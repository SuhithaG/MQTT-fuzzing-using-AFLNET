# CSE543-Project3
In this project we have included support for MQTT protocol in AFLNET. 
Complete environment setup, to fuzz MQTT protocol using AFLNET, requires installation of AFLNET and MQTT broker and client binaries. 
1. To compile and setup AFLNET, use following commands. 
    #download aflnet source code from git repository
    git clone https://github.com/aflnet/aflnet aflnet
    cd aflnet 
    make clean all
    cd llvm_mode
    make
    cd ../..
    export AFLNET=$(pwd)/aflnet
    export WORKDIR=$(pwd)
    export PATH=$AFLNET:$PATH
    export AFL_PATH=$AFLNET
For more details about aflnet setup please visit the website https://github.com/aflnet/aflnet .

    
