import { LightningElement, track } from 'lwc';
import getCountBigObjectRecords from '@salesforce/apex/AsyncBigObject.getCountBigObjectRecords';

export default class AsyncBObject extends LightningElement {

    @track error;
    @track countRecords;
    @track isSpinner = false;

    handleClick() {
        
        this.toggleSpinner();

        getCountBigObjectRecords()
        .then(result => {

            this.countRecords = result;
            this.toggleSpinner();

        })
        .catch(error => {

            this.error = error;
            this.toggleSpinner();      
                 
        });
        
    }

    toggleSpinner() {
        this.isSpinner = !this.isSpinner;
    }


    /**
     * Object for post:
     *
     {
  "query": "SELECT Game_User_Account__c FROM Customer_Interaction__b",
  "operation": "insert",
  "targetObject": "ObjectTestTrigger__c",
  "targetFieldMap" : {
    "Game_User_Account__c": "Text_field__c"
  }
}
     */
}