namespace :db do
  namespace :seed do
    desc 'Populate demo with seed data'
    task :demo => 'db:abort_if_pending_migrations' do
      seed_file = File.join(Rails.root, 'db', 'demo_seeds.rb')
      load seed_file if File.exist? seed_file
    end
  end
end

