#include <string>
#include <vector>
#include <set>
#include <map>
#include <algorithm>
#include <utility>
// #include <iostream>  // NOLINT

#include "base/logging.h"
#include "base/time.h"
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

using std::string;                                                              
using std::vector;                                                              
using std::map;                                                                 
using std::set;                                                                 
using std::pair;                                                                
using base::Time;
using base::TimeDelta;
// using std::sort; 
// using social_mining::region_identify::SkipCommentReader;
// using social_mining::region_identify::StableUnique;

namespace social_mining {
WhatClass::WhatClass() : {
}

WhatClass::~WhatClass() {
}

// bool WhatClass::Run() {
  // return true;
// }

// void WhatClass::Destroy() {
  // inited_ = false;
// }
}  // namespace social_mining
