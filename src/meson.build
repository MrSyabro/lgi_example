pkgdatadir = join_paths(get_option('prefix'), get_option('datadir'), meson.project_name())
moduledir = join_paths(pkgdatadir, meson.project_name())
gnome = import('gnome')

gnome.compile_resources(meson.project_name(),
  'gresource.xml',
  gresource_bundle: true,
  install: true,
  install_dir: pkgdatadir,
)

conf = configuration_data()
conf.set('LUAJIT', find_program('luajit').full_path())
conf.set('VERSION', meson.project_version())
conf.set('NAME', meson.project_name())
conf.set('libdir', join_paths(get_option('prefix'), get_option('libdir')))
conf.set('datadir', join_paths(get_option('prefix'), get_option('datadir')))
conf.set('localedir', join_paths(get_option('prefix'), get_option('localedir')))
conf.set('pkgdatadir', pkgdatadir)
conf.set('moduledir', moduledir)

configure_file(
  input: 'lgi_example.in',
  output: meson.project_name(),
  configuration: conf,
  install: true,
  install_dir: get_option('bindir')
)

example_sources = [
  'init.lua',
  'window.lua',
]

install_data(example_sources, install_dir: moduledir)
