from os import environ

env = Environment(
                  CXXFLAGS = ['-Os',
			      '-Dlinux',
                              '-DINTERFACE_CLI',
                              '-Dstricmp=strcasecmp'])
print(env)
env.Program('asar', Glob('src/*.cpp'))
