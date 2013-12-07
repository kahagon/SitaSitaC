#include <vector>
#include "Token.h"

#ifndef TOKENARRAY_H
#define TOKENARRAY_H

namespace SSC {

class TokenArray {
    private:
        std::vector<Token*> tokens;

    public:
        typedef std::vector<Token*>::size_type size_type;
        // use default constructor
        //TokenArray();
        ~TokenArray();
        size_type size() {
            return tokens.size();
        }
        Token* at(size_type i) {
            return tokens.at(i);
        };
        void push_back(Token* token) {
            tokens.push_back(token);
        };
};

}

#endif /* TOKENARRAY_H */
