import { LightningElement, track } from 'lwc';
import getCustomerInteractions from '@salesforce/apex/BigObjectsClass.getCustomerInteractions';

export default class AppMain extends LightningElement {
    test = ' yyyy ';

    @track bigObjects;
    @track error

    connectedCallback() {

        let t0 = performance.now();

        getCustomerInteractions()
            .then(result => {
                this.bigObjects = this.createUniqId(result);
                // console.log(result);
                // console.log(this.bigObjects);
                let t1 = performance.now();
                console.log("Call to doSomething took " + (t1 - t0) + " milliseconds.")
            })
            .catch(error => {
                // alert('error');
                // console.log(error);
                this.error = error;
            });
    }

    createUniqId(dataList) {
        dataList.forEach((element, index) => {
            element.uniqId = index;
        });

        return dataList;
    }
}