Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039B2C5B552
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 19:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLeG9OKRRcScbHo3vdGPfOM8PLfchSJJtBKWjwIZT0Q=; b=mGmvEU71wE3i6P
	wJsEziSjhlnK0Pf30NBfJppTr6n3R8CABQmpofZnrv5JZJTd1AoAGdpPnMy6+3YrIInRjD+MQ7zZ6
	6iXxiwwPu6SfhTHNgW//kRMG27yYZQs2f3WhCi7IDiMUbD+eypbVlsZiEuh39ATDRt4NP/FsI0NWx
	ZzulfjWCSNrIcgiwsyvfrn0wKFqtLXK5GgCw6Kcxi7WrBjdGZfX/lTYvc5fW0+qlPVDBrztFR8NOV
	A8dy1ITQ6EMNx9blB0NnVUspLLwMVlF3LBauq16c6BAV10OB0foVGnJ2x5ehfTNGUg+z/AimX58rD
	5bfumRtLPzFc84LlF/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOLkH-00000002u8z-087S;
	Sun, 08 Jun 2025 19:31:53 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOLkD-00000002u8P-3c6L
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 19:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749411110; x=1780947110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gifPlaHBYfzezWCVEDpNS3T26y78KL1GGVGcXJ1yV2g=;
  b=adBYCysxy/FrbF7DlMdLh7j27RU6Gmi9levkVw7UdIlLcfxMiXcdAd/t
   fzbKEo5JXuTiXJpLjT9+/3OuqowwGEHFaSoSpu01fxoRiTANiJKZr3VaG
   8DkS9hx+BoQ3mX5kP+8TmuhMFvSEHkbKtDrSlVGcoXXWl0V+0U1frRGfw
   gmjPOEzWRH+SvhaakiuRbD2Mrs1zRM6yIhUDQq/Irv3QqWDnxRrUnyXIN
   9cxaqiKOr05vG4GchOFc6c9CgpmmE/qeIxXnIPuJ9CZ+MA9vSJC7+Etc4
   T6Gw1IMqzvC0nVXtGWOwsP7poapJfjMasKyD8qZp4E+AEn4SqLB2o8bC5
   A==;
X-CSE-ConnectionGUID: Q2wldEs0QCe5M+iWJUxmTQ==
X-CSE-MsgGUID: sZuICoMpRkSAkHzGWSHHTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51636831"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="51636831"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 12:31:42 -0700
X-CSE-ConnectionGUID: +iDqu+SLTnmB9lbjJ9Zhjg==
X-CSE-MsgGUID: a3JqnYI8TYC8kncyZS6nww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="177264927"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jun 2025 12:31:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOLk0-0006X7-1I;
	Sun, 08 Jun 2025 19:31:36 +0000
Date: Mon, 9 Jun 2025 03:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
	sboyd@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dlan@gentoo.org, heylenay@4d2.org,
	inochiama@outlook.com, elder@riscstar.com,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Message-ID: <202506090339.Jy504MGo-lkp@intel.com>
