Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AA0CCFA00
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Nov 2025 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yg6pMDBt+bGgVW9ip6+l6uf1ojuQybVKKzY2o0siqzo=; b=S4P43Tsb59Ofkf
	o1mKzIqVYClgGucwhcRxfTH67+qHx1bbCLgBNQCSonDQhXK0v/f3bSAQ3ACNu3CcDVpFQnsVRP0mg
	XtGvaxUC2uC3H/FFNq2sADE18Gz5y73Y2L/0HaDJ1CUBehCd3B/MNRFLx4Z84zsGnzAwO9+RNtdlU
	NUborMrHKoY/kexnFkM6aB3V/lJRQUcCgJmo1gH4S1lr82Qk0S0A+JJPP57C9sfxlXrREvc+JwJLx
	Aa9dsQbL4Kncx02Vp8r0xXuypIU17d2k9cnDaynXck9t4GyN5DkapW9Ep2XaRFOSQxh9L89wZf/P9
	Hwk8A6SnqfGavJg6hrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFgW1-00000008tMx-0CC6;
	Sun, 02 Nov 2025 22:25:37 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFgVw-00000008tMR-1W9O;
	Sun, 02 Nov 2025 22:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762122331; x=1793658331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xAaDVXcvzXMuT6b41jvj67zRq9dUreGowV9Fgs0NF0Y=;
  b=dLn09RPCd3lCvkzqCZEc4JvPOKzS9Al9OkRYtQu2NLotO5TZkB/uLfcb
   +Jzvp//7HLUoSRjB8zh4DzJIfTUfsI1qbkj5b6lUrgSOTZ+Ao8rgWz8wk
   hNyCbrhQJEv+6ng1tsFKWo+p/DPaFgLu9JDydzDKWwWP/iLg93N7aZEdQ
   wOutIUi7M8Tnbb1YfH/tb/qZNJ0oHuwUGl/1bZZR6Dkzzaefc71Zt/5du
   TmVHOnwyLSKNp3BxmDCvC52SDy5UkyGLoEDIRtgJCIAjFNPLDEH+w/YnA
   DCdqRYDik14f0IQyaL04UPCqd9IS9kfTdo8fDH7NhI47KC1Dfv05uXTUg
   A==;
X-CSE-ConnectionGUID: 1JTZ+3SbTzid+kRGHMR/hw==
X-CSE-MsgGUID: vJ+BefHfSZ+/vzuA0XXbVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="89663064"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="89663064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 14:25:30 -0800
X-CSE-ConnectionGUID: vXJAcFdIRR2J+3k8618sjw==
X-CSE-MsgGUID: gfzfgI3ESyqPmcXpTmfFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="186593785"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Nov 2025 14:25:28 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFgVq-000PcC-1p;
	Sun, 02 Nov 2025 22:25:26 +0000
Date: Mon, 3 Nov 2025 06:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, vkoul@kernel.org, kishon@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de, dlan@gentoo.org,
	aurelien@aurel32.net, guodong@riscstar.com,
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH v4 4/7] phy: spacemit: introduce PCIe/combo PHY
Message-ID: <202511030652.3CVPb2v3-lkp@intel.com>
References: <20251030220259.1063792-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030220259.1063792-5-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_142532_464057_D63F4E6A 
X-CRM114-Status: UNSURE (   8.31  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 131f3d9446a6075192cdd91f197989d98302faa6]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-phy-spacemit-add-SpacemiT-PCIe-combo-PHY/20251031-060541
base:   131f3d9446a6075192cdd91f197989d98302faa6
patch link:    https://lore.kernel.org/r/20251030220259.1063792-5-elder%40riscstar.com
patch subject: [PATCH v4 4/7] phy: spacemit: introduce PCIe/combo PHY
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251103/202511030652.3CVPb2v3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030652.3CVPb2v3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030652.3CVPb2v3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_clk_hw_register" [drivers/phy/phy-spacemit-k1-pcie.ko] undefined!
>> ERROR: modpost: "devm_clk_hw_get_clk" [drivers/phy/phy-spacemit-k1-pcie.ko] undefined!
ERROR: modpost: "clk_save_context" [drivers/net/phy/air_en8811h.ko] undefined!
ERROR: modpost: "clk_restore_context" [drivers/net/phy/air_en8811h.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
