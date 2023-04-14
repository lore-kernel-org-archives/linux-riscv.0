Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B2DC77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 02:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPvejEklgYiXIGo+v4QZfsnI7nvZn7sfu9ZbBDewbvE=; b=AO3LSOstuop4NP
	YyFhjmLtV2AXdbiev3/i3nCWjOKnD4PD9Sx+0XN3qyCYaO4ODQfpik2bwR/pTKBCvpXXYkE/rhBNh
	zShArJxC9xqGD21MbgXXXMMGJc2sqDPwoiJbM3KQBspfOdRT5mXP2OE15H9qkQluXCbEHqDpSa0JK
	2oWiS0+Cwu3Sllgb6fydpawYJkyOrRewzy7kcmXOayNVn3qPtRBRpG6YQ8BMVfuqW28i+Fq+N6OWb
	Ges28Tq51xQ/NTO1QxHmluzs1OJI+6zfLYyCnba9r4mVSOm15xK941Vk7alnZdp1FaqTCybThVAWX
	dxseCMY4zgyw8lkEHRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn8tM-0085Fq-2A;
	Fri, 14 Apr 2023 02:10:24 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn8tK-0085Ew-08;
	Fri, 14 Apr 2023 02:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681438221; x=1712974221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IeRnQ+CQcJwGbjz4GOR0Cyk0yJ9hc73wDuZH6+tv/hs=;
  b=nONnpkkPCs3xdaqnOKU9Cf4ije6ogioOx37Rkgka6COgkAUZXq34xg1L
   4XUnB0sq5cIGV0hhJU4Lcp4n7FZ8WcT/KDG1/jJLGzlHKOVb4s9qn/Ge7
   neyvxpDzUXY74fxgaHP3ft5nsBqVZbpnpu5mPg/4lrX4LthLZZmFyjt2d
   KYN+EIsAwkcRJt6sYPpLID4p6qNOWKQDXRYIewUT60eMWMBwyiN+/ZWhu
   hxmoGm9WVoAUk+fya0Cjwa9cg5hN5DNACnZwL+gpitBQRCQH5GWwpPvT2
   EeGvtzdg25e4qthSlKkcYj9o23XcpERh1DDi3XBhPrJwHDhn86GtvcXgN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="372222362"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="372222362"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 19:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="720102853"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="720102853"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Apr 2023 19:10:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn8t8-000Z8D-0o;
	Fri, 14 Apr 2023 02:10:10 +0000
Date: Fri, 14 Apr 2023 10:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 4/4] riscv: Enable perf counters user access only through
 perf
Message-ID: <202304140904.9oAVhFHu-lkp@intel.com>
References: <20230413161725.195417-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230413161725.195417-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_191022_093382_125EE873 
X-CRM114-Status: GOOD (  16.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on acme/perf/core tip/master tip/auto-latest linus/master v6.3-rc6]
[cannot apply to next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/perf-Fix-wrong-comment-about-default-event_idx/20230414-002232
patch link:    https://lore.kernel.org/r/20230413161725.195417-5-alexghiti%40rivosinc.com
patch subject: [PATCH 4/4] riscv: Enable perf counters user access only through perf
config: riscv-randconfig-r036-20230412 (https://download.01.org/0day-ci/archive/20230414/202304140904.9oAVhFHu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8ca9b21cbf2c0b91ee35356c01aef9da7d874e55
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/perf-Fix-wrong-comment-about-default-event_idx/20230414-002232
        git checkout 8ca9b21cbf2c0b91ee35356c01aef9da7d874e55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140904.9oAVhFHu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/perf_event.c:8:28: error: call to undeclared function 'to_riscv_pmu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
                                     ^
>> arch/riscv/kernel/perf_event.c:8:20: error: incompatible integer to pointer conversion initializing 'struct riscv_pmu *' with an expression of type 'int' [-Wint-conversion]
           struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
                             ^       ~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/perf_event.c:24:27: error: incomplete definition of type 'struct riscv_pmu'
           userpg->pmc_width = rvpmu->ctr_get_width(event->hw.idx) + 1;
                               ~~~~~^
   arch/riscv/kernel/perf_event.c:8:9: note: forward declaration of 'struct riscv_pmu'
           struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
                  ^
   3 errors generated.


vim +/to_riscv_pmu +8 arch/riscv/kernel/perf_event.c

     4	
     5	void arch_perf_update_userpage(struct perf_event *event,
     6				       struct perf_event_mmap_page *userpg, u64 now)
     7	{
   > 8		struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
     9		struct clock_read_data *rd;
    10		unsigned int seq;
    11		u64 ns;
    12	
    13		userpg->cap_user_time = 0;
    14		userpg->cap_user_time_zero = 0;
    15		userpg->cap_user_time_short = 0;
    16		userpg->cap_user_rdpmc =
    17			!!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT);
    18	
    19		/*
    20		 * The counters are 64-bit but the priv spec doesn't mandate all the
    21		 * bits to be implemented: that's why, counter width can vary based on
    22		 * the cpu vendor.
    23		 */
  > 24		userpg->pmc_width = rvpmu->ctr_get_width(event->hw.idx) + 1;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
