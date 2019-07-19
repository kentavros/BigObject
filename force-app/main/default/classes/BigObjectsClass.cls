public with sharing class BigObjectsClass {


    @AuraEnabled
    public static  Customer_Interaction__b[] getCustomerInteractions(){
        Customer_Interaction__b[] customerInteractions = new Customer_Interaction__b[]{};
        
        try {
            customerInteractions.addAll([
                SELECT Game_User_Account__c, Game_Platform__c, In_Game_Purchase__c, Level_Achieved__c, Lives_This_Game__c, Play_Duration__c, Score_This_Game__c  
                FROM Customer_Interaction__b LIMIT 5
            ]);
        } catch(Exception e) {
            System.debug(e.getMessage());
        }

        return customerInteractions;
    }

}
