public with sharing class AsyncBigObject {


    @AuraEnabled
    public static Integer getCountBigObjectRecords(){
        // SELECT Game_User_Account__c, Play_Date__c, Game_Platform__c, In_Game_Purchase__c, Level_Achieved__c, Lives_This_Game__c, Play_Duration__c, Score_This_Game__c  FROM Customer_Interaction__b 

        Customer_Interaction__b[] allRecords = new Customer_Interaction__b[]{};

        try {

            allRecords = [
                SELECT Game_User_Account__c, Play_Date__c, Game_Platform__c, In_Game_Purchase__c, Level_Achieved__c, Lives_This_Game__c, Play_Duration__c, Score_This_Game__c  
                FROM Customer_Interaction__b LIMIT 50000
            ];

            System.debug(allRecords.size());

            
            
        } catch (Exception e) {
           System.debug(e.getMessage());
        }

        return allRecords.size();
    }
}
