import { LightningElement, wire } from 'lwc';
import getProperties from "@salesforce/apex/PropertyServices.getProperties";

export default class PropertyList extends LightningElement {
    @wire(getProperties) PropertyList;
}