# frozen_string_literal: true

# Define a task for Brakeman
task brakeman: :environment do
  sh 'bundle exec brakeman'
end

# Define a task for RuboCop
task rubocop: :environment do
  sh 'bundle exec rubocop'
end

# Define a task for Erblint
task erblint: :environment do
  sh 'bundle exec erblint --lint-all --enable-all-linters'
end

# Define a task for bundler-audit
task bundler_audit: :environment do
  sh 'bundle exec bundler-audit'
end

# Add more tasks for other code quality checks as needed

# Define a task to run all code quality checks
task code_quality: %i[rubocop brakeman erblint bundler_audit] do
  # This task has dependencies on individual checks and will only run if they all pass
  puts 'All code quality checks passed!'
end
