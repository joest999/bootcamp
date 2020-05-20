## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Diagrams/Azure_Virtual_Network.pdf

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the syslogs and system metrics.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| VM-1     | VM       | 10.0.0.5   | Linux            |
| VM-2     | VM       | 10.0.0.6   | Linux		     |
| ELK      | Server   | 10.0.0.7   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box, ELK Server, and Load Balancer can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: See Chart Below

Machines within the network can only be accessed by JumpBox 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses |
|----------   |---------------------|----------------------|
| Jump Box    |  YES                | 173.49.1.86          |
| VM-1        |  No                 | 10.0.0.4             |
| VM-2        |  No                 | 10.0.0.4             |
| Elk         |  YES                | 10.0.0.4, 173.49.1.86|              
|Load Balancer|  Yes                | 0.0.0.0              |                

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because multiple VMs can be configured with the tasks defined in a playbook.

The playbook implements the following tasks:
- docker.io installed: The Docker engine used for running     containers.
- python-pip installed: Package used to install Python software
- Docker python module installed:  Python client for Docker
- sysctl -w vm.max_map_count=262144: MMAP limits are increased on the Docker 
- download and launch a docker elk container: sebp/elk Docker container is downloaded and started with the port mappings 5601:5601, 9200:9200, 5044:5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Diagrams/Screenshots.odt

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
10.0.0.5, 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat and Metricbeat
These Beats allow us to collect the following information from each machine:
Filebeat records syslog events, sudo command usage, and ssh logins. Metricbeat records CPU usage (%), memory usage (%), and memory RSS.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Filebeat configuration file to your ELK VM.
- Update the hosts file to include {webservers} 10.0.0.5, 10.0.0.6; {elkservers} 10.0.0.7
- Run the playbook, and navigate to http:// [ELK-Server Public IP:5601] to check that the installation worked as expected.


