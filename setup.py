from distutils.core import setup, Extension
from Cython.Build import cythonize
import numpy

setup(ext_modules = cythonize(Extension(
	"reader",
	sources=["reader.pyx"],
	language="c++",
	include_dirs=[r'.',numpy.get_include()],
	library_dirs=[r'.'],
	extra_compile_args=["-std=c++11"],
	extra_link_args=["-std=c++11"]
)))

