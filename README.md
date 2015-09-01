# mobilyws-rest
Small API heroku ready for sending sms messages using mobilyws SMS Gateway.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Usage

After you deploy your instance in heroku or in your own server, you can call the API as follows:

```
curl -X POST https://[APP_NAME].herokuapp.com/send \ 
        -H "Authentication:__YOUR_LONG_AUTHENTICATION_KEY__" \
        -d mobile=966555555555 \
				-d name="sami"
        
```

**-H**

You can find the Authentication key by asking heroku command about the config
```heroku config:get AUTH_TOKEN -a [APP_NAME]```

**-d**

API accept two parameters:

1. name (optional): Name of SMS receiver. (you can use it in message string by adding %s)
2. mobile (required): Mobile number. 
