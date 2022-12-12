package com.qinsicheng.day1;

import java.util.Stack;

/**
 * 获取最小值栈
 */
public class MinStack {

    private Stack<Integer> stack;
    private Stack<Integer> minStack;

    /**
     * initialize your data structure here.
     */
    public MinStack() {
        stack = new Stack<Integer>();
        minStack = new Stack<Integer>();
    }

    public void push(int x) {
        stack.push(x);
        if (minStack.isEmpty() || x <= minStack.peek()) {
            minStack.push(x);
        }
    }

    public void pop() {
        Integer pop = stack.pop();
        //  这里一定注意 Integer比较  要么转化为int，要么使用Equal方法比较
        if (minStack.peek().intValue() == pop.intValue()) {
            minStack.pop();
        }
    }

    public int top() {
        return stack.isEmpty() ? -1 : stack.peek();
    }

    public int min() {
        return stack.isEmpty() ? -1 : minStack.peek();
    }
}