# CSE543-Project3
In this project we have included support for MQTT protocol in AFLNET. 
Complete environment setup, to fuzz MQTT protocol using AFLNET, requires installation of AFLNET and MQTT broker and client binaries. 
1. To compile and setup AFLNET, use following commands. <br/>
    ###download aflnet source code from git repository <br/>
    git clone https://github.com/SuhithaG/CSE543-Project3/tree/main/aflnet-master_mqtt aflnet_mqtt <br/>
    cd aflnet_mqtt <br/>
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
	#we have included vulnerability in mosquitto broker code to check the effectiveness of our implementation.For this use following command. <br/>
	git clone https://github.com/SuhithaG/CSE543-Project3/tree/main/buggy_mosquitto buggy_mosquitto <br/>
	cd mqtt_broker or buggy_mosquitto <br/>
	#This command is used to instrument the mosquitto broker. <br/> 
	make CC=afl-gcc CXX=afl-g++ <br/>
	make test CC=afl-gcc CXX=afl-g++ <br/>
	sudo make install <br/>
mosquitto binary will be created in /usr/local/sbin. Mosquitto broker can be started by running <br/>
	mosquitto <br/>
mosquitto clients can be started by using <br/>
	mosquitto_sub -t 'topic name' -v <br/>
	mosquitto_pub -t 'topic name' -m 'message to be sent on topic specified' <br/>

Once aflnet and mosquitto binaries are installed, you can run following fuzz command to fuzz Mosquitto broker using aflnet. <br/>
	afl-fuzz -d -i $AFLNET/tutorials/mqtt/in_mqtt -o $WORKDIR/mqtt_out -N tcp://127.0.0.1/1883  -P MQTT -D 10000 -q 3 -s 3 -E -K -R -n mosquitto <br/>
you have to create mqtt_out in your workdir folder before running the command to collect output. <br/>
To stop fuzzing user should press ctrl+c. 
