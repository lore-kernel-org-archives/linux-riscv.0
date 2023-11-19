Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7609EC5ACB3
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Nov 2023 11:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7so4P5p5vUBN0m8wjHPXUYdhTZO9EA0ZtJxArsYKSuA=; b=n6YJkRyzzSW9vT
	M4epA1HunXV2ic+294bOH3jp9V0Robh94z0o+Qn5gJCAzghx4tSmef7emgHV6VG/gHDwCDSHwrquG
	AaFcAc1TkRDtoCU37zvTujHQbv5A1a8rqjB10eEBupq0MwfnsWpR5kFk9K9Oglu039E189eCjre/X
	1gIe3HG/J1SbTneJMvAFGatqBVKrLuxV/RxhL6x8m8o41AzO8Qtbqf9VbCSwrGMV8vHB8FS5QtLh0
	3AiN0BUdKdGFd2FY4WmClR0QtL3skm+IRWcCJ7PNrSPmCBgfxIO4Q8GGVJJuoHww+uDxGLAmNPd4W
	NMNydlJD3u6x32lKvQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4fjU-009ubh-2k;
	Sun, 19 Nov 2023 11:12:56 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4fjQ-009uVW-2u
	for linux-riscv@lists.infradead.org;
	Sun, 19 Nov 2023 11:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700392372; x=1731928372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6MB7KR6Wqu2v79BBJpxIM6CND7+cD3U13FwZlh4YFU=;
  b=OQ1orQsQLj3s1mfq2UJgiahT2nKz+gD0Qy6kTRbAqk5IjqDU1rqhNFWC
   S5GJ+Yqn+kSrNQM+VlVnnhgYEhQgyT5D31ZmAPuPsoQOLsElP1Lm3rTuz
   E9//HasAE3NKUyUpnfH3fDKOMtUkTjxTT9IHqCpvGSWiZhLzA81MOBoIk
   Y3HHbdMt77qHMHB5E3HnbxL8xsZ4n3lrBNQd23KL02Czfcq0RCjr9CO6q
   v/u26K/3WHSRfil3Pb4O/ITil+M4iHN2VG0oD+SXpVfZXHMw/RdbzncSS
   l+10tikNRcUylrGW6YZxq1aHhOmesvT+jkUGgOQ2BMP365XCdgUxfKcCY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="376523982"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="376523982"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 03:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="769628656"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="769628656"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Nov 2023 03:12:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4fjB-00051h-08;
	Sun, 19 Nov 2023 11:12:37 +0000
Date: Sun, 19 Nov 2023 19:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 4/5] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <202311191920.5xIUxW5n-lkp@intel.com>
References: <1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_031253_016335_28A5D2C5 
X-CRM114-Status: GOOD (  11.82  )
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

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-clock-sophgo-Add-SG2042-clock-definitions/20231113-212401
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang%40outlook.com
patch subject: [PATCH 4/5] clk: sophgo: Add SG2042 clock generator driver
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231119/202311191920.5xIUxW5n-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191920.5xIUxW5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191920.5xIUxW5n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/sophgo/clk-sophgo-sg2042.c:217:44: warning: overflow in expression; result is -1094967296 with type 'long' [-Winteger-overflow]
     217 |                         if (foutvco < PLL_FREQ_MIN || foutvco > PLL_FREQ_MAX
         |                                                                 ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:25:28: note: expanded from macro 'PLL_FREQ_MAX'
      25 | #define PLL_FREQ_MAX (3200 * MHZ)
         |                            ^
   1 warning generated.


vim +/long +217 drivers/clk/sophgo/clk-sophgo-sg2042.c

   201	
   202	static int __sg2042_get_pll_ctl_setting(
   203		struct sg2042_pll_ctrl *best,
   204		unsigned long req_rate,
   205		unsigned long parent_rate)
   206	{
   207		int ret;
   208		unsigned int fbdiv, refdiv, fref, postdiv1, postdiv2;
   209		unsigned long tmp = 0, foutvco;
   210	
   211		fref = parent_rate;
   212	
   213		for (refdiv = REFDIV_MIN; refdiv < REFDIV_MAX + 1; refdiv++) {
   214			for (fbdiv = FBDIV_MIN; fbdiv < FBDIV_MAX + 1; fbdiv++) {
   215				foutvco = fref * fbdiv / refdiv;
   216				/* check fpostdiv pfd */
 > 217				if (foutvco < PLL_FREQ_MIN || foutvco > PLL_FREQ_MAX
   218						|| (fref / refdiv) < 10)
   219					continue;
   220	
   221				ret = __sg2042_pll_get_postdiv_1_2(req_rate, fref, fbdiv,
   222						refdiv, &postdiv1, &postdiv2);
   223				if (ret)
   224					continue;
   225	
   226				tmp = foutvco / (postdiv1 * postdiv2);
   227				if (abs_diff(tmp, req_rate) < abs_diff(best->freq, req_rate)) {
   228					best->freq = tmp;
   229					best->refdiv = refdiv;
   230					best->fbdiv = fbdiv;
   231					best->postdiv1 = postdiv1;
   232					best->postdiv2 = postdiv2;
   233					if (tmp == req_rate)
   234						return 0;
   235				}
   236				continue;
   237			}
   238		}
   239	
   240		return 0;
   241	}
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
