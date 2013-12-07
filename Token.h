

#include <string>
#ifndef TOKEN_H
#define TOKEN_H

#define T_LNUMBER 1

namespace SSC {

class Token {
    private:
        int type;
        std::string entity;
        std::string moduleName;
        int line;
    public:
        Token(int _type, std::string _entity, std::string _moduleName, int _line) 
        : type(_type), entity(_entity), moduleName(_moduleName), line(_line) {};
        int getType() { return type; };
        std::string getEntity() { return entity; };
        std::string getModuleName() { return moduleName; };
        int getLine() { return line; };
};

}

#endif /* TOKEN_H */
