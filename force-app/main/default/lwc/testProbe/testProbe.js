import { LightningElement, api } from 'lwc';

export default class TestProbe extends LightningElement {
    @api cardTitle = 'LWC Test Probe';
    @api message = 'Hello from your test Lightning Web Component.';

    clicked = false;

    get statusLabel() {
        return this.clicked ? 'Interactive test passed' : 'Rendered';
    }

    handleClick() {
        this.clicked = true;
    }
}