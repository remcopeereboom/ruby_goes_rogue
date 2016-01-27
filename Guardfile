guard :rspec, cmd: 'bundle exec rspec' do
  # watch ruby files the lib directory or it's subdirectories.
  watch(%r{^lib/(.+).rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  # watch spec files in the spec directory
  watch(%r{^spec/(.+).rb$}) do |m|
    "spec/#{m[1]}.rb"
  end
end
