require 'active_record'
require 'yaml'

namespace :db do
  db_config       = YAML::load(File.open('config/database.yml'))
  db_config_admin = db_config.merge({
    'database' => 'postgres',
    'schema_search_path' => 'public'
  })

  desc 'Create the database'
  task :create do
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.create_database(db_config['database'])
    puts 'Database created.'
  end

  desc 'Migrate the database'
  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::MigrationContext.new('db/migrate').migrate
    Rake::Task['db:schema'].invoke
    puts 'Database migrated.'
  end

  desc 'Drop the database'
  task :drop do
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.drop_database(db_config['database'])
    puts 'Database deleted.'
  end

  desc 'Reset the database'
  task reset: %i[drop create migrate]

  desc 'Create a db/schema.rb file that is portable'
  task :schema do
    ActiveRecord::Base.establish_connection(db_config)
    require 'active_record/schema_dumper'
    filename = 'db/schema.rb'
    File.open(filename, 'w:utf-8') do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end

  desc 'Populates DB with relevant data'
  task :seed do
    ActiveRecord::Base.establish_connection(db_config)
    project_root = File.dirname(File.absolute_path(__FILE__))
    Dir.glob(project_root + '/models/*.rb').each { |f| require f }
    require 'faker'

    age = Option.create(name: 'Age')
    3.times do
      OptionValue.create(option_id: age.id, name: Faker::Dog.unique.age)
    end

    gender = Option.create(name: 'Gender')
    2.times do
      OptionValue.create(option_id: gender.id, name: Faker::Dog.unique.gender)
    end

    size = Option.create(name: 'Size')
    4.times do
      OptionValue.create(option_id: size.id, name: Faker::Dog.unique.size)
    end

    registry = Option.create(name: 'Registry')
    3.times do
        OptionValue.create(option_id: registry.id, name: Faker::Cat.unique.registry)
    end 

    dogs = Category.create(name: 'Dogs')
    20.times do
      Category.create(category_id: dogs.id, name: Faker::Dog.unique.breed)
    end

    cats = Category.create(name: 'Cats')
    20.times do
        Category.create(category_id: cats.id, name: Faker::Cat.unique.breed)
    end

    Category.where(category_id: dogs.id).pluck(:id).each do |category_id|
      OptionValue.where(option_id: age.id).each do |age_value|
        OptionValue.where(option_id: gender.id).each do |gender_value|
          OptionValue.where(option_id: size.id).each do |size_value|
            2.times do
              p = Product.create(category_id: category_id, name: Faker::Dog.name, description: Faker::Dog.meme_phrase, hidden: false)
              v = Variant.create(product_id: p.id, sku: Faker::Code.asin, price: Faker::Commerce.price, amount: 1)
              ProductOption.create(product_id: p.id, option_id: gender.id)
              VariantOptionValue.create(variant_id: v.id, option_value_id: gender_value.id)
              ProductOption.create(product_id: p.id, option_id: size.id)
              VariantOptionValue.create(variant_id: v.id, option_value_id: size_value.id)
              ProductOption.create(product_id: p.id, option_id: age.id)
              VariantOptionValue.create(variant_id: v.id, option_value_id: age_value.id)
            end
          end
        end
      end
    end

    Category.where(category_id: cats.id).pluck(:id).each do |category_id|
      OptionValue.where(option_id: gender.id).each do |gender_value|
        OptionValue.where(option_id: registry.id).each do |registry_value|
          2.times do
            p = Product.create(category_id: category_id, name: Faker::Cat.name, description: Faker::Coffee.notes, hidden: false)
            v = Variant.create(product_id: p.id, sku: Faker::Code.asin, price: Faker::Commerce.price, amount: 1)
            ProductOption.create(product_id: p.id, option_id: gender.id)
            VariantOptionValue.create(variant_id: v.id, option_value_id: gender_value.id)
            ProductOption.create(product_id: p.id, option_id: registry.id)
            VariantOptionValue.create(variant_id: v.id, option_value_id: registry_value.id)
          end 
        end
      end
    end

    200.times do
      name = Faker::Name.name
      c = Customer.create(name: name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email(name), shipping_address: "#{Faker::Address.city}\n#{Faker::Address.street_address}\n#{Faker::Address.secondary_address}")
      3.times do
        next if Faker::Boolean.boolean
        variants = Variant.where(amount: 1).limit(Random.rand(1..3))
        o = Order.create(status: Random.rand(0..2), paid: Faker::Boolean.boolean, customer_id: c.id)
        variants.each do |v|
          OrderLine.create(variant_id: v.id, order_id: o.id, price: v.price, amount: 1)
          v.update(amount: 0)
        end
      end
    end
  end

  desc 'Reseed the database'
  task reseed: %i[drop create migrate seed]
end

namespace :generate do
  desc 'Generate migration'
  task :migration do
    name = ARGV[1]
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split('_').map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-RUBY
class #{migration_class} < ActiveRecord::Migration[5.2]
  def change
  end
end
      RUBY
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end

  desc 'Generate table'
  task :table do
    table_name = ARGV[1]
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    name = "create_#{table_name}"
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split('_').map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-RUBY
class #{migration_class} < ActiveRecord::Migration[5.2]
  def change
    create_table :#{table_name} do |t|

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
      RUBY
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
