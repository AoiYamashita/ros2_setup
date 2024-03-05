sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update -y
sudo apt install ros-foxy-desktop -y

echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install python3-colcon-common-extensions -y
sudo apt install python3-argcomplete -y

mkdir -p ~/ros2_ws/src
cd ~/ros2_ws
colcon build

sudo curl -sSL http://get.gazebosim.org | sh
sudo apt install ros-foxy-gazebo-* -y
