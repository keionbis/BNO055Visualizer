package com.BNO055.Visualizer;
import com.neuronrobotics.sdk.addons.kinematics.TransformFactory;
import com.neuronrobotics.sdk.addons.kinematics.math.RotationNR;
import com.neuronrobotics.sdk.addons.kinematics.math.TransformNR;
import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXML;
import javafx.geometry.Point3D;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Slider;
import javafx.scene.paint.Color;
import javafx.scene.paint.PhongMaterial;
import javafx.scene.shape.Box;
import javafx.scene.transform.Affine;
import javafx.stage.Stage;
import java.io.IOException;
import java.net.InetAddress;


import edu.wpi.SimplePacketComs.BytePacketType;
import edu.wpi.SimplePacketComs.FloatPacketType;
import edu.wpi.SimplePacketComs.PacketType;
import edu.wpi.SimplePacketComs.device.UdpDevice;
import edu.wpi.SimplePacketComs.phy.UDPSimplePacketComs;




public class VisualizerController extends Application {
    @FXML
    private Box Cube = new Box();
    private IMUData imu = IMUData.get().get(0);
    private double[] pickOrderData = new double[9];
    Affine affine = new Affine();

    public VisualizerController() throws Exception {
        imu.addEvent(1863, ()->{
            setAngles(imu.getData()[0],imu.getData()[1],imu.getData()[2]);
            Cube.getTransforms().add(affine);
        });
    }
    public void start(Stage stage) throws Exception {
        final PhongMaterial redMaterial = new PhongMaterial();
        redMaterial.setSpecularColor(Color.ORANGE);
        redMaterial.setDiffuseColor(Color.RED);
        Group root = new Group();
        stage.setScene(new Scene(root,1024,1080));
        Cube.setMaterial(redMaterial);
        Cube.setHeight(100);
        Cube.setDepth(75);
        Cube.setWidth(50);
        Cube.relocate(500,400);
        root.getChildren().add(Cube);
        stage.show();
    }
    public void setAngles(double elevation,double azamuth,double tilt){
        TransformNR newTrans = new TransformNR(0,0,0,new RotationNR(elevation,azamuth,tilt));
        TransformFactory.nrToAffine(newTrans ,affine);
    }
    public static void main(String[] args) throws IOException {

      launch(args);
    }


}
