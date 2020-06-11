# aws-localstack
    https://github.com/localstack/localstack

# environemnt setup
* Clone the localstack repo
* set the environment variable PORT_WEB_UI
   export PORT_WEB_UI=8055
* fire up Localstack: run docker-compose up from inside the localstack directory
* install aws cli: sudo apt install awscli
* run aws configure: \
    aws configure \
    AWS Access Key ID [None]: ACCESSKEYAWSUSER \
    AWS Secret Access Key [None]: sEcreTKey \
    Default region name [None]: us-west-2 \
    Default output format [None]: json \

# S3
* S3 endpoint url: \
   http://localhost:4572 or http://localhost:4566
* Create a bucket: \
    aws --endpoint-url=http://localhost:4572 s3api create-bucket --bucket my-bucket
* Attach an ACL: \
   aws --endpoint-url=http://localhost:4572 s3api put-bucket-acl --bucket my-bucket --acl public-read
* List all s3 buckets: \
   aws --endpoint-url=http://localhost:4572 s3api list-buckets
   aws --endpoint-url=http://localhost:4572 s3 ls
* Upload/copy file from local to s3 bucket: \
   aws --endpoint-url=http://localhost:4572 s3 cp ~/Downloads/problem.txt s3://my-bucket
* Download/Copy from s3 bucket to local folder: \
   aws --endpoint-url=http://localhost:4572 s3 cp s3://my-bucket/problem.txt ~/Downloads/aws-test
* List the files in bucket: \
   CLI: aws --endpoint-url=http://localhost:4572 s3 ls s3://my-bucket \
   Bowser: http://localhost:4572/my-bucket 
* Contents of a file: \
   Browser: http://localhost:4572/my-bucket/problem.txt 

# sqs
   * Create Queue: \
      aws --endpoint-url=http://localhost:4576 sqs create-queue --queue-name demo_queue
   * Send Message: \
      aws --endpoint-url=http://localhost:4576 sqs send-message --message-body="{\"message\": \"Hello World\"}" --queue-url "http://localhost:4576/queue/demo_queue"
   * Receive Message: \
      aws --endpoint-url=http://localhost:4576 sqs receive-message --queue-url "http://localhost:4576/queue/demo_queue"

# lambda
* Prerequisite:
  * Linux:
  * Docker:
  * AWS cli:
* cd to ./sqs-lambda
* execute init.sh
   ./init.sh \
   The script:
   1. Creates a lambda function
   2. Creates a SQS 
   3. Map the event to the lambda function, so that when the queue receives a message, the lambda function is triggerred.   
* run docker-compose up
* The deployed resources can be accessed at: http://localhost:9070/#!/infra
* Excute lamda function:
   1. aws --endpoint-url=http://localhost:4574 lambda invoke --function-name demoLambda outfile.txt
   2. From sqs by sending a message to the queue:
      aws --endpoint-url=http://localhost:4576 sqs send-message --message-body="{\"message\": \"Hello World\"}" --queue-url "http://localhost:4576/queue/demo_queue"


# serverless
The Serverless Framework is a node-based package, so we need to install it on our system. \
    npm config set prefix /usr/local \
    npm i -g serverless 
