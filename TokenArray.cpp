#include "TokenArray.h"

namespace SSC {

TokenArray::~TokenArray() {
    for (size_type i = 0; i < tokens.size(); i++) {
        delete tokens[i];
        tokens[i] = NULL;
    }
}

}
