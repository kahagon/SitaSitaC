#include "node.h"

void node_do_assign(node* result, node* variable, node* value) {
    result->value = value->value;
    result->entity = (void*)0;
}
