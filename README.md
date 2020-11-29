# CSE543-Project3
In this project we have included support for MQTT protocol in AFLNET. 
Complete environment setup, to fuzz MQTT protocol using AFLNET, requires installation of AFLNET and MQTT broker and client binaries. 
1. To compile and setup AFLNET, use following commands. <br/>
    ###download aflnet source code from git repository <br/>
    git clone <link to the aflnet branch> aflnet_mqtt <br/>
    cd aflnet <br/>
    make clean all <br/>
    cd llvm_mode <br/>
    make <br/>
    cd ../.. <br/>
    export AFLNET=$(pwd)/aflnet <br/>
    export WORKDIR=$(pwd) <br/>
    export PATH=$AFLNET:$PATH <br/>
    export AFL_PATH=$AFLNET <br/>
For more details about aflnet setup please visit the website https://github.com/aflnet/aflnet . <br/>
2. We have used Mosquitto 1.5.5 MQTT broker implementation. To install this use follwing commands. <br/>
	git clone https://github.com/eclipse/mosquitto/tree/v1.5.5 mqtt_broker <br/>
	cd mqtt_broker <br/>
	make CC=afl-gcc CXX=afl-g++ <br/>
	make test CC=afl-gcc CXX=afl-g++ <br/>
	sudo make install <br/>
mosquitto binary will be created in /usr/local/sbin. Mosquitto broker can be started by running <br/>
	mosquitto <br/>
mosquitto clients can be started by using <br/>
	mosquitto_sub -t '<topic name>' -v <br/>
	mosquitto_pub -t '<topic name>' -m '<message to be sent on topic specified>' <br/>
