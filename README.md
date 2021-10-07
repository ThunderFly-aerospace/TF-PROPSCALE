# TF-MOTORSCALE
Bench for measuring parameters of propulsion system (propeller, motor, regulator) of unmanned drones


    sudo systemctl restart onboot
    
Then the data should be displayed in the [PlotJuggler](https://github.com/facontidavide/PlotJuggler) on the remote computer.

    ros2 run plotjuggler plotjuggler


# Vyčítání parametrů z UAVCAN regulátoru
    
CAN převodník se přípojí příkazem:

    ./create_socket_can.sh
    

Následně se musí spustit ROS nod:

    ros2 run tf_tools uavcan_motor_driver
