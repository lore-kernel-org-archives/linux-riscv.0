Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F662CCFA00
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Nov 2025 21:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgB0fzPgfcAFakpH9ILDIwyV0TbkRgb5nZR5Ubwv2TE=; b=mbjK33a5mnM5Lg
	f6cCDnM9hwxAY5nl0J3Hm59vdi4c/wXMq8vole8LdVKLk8D8I3saXN8wGqc/4T3i4KHQODYVc6e3n
	nfmRu1Zdzclv3OGQXLumr8AgQKk4uFVHxIkavGzJEMrco2SNj5brRScyWHNZUYwmwvj5T5Cw+xTvr
	8ksVr1lgAIc5aSluMY7oIxJogvOLNzwzHA0qhJtq4c3iwkJgwIfraEilbk4+15A+VnzxEqLoTytJa
	2e+wDHih9eYv6ggkb4CUQk+bmie/7W0NEnKmG4hS9urGM0guHvHnpA3ZDXpUWSgDCApll+izttZQl
	0QE51WPby1xkM3+asBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFg1A-00000008riY-1d3H;
	Sun, 02 Nov 2025 21:53:44 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFg17-00000008rhQ-0dM3;
	Sun, 02 Nov 2025 21:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762120421; x=1793656421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wlc0UGWnu9Jt/GUB1LZ5Asy8Dq1Zq0j7h+47A1DCXgQ=;
  b=TAG7rlsUbel7rBtDKV37Xn/Af+/RDDJ92SoMTdZesZFANRNLbqW+KJi6
   g9Xu+lieBwdt3QtRX3zW+mDyNqcjZduF/bJuEXbr68mJSHKKCKjwcdMwk
   veu8tYo3f/tYO8Glp36DUpuM0cN9v3lJlO34aCiDn+n7j1pvnqid8DCCe
   NuF1QEq2ZajBgQVX43bQC7ZudwPIRE+9NTjk/ZzMlL21SrG09Xdq6GqSu
   fbVnntecWAB3b8Ie9C63DHxzVf4e7L2OpKl2VN4QHX1nWlKuSy2DwTUeA
   bBbb/qM6ux4IMc41kTICO5t6YUOcQS90zuNs+LZUZmw7nFrKB/8UrNfYo
   Q==;
X-CSE-ConnectionGUID: 8UbS3l+/QDOOH9cuHZlH7w==
X-CSE-MsgGUID: 8dYrvlBMSLueNG8Yw8YbBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="51770892"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="51770892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 13:53:36 -0800
X-CSE-ConnectionGUID: 0tQ+/Z5IRwWinFoWz7n/aA==
X-CSE-MsgGUID: zmwLQ7idRgKcJrmcIvrAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="191040965"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Nov 2025 13:53:33 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFg0w-000PbA-32;
	Sun, 02 Nov 2025 21:53:30 +0000
Date: Mon, 3 Nov 2025 05:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, vkoul@kernel.org, kishon@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de, dlan@gentoo.org,
	aurelien@aurel32.net, guodong@riscstar.com,
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH v4 4/7] phy: spacemit: introduce PCIe/combo PHY
Message-ID: <202511030553.8UVCnq06-lkp@intel.com>
References: <20251030220259.1063792-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030220259.1063792-5-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_135341_227493_1FCEC502 
X-CRM114-Status: UNSURE (   9.17  )
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251103/202511030553.8UVCnq06-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030553.8UVCnq06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030553.8UVCnq06-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/phy/phy-spacemit-k1-pcie.o: in function `k1_pcie_phy_probe':
>> phy-spacemit-k1-pcie.c:(.text+0x7e4): undefined reference to `devm_clk_hw_register'
>> sh4-linux-ld: phy-spacemit-k1-pcie.c:(.text+0x7ec): undefined reference to `devm_clk_hw_get_clk'
   sh4-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_resume':
   air_en8811h.c:(.text+0x948): undefined reference to `clk_restore_context'
   sh4-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_suspend':
   air_en8811h.c:(.text+0x984): undefined reference to `clk_save_context'
   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x1a68): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x1a74): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x1a78): undefined reference to `of_clk_hw_simple_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
