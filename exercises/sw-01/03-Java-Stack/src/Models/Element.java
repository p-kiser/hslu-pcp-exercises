package Models;

import Interfaces.IElement;

public class Element implements IElement {

    private int value;
    private Element next;

    public Element(int value) {
        this.value = value;
        next = null;
    }

    @Override
    public int getValue() {
        return value;
    }

    @Override
    public Element getNext() {
        return next;
    }

    @Override
    public void setNext(Element next) {
        this.next = next;
    }
}
