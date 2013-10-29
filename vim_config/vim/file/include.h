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

namespace social_mining {
  class WhatClass {
    public:
      // virtual
      ~WhatClass();

      // virtual void Run();
      // make it singleton
    private:
      WhatClass();
      friend struct DefaultSingletonTraits<WhatClass>;
      DISALLOW_COPY_AND_ASSIGN(WhatClass);
  };
}  // namespace social_mining
