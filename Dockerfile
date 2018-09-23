FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
          apt-get install -y build-essential gcc g++ make ninja-build cmake git \
		yasm nasm neovim less curl wget locales \
                python python-dev python-pip ruby ruby-dev rubygems \
		clang-6.0 clang-format-6.0 clang-tidy-6.0 clang-tools-6.0 libclang-6.0-dev \
                doxygen graphviz valgrind gdb astyle

RUN sed -i 's/# de_CH.UTF-8 UTF-8/de_CH.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    ln -fs /etc/locale.alias /usr/share/locale/locale.alias && \
    locale-gen && update-locale LANG=en_US.UTF-8
RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime && \
    echo "Europe/Zurich" >  /etc/timezone

RUN pip install conan

RUN conan remote add conan-cpp https://api.bintray.com/conan/squawkcpp/conan-cpp && \
    conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan && \
    conan remote add conan https://api.bintray.com/conan/conan-community/conan

RUN mkdir -p /root/.conan/profiles/
RUN echo "\
[build_requires] \n\
[settings] \n\
os=Linux \n\
arch=x86_64 \n\
compiler=gcc \n\
compiler.version=7 \n\
compiler.libcxx=libstdc++11 \n\
build_type=Release \n\
[options] \n\
*:Shared=False \n\
[env]" > /root/.conan/profiles/default

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
##ENV CC clang
##ENV CXX clang++
##RUN ln -sf /bin/cc /bin/clang
##RUN ln -sf /bin/cxx /bin/clang++
