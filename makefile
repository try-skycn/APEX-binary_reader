.PHONY: all
all:
	python3 setup.py build_ext --inplace
	rm reader.cpp
	rm -rf build