Feature: sample karate test script

  Background:
    * url 'https://jsonplaceholder.typicode.com/users/'
    * configure ssl = true
    #* configure headers = {Content-Type: 'application/x-www-form-urlencoded', accept: 'application/json'}


  @GetUsers
  Scenario Outline: Get Users
    * header Content-Type = 'application/x-www-form-urlencoded'
    * header accept = 'application/json'
    Given url 'https://jsonplaceholder.typicode.com/users/'
    When method get
    * print response
    Then status 200
    And assert response.length==10
    Examples:
      |Id                 |
      |2                  |

  @GetUsersById
  Scenario Outline: Get Users By Id
    * header Content-Type = 'application/x-www-form-urlencoded'
    * header accept = 'application/json'
    Given url 'https://jsonplaceholder.typicode.com/users/<Id>'
    When method get
    * print response
    Then status 200
    And assert response.name=='Nicholas Runolfsdottir V'
    Examples:
      |Id                 |
      |8                  |




  @VerifyPostUsersRequest
  Scenario Outline: Verify Post Request
    * header Content-Type = 'application/x-www-form-urlencoded'
    * header accept = 'application/json'
    And request { id: '<Id>' , name: '<name>',username:'<username>',email:'<email>',address:{"street": "<street>","suite": "<suite>",city:"<city>",zip-code:"<zip-code>",geo:{lat:"<lat>",lng:"<lat>"}},phone:"<phone>",website:"<website>",company:{name:"<companyName>",catchPhrase:"<catchPhrase>",bs:"<bs>"}}
    When method POST
    Then status 201
    * def resp = {"id":11,"{\"id\":\"11\",\"name\":\"Khaya Mqikela\",\"username\":\"Kairo\",\"email\":\"Khaya.Mqikela@yahoo.com\",\"address\":{\"street\":\"Kulas Light\",\"suite\":\"Apt. 556\",\"city\":\"Gwenborough\",\"zip-code\":\"92998-3874\",\"geo\":{\"lat\":\"81.1496\",\"lng\":\"81.1496\"}},\"phone\":\"1-770-736-8031 x56442\",\"website\":\"hildegard.org\",\"company\":{\"name\":\"Romaguera-Crona\",\"catchPhrase\":\"Multi-layered client-server neural-net\",\"bs\":\"harness real-time e-markets\"}}":""}
    And match resp == response
    Examples:
      |     Id             |name         |username|email                  |street     |suite   |city       |zip-code  |lat       |lat    |phone                     |website      |companyName    |catchPhrase                           |bs                           |
      |11                  |Khaya Mqikela|Kairo   |Khaya.Mqikela@yahoo.com|Kulas Light|Apt. 556|Gwenborough|92998-3874|92998-3874|81.1496|1-770-736-8031 x56442     |hildegard.org|Romaguera-Crona|Multi-layered client-server neural-net|harness real-time e-markets  |


