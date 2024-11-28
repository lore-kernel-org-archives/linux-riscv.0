Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC41D70DE2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHITUeYMZE+U5Bn9nYb/0PzX0pG7wg96FgNqH71Tqyc=; b=d4aOskquD0mTqf
	Oy62SmyFBvWOpmnovqh7tYBF0REv5PnwtcY8Go5TjrvW2udVRKZmijxjiNFVTzA6TTFYK0bJBZC1b
	a/l7pvd/0obf+zDlp3HLf5grtYulx5ri8j4SmJWKTAJN2LQW+Cle2ZGajn4wjWTvYUGrVcXLKv342
	Qyv1Sn3I6EpXedx3pK1LSufsbdcAjSqDabqw7Ap5bRS7ZQsTxhRVu6HzMbquU3vry5LSwnRFdAGX8
	LhULTH0MJUKr2lmRnqceuqWx/0L3nu8QYSoSXpqbFEFnKDe8WNuNB9Q8wyqjssWoneQgAajiwQVxD
	cOaf0llHO2DDZwja99uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGh4b-0000000Fy9g-0LVB;
	Thu, 28 Nov 2024 16:08:57 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGh4Z-0000000Fy92-0ISh
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 16:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732810135; x=1764346135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zgR7POQipJr92V+u9Tt4pGs3gh2pe3hR7ESpRucymuM=;
  b=Q/BoEnC/482AQhimxV+NWJ0Moeo5ZqiJNMHSSgG7rMgs6JoX6lScNO8n
   mVbMXuDaM0U1smyf+CtnPnHwIle/dF7wyvGRNw07jsIBYQyE2YxH3uerx
   ufGZDNUou8ZPQrmOvBr1xMKdnQFyZrau5pBL71oBIqL1QVZIeWF2JWUaI
   +LdQRg87rFJPOFBZEGE6RSNyOdHSqND6n/pXDeb4+DN7CGdxjgRWcempG
   bfcRhCK3zUUqv+itkwugk2mvc4HH65v6Eq0nEh7RH957euJu8jgbrwWiR
   UHmvBhQk2uxXOU2r/xEZ38Un9hYXzmIz5X82VGZ8Srm6KQSVT2oVMEi5O
   g==;
X-CSE-ConnectionGUID: d41HSfcKTVaXPtCQ0QaJGg==
X-CSE-MsgGUID: e+ntzaGrTfa77T4zluJ+ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32417690"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32417690"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 08:07:44 -0800
X-CSE-ConnectionGUID: SOiR0bVYTaKLPWXALnNw+Q==
X-CSE-MsgGUID: Z27cMCa4QpyjNYwuD8SyGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92659227"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2024 08:07:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGh3J-0009m6-2g;
	Thu, 28 Nov 2024 16:07:37 +0000
Date: Fri, 29 Nov 2024 00:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <202411282305.iJ9x0lmj-lkp@intel.com>
References: <20241126143125.9980-7-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126143125.9980-7-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_080855_130617_A5B9EB0F 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Haylen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2d5404caa8c7bb5c4e0435f94b28834ae5456623]

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-clock-spacemit-Add-clock-controllers-of-Spacemit-K1-SoC/20241128-101248
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/20241126143125.9980-7-heylenay%404d2.org
patch subject: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1 SoC
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241128/202411282305.iJ9x0lmj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282305.iJ9x0lmj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282305.iJ9x0lmj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/spacemit/ccu_pll.c: In function 'ccu_pll_set_rate':
>> drivers/clk/spacemit/ccu_pll.c:128:23: warning: variable 'old_rate' set but not used [-Wunused-but-set-variable]
     128 |         unsigned long old_rate;
         |                       ^~~~~~~~
--
   drivers/clk/spacemit/ccu_mix.c: In function 'ccu_mix_set_rate':
>> drivers/clk/spacemit/ccu_mix.c:180:23: warning: variable 'best_rate' set but not used [-Wunused-but-set-variable]
     180 |         unsigned long best_rate = 0;
         |                       ^~~~~~~~~
--
   drivers/clk/spacemit/ccu_ddn.c: In function 'clk_ddn_set_rate':
>> drivers/clk/spacemit/ccu_ddn.c:115:23: warning: variable 'prev_rate' set but not used [-Wunused-but-set-variable]
     115 |         unsigned long prev_rate, rate = 0;
         |                       ^~~~~~~~~


vim +/old_rate +128 drivers/clk/spacemit/ccu_pll.c

   115	
   116	/*
   117	 * pll rate change requires sequence:
   118	 * clock off -> change rate setting -> clock on
   119	 * This function doesn't really change rate, but cache the config
   120	 */
   121	static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
   122				       unsigned long parent_rate)
   123	{
   124		struct ccu_pll *p = hw_to_ccu_pll(hw);
   125		struct ccu_common *common = &p->common;
   126		struct ccu_pll_config *params = &p->pll;
   127		struct ccu_pll_rate_tbl *entry;
 > 128		unsigned long old_rate;
   129		bool found = false;
   130		u32 mask, val;
   131		int i;
   132	
   133		if (ccu_pll_is_enabled(hw)) {
   134			pr_err("%s %s is enabled, ignore the setrate!\n",
   135			       __func__, __clk_get_name(hw->clk));
   136			return 0;
   137		}
   138	
   139		old_rate = __get_vco_freq(hw);
   140	
   141		for (i = 0; i < params->tbl_size; i++) {
   142			if (rate == params->rate_tbl[i].rate) {
   143				found = true;
   144				entry = &params->rate_tbl[i];
   145				break;
   146			}
   147		}
   148		WARN_ON_ONCE(!found);
   149	
   150		mask = PLL_SWCR1_REG5_MASK | PLL_SWCR1_REG6_MASK;
   151		mask |= PLL_SWCR1_REG7_MASK | PLL_SWCR1_REG8_MASK;
   152		val |= entry->reg5 << PLL_SWCR1_REG5_OFF;
   153		val |= entry->reg6 << PLL_SWCR1_REG6_OFF;
   154		val |= entry->reg7 << PLL_SWCR1_REG7_OFF;
   155		val |= entry->reg8 << PLL_SWCR1_REG8_OFF;
   156		ccu_update(swcr1, common, mask, val);
   157	
   158		mask = PLL_SWCR3_DIV_INT_MASK | PLL_SWCR3_DIV_FRC_MASK;
   159		val = entry->div_int << PLL_SWCR3_DIV_INT_OFF;
   160		val |= entry->div_frac << PLL_SWCR3_DIV_FRC_OFF;
   161		ccu_update(swcr3, common, mask, val);
   162	
   163		return 0;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
