Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A2BCCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAWua1uyDi8tMul3qpoyfZHUreXaewsqpM4EEvA5JTE=; b=LBqnl0WpTdzwPB
	bsY55K+LFyrakQHBfAHMKEB+v/KJRu3NlRjKPO5zkvR6sWONlw+RvxdKpYNNvVzVoGIMux8Quhnju
	8E4Z1Pfrg9ey34KekDdEae/5lk6Itce4eBOuja1hx/Tb+2kDooJihQSkbfBCY+aT4afFGbIs0T37L
	QU/hP26G7qEGkuJdI3nhZClLa1Hwie9x5LAEiY5MGCHwX/64V86XCm85DKX11wKWksKZQPON/r7Qu
	29F7+NgLnZXwmHXcCGeox+z9qZ1DH4FW7cNg8CVvGAv+bFkoySh6BS80lTujS5xcjOVPV7/ZSbwaP
	lz8rEDl7fkQrjHwclTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaXH-00000004yGm-0kVs;
	Thu, 30 Oct 2025 21:50:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaXA-00000004yEv-1NEl
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 21:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761861016; x=1793397016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uhsBi6jPYk4r7zoS0KFwjGrcAihOvbPQ1OZl8wiwXVg=;
  b=ZzbE7McXuckRTmtONo9jvxI7uyGY4m4KhBJ9CfWUz3/d3TLRGhro8AuD
   WOZrFzoSEQO/uwxRt02YvhkVKBnRB6Yx62l4efBJK7QANYRYrJSHrPtcW
   /60BP0y032vj/Iv+J14rLQR+UTfUipqaHLszvvkQqKEhZN+niDxT2w2ko
   m21MC5BKAzBDguK/Csw+o1gGop8csouOHbYyaUA1COXLMpqG9KN3/YXpm
   M/fuXI7YX+xJzlNDyoKBwBmnc0jR52FP+3ntIvsTWCWa9d29bsgMz1IfN
   bw3LgxrdNEnjrQzCs+KeuROE/c+sZQYmjUB+Fc9nJ4Et1wOZlTgLHXcEW
   w==;
X-CSE-ConnectionGUID: YYHyInRKQGCcc6c4o4iI8A==
X-CSE-MsgGUID: ZRsQTqwXR8qBRx8jaVoRFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81645382"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="81645382"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 14:50:15 -0700
X-CSE-ConnectionGUID: mqKL0/XMRAu6LM36rYEPAQ==
X-CSE-MsgGUID: UsRHOMzSR5SIqQrleSv+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186404807"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2025 14:50:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEaX4-000MYi-28;
	Thu, 30 Oct 2025 21:50:10 +0000
Date: Fri, 31 Oct 2025 05:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, dlan@gentoo.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <202510310505.d7e7kzCk-lkp@intel.com>
References: <20251027125504.297033-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027125504.297033-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_145016_428036_85FF7AD4 
X-CRM114-Status: UNSURE (   8.57  )
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

[auto build test ERROR on 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-spi-add-SpacemiT-K1-SPI-support/20251027-211246
base:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
patch link:    https://lore.kernel.org/r/20251027125504.297033-3-elder%40riscstar.com
patch subject: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251031/202510310505.d7e7kzCk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310505.d7e7kzCk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310505.d7e7kzCk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_udivdi3" [drivers/spi/spi-spacemit-k1.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMA_CMA
   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
   Selected by [m]:
   - SND_SOC_K1_I2S [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
