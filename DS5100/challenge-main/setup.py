from setuptools import setup, find_packages

setup(name='mypkg',
      version='1.0',

      # list folders, not files
      packages=['mypkg'], # Include packages in the project
      install_requires=['click'],         # Required libraries
)
