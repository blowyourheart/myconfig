#include <string>
#include <vector>
#include <set>
#include <map>
#include <alogrithm>
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

#include "infrastructure/mapreduce/public/mapred.h"
#include "indexing/proto/gen-cpp/mergeddoc_types.h"

using namespace mapreduce;
using namespace indexing;

namespace social_mining {
class WhatMapper : public MergedDocMapper {
 public:
  virtual ~WhatMapper() {
  }

  void OnCreate(TaskContext* context) {
    incounter_ = context->getCounter("mergedoc", "num_input");
    matchcounter_ = context->getCounter("mergedoc", "totally_match");
  }

  void Map(MergedDoc* doc, MapContext* context) {
    context->Emit(doc->url, doc->seg_body);
  }

 private:
  mapreduce::Counter* incounter_;
  mapreduce::Counter* matchcounter_;
};

class WhatReducer : public BasicReducer {
 public:
  virtual ~WhatReducer() {
  }

  void OnCreate(TaskContext* context) {
  }

  void Reduce(ReduceContext* context) {
    while (context->NextValue()) {
      context->Emit(context->GetInputKey(), context->GetInputValue());
    }
  }

 private:
  ;
};

}

REGIST_MAP_RED(social_mining::WhatMapper,
   social_mining::WhatReducer);
