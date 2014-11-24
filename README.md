AWS Release Tasks
===============


Wrapper helper commands to use with AWS Beanstalk.  Uses fabric, prettytable and boto.


Usage
-----

To use, first install and setup AWS Elastic Beanstalk command line tool (eb).


### Available commands

* list_environments  - Shows all available environments
* instances - Returns ssh connection string to available instance
* leader - Returns ssh connection string to leader instance
* list_instances - Shows all instances for an environment
* deploy - Deploy a release to the specified AWS Elastic Beanstalk environment. Requires site name & tag (release)
* dump_bucket - Downloads an S3 Bucket, given the bucket name
* manage - Run a manage command remotely, need host that you can get from leader command. use appropriate cert



Installation
------------------


### Setup eb tool and run eb init in your repository root

Follow the instructions for eb tool, it is required for deploy command which uses aws.push

### Add the package to your PYTHONPATH i.e. in  ../lib

You can include it anywhere so long as its accessible

### Reference it in your fabfile.py

First set the required environment variables in your fab file, then import the tasks


    import os
    os.environ['PROJECT_NAME'] = os.getcwd().split('/')[-1]  # Import before aws_tasks, as it is used there.
    os.environ['DEFAULT_REGION'] = 'us-east-1'
    os.environ['DB_HOST'] = 'prod.your-db-url.us-east-1.rds.amazonaws.com'  # RDS DB URL, update accordingly']

    #import tasks
    from aws_tasks import tasks as aws


### Sample Fabfile.py

    import os

    from fabric.api import task, local
    from boulanger.fabfile import release_notes

    os.environ['PROJECT_NAME'] = os.getcwd().split('/')[-1]  # Import before aws_tasks, as it is used there.
    os.environ['DEFAULT_REGION'] = 'us-east-1'
    os.environ['DB_HOST'] = 'prod.czxygluip2xt.us-east-1.rds.amazonaws.com'  # RDS DB URL, update accordingly']
    from aws_tasks import tasks as aws

    # UNCOMMENT BELOW for fab local_setup to work
    # This is required for local_setup but it is not required for hosting because Beanstalk is used. Below is boulanger/fab specific
    #from boulanger.fabfile import *   # UNCOMMENT for local_setup to work
    #env.server_nodes = {
    #    'web': {
    #        'web1': ('localhost', ''),
    #    },
    #}
    #env.project_name = os.getcwd().split('/')[-1]
    #env.user = env.project_name + 'team'
    #env.roledefs = {
    #    'web': [public_address for public_address, private_address in env.server_nodes['web'].values()],
    #}

### Assumptions

The project name is unique and the name of the project using the union django-template project structure is used.

