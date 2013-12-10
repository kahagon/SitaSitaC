
#ifndef NODE_H
#define NODE_H

typedef struct {
    unsigned char* entity;
    unsigned char* value;
} node;

void node_do_assign(node* result, node* variable, node* value);

#endif /* NODE_H */
