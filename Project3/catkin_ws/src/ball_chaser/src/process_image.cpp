
#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>

// Define a global client that can request services
ros::ServiceClient client;

// This function calls the command_robot service to drive the robot in the specified direction
void drive_robot(float lin_x, float ang_z)
{
    // TODO: Request a service and pass the velocities to it to drive the robot
    ROS_INFO_STREAM("Moving robot");
    
    // Request
    ball_chaser::DriveToTarget srv;
    srv.request.linear_x = lin_x;
    srv.request.angular_z = ang_z;

    // Call the safe_move service and pass the requested joint angles
    if (!client.call(srv))
        ROS_ERROR("Failed to call service command_robot");
}

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img)
{

    int white_pixel = 255;
    
    // TODO: Loop through each pixel in the image and check if there's a bright white one
    // Then, identify if this pixel falls in the left, mid, or right side of the image
    // Depending on the white ball position, call the drive_bot function and pass velocities to it
    // Request a stop when there's no white ball seen by the camera
    
    // Forward: linear_x: 0.5 angular_z:  0.0
    // Left:    linear_x: 0.0 angular_z:  0.5
    // Right:   linear_x: 0.0 angular_z: -0.5
    // Stop:    linear_x: 0.0 angular_z:  0.0

    for (int i = 0; i < img.height * img.step; i+=3) {
        if( img.data[i] == white_pixel && img.data[i+1] == white_pixel && img.data[i+2] == white_pixel )
        {   
             float p = (float(i%img.step) / img.step);
             //ROS_INFO("Image process - p:%1.2f", p );
             //drive_robot( 0.5, 0.0 );

             if( p < 0.3){
                drive_robot( 0.0, 0.5 );
             }else if( p >= 0.3 && p < 0.7 ){
                drive_robot( 0.5, 0.0 );
             }else{
                drive_robot( 0.0, -0.5 );
             }
             return;
        }
    } 

    //Stop
    drive_robot( 0.0, 0.0 );
    
}

int main(int argc, char** argv)
{
    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;

    // Define a client service capable of requesting services from command_robot
    client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/camera/rgb/image_raw", 10, process_image_callback);

    // Handle ROS communication events
    ros::spin();

    return 0;
}


