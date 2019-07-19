global with sharing class B_bigObject implements Database.Batchable<SObject> {


    global Database.QueryLocator start(Database.BatchableContext batchContext) {

        String query = 'SELECT Game_User_Account__c, Play_Date__c, Game_Platform__c, In_Game_Purchase__c, Level_Achieved__c, Lives_This_Game__c, Play_Duration__c, Score_This_Game__c  FROM Customer_Interaction__b';

        //TODO: add soql
        //TODO: add soql
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext batchContext, SObject[] records) {

    }

    global void finish(Database.BatchableContext batchContext){

    }


}
