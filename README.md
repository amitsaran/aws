# aws-localstack
    https://github.com/localstack/localstack

# environemnt setup
1. Clone the localstack repo
2. set the environment variable PORT_WEB_UI
   export PORT_WEB_UI=8055
3. fire up Localstack: run docker-compose up from inside the localstack directory
4. install aws cli: sudo apt install awscli
5. run aws configure: \
    aws configure \
    AWS Access Key ID [None]: ACCESSKEYAWSUSER \
    AWS Secret Access Key [None]: sEcreTKey \
    Default region name [None]: us-west-2 \
    Default output format [None]: json \

# S3
1. S3 endpoint url: \
   http://localhost:4572 or http://localhost:4566
2. Create a bucket: \
    aws --endpoint-url=http://localhost:4572 s3api create-bucket --bucket my-bucket
3. Attach an ACL: \
   aws --endpoint-url=http://localhost:4572 s3api put-bucket-acl --bucket my-bucket --acl public-read
4. List all s3 buckets: \
   aws --endpoint-url=http://localhost:4572 s3api list-buckets
   aws --endpoint-url=http://localhost:4572 s3 ls
5. Upload/copy file from local to s3 bucket: \
   aws --endpoint-url=http://localhost:4572 s3 cp ~/Downloads/problem.txt s3://my-bucket
6. Download/Copy from s3 bucket to local folder: \
   aws --endpoint-url=http://localhost:4572 s3 cp s3://my-bucket/problem.txt ~/Downloads/aws-test
7. List the files in bucket: \
   CLI: aws --endpoint-url=http://localhost:4572 s3 ls s3://my-bucket \
   Bowser: http://localhost:4572/my-bucket 
8. Contents of a file: \
   Browser: http://localhost:4572/my-bucket/problem.txt 

# serverless
The Serverless Framework is a node-based package, so we need to install it on our system. \
    npm config set prefix /usr/local \
    npm i -g serverless 
