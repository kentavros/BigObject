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
}