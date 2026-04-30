Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49143CD13DA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DTIixoZf29ofK20UUe/gf3kjTzUk3RHyUk7f7dVI2A=; b=pZkQM4edgCTcVy
	lQOwGN67EiRp5Jzbqyrkhmku/mafejyAQfRLc6fGWO4sdrKMOm/CVjpD7vXtqAXfB5Ldu6mUGzCDy
	6xB4V8GmWlZxzF//4Lx6cufN+9tSZ8CT48Kmf7fh4sM/ZkrizsptiZaNs+ZJXnu+GEzgaYLkzOFwu
	gf+J8i8L1mCnYIwwxsjow9sp5swEvBthPTw33S3FgWFn6TauKURe9UniHt99d47Jtw67jakQwcfq2
	UcJkxYjIGTts97J3g9vgMs8VVtSGsqEIhirgUOO0RTkz+3SUM6DIBHb4UkQFYxu+9ayUvb+UIqKus
	KlNjR9okF159DFGmt2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITHc-00000005dZI-2drr;
	Thu, 30 Apr 2026 15:26:32 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITHa-00000005dYu-0qEL
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 15:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777562790; x=1809098790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jrMLhTOFazqSf/nfKlZBcGdopmTfk+jWZBTd7xfe2u4=;
  b=k/hv93UYYApgX+Ra6jJkDQ6J6dUCZE4Ane2CYptERqV4u0eOLPMxfg24
   mynJErhV/lacdheUj1V6SX7RGZWJWA1BRvyTHSt7ezeqahJKlKODlHkFL
   MDdEkx8TrxtWohKeku/hjSGFm5P898laSyU0XZ42Mksa8SqO/WlI1j2ti
   HA6+JufdbSzuLG8z6VlEiLK7ILOfxYpnU6V0nxw/IudDHCdW6GCvGqaz8
   UP+vcQtZI8AfqWexXDyvyvit+OAsyIMwSURX2AMy58HKMi5z/zybzLVSw
   UfllbJ49E87vGN8CwZ4gnJRIrsBwPVLlHgio2pebdP+YSjDFpQtoOE27r
   A==;
X-CSE-ConnectionGUID: b9LPP7lcSOCwnQpLycxdXw==
X-CSE-MsgGUID: g1sng68NSVKz/ZXaWGiGJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82122329"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="82122329"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 08:24:39 -0700
X-CSE-ConnectionGUID: Eik7u7RfRH6c6Mk4x3XHBw==
X-CSE-MsgGUID: BRvchASGQ5il6tA77o+T7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234500215"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2026 08:24:36 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wITFh-00000000CWK-210q;
	Thu, 30 Apr 2026 15:24:33 +0000
Date: Thu, 30 Apr 2026 23:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	atish.patra@linux.dev, anup@brainfault.org, will@kernel.org,
	palmer@dabbelt.com, pjw@kernel.org, cuiyunhui@bytedance.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	yuanzhu@bytedance.com,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH] drivers/perf: riscv: do not restart throttled events
 after overflow
Message-ID: <202604302308.Wa7Tg3es-lkp@intel.com>
References: <20260415032017.10712-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415032017.10712-1-zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_082630_881899_A4EFAD6A 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

Hi Zhanpeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhanpeng-Zhang/drivers-perf-riscv-do-not-restart-throttled-events-after-overflow/20260416-205442
base:   linus/master
patch link:    https://lore.kernel.org/r/20260415032017.10712-1-zhangzhanpeng.jasper%40bytedance.com
patch subject: [PATCH] drivers/perf: riscv: do not restart throttled events after overflow
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604302308.Wa7Tg3es-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302308.Wa7Tg3es-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302308.Wa7Tg3es-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_sbi.c:65:33: error: use of undeclared identifier 'MAX_INTERRUPTS'
      65 |         return event->hw.interrupts == MAX_INTERRUPTS;
         |                                        ^~~~~~~~~~~~~~
   1 error generated.


vim +/MAX_INTERRUPTS +65 drivers/perf/riscv_pmu_sbi.c

    61	
    62	PMU_FORMAT_ATTR(event, "config:0-55");
    63	static inline bool rvpmu_perf_event_is_throttled(struct perf_event *event)
    64	{
  > 65		return event->hw.interrupts == MAX_INTERRUPTS;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
