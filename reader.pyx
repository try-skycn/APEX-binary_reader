import numpy as np
cimport numpy as np
from libc.stdio cimport fopen, fclose, fread, fseek, FILE, SEEK_SET

def read(filename, width, batch_size, start, end):
	size = end - start
	cdef FILE *f = fopen(filename, "rb")
	fseek(f, sizeof(unsigned int) * width * batch_size * start, SEEK_SET)
	cdef unsigned int size_read
	cdef np.ndarray[np.int32_t, ndim=1] buff = np.zeros((size * batch_size * width), np.int32)
	size_read = fread(<void*>buff.data, sizeof(unsigned int) * width * batch_size, size, f)
	fclose(f)
	return buff.reshape((-1, batch_size, width))[:size_read]

