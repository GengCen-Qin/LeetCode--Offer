package com.qinsicheng.day1;

import java.util.Stack;

/**
 * 用两个栈实现一个队列。队列的声明如下，
 * 请实现它的两个函数 appendTail 和 deleteHead ，
 * 分别完成在队列尾部插入整数和在队列头部删除整数的功能。
 * (若队列中没有元素，deleteHead 操作返回 -1 )
 */
class CQueue {
    private Stack<Integer> inStack;
    private Stack<Integer> outStack;

    public CQueue() {
        inStack = new Stack<Integer>();
        outStack = new Stack<Integer>();
    }
    
    public void appendTail(int value) {
        inStack.add(value);
    }
    
    public int deleteHead() {
        if (isEmpty()) {
            return -1;
        }
        if (!outStack.isEmpty()) {
            return outStack.pop();
        }
        // 说明 inStack 内还有数据
        while (!inStack.isEmpty()) {
            outStack.add(inStack.pop());
        }
        return outStack.pop();
    }

    public boolean isEmpty() {
        return inStack.isEmpty() && outStack.isEmpty();
    }
}