import numpy as np
cimport numpy as np
from libc.stdio cimport fopen, fclose, fread, fseek, FILE, SEEK_SET

def read(filename, width, start, end):
	size = end - start
	cdef FILE *f = fopen(filename, "rb")
	fseek(f, sizeof(unsigned int) * width * start, SEEK_SET)
	cdef unsigned int size_read
	cdef np.ndarray[np.int32_t, ndim=1] buff = np.zeros((size * width), np.int32)
	size_read = fread(<void*>buff.data, sizeof(unsigned int)*width, size, f)
	fclose(f)
	return buff[:width*size_read].reshape((-1, width))

