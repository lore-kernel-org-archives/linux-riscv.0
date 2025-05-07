Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F93C3ABC6
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 08:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hO8ZadXTJcA7wlPvz2Erow05UxrPbgBaqMsw2ljU4YI=; b=Npcg7lgTCOxcmI
	HiH5AAIOxBn0SNTMFjpUDJBhakPtUVCJlElR+41gPJ68UgnE1H1xAvHQlWcb0xg8aPyP6Rlb1GFdr
	eEG8Gmxww3bXf6CPH7ngnG/GOxz1W/JM/dZlKdV+bRBZsBnpClY/Ig26Dw/6pHWdQ0Sy6+bFTe0/O
	HWNZuKKRscAaOGvzRo5EbXVQGJf1Z+BSO91HRM3iqg/tGWlr7DS450iffO7bNZM1R+JkUitBDyI1h
	2fOt1lQHJYczhKe3mfa2OzbeuuE6ru+i4vWvyRVV0Mu+RpSGYVA/YFzc8fRxlW7PTWDapE+EiFecI
	bh7Y9pDUhz7qt+l2mvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaKz-0000000EnA7-0oDe;
	Wed, 07 May 2025 08:41:09 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZSh-0000000EaNs-2uay
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 07:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603904; x=1778139904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QXHYEKAW9/CqJfMG4iKzrn7ClrN8rdtrlRVJuX/TCQQ=;
  b=WIemcZ4FlFAMg0G3RqGAJ1AnGABa47U75szy9UDzjcwvOzGGCrF6e6U7
   kRcIr4JKsJ6f5miloi4psyPBv+73TSrlibA0xPnt5kMoIgNoiunrpTro2
   kjVX/TN8MX4IPUHMbR9Ho6de4vt1GZ+9M3v5G4H6p2IH2uVhsQyR96Rt5
   rWWUZ0sCJZn0B2+QJcnvB/w6PeRURVlzKwgZpa43zsTAgZD6XOoHG5x7F
   Vn6SDhDporW5d6w2Pzlip4fZ9goDVdshyiGMVGY4a1Euvd39D0h/avGx2
   0fncoLMk9pwUElwvXrYuTT3EvOHTS1CJsM3HKUss2RB0VeMbwYkS6j4wX
   g==;
X-CSE-ConnectionGUID: SHBQIu8jRSm9+s47Cj6jkA==
X-CSE-MsgGUID: 4IVs5qvbQgmUkdd0AjWqQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52133196"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52133196"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:45:03 -0700
X-CSE-ConnectionGUID: E1qZMY2HTZGgYsJVYG+Cvw==
X-CSE-MsgGUID: gTAUAlcERN+/lUFCdLWGCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135875090"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 00:44:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZSU-0007LT-05;
	Wed, 07 May 2025 07:44:50 +0000
Date: Wed, 7 May 2025 15:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Elder <elder@riscstar.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
Message-ID: <202505071416.Rll3WhPR-lkp@intel.com>
References: <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_004503_741586_695C8B78 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Yixun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/dt-bindings-mmc-spacemit-sdhci-add-support-for-K1-SoC/20250501-165846
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250501-20-k1-sdhci-v2-2-3e7005fae29b%40gentoo.org
patch subject: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071416.Rll3WhPR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071416.Rll3WhPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071416.Rll3WhPR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/sdhci-of-k1.c: In function 'spacemit_sdhci_reset':
>> drivers/mmc/host/sdhci-of-k1.c:88:33: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
      88 |         struct platform_device *pdev;
         |                                 ^~~~


vim +/pdev +88 drivers/mmc/host/sdhci-of-k1.c

    85	
    86	static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
    87	{
  > 88		struct platform_device *pdev;
    89	
    90		pdev = to_platform_device(mmc_dev(host->mmc));
    91		sdhci_reset(host, mask);
    92	
    93		if (mask != SDHCI_RESET_ALL)
    94			return;
    95	
    96		spacemit_sdhci_setbits(host, PHY_FUNC_EN | PHY_PLL_LOCK, SDHC_PHY_CTRL_REG);
    97	
    98		spacemit_sdhci_clrsetbits(host, PHY_DRIVE_SEL,
    99					  RX_BIAS_CTRL | FIELD_PREP(PHY_DRIVE_SEL, 4),
   100					  SDHC_PHY_PADCFG_REG);
   101	
   102		if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
   103			spacemit_sdhci_setbits(host, MMC_CARD_MODE, SDHC_MMC_CTRL_REG);
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
