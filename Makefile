

install-libiop:
	echo "[+] Fetching libiop and its dependencies"
	git clone https://github.com/scipr-lab/libiop
	cd libiop; git submodule init && git submodule update
	@sed -i 's/private:/public:/g' libiop/depends/libff/libff/algebra/fields/prime_base/fp.hpp
	@sed -i 's/#include <cstdint>/#include <cstddef>/g' libiop/libiop/algebra/utils.hpp
	#echo "[+] Compiling libiop"
	#cd libiop; mkdir build; cd build; cmake ..; make

build:
	mkdir build; cd build; cmake ..; make

clean:
	rm -rf build

clean-all:
	rm -rf libiop
	rm -rf build
