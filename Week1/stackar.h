#pragma once
typedef int int;
#ifndef _stack_h
#define _stack_h

struct stackrecord;
typedef struct stackrecord* stack;

bool isempty(stack s);
bool isfull(stack s);
stack createstack(int maxelements);
void disposestack(stack s);
void makeempty(stack s);
void push(int x, stack s);
void pop(stack s);
int top(stack s);

#endif