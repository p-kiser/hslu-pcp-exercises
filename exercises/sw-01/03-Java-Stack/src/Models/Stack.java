package Models;

import Interfaces.IStack;

public class Stack implements IStack {

    private static final int STACK_EMPTY_INDEX = -1;
    private int index;
    private Element topElement;

    public Stack() {
        this.index = STACK_EMPTY_INDEX;
        topElement = null;
    }

    @Override
    public void push(Element e) {

        if (this.topElement != null) {
            e.setNext(this.topElement);
        }
        this.topElement = e;
        this.index++;
    }

    @Override
    public Element top() {
        return this.topElement;
    }

    @Override
    public boolean pop() {
        if (this.index > Stack.STACK_EMPTY_INDEX) {
            this.topElement = this.topElement.getNext();
            this.index--;

            return true;
        }

        return false;
    }

    @Override
    public void print() {
        String s = "print - ";

        if (!this.isEmpty()) {
            s += "Stack contains: ";
            Element curr = this.top();
            while (curr != null) {
                s += String.format(" %s,", curr.getValue());
                curr = curr.getNext();
            }
            s += String.format("top Element = %s", this.top().getValue());
        } else {
            s += "Stack is empty";
        }

        System.out.println(s);
    }

    @Override
    public boolean isEmpty() {
        return index == STACK_EMPTY_INDEX;
    }

    @Override
    public int size() {
        return index + 1;
    }
}
