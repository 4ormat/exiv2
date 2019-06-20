require 'mkmf'

RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']
RbConfig::MAKEFILE_CONFIG['CCFLAGS'] = ENV['CCFLAGS'] if ENV['CCFLAGS']
RbConfig::MAKEFILE_CONFIG['CXX'] = ENV['CXX'] if ENV['CXX']
RbConfig::MAKEFILE_CONFIG['CXXFLAGS'] = ENV['CXXFLAGS'] if ENV['CXXFLAGS']

config = pkg_config('exiv2')
if config
  $CPPFLAGS = [$CPPFLAGS, config[0]].join ' '
  create_makefile("exiv2/exiv2")
else
  abort 'exiv2 devel package is missing'
end
