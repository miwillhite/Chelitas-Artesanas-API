namespace :db do
  desc 'Nuke the database'
  task :nuke do
    %w| db:drop db:create db:migrate |.each do |t|
      Rake.application[t].invoke
    end
  end
end

