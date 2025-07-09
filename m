Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB92C83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 05:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjAWBmfk6SDEG9xaJPSb4Bws2x6cBlBWX3rYQ2n6fzs=; b=L9bhs362Ti04/I
	tqh7qY4rNSU3GYod/E+prUCo9Rb+jVjS9BYyVimX4P8jDu7MF5TEYGvFLQoHrtQqgs8bB+urt954A
	jvgOpd6tsr5Sic3rwy2s5Su7BBcHFJNaCjrn2MS+RomF9Bq/DVYKde1Sqtm6ORMKg3Hd8/TSh1iag
	WfccTgI1vzs6t+Uucn3hCKN0N58VBD1Gm9qHl4IH5w6f3YMVP08RvobGBElnEJ1Jybpwgx8ooQedO
	G+9X9axQgokMi/ZtR1YmSP/nFPOZYr0Ls7Av4wCopLJDvYdbnU7gkeiZTGlBEdacqJnAPjnpI4Fw6
	KkTv3Zp2OVJWU0MOtz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNDv-00000007YDq-0bL2;
	Wed, 09 Jul 2025 05:20:03 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNDs-00000007YCL-23Zp
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 05:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752038401; x=1783574401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1HKYQB+6U3/FZmF5kwiWOis/cLTGRKWllXiKrhif0Qw=;
  b=Hi40wO/aMRAlwSXXJPQrsa0oHXaVaQOnw5zqGkEq9hrFhfNCQJxb4JIL
   GzDeQ+no4KHuoNDht2EnqBgvjW6Yn1xfmgI9qvnpmU6tCWn58YAKz75BQ
   ckVIam05k8O4lVi6c1PWX6nb+Nx02TfO8vXsj/H8xavGqAd5LJfTC2wbi
   tQhmuNWtkfZ2C1HFL+u2lfvZjNrzdSVXHqHEXLa0vuoSu4HctMJprAifg
   DdC+AdMMuJMAhgQ4n35kVjDQqsWJFhdcH0LwPG7Iz9/rFKTlfyIp47k+v
   inZZswGA1S3hFrKPS7U1PFA++Orv0mQWq4jLcHy+Suz7XS0Wqo6CZxMWJ
   g==;
X-CSE-ConnectionGUID: vOO5hmEiRv2YlysYuYF0aQ==
X-CSE-MsgGUID: wuHZ8XWUQoGnXwmU+Fd9WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54260376"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54260376"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 22:07:45 -0700
X-CSE-ConnectionGUID: 8ZHutkv5QRSldcFywYFZPw==
X-CSE-MsgGUID: MkqBmEq1Sz2Chj2bZ5VnCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="159986231"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Jul 2025 22:07:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZN1v-00036x-1O;
	Wed, 09 Jul 2025 05:07:39 +0000
Date: Wed, 9 Jul 2025 13:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yao Zi <ziyao@disroot.org>, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <202507091214.BjAuy5rw-lkp@intel.com>
References: <20250705052028.24611-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705052028.24611-1-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_222000_737870_FF21EA41 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Yao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.16-rc5 next-20250708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yao-Zi/clk-thead-th1520-ap-Correctly-refer-the-parent-for-c910-and-osc_12m/20250705-132237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250705052028.24611-1-ziyao%40disroot.org
patch subject: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for c910 and osc_12m
config: riscv-randconfig-r131-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091214.BjAuy5rw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250709/202507091214.BjAuy5rw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091214.BjAuy5rw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/clk/thead/clk-th1520-ap.c:585:25: sparse: sparse: symbol 'osc12m_clk' was not declared. Should it be static?

vim +/osc12m_clk +585 drivers/clk/thead/clk-th1520-ap.c

   584	
 > 585	struct clk_fixed_factor osc12m_clk = {
   586		.div		= 2,
   587		.mult		= 1,
   588		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
   589							   osc_24m_clk,
   590							   &clk_fixed_factor_ops,
   591							   0),
   592	};
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
