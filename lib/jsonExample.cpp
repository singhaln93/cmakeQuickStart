#include "jsonExample.hpp"
using namespace ns;

void to_json(json &j, const person &p)
{
    j = json{{"name", p.name}, {"address", p.address}, {"age", p.age}};
}

void from_json(const json &j, person &p)
{
    j.at("name").get_to(p.name);
    j.at("address").get_to(p.address);
    j.at("age").get_to(p.age);
}