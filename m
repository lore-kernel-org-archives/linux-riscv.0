Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F0BC87FCF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 01:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8HlcDdvVBOwuxp/j0sY5Xcm6SWXLKxjrnwUL6v32SA=; b=pKS2YpwEnTG98R
	mkZFGGJlkHg7FUgLEIhbBOA8s7GQYkUWN1gjbqDzKKi4N1ocYy4Y1kyoVgpkJ1pP4TJXEjbckgl/f
	RGNI9eIGeJ1061ffF17N47v/h3DCQ4WlEVbElXSCJG9L2DQwSnQ8NY7HqNt0RRp0OqUe0KFMhXSWf
	gjhbZ0D7DNQkbdbLDIPKsHFmDzN+a1xgOtZVtal7S9rKoyw742evesWzT4ZT666Sxbj72zrVeCUTL
	WMzjKuTxCHzEWGPMsqlrTcdFJzkbbKb2ORcKzdf808PSZO/+y1sav3MZkDSv2+ikPFjNA//17/Of8
	2DZ2cTp2xUNcB17Cnusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umMPn-0000000FSN6-47Hc;
	Thu, 14 Aug 2025 01:05:59 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umMPl-0000000FSMh-463N
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 01:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755133558; x=1786669558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GHq+UdFILVZZcTmyOuJYpLnjJl4RNHxMErvsBexshnY=;
  b=aElfw9PugSRRSNtTahKi3+HvFQUMRuTnoJ9rTUczDl+o149MGaoxahHK
   I61UwOph4raZFaLrQNcvRr+ZE6SHTE6lZFladu8vFggtLBmVJ9/rnF3wF
   3aWap22ACwbQNGydUPVx11izsAO5SP9kVZOcZki9KcjLh15eBNzpp/Wug
   ATRMmO9RbjW6IB6BKZ1BH/4Kuns60d/Vf+IOxFjFrnBHC0/jVtRBWGkyN
   ZMb1WO5q5OBAZ7l1xivZnGO/UAcWL32CGyz84bbnF5vFX4OVeCY7ejcuR
   /qaQVcRswX9cr7m2UcMGont3wNNV+ZqAo+ZVSDdcoe0ZXmfq6yp7lDNCr
   w==;
X-CSE-ConnectionGUID: vQt9Y8J4SXm0uTAKkrHZDA==
X-CSE-MsgGUID: J9LyVW1TRTK68MO4Z7CAtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68522885"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68522885"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 18:05:57 -0700
X-CSE-ConnectionGUID: GyU04fsaR2OYGBt93Y2/8w==
X-CSE-MsgGUID: ewk1E047T+a1xTM9ypDf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166997295"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2025 18:05:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umMPc-000ATw-07;
	Thu, 14 Aug 2025 01:05:48 +0000
Date: Thu, 14 Aug 2025 09:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2 4/4] clk: spacemit: fix i2s clock
Message-ID: <202508140828.p7rvt41N-lkp@intel.com>
References: <20250811-k1-clk-i2s-generation-v2-4-e4d3ec268b7a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-k1-clk-i2s-generation-v2-4-e4d3ec268b7a@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_180558_069198_BF53B366 
X-CRM114-Status: UNSURE (   8.30  )
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

Hi Troy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/dt-bindings-clock-spacemit-introduce-i2s-pre-clock-to-fix-i2s-clock/20250811-221114
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250811-k1-clk-i2s-generation-v2-4-e4d3ec268b7a%40linux.spacemit.com
patch subject: [PATCH v2 4/4] clk: spacemit: fix i2s clock
config: riscv-randconfig-r112-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140828.p7rvt41N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250814/202508140828.p7rvt41N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140828.p7rvt41N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/spacemit/ccu-k1.c:160:1: sparse: sparse: Initializer entry defined twice
   drivers/clk/spacemit/ccu-k1.c:160:1: sparse:   also defined here
   drivers/clk/spacemit/ccu-k1.c:656:1: sparse: sparse: Initializer entry defined twice
   drivers/clk/spacemit/ccu-k1.c:656:1: sparse:   also defined here

vim +160 drivers/clk/spacemit/ccu-k1.c

   159	
 > 160	CCU_DIV_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_sysclk), MPMU_ISCCR, 27, 2, BIT(29), 2, 0);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
