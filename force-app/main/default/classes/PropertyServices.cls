public with sharing class PropertyServices {
    @AuraEnabled(casheable=true);
    public static List<Property__c> getProperties() {
        try {
            List<Property__c> propertyList = [
                SELECT Name, 
                Date_Listed__c, 
                Days_On_Market__c, 
                Price__c 
                FROM Property__c 
                WITH SECURITY_ENFORCED 
                ORDER BY Days_On_Market__c];
                return propertyList;
        } catch (Exception ex) {
           throw new AuraHandledException(ex.getMessage());
        }

    }


    public static Property__c createProperty(String propertyName){
        try {
            Property__c newProperty = new Property__c();
            newProperty.Name = propertyName;
            newProperty.Date_Listed__c = Date.today();
            insert newProperty;
            return newProperty;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }

    }

    public static List<Property__c> updateProperty(){
        try {
            List<Property__c> propertyList = getProperties();

            for(Property__c property : propertyList){
                property.Status__c = 'Available';
            } 

            update propertyList;
            return propertyList;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

}


