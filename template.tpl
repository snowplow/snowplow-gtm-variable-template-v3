___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Snowplow Analytics v3 Settings",
  "description": "The Snowplow Analytics Settings variable can be used to easily apply a set of tracker configuration parameters to tags created with the Snowplow Analytics v3 tag template.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX1Nub3dwbG93QW5hbHl0aWNzVjNWYXJpYWJsZS1TaW1vLUFoYXZh",
  "securityGroups": [],
  "categories": [
    "ANALYTICS"
  ],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "trackerOptions",
    "displayName": "Tracker Options",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "help": "This is the name of the tracker instance. It is used to distinguish the configuration you have set for one tracker instance from all the other possible tracker instances on the page.",
        "alwaysInSummary": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Tracker Name",
        "simpleValueType": true,
        "name": "trackerName",
        "type": "TEXT",
        "defaultValue": "spTracker"
      },
      {
        "help": "Enter the hostname of the collector. You can optionally provide the protocol (http:// or https://) if you want to force either HTTP or HTTPS.",
        "alwaysInSummary": true,
        "valueValidators": [
          {
            "args": [
              "^\\S+$"
            ],
            "errorMessage": "You must provide a valid hostname.",
            "type": "REGEX"
          }
        ],
        "displayName": "Collector Endpoint Hostname",
        "simpleValueType": true,
        "name": "collectorEndpoint",
        "type": "TEXT",
        "valueHint": "e.g. snowplowcollector.mydomain.net"
      },
      {
        "displayName": "JavaScript Tracker",
        "name": "trackerGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "type": "RADIO",
            "name": "spLibrary",
            "displayName": "JavaScript Library Host",
            "radioItems": [
              {
                "value": "jsDelivr",
                "displayValue": "jsDelivr",
                "subParams": [],
                "help": ""
              },
              {
                "value": "unpkg",
                "displayValue": "unpkg"
              },
              {
                "value": "selfHosted",
                "displayValue": "Self-hosted",
                "subParams": [
                  {
                    "help": "Add the URL where your self-hosted Snowplow JavaScript library can be downloaded from. If this location is not in AWS S3 (via Cloudfront) or GCP Storage, remember to update \u003ca href\u003d\"https://www.simoahava.com/analytics/custom-templates-guide-for-google-tag-manager/#injects-scripts\"\u003e\u003cstrong\u003etemplate permissions\u003c/strong\u003e\u003c/a\u003e to allow script injection requests to this URL.",
                    "valueValidators": [
                      {
                        "args": [
                          "^https://.*"
                        ],
                        "type": "REGEX"
                      }
                    ],
                    "displayName": "Self-hosted Library URL",
                    "simpleValueType": true,
                    "name": "selfHostedUrl",
                    "type": "TEXT",
                    "valueHint": "https://123.cloudfront.net/sp.js"
                  }
                ]
              }
            ],
            "simpleValueType": true,
            "help": "Load the Snowplow JavaScript library from a CDN or choose the location where the self-hosted library can be loaded from.",
            "defaultValue": "selfHosted"
          },
          {
            "type": "TEXT",
            "name": "version",
            "displayName": "Library version",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "spLibrary",
                "paramValue": "unpkg",
                "type": "EQUALS"
              },
              {
                "paramName": "spLibrary",
                "paramValue": "jsDelivr",
                "type": "EQUALS"
              }
            ],
            "help": "Enter the version of the sp.js library you want to load. You can find more details about library versions \u003ca href\u003d\"https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/javascript-trackers/javascript-tracker/third-party-cdn-hosting/\"\u003ehere\u003c/a\u003e.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^([3-9]|[1-9][0-9])\\..+$"
                ],
                "errorMessage": "The sp.js library version number must be greater or equal to 3 (e.g. 3.1.5)."
              }
            ],
            "valueHint": "3.1.5"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Application Settings",
    "name": "trackerParamsApp",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "See \u003ca href\u003d\"https://github.com/snowplow/snowplow/wiki/1-General-parameters-for-the-Javascript-tracker#221-setting-the-application-id\"\u003ehere\u003c/a\u003e for more information.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Application ID",
        "defaultValue": "my-site",
        "simpleValueType": true,
        "name": "appId",
        "type": "TEXT"
      },
      {
        "selectItems": [
          {
            "displayValue": "Web",
            "value": "web"
          },
          {
            "displayValue": "Mobile/Tablet",
            "value": "mob"
          },
          {
            "displayValue": "Desktop/Laptop/Notebook",
            "value": "pc"
          },
          {
            "displayValue": "Server-Side App",
            "value": "srv"
          },
          {
            "displayValue": "General App",
            "value": "app"
          },
          {
            "displayValue": "Connected TV",
            "value": "tv"
          },
          {
            "displayValue": "Games Console",
            "value": "cnsl"
          },
          {
            "displayValue": "Internet of Things",
            "value": "iot"
          },
          {
            "displayValue": "[Custom]",
            "value": "custom"
          }
        ],
        "displayName": "Platform",
        "simpleValueType": true,
        "name": "platform",
        "type": "SELECT",
        "subParams": [
          {
            "alwaysInSummary": false,
            "enablingConditions": [
              {
                "paramName": "platform",
                "type": "EQUALS",
                "paramValue": "custom"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "displayName": "",
            "simpleValueType": true,
            "name": "customPlatform",
            "type": "TEXT"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Privacy",
    "name": "trackerParamsPrivacy",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "True",
            "value": true
          },
          {
            "displayValue": "False",
            "value": false
          }
        ],
        "displayName": "Respect \"Do Not Track\"",
        "simpleValueType": true,
        "name": "respectDoNotTrack",
        "type": "SELECT"
      },
      {
        "type": "SELECT",
        "name": "anonymousTracking",
        "displayName": "Anonymous Tracking",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": "anonymousTrackingFalse",
            "displayValue": "False"
          },
          {
            "value": "anonymousTrackingTrue",
            "displayValue": "True"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "anonymousTrackingFalse",
        "subParams": [
          {
            "type": "CHECKBOX",
            "name": "withServerAnonymization",
            "checkboxText": "Server Anonymization",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "anonymousTracking",
                "paramValue": "anonymousTrackingTrue",
                "type": "EQUALS"
              }
            ],
            "defaultValue": false
          },
          {
            "type": "CHECKBOX",
            "name": "withSessionTracking",
            "checkboxText": "Anonymous Session Tracking",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "anonymousTracking",
                "paramValue": "anonymousTrackingTrue",
                "type": "EQUALS"
              }
            ],
            "defaultValue": false
          }
        ],
        "help": "Please read \u003ca href\u003d\"https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/javascript-trackers/javascript-tracker/javascript-tracker-v3/tracker-setup/initialization-options/#Anonymous_Tracking\"\u003ethis documentation\u003c/a\u003e carefully before selecting Anonymous Tracking in order to understand the implications."
      }
    ]
  },
  {
    "displayName": "Cookie Settings",
    "name": "trackerParamsCookie",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "alwaysInSummary": false,
        "selectItems": [
          {
            "displayValue": "Cookie and Local Storage",
            "value": "cookieAndLocalStorage"
          },
          {
            "displayValue": "Cookie",
            "value": "cookie"
          },
          {
            "displayValue": "Local Storage",
            "value": "localStorage"
          },
          {
            "value": "none",
            "displayValue": "None"
          }
        ],
        "displayName": "State Storage Strategy",
        "simpleValueType": true,
        "name": "stateStorageStrategy",
        "type": "SELECT",
        "defaultValue": "cookieAndLocalStorage"
      },
      {
        "help": "Set to \u003cstrong\u003eauto\u003c/strong\u003e to have Snowplow write the cookie on the root domain.",
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "type": "EQUALS",
            "paramValue": "cookie"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ],
        "displayName": "Cookie Domain",
        "defaultValue": "auto",
        "simpleValueType": true,
        "name": "cookieDomain",
        "type": "TEXT"
      },
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "type": "EQUALS",
            "paramValue": "cookie"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ],
        "displayName": "Cookie Name",
        "defaultValue": "sp",
        "simpleValueType": true,
        "name": "cookieName",
        "type": "TEXT",
        "help": "Use this field to set the first-party cookie name prefix of the tracker instance. The default value is different to the JavaScript tracker\u0027s default. If you want it to be the same, set this to \u003cstrong\u003e_sp_\u003c/strong\u003e"
      },
      {
        "selectItems": [
          {
            "displayValue": "2 years",
            "value": 63072000
          },
          {
            "displayValue": "1 year",
            "value": 31536000
          },
          {
            "displayValue": "6 months",
            "value": 15552000
          },
          {
            "displayValue": "3 months",
            "value": 7776000
          },
          {
            "displayValue": "1 month",
            "value": 2592000
          },
          {
            "displayValue": "7 days",
            "value": 604800
          },
          {
            "displayValue": "1 day",
            "value": 86400
          },
          {
            "displayValue": "Session",
            "value": 0
          },
          {
            "displayValue": "Disable first-party cookie",
            "value": -1
          },
          {
            "displayValue": "[Custom lifetime]",
            "value": "custom"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "type": "EQUALS",
            "paramValue": "cookie"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ],
        "displayName": "Cookie Lifetime",
        "simpleValueType": true,
        "name": "cookieLifetime",
        "type": "SELECT",
        "subParams": [
          {
            "enablingConditions": [
              {
                "paramName": "cookieLifetime",
                "type": "EQUALS",
                "paramValue": "custom"
              }
            ],
            "valueValidators": [
              {
                "type": "POSITIVE_NUMBER"
              }
            ],
            "simpleValueType": true,
            "name": "customCookieLifetime",
            "type": "TEXT"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "cookieSameSite",
        "displayName": "Cookie SameSite",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": "None",
            "displayValue": "None"
          },
          {
            "value": "Lax",
            "displayValue": "Lax"
          },
          {
            "value": "Strict",
            "displayValue": "Strict"
          },
          {
            "value": "noSameSite",
            "displayValue": "null"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookie",
            "type": "EQUALS"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ],
        "defaultValue": "Lax"
      },
      {
        "type": "SELECT",
        "name": "cookieSecure",
        "displayName": "Cookie Secure",
        "selectItems": [
          {
            "value": true,
            "displayValue": "True"
          },
          {
            "value": false,
            "displayValue": "False"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookie",
            "type": "EQUALS"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "sessionCookieTimeout",
        "displayName": "Session Cookie Timeout",
        "simpleValueType": true,
        "valueUnit": "seconds",
        "defaultValue": 1800,
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookie",
            "type": "EQUALS"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "maxLocalStorageQueueSize",
        "displayName": "Maximum Local Storage Queue Size",
        "simpleValueType": true,
        "defaultValue": 1000,
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "localStorage",
            "type": "EQUALS"
          }
        ],
        "valueUnit": "events"
      }
    ]
  },
  {
    "displayName": "Dispatching",
    "name": "trackerParamsHit",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "POST",
            "value": "post"
          },
          {
            "displayValue": "GET",
            "value": "get"
          },
          {
            "displayValue": "Beacon",
            "value": "beacon"
          }
        ],
        "displayName": "Dispatch Method",
        "simpleValueType": true,
        "name": "eventMethod",
        "type": "SELECT",
        "defaultValue": "post"
      },
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "True",
            "value": true
          },
          {
            "displayValue": "False",
            "value": false
          }
        ],
        "displayName": "Encode Into Base64",
        "simpleValueType": true,
        "name": "encodeBase64",
        "type": "SELECT"
      },
      {
        "enablingConditions": [
          {
            "paramName": "eventMethod",
            "type": "NOT_EQUALS",
            "paramValue": "get"
          }
        ],
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ],
        "displayName": "Buffer Size",
        "defaultValue": 1,
        "simpleValueType": true,
        "name": "bufferSize",
        "type": "TEXT"
      },
      {
        "enablingConditions": [
          {
            "paramName": "eventMethod",
            "type": "NOT_EQUALS",
            "paramValue": "get"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "POST Path",
        "defaultValue": "/com.snowplowanalytics.snowplow/tp2",
        "simpleValueType": true,
        "name": "postPath",
        "type": "TEXT"
      },
      {
        "enablingConditions": [
          {
            "paramName": "eventMethod",
            "type": "NOT_EQUALS",
            "paramValue": "get"
          }
        ],
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ],
        "displayName": "Maximum POST Payload Size",
        "defaultValue": 40000,
        "simpleValueType": true,
        "name": "maxPostBytes",
        "valueUnit": "bytes",
        "type": "TEXT"
      },
      {
        "type": "TEXT",
        "name": "connectionTimeout",
        "displayName": "Connection Timeout",
        "simpleValueType": true,
        "defaultValue": 5000,
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ],
        "help": "Set the connection timeout for POST and GET requests.The recommended value is between 5000 and 10000.",
        "valueUnit": "milliseconds"
      }
    ]
  },
  {
    "displayName": "Predefined Contexts",
    "name": "trackerParamsContexts",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "simpleValueType": true,
        "name": "webPage",
        "checkboxText": "webPage",
        "type": "CHECKBOX",
        "defaultValue": true
      },
      {
        "simpleValueType": true,
        "name": "performanceTiming",
        "checkboxText": "performanceTiming",
        "type": "CHECKBOX"
      },
      {
        "simpleValueType": true,
        "name": "gaCookies",
        "checkboxText": "gaCookies",
        "type": "CHECKBOX"
      },
      {
        "type": "CHECKBOX",
        "name": "clientHints",
        "checkboxText": "clientHints",
        "simpleValueType": true
      },
      {
        "simpleValueType": true,
        "name": "geolocation",
        "checkboxText": "geolocation",
        "type": "CHECKBOX"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const UNPKG = 'https://unpkg.com/browse/@snowplow/javascript-tracker@' + data.version + '/dist/sp.js';
const JSDELIVR = 'https://cdn.jsdelivr.net/npm/@snowplow/javascript-tracker@' + data.version + '/dist/sp.min.js';

const libUrl = data.spLibrary === 'unpkg' ? UNPKG
             : (data.spLibrary === 'jsDelivr' ? JSDELIVR
             : data.selfHostedUrl);

const anonymousTracking = () => {
  if (data.anonymousTracking === 'anonymousTrackingFalse' || !data.anonymousTracking) {
    return false;
  } else if (data.anonymousTracking === 'anonymousTrackingTrue') {
    return {
      withServerAnonymisation: data.withServerAnonymisation || false,
      withSessionTracking: data.withSessionTracking || false
    };
  }
  return data.anonymousTracking;
}();

return {
  type: 'snowplow',
  appId: data.appId,
  platform: data.platform === 'custom' ? data.customPlatform : data.platform,
  respectDoNotTrack: data.respectDoNotTrack,
  stateStorageStrategy: data.stateStorageStrategy,
  cookieDomain: data.cookieDomain !== 'auto' && data.cookieDomain,
  discoverRootDomain: data.cookieDomain === 'auto',
  cookieName: data.cookieName,
  cookieLifetime: data.cookieLifetime !== 'custom' ? data.cookieLifetime : data.customCookieLifetime,
  cookieSameSite: data.cookieSameSite === 'noSameSite' ? null : data.cookieSameSite,
  cookieSecure: data.cookieSecure,
  sessionCookieTimeout: data.sessionCookieTimeout,
  maxLocalStorageQueueSize: data.maxLocalStorageQueueSize,
  eventMethod: data.eventMethod,
  encodeBase64: data.encodeBase64,
  bufferSize: data.bufferSize,
  postPath: data.postPath,
  maxPostBytes: data.maxPostBytes,
  connectionTimeout: data.connectionTimeout,
  anonymousTracking: anonymousTracking,
  contexts: {
    webPage: data.webPage,
    performanceTiming: data.performanceTiming,
    gaCookies: data.gaCookies,
    clientHints: data.clientHints,
    geolocation: data.geolocation,
  },
  trackerOptions: {
    trackerName: data.trackerName,
    collectorEndpoint: data.collectorEndpoint,
    libUrl: libUrl
  }
};


___TESTS___

scenarios:
- name: Variable returns expected object
  code: "const mockData = {\n  trackerName: 'snowTracker',\n  collectorEndpoint: 'https://www.test.com',\n\
    \  \n  spLibrary: 'unpkg',\n  version: '3.1.5',\n  \n  appId: 'app-id',\n  platform:\
    \ 'custom',\n  customPlatform: 'testPlatform',\n  \n  respectDoNotTrack: false,\n\
    \  anonymousTracking: 'anonymousTrackingTrue',\n  withServerAnonymisation: true,\n\
    \  withSessionTracking: false,\n  \n  stateStorageStrategy: 'cookieAndLocalStorage',\n\
    \  cookieDomain: 'auto',\n  cookieName: 'sp',\n  cookieLifetime: 'custom',\n\
    \  customCookieLifetime: '123',\n  cookieSameSite: 'Lax',\n  cookieSecure: true,\n\
    \  sessionCookieTimeout: '1800',\n  maxLocalStorageQueueSize: '123',\n  \n  eventMethod:\
    \ 'post',\n  encodeBase64: false,\n  bufferSize: '123',\n  postPath: 'postPath',\n\
    \  maxPostBytes: '123',\n  resetActivityTrackingOnPageView: true,\n  connectionTimeout:\
    \ '500',\n  \n  webPage: true,\n  performanceTiming: false,\n  gaCookies: false,\n\
    \  clientHints: false,\n  geolocation: false,\n};\n\nconst expected = {\n  type:\
    \ 'snowplow',\n  appId: mockData.appId,\n  platform: mockData.customPlatform,\n\
    \  respectDoNotTrack: mockData.respectDoNotTrack,\n  stateStorageStrategy: mockData.stateStorageStrategy,\n\
    \  cookieDomain: false,\n  discoverRootDomain: true,\n  cookieName: mockData.cookieName,\n\
    \  cookieLifetime: mockData.customCookieLifetime,\n  cookieSameSite: 'Lax',\n\
    \  cookieSecure: mockData.cookieSecure,\n  sessionCookieTimeout: mockData.sessionCookieTimeout,\n\
    \  maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,\n  eventMethod:\
    \ mockData.eventMethod,\n  encodeBase64: mockData.encodeBase64,\n  bufferSize:\
    \ mockData.bufferSize,\n  postPath: mockData.postPath,\n  maxPostBytes: mockData.maxPostBytes,\n\
    \  connectionTimeout: mockData.connectionTimeout,\n  anonymousTracking: {\n  \
    \  withServerAnonymisation: mockData.withServerAnonymisation,\n    withSessionTracking:\
    \ mockData.withSessionTracking\n  },\n  contexts: {\n    webPage: mockData.webPage,\n\
    \    performanceTiming: mockData.performanceTiming,\n    gaCookies: mockData.gaCookies,\n\
    \    geolocation: mockData.geolocation,\n    clientHints: mockData.clientHints,\n\
    \  },\n  trackerOptions: {\n    trackerName: mockData.trackerName,\n    collectorEndpoint:\
    \ mockData.collectorEndpoint,\n    libUrl: 'https://unpkg.com/browse/@snowplow/javascript-tracker@'\
    \ + mockData.version + '/dist/sp.js'\n  }\n};\n  \n// Call runCode to run the\
    \ template's code.\nconst variableResult = runCode(mockData);\n\n// Verify that\
    \ the variable returns a result.\nassertThat(variableResult).isEqualTo(expected);"
- name: Test anonymous tracking false
  code: "const mockData = {\n  trackerName:\"spTracker\",\n  collectorEndpoint:\"\
    test\",\n  \n  spLibrary: 'unpkg',\n  version: '3.1.5',\n  \n  appId:\"my-site\"\
    ,\n  platform:\"web\",\n  \n  respectDoNotTrack:true,\n  anonymousTracking:\"\
    anonymousTrackingFalse\",\n  \n  stateStorageStrategy:\"cookieAndLocalStorage\"\
    ,\n  cookieDomain:\"auto\",\n  cookieName:\"sp\",\n  cookieLifetime:63072000,\n\
    \  cookieSameSite:\"Lax\",\n  sessionCookieTimeout:\"1800\",\n  cookieSecure:true,\n\
    \  maxLocalStorageQueueSize:\"1000\",\n  \n  eventMethod:\"post\",\n  postPath:\"\
    /com.snowplowanalytics.snowplow/tp2\",\n  bufferSize:\"1\",\n  encodeBase64:true,\n\
    \  maxPostBytes:\"40000\",\n  connectionTimeout:\"5000\",\n  \n  webPage:true,\n\
    \  gaCookies:false,\n  clientHints:false,\n  performanceTiming:false,\n  geolocation:false,\n\
    };\n\nconst expected = {\n  type: 'snowplow',\n  appId: mockData.appId,\n  platform:\
    \ mockData.platform,\n  respectDoNotTrack: mockData.respectDoNotTrack,\n  stateStorageStrategy:\
    \ mockData.stateStorageStrategy,\n  cookieDomain: false,\n  discoverRootDomain:\
    \ true,\n  cookieName: mockData.cookieName,\n  cookieLifetime: mockData.cookieLifetime,\n\
    \  cookieSameSite: 'Lax',\n  cookieSecure: mockData.cookieSecure,\n  sessionCookieTimeout:\
    \ mockData.sessionCookieTimeout,\n  maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,\n\
    \  eventMethod: mockData.eventMethod,\n  encodeBase64: mockData.encodeBase64,\n\
    \  bufferSize: mockData.bufferSize,\n  postPath: mockData.postPath,\n  maxPostBytes:\
    \ mockData.maxPostBytes,\n  connectionTimeout: mockData.connectionTimeout,\n \
    \ anonymousTracking: false,\n  contexts: {\n    webPage: mockData.webPage,\n \
    \   performanceTiming: mockData.performanceTiming,\n    gaCookies: mockData.gaCookies,\n\
    \    geolocation: mockData.geolocation,\n    clientHints: mockData.clientHints,\n\
    \  },\n  trackerOptions: {\n    trackerName: mockData.trackerName,\n    collectorEndpoint:\
    \ mockData.collectorEndpoint,\n    libUrl: 'https://unpkg.com/browse/@snowplow/javascript-tracker@'\
    \ + mockData.version + '/dist/sp.js'\n  }\n};\n\n// Call runCode to run the template's\
    \ code.\nlet variableResult = runCode(mockData);\n\n// Verify that the variable\
    \ returns a result.\nassertThat(variableResult).isEqualTo(expected);"
- name: Test anonymous tracking from variable
  code: "const myConsentVar = {\n  withServerAnonymisation: true,\n  withSessionTracking:\
    \ true\n};\n\nconst mockData = {\n  trackerName:\"spTracker\",\n  collectorEndpoint:\"\
    test\",\n  \n  spLibrary: 'unpkg',\n  version: '3.1.5',\n  \n  appId:\"my-site\"\
    ,\n  platform:\"web\",\n  \n  respectDoNotTrack:true,\n  anonymousTracking:myConsentVar,\n\
    \  \n  stateStorageStrategy:\"cookieAndLocalStorage\",\n  cookieDomain:\"auto\"\
    ,\n  cookieName:\"sp\",\n  cookieLifetime:63072000,\n  cookieSameSite:\"Lax\"\
    ,\n  sessionCookieTimeout:\"1800\",\n  cookieSecure:true,\n  maxLocalStorageQueueSize:\"\
    1000\",\n  \n  eventMethod:\"post\",\n  postPath:\"/com.snowplowanalytics.snowplow/tp2\"\
    ,\n  bufferSize:\"1\",\n  encodeBase64:true,\n  maxPostBytes:\"40000\",\n  connectionTimeout:\"\
    5000\",\n  \n  webPage:true,\n  gaCookies:false,\n  clientHints:false,\n  performanceTiming:false,\n\
    \  geolocation:false,\n};\n\nconst expected = {\n  type: 'snowplow',\n  appId:\
    \ mockData.appId,\n  platform: mockData.platform,\n  respectDoNotTrack: mockData.respectDoNotTrack,\n\
    \  stateStorageStrategy: mockData.stateStorageStrategy,\n  cookieDomain: false,\n\
    \  discoverRootDomain: true,\n  cookieName: mockData.cookieName,\n  cookieLifetime:\
    \ mockData.cookieLifetime,\n  cookieSameSite: 'Lax',\n  cookieSecure: mockData.cookieSecure,\n\
    \  sessionCookieTimeout: mockData.sessionCookieTimeout,\n  maxLocalStorageQueueSize:\
    \ mockData.maxLocalStorageQueueSize,\n  eventMethod: mockData.eventMethod,\n \
    \ encodeBase64: mockData.encodeBase64,\n  bufferSize: mockData.bufferSize,\n \
    \ postPath: mockData.postPath,\n  maxPostBytes: mockData.maxPostBytes,\n  connectionTimeout:\
    \ mockData.connectionTimeout,\n  anonymousTracking: myConsentVar,\n  contexts:\
    \ {\n    webPage: mockData.webPage,\n    performanceTiming: mockData.performanceTiming,\n\
    \    gaCookies: mockData.gaCookies,\n    geolocation: mockData.geolocation,\n\
    \    clientHints: mockData.clientHints,\n  },\n  trackerOptions: {\n    trackerName:\
    \ mockData.trackerName,\n    collectorEndpoint: mockData.collectorEndpoint,\n\
    \    libUrl: 'https://unpkg.com/browse/@snowplow/javascript-tracker@' + mockData.version\
    \ + '/dist/sp.js'\n  }\n};\n\n// Call runCode to run the template's code.\nlet\
    \ variableResult = runCode(mockData);\nassertThat(variableResult).isEqualTo(expected);\n"
setup: ''


___NOTES___

Created on 16/08/2019, 09:46:59
