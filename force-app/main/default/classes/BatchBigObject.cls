/*
 * Created by ashcherbanyuk on 7/19/2019.
 */
global with sharing class BatchBigObject implements Database.Batchable<SObject>, Database.Stateful {

	public Integer numberOfRecords = 0;
	public String bigObjectApiName;

	public BatchBigObject(String apiName) {

		if (apiName == null || apiName == '') {
			throw new CustomException('400 Bad Request');
		}

		this.bigObjectApiName = apiName;
	}

//Iterable
	global Iterable<sObject> start(Database.BatchableContext batchContext) {
		Integer count = Limits.getLimitQueryRows() - Limits.getQueryRows();
		Customer_Interaction__b[] bigObjectRecords = [SELECT Game_User_Account__c FROM Customer_Interaction__b LIMIT :count];
		return bigObjectRecords;
	}

//	QueryLocator
//	global Database.QueryLocator start(Database.BatchableContext batchContext) {
//		SObject s1 = new Customer_Interaction__b();
//
//		System.debug(U_QueryBuilder.getQueryForBigObject(this.bigObjectApiName));
//		return Database.getQueryLocator(U_QueryBuilder.getQueryForBigObject(this.bigObjectApiName));
//	}


	global void execute(Database.BatchableContext batchContext, SObject[] records) {
		System.debug(records.size());
		this.numberOfRecords += records.size();
	}

	global void finish(Database.BatchableContext batchContext){

		System.debug(this.numberOfRecords);
	}


}