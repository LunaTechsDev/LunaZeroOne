let project = new Project('LunaZeroOne');

project.localLibraryPath ='libs';

project.addLibrary('zui'); // More Information: https://github.com/armory3d/zui
project.addLibrary('echo');
project.addLibrary('hxmath');

//Assets
project.addAssets('assets/**', {
  nameBaseDir: 'assets',
  destination: '{dir}/{name}',
  name: '{dir}/{name}'
});


project.addShaders('shaders/**')
project.addSources('src');

resolve(project);
