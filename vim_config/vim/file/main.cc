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
#include "base/yr.h"
// #include "base/flags.h"
// #include "base/shared_ptr.h"
// #include "base/thrift.h"

#include "bi/social_mining/weibo/public/final_output/fill_weibo.h"
#include "bi/social_mining/weibo/public/zone_detect/zone_detect.h"
#include "bi/social_mining/weibo/public/zone_detect/region_util.h"
// #include "util/release/release_path.h"
// #include "bi/social_mining/weibo/public/seg_jump_trie/seg_jump_trie.h"

// some thrift mostly used
#include "bi/social_mining/proto/weibo/gen-cpp/inner_weibo_mergeddoc_types.h"
#include "bi/social_mining/proto/weibo/gen-cpp/weibo_analysis_info_types.h"
// #include "bi/crawl/mblog/proto/gen-cpp/extra_social_data_types.h"

using namespace social_mining;  // NOLINT
using namespace social_mining::region_identify;  // NOLINT
using namespace sentiment;  // NOLINT

DEFINE_string(file_name, "", "");
DEFINE_int32(max_count, 0, "");
base::AtExitManager atExit;

int main(int argc, char** argv) {
  base::ParseCommandLineFlags(&argc, &argv, true);
  SSReader reader(FLAGS_file_name);
  Type t;
  int process_count = 0;
  while (reader.ReadNext(&t)) {
    process_count++;
    // do something

    if (FLAGS_max_count > 0 && process_count >= FLAGS_max_count) {
      break;
    }
  }
  return 0;
}
