Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11C3CAC597
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 01:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2Qbz3sPzvkvK4YQQsg89bBm19PPCbqHicQzHA3Z7ns=; b=hf9cn0MUm/aUdz
	DuIBtJ33G1bU6YZqWHJf10YZRQxnA0k002aCxbz0TMcRIfRLH0BAjLvPtqZTj7URhDAnKB58ALBD7
	H4mnKBzkVkgLJpy4G6MltLmXCxxWh+rgVqnkifWZ8JLdNoW+YjpIQ/KVmJLDMZKQx3P2JX6SXCpL1
	M3J16rUdXF/nm7utU7s+MtnpOBwEkLJx9l2RrTtbHlOR33XCog+iTZyFbbnlAL1/qWnP+w4IweT2E
	Mb4XDiqCrsaLf/b2NgKZVTsQ0W2izKT0/qgkuzrlYh1fPQNQ7y2HS6t7N6gtFK8AuMWxJTT0+S0pd
	qBYeAQ0nOdcBOay04GLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKnZ-00000006BtZ-2AB1;
	Tue, 16 Sep 2025 01:48:01 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKnX-00000006Bt3-0Kdi
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 01:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757987279; x=1789523279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uzk0zM0Sv9BPqYaD/fclWwxs8iEByGp20gyqw+q/3QE=;
  b=BgEj+JcjQFmwgdFAlZTWeSs4leyEuLVzbI8rvx1Z+tAsu26W2Wn94iYl
   0Fjy9qtZnJgYeD4nkoPF3CMciIV+kFacR3ajnoqqBp5qBfyJwSGw+LQ73
   BjlyFP+YobR+FrX1uOo0QCNKKDBVra9RYvMqo/dVPZbZ6gB1VoYjrW5rJ
   Z8NGU2YwiwrudnY8KzjJhFEXDp4t35nhhkRI74mXtIpF4rKMMGTbQQMH7
   Y5mrdvPa4mO5vtEldYISx8I+zHbIROOQQMjQc+GLhENM9Ylt4H6wrphUi
   LSC66wdeGEuTmrmk97DvrWuDhzzFVQxroynfMaPayW4rSttEZ3ETA93ib
   A==;
X-CSE-ConnectionGUID: +uS7ValySQeno5Jy3/XYxg==
X-CSE-MsgGUID: UGHYWQ2RQ2anLEN88TR3DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="47829897"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="47829897"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 18:47:55 -0700
X-CSE-ConnectionGUID: XE/uw4eBRPOzozjJHBpHbQ==
X-CSE-MsgGUID: vgAiQquBQyKKwPzeeHY03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="174618035"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2025 18:47:51 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyKnM-0000tz-0F;
	Tue, 16 Sep 2025 01:47:48 +0000
Date: Tue, 16 Sep 2025 09:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	iommu@lists.linux.dev, tjeznach@rivosinc.com, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	anxu@bosc.ac.cn, wangran@bosc.ac.cn,
	Yaxing Guo <guoyaxing@bosc.ac.cn>
Subject: Re: [PATCH v1 1/3] iommu/riscv: Add iommu perf driver
Message-ID: <202509160926.OINmzlTz-lkp@intel.com>
References: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_184759_131021_5F4F0B21 
X-CRM114-Status: GOOD (  10.88  )
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

Hi Yaxing,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.17-rc6 next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yaxing-Guo/iommu-riscv-Add-Makefile-support-for-RISC-V-IOMMU-perf-driver/20250915-101640
base:   linus/master
patch link:    https://lore.kernel.org/r/20250915020911.1313-1-guoyaxing%40bosc.ac.cn
patch subject: [PATCH v1 1/3] iommu/riscv: Add iommu perf driver
config: riscv-randconfig-001-20250916 (https://download.01.org/0day-ci/archive/20250916/202509160926.OINmzlTz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509160926.OINmzlTz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509160926.OINmzlTz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu-pci.c:21:
   In file included from drivers/iommu/riscv/iommu.h:20:
>> drivers/iommu/riscv/iommu-perf.h:68:29: error: no member named 'pmu' in 'struct perf_event'
      68 |         return container_of(event->pmu, struct riscv_iommu_pmu, pmu);
         |                             ~~~~~  ^
>> drivers/iommu/riscv/iommu-perf.h:68:29: error: no member named 'pmu' in 'struct perf_event'
      68 |         return container_of(event->pmu, struct riscv_iommu_pmu, pmu);
         |                             ~~~~~  ^
>> drivers/iommu/riscv/iommu-perf.h:68:29: error: no member named 'pmu' in 'struct perf_event'
      68 |         return container_of(event->pmu, struct riscv_iommu_pmu, pmu);
         |                             ~~~~~  ^
   3 errors generated.


vim +68 drivers/iommu/riscv/iommu-perf.h

    65	
    66	static inline struct riscv_iommu_pmu *riscv_iommu_event_to_pmu(struct perf_event *event)
    67	{
  > 68		return container_of(event->pmu, struct riscv_iommu_pmu, pmu);
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
