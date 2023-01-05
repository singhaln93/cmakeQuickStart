#include "../lib/add.hpp"
// #include "../lib/jsonExample.hpp"
//#include "../dep/json/single_include/nlohmann/json.hpp"
#include <iostream>

// using json = nlohmann::json;

int main()
{
  // create JSON arrays
  // json j_list_of_pairs = json::array({{"one", 1}, {"two", 2}});
  // serialize the JSON arrays
  // std::cout << j_list_of_pairs << '\n';

  // json j;
  // ns::person p = {"Ned Flanders", "744 Evergreen Terrace", 60};
  // ns::to_json(j, p);
  // ns::from_json(j, p);

  std::cout << "Sum is: " << Sum2N(5, 7) << std::endl;
  return 0;
}