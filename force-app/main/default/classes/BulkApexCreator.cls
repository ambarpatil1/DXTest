public class BulkApexCreator {
    public static void createClasses() {
        for (Integer i = 1; i <= 10; i++) {
            // Manually padding the class name
            String className = 'BulkClass' + (i < 10 ? '00' : i < 100 ? '0' : '') + i;
            String apexBody = 'public class ' + className + ' {\n'
                            + '    public void execute() {\n'
                            + '        System.debug(\'This is ' + className + '\');\n'
                            + '    }\n'
                            + '}';

            try {
                // Use the Tooling API endpoint with the new URL method
                String toolingUrl = URL.getOrgDomainUrl().toExternalForm() + '/services/data/v50.0/tooling/sobjects/ApexClass/';
                
                HttpRequest req = new HttpRequest();
                req.setEndpoint(toolingUrl);
                req.setMethod('POST');
                req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
                req.setHeader('Content-Type', 'application/json');

                // Prepare the JSON payload
                String jsonBody = '{' +
                                  '"Name": "' + className + '",' +
                                  '"Body": "' + apexBody.replaceAll('\n', '\\n').replaceAll('\r', '\\r') + '"' +
                                  '}';
                req.setBody(jsonBody);

                // Send the HTTP request to the Tooling API
                Http http = new Http();
                HttpResponse res = http.send(req);

                // Check the response status
                if (res.getStatusCode() == 201) {
                    System.debug('Successfully created class: ' + className);
                } else {
                    System.debug('Failed to create class: ' + className + ' - ' + res.getBody());
                }

            } catch (Exception e) {
                System.debug('Error: ' + e.getMessage());
            }
        }
    }
}