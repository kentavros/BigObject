/*
 * Created by ashcherbanyuk on 7/19/2019.
 */
public with sharing class U_QueryBuilder {

	private static final String SELECT_q = 'SELECT ';
	private static final String FROM_q = ' FROM ';
	private static final String WHERE_q = ' WHERE ';
	private static final String AND_q = ' AND ';

	public static String getQueryForBigObject(String bigObjectApiName){

//		return SELECT_q + 'Game_User_Account__c, Play_Date__c, Game_Platform__c, In_Game_Purchase__c, ' +
//				'Level_Achieved__c, Lives_This_Game__c, Play_Duration__c, Score_This_Game__c' +
//				FROM_q + bigObjectApiName;
//		return SELECT_q + 'Id, Name' + FROM_q + bigObjectApiName;

		return 'SELECT Game_User_Account__c FROM Customer_Interaction__b';
	}

}