#include <string>
#include <vector>
#include <set>
#include <map>
#include <algorithm>
#include <utility>
// #include <iostream>  // NOLINT

#include "base/logging.h"
#include "base/string_util.h"
#include "base/scoped_ptr.h"
#include "base/singleton.h"
// #include "base/flags.h"
// #include "base/shared_ptr.h"
// #include "base/thrift.h"
// #include "base/yr.h"

#include "bi/social_mining/weibo/public/final_output/fill_weibo.h"
#include "bi/social_mining/weibo/public/zone_detect/zone_detect.h"
#include "bi/social_mining/weibo/public/zone_detect/region_util.h"
// #include "util/release/release_path.h"
// #include "bi/social_mining/weibo/public/seg_jump_trie/seg_jump_trie.h"

// some thrift mostly used
#include "bi/social_mining/proto/weibo/gen-cpp/inner_weibo_mergeddoc_types.h"
#include "bi/social_mining/proto/weibo/gen-cpp/weibo_analysis_info_types.h"
// #include "bi/crawl/mblog/proto/gen-cpp/extra_social_data_types.h"

#include "testing/gtest/include/gtest/gtest.h"

using namespace social_mining;  // NOLINT
using namespace social_mining::region_identify;  // NOLINT

namespace social_mining {

  struct ProgramTest : public testing::Test {
    ProgramTest()  { }
    ~ProgramTest() { }

    static void SetUpTestCase() {
    }
    static void TearDownCase() {
    }
    void SetUp() {
      // init data member here
    }
    void TearDown() {
    }

    // data member here;
  };

  TEST_F(ProgramTest, simple_test) {
    string a;
    string b;

    EXPECT_TRUE();
    EXPECT_GT();
    EXPECT_NE();
    EXPECT_EQ();
  }

}
