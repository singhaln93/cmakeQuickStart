#pragma once
#include "../dep/json/single_include/nlohmann/json.hpp"
using json = nlohmann::json;

namespace ns
{
    // a simple struct to model a person
    struct person
    {
        std::string name;
        std::string address;
        int age;
    };

    void to_json(json &j, const person &p);
    void from_json(const json &j, person &p);
}