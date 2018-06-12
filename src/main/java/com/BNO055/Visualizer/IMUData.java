package com.BNO055.Visualizer;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import edu.wpi.SimplePacketComs.BytePacketType;
import edu.wpi.SimplePacketComs.PacketType;
import edu.wpi.SimplePacketComs.device.UdpDevice;
import edu.wpi.SimplePacketComs.device.gameController.GameController;
import edu.wpi.SimplePacketComs.phy.UDPSimplePacketComs;



public class IMUData extends UDPSimplePacketComs{
    private PacketType IMU = new BytePacketType(1863, 64);

    private final double[] data = new double[15];

    private IMUData(InetAddress add) throws Exception {
        super(add);
        addPollingPacket(IMU);
        addEvent(IMU.idOfCommand, () -> {
            readFloats(IMU.idOfCommand, getData());
        });
    }
    public static List<IMUData> get(String name) throws Exception {
        HashSet<InetAddress> addresses = UDPSimplePacketComs.getAllAddresses(name);
        ArrayList<IMUData> robots = new ArrayList<>();
        if (addresses.size() < 1) {
            System.out.println("No IMU controllers found named "+name);
            return robots;
        }
        for (InetAddress add : addresses) {
            System.out.println("Got " + add.getHostAddress());
            IMUData e = new IMUData(add);
            e.connect();
            robots.add(e);
        }

        return robots;
    }
    public static List<IMUData> get() throws Exception {
        return get("*");
    }

    public double[] getData() {
        return data;
    }
}