References: <20250607202759.4180579-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250607202759.4180579-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_123149_990176_FF649BA7 
X-CRM114-Status: UNSURE (   9.07  )
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

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20250606]
[cannot apply to v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/clk-spacemit-mark-K1-pll1_d8-as-critical/20250608-042952
base:   linus/master
patch link:    https://lore.kernel.org/r/20250607202759.4180579-1-elder%40riscstar.com
patch subject: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
config: csky-randconfig-r111-20250608 (https://download.01.org/0day-ci/archive/20250609/202506090339.Jy504MGo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250609/202506090339.Jy504MGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506090339.Jy504MGo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/spacemit/ccu-k1.c:168:1: sparse: sparse: symbol 'pll1_d3' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:170:1: sparse: sparse: symbol 'pll1_d5' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:172:1: sparse: sparse: symbol 'pll1_d7' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:175:1: sparse: sparse: symbol 'pll1_d11_223p4' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:176:1: sparse: sparse: symbol 'pll1_d13_189' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:177:1: sparse: sparse: symbol 'pll1_d23_106p8' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:178:1: sparse: sparse: symbol 'pll1_d64_38p4' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:179:1: sparse: sparse: symbol 'pll1_aud_245p7' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:180:1: sparse: sparse: symbol 'pll1_aud_24p5' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:182:1: sparse: sparse: symbol 'pll2_d1' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:183:1: sparse: sparse: symbol 'pll2_d2' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:184:1: sparse: sparse: symbol 'pll2_d3' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:185:1: sparse: sparse: symbol 'pll2_d4' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:186:1: sparse: sparse: symbol 'pll2_d5' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:187:1: sparse: sparse: symbol 'pll2_d6' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:188:1: sparse: sparse: symbol 'pll2_d7' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:189:1: sparse: sparse: symbol 'pll2_d8' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:191:1: sparse: sparse: symbol 'pll3_d1' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:192:1: sparse: sparse: symbol 'pll3_d2' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:193:1: sparse: sparse: symbol 'pll3_d3' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:194:1: sparse: sparse: symbol 'pll3_d4' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:195:1: sparse: sparse: symbol 'pll3_d5' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:196:1: sparse: sparse: symbol 'pll3_d6' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:197:1: sparse: sparse: symbol 'pll3_d7' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:198:1: sparse: sparse: symbol 'pll3_d8' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:214:1: sparse: sparse: symbol 'pll1_d24_102p4' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:215:1: sparse: sparse: symbol 'pll1_d48_51p2' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:216:1: sparse: sparse: symbol 'pll1_d48_51p2_ap' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:217:1: sparse: sparse: symbol 'pll1_m3d128_57p6' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:218:1: sparse: sparse: symbol 'pll1_d96_25p6' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:219:1: sparse: sparse: symbol 'pll1_d192_12p8' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:220:1: sparse: sparse: symbol 'pll1_d192_12p8_wdt' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:221:1: sparse: sparse: symbol 'pll1_d384_6p4' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:228:1: sparse: sparse: symbol 'pll1_d12_204p8' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:231:1: sparse: sparse: symbol 'pll1_d10_245p76' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:234:1: sparse: sparse: symbol 'pll1_d52_47p26' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:235:1: sparse: sparse: symbol 'pll1_d78_31p5' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:247:1: sparse: sparse: symbol 'i2s_sysclk' was not declared. Should it be static?
>> drivers/clk/spacemit/ccu-k1.c:248:1: sparse: sparse: symbol 'i2s_bclk' was not declared. Should it be static?

vim +/pll1_d3 +168 drivers/clk/spacemit/ccu-k1.c

1b72c59db0add8 Haylen Chu 2025-04-16  159  
1b72c59db0add8 Haylen Chu 2025-04-16  160  CCU_PLL_DEFINE(pll1, pll1_rate_tbl, APBS_PLL1_SWCR1, APBS_PLL1_SWCR3, MPMU_POSR, POSR_PLL1_LOCK,
1b72c59db0add8 Haylen Chu 2025-04-16  161  	       CLK_SET_RATE_GATE);
1b72c59db0add8 Haylen Chu 2025-04-16  162  CCU_PLL_DEFINE(pll2, pll2_rate_tbl, APBS_PLL2_SWCR1, APBS_PLL2_SWCR3, MPMU_POSR, POSR_PLL2_LOCK,
1b72c59db0add8 Haylen Chu 2025-04-16  163  	       CLK_SET_RATE_GATE);
1b72c59db0add8 Haylen Chu 2025-04-16  164  CCU_PLL_DEFINE(pll3, pll3_rate_tbl, APBS_PLL3_SWCR1, APBS_PLL3_SWCR3, MPMU_POSR, POSR_PLL3_LOCK,
1b72c59db0add8 Haylen Chu 2025-04-16  165  	       CLK_SET_RATE_GATE);
1b72c59db0add8 Haylen Chu 2025-04-16  166  
1b72c59db0add8 Haylen Chu 2025-04-16  167  CCU_FACTOR_GATE_DEFINE(pll1_d2, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(1), 2, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @168  CCU_FACTOR_GATE_DEFINE(pll1_d3, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(2), 3, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  169  CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @170  CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  171  CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @172  CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
5d0122955ef9fd Alex Elder 2025-06-07  173  CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
5d0122955ef9fd Alex Elder 2025-06-07  174  		CLK_IS_CRITICAL);
1b72c59db0add8 Haylen Chu 2025-04-16 @175  CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @176  CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @177  CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @178  CCU_FACTOR_GATE_DEFINE(pll1_d64_38p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(0), 64, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @179  CCU_FACTOR_GATE_DEFINE(pll1_aud_245p7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(10), 10, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @180  CCU_FACTOR_GATE_DEFINE(pll1_aud_24p5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(11), 100, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  181  
1b72c59db0add8 Haylen Chu 2025-04-16 @182  CCU_FACTOR_GATE_DEFINE(pll2_d1, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(0), 1, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @183  CCU_FACTOR_GATE_DEFINE(pll2_d2, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(1), 2, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @184  CCU_FACTOR_GATE_DEFINE(pll2_d3, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(2), 3, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @185  CCU_FACTOR_GATE_DEFINE(pll2_d4, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(3), 4, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @186  CCU_FACTOR_GATE_DEFINE(pll2_d5, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(4), 5, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @187  CCU_FACTOR_GATE_DEFINE(pll2_d6, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(5), 6, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @188  CCU_FACTOR_GATE_DEFINE(pll2_d7, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(6), 7, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @189  CCU_FACTOR_GATE_DEFINE(pll2_d8, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BIT(7), 8, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  190  
1b72c59db0add8 Haylen Chu 2025-04-16 @191  CCU_FACTOR_GATE_DEFINE(pll3_d1, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(0), 1, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @192  CCU_FACTOR_GATE_DEFINE(pll3_d2, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(1), 2, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @193  CCU_FACTOR_GATE_DEFINE(pll3_d3, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(2), 3, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @194  CCU_FACTOR_GATE_DEFINE(pll3_d4, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(3), 4, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @195  CCU_FACTOR_GATE_DEFINE(pll3_d5, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(4), 5, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @196  CCU_FACTOR_GATE_DEFINE(pll3_d6, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(5), 6, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @197  CCU_FACTOR_GATE_DEFINE(pll3_d7, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(6), 7, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @198  CCU_FACTOR_GATE_DEFINE(pll3_d8, CCU_PARENT_HW(pll3), APBS_PLL3_SWCR2, BIT(7), 8, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  199  
1b72c59db0add8 Haylen Chu 2025-04-16  200  CCU_FACTOR_DEFINE(pll3_20, CCU_PARENT_HW(pll3_d8), 20, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  201  CCU_FACTOR_DEFINE(pll3_40, CCU_PARENT_HW(pll3_d8), 10, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  202  CCU_FACTOR_DEFINE(pll3_80, CCU_PARENT_HW(pll3_d8), 5, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  203  
1b72c59db0add8 Haylen Chu 2025-04-16  204  /* APBS clocks end */
1b72c59db0add8 Haylen Chu 2025-04-16  205  
1b72c59db0add8 Haylen Chu 2025-04-16  206  /* MPMU clocks start */
1b72c59db0add8 Haylen Chu 2025-04-16  207  CCU_GATE_DEFINE(pll1_d8_307p2, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(13), 0);
1b72c59db0add8 Haylen Chu 2025-04-16  208  
1b72c59db0add8 Haylen Chu 2025-04-16  209  CCU_FACTOR_DEFINE(pll1_d32_76p8, CCU_PARENT_HW(pll1_d8_307p2), 4, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  210  
1b72c59db0add8 Haylen Chu 2025-04-16  211  CCU_FACTOR_DEFINE(pll1_d40_61p44, CCU_PARENT_HW(pll1_d8_307p2), 5, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  212  
1b72c59db0add8 Haylen Chu 2025-04-16  213  CCU_FACTOR_DEFINE(pll1_d16_153p6, CCU_PARENT_HW(pll1_d8), 2, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @214  CCU_FACTOR_GATE_DEFINE(pll1_d24_102p4, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(12), 3, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @215  CCU_FACTOR_GATE_DEFINE(pll1_d48_51p2, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(7), 6, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @216  CCU_FACTOR_GATE_DEFINE(pll1_d48_51p2_ap, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(11), 6, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @217  CCU_FACTOR_GATE_DEFINE(pll1_m3d128_57p6, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(8), 16, 3);
1b72c59db0add8 Haylen Chu 2025-04-16 @218  CCU_FACTOR_GATE_DEFINE(pll1_d96_25p6, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(4), 12, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @219  CCU_FACTOR_GATE_DEFINE(pll1_d192_12p8, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(3), 24, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @220  CCU_FACTOR_GATE_DEFINE(pll1_d192_12p8_wdt, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(19), 24, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @221  CCU_FACTOR_GATE_DEFINE(pll1_d384_6p4, CCU_PARENT_HW(pll1_d8), MPMU_ACGR, BIT(2), 48, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  222  
1b72c59db0add8 Haylen Chu 2025-04-16  223  CCU_FACTOR_DEFINE(pll1_d768_3p2, CCU_PARENT_HW(pll1_d384_6p4), 2, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  224  CCU_FACTOR_DEFINE(pll1_d1536_1p6, CCU_PARENT_HW(pll1_d384_6p4), 4, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  225  CCU_FACTOR_DEFINE(pll1_d3072_0p8, CCU_PARENT_HW(pll1_d384_6p4), 8, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  226  
1b72c59db0add8 Haylen Chu 2025-04-16  227  CCU_GATE_DEFINE(pll1_d6_409p6, CCU_PARENT_HW(pll1_d6), MPMU_ACGR, BIT(0), 0);
1b72c59db0add8 Haylen Chu 2025-04-16 @228  CCU_FACTOR_GATE_DEFINE(pll1_d12_204p8, CCU_PARENT_HW(pll1_d6), MPMU_ACGR, BIT(5), 2, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  229  
1b72c59db0add8 Haylen Chu 2025-04-16  230  CCU_GATE_DEFINE(pll1_d5_491p52, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(21), 0);
1b72c59db0add8 Haylen Chu 2025-04-16 @231  CCU_FACTOR_GATE_DEFINE(pll1_d10_245p76, CCU_PARENT_HW(pll1_d5), MPMU_ACGR, BIT(18), 2, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  232  
1b72c59db0add8 Haylen Chu 2025-04-16  233  CCU_GATE_DEFINE(pll1_d4_614p4, CCU_PARENT_HW(pll1_d4), MPMU_ACGR, BIT(15), 0);
1b72c59db0add8 Haylen Chu 2025-04-16 @234  CCU_FACTOR_GATE_DEFINE(pll1_d52_47p26, CCU_PARENT_HW(pll1_d4), MPMU_ACGR, BIT(10), 13, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @235  CCU_FACTOR_GATE_DEFINE(pll1_d78_31p5, CCU_PARENT_HW(pll1_d4), MPMU_ACGR, BIT(6), 39, 2);
1b72c59db0add8 Haylen Chu 2025-04-16  236  
1b72c59db0add8 Haylen Chu 2025-04-16  237  CCU_GATE_DEFINE(pll1_d3_819p2, CCU_PARENT_HW(pll1_d3), MPMU_ACGR, BIT(14), 0);
1b72c59db0add8 Haylen Chu 2025-04-16  238  
1b72c59db0add8 Haylen Chu 2025-04-16  239  CCU_GATE_DEFINE(pll1_d2_1228p8, CCU_PARENT_HW(pll1_d2), MPMU_ACGR, BIT(16), 0);
1b72c59db0add8 Haylen Chu 2025-04-16  240  
1b72c59db0add8 Haylen Chu 2025-04-16  241  CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
1b72c59db0add8 Haylen Chu 2025-04-16  242  CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, 16, 13, 0, 13, 0);
1b72c59db0add8 Haylen Chu 2025-04-16  243  CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, 16, 13, 0, 13, 0);
1b72c59db0add8 Haylen Chu 2025-04-16  244  
1b72c59db0add8 Haylen Chu 2025-04-16  245  CCU_GATE_DEFINE(wdt_clk, CCU_PARENT_HW(pll1_d96_25p6), MPMU_WDTPCR, BIT(1), 0);
1b72c59db0add8 Haylen Chu 2025-04-16  246  
1b72c59db0add8 Haylen Chu 2025-04-16 @247  CCU_FACTOR_GATE_DEFINE(i2s_sysclk, CCU_PARENT_HW(pll1_d16_153p6), MPMU_ISCCR, BIT(31), 50, 1);
1b72c59db0add8 Haylen Chu 2025-04-16 @248  CCU_FACTOR_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_sysclk), MPMU_ISCCR, BIT(29), 1, 1);
1b72c59db0add8 Haylen Chu 2025-04-16  249  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
