Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85068D15D9D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 11:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ze6hdQbhZSvXNbC/JoT0gf5P2Z4YdlhYacfXVHqNo1s=; b=Wt9PQuzm7Yogqw
	rxLY3iU9GtnO2pO6Jp/qtAmbxAXHXAk71qkoHHTpsu3bLUCg9J05b3WIqWb8lSN7uJBismGwhhNsu
	SJWLoOVz9cIhOaKsBLRNNMb8KkkUMPpiSt3AqhGgbCoBG2rxPi81+f2sEJ3V7WuCzpevWXzipjNzt
	vvsNRdO3O0S3txYJc/q4sswomugP84nUdVPTgRTDulH0zLzIgd+cyDI3jDPmk+rt09s1rtxo0VDhL
	RCB6ueViraf8OTwMB10ZTXPC9U0gQiVjbSWsvBAIf3WqemWAHhfn5l7FPisg7dGe3P04pgWoilhlb
	zJGE42LHEsOLPOMY8s/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CjN-0000000Adxo-3hzI;
	Tue, 22 Oct 2024 11:07:17 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Chq-0000000AdkK-1WXx;
	Tue, 22 Oct 2024 11:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729595142; x=1761131142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lk6aSBgrBEc1NRKveTngB3JmIdfkK85pmGw8ldyXGEM=;
  b=duoHEe1AAVWZwrTfVvs9QJ3zuv7E9TSdpii+8q6oYlIlgXK8Xu8G2s9+
   t/HA5iEE382whTqnNTYre/WskpuzjNBaAfyZrLgOs5kzk2zAeSdOtk48x
   PzSa19p5yF+2uO+ddVBH4prDrV5lxIj38ns3NwziETHyO+W+2oYFFZLda
   x64+CVYa0kmE1zTgd3g6tgBcSxnMD9Q3CJj/jgLqlS+v+hAGesnsNk0Bj
   AeDsEGlmeHIkARykd2DK/oMpef5HVjfy4dDl1MCx3m633CWa1JtALXQGn
   yillsiZCRfEzJ/Dx674bWBWPCyDgqGG6KOFJXt3hbumLjY8jNjK1qLn4D
   Q==;
X-CSE-ConnectionGUID: W4WwBh5qR2yrn/8em2NIKA==
X-CSE-MsgGUID: vQu00oraQ9G+fJfimVJG3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29014477"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="29014477"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:05:40 -0700
X-CSE-ConnectionGUID: M5Fes5M9R4qe3m5f1zbR5Q==
X-CSE-MsgGUID: bsraSG9CSeiejIeei9+NFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79778327"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2024 04:05:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Che-000TTS-2k;
	Tue, 22 Oct 2024 11:05:30 +0000
Date: Tue, 22 Oct 2024 19:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <202410221853.0nt4WyvW-lkp@intel.com>
References: <20241021103617.653386-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021103617.653386-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_040542_441827_EBD411BB 
X-CRM114-Status: GOOD (  13.34  )
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

Hi Inochi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on sophgo/for-next sophgo/fixes net-next/main net/main linus/master v6.12-rc4 next-20241021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-net-snps-dwmac-Add-dwmac-5-30a-version/20241021-184301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241021103617.653386-5-inochiama%40gmail.com
patch subject: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241022/202410221853.0nt4WyvW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221853.0nt4WyvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221853.0nt4WyvW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:41:2: warning: variable 'rate' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
      41 |         default:
         |         ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:46:36: note: uninitialized use occurs here
      46 |         ret = clk_set_rate(dwmac->clk_tx, rate);
         |                                           ^~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:28:20: note: initialize the variable 'rate' to silence this warning
      28 |         unsigned long rate;
         |                           ^
         |                            = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/rate +41 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

    24	
    25	static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
    26	{
    27		struct sophgo_dwmac *dwmac = priv;
    28		unsigned long rate;
    29		int ret;
    30	
    31		switch (speed) {
    32		case SPEED_1000:
    33			rate = 125000000;
    34			break;
    35		case SPEED_100:
    36			rate = 25000000;
    37			break;
    38		case SPEED_10:
    39			rate = 2500000;
    40			break;
  > 41		default:
    42			dev_err(dwmac->dev, "invalid speed %u\n", speed);
    43			break;
    44		}
    45	
    46		ret = clk_set_rate(dwmac->clk_tx, rate);
    47		if (ret)
    48			dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
