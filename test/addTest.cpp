#include "mainTest.hpp"
#include "../lib/add.hpp"

TEST_CASE() { REQUIRE(Sum2N(2, 52) == 54); }
TEST_CASE() { REQUIRE(Sum2N(2, 5) == 7); }