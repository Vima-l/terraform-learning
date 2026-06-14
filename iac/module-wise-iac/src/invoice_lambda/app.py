import json

#sample lambda function
#sample command
def lambda_handler(event, context):

    print(event)

    return {
        "statusCode": 200,
        "body": json.dumps({"event": event})
    }
