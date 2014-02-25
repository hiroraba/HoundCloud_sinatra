# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'ego' do
  watch('Guardfile')
end

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
  # sinatra
  watch(%r{.+\.rb})
  watch(%r{views/.+\.(haml|sass|css|erb)})
end
