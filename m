Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99458C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 00:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13IM+36MOaQNGOjl0p6A372CLWFnP2XI82DFCnK09uY=; b=eh1O0mOD25JsDS
	XujttFx9lONW7wJc4T61N293jpdq4ila8KLB0DaqJqXc1eXDwTa6pifRqijAQY03ReQz9yMGwLWW1
	2aP/0/55tR1A6J8BaxSK7Zs78rYMzpIsovscLmhP/SzmYlW90sE/47kNaV8++BkJS84ctG8K2sf88
	psNEyuMwduPk76i9CbzDBkttnPgTDgVkhmCTynYfHDjP+YghAr+umrPGQQSa69rNAVY5nvhR9jiJ3
	b3lf6rXuTRXX+KDZUF0xqNpM5hnkqEg9UBR1OQ1s6EduY6NtGGlGW1UXm7fup6hS2xG3LMvKFHeoQ
	nkAuo6+NqrO68Jz1XOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC7dW-00000002SYG-2Peg;
	Wed, 29 May 2024 00:57:50 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC7dU-00000002SXZ-0qhN
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 00:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716944268; x=1748480268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9PMDHi0i2X7JYHYfsjL5TSPtAzVp+Z//KwjHgfx3R6M=;
  b=RUx7K80TiGuaFh6wEquN5PdS+Epjulo169kz1ENUT7ipYn1PPX4PrTbj
   K4xGtTB+l3pvJ2bUmtCT1U3JMy0IYUkCXuIoKwCw/52BzUTdMVOgSLmzq
   nvFHbm4trN39EVLsdu2PFpyhVyjEZtDMgskZ+8OpT0f/rXy9DHs/SpAjG
   YZkeQ8xskwiERXb/wpDcU1M49DjE5nR7PJ3KIQWG6GcCfQHxSb0ort9Af
   wpTXej8sN1oXYXSiy6Cu0S3WL4CIkEgvm69gYdP5eAruE6OGG8zF9+qaC
   Xeo6ONyAxZOP/cfQfTzavXtt73IeCAutl9oZc87qr0zF+Rn8QydWlMS8H
   w==;
X-CSE-ConnectionGUID: +NsG7t13SDKgOSrW1Py6ZQ==
X-CSE-MsgGUID: 3PzMRtvYQzOf3GOSE+cTrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24738017"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="24738017"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 17:57:46 -0700
X-CSE-ConnectionGUID: 9XYhmVTTSMK9lfuGzBmNlA==
X-CSE-MsgGUID: XvW19c5xTcKwgSa5g6SciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35317869"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 May 2024 17:57:42 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC7dL-000Cwn-2I;
	Wed, 29 May 2024 00:57:39 +0000
Date: Wed, 29 May 2024 08:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH 5/5] riscv: dts: sophgo: Add LicheeRV Nano board device
 tree
Message-ID: <202405290822.4dIYJxLq-lkp@intel.com>
References: <20240527-sg2002-v1-5-1b6cb38ce8f4@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240527-sg2002-v1-5-1b6cb38ce8f4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_175748_484855_883369D7 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/dt-bindings-interrupt-controller-Add-SOPHGO-SG2002-plic/20240527-183235
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240527-sg2002-v1-5-1b6cb38ce8f4%40bootlin.com
patch subject: [PATCH 5/5] riscv: dts: sophgo: Add LicheeRV Nano board device tree
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240529/202405290822.4dIYJxLq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290822.4dIYJxLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290822.4dIYJxLq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano.dtb', needed by 'arch/riscv/boot/dts/sophgo/'.
   make[6]: Target 'arch/riscv/boot/dts/sophgo/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
