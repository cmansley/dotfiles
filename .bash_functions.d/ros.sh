# ROS shell setup
source /opt/ros/diamondback/setup.bash

# Add car to ROS path
export ROS_PACKAGE_PATH=~/rdr/stacks:${ROS_PACKAGE_PATH}

# Parallel jobs for ROS
export ROS_PARALLEL_JOBS=-j6