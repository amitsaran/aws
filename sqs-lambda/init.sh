zip -j handler.zip ./src/index.js
aws --endpoint-url=http://localhost:4574 lambda create-function --function-name demoLambda --region us-east-1 --runtime nodejs8.10 --handler index.lambdaHandler --memory-size 128 --zip-file fileb://handler.zip --role arn:aws:iam:awslocal
aws --endpoint-url=http://localhost:4576 sqs create-queue --queue-name demo_queue
aws --endpoint-url=http://localhost:4574 lambda create-event-source-mapping --function-name demoLambda --event-source-arn arn:aws:sqs:us-east-1:000000000000:demo_queue
