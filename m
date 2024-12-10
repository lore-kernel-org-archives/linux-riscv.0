Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5868AE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7+wAQns7PJMLVKGb+jwMF1XBvi/iNYn768D/DwJ1iM=; b=bHJJgr28isOGcc
	T1cczaMQx7DJXRiY/DN2JDwD43iIu4uWtKnTQOKrI7Jcy337RYOacWUvrWKSphoyiDduMuymzVHHM
	tDrBFO4lgFodJQ3gyWeG+OMd51jjdmjDqaDTkfcJHR3qbTga+2rT86tPQLpHUeGiUvKvow75mP2Yw
	qW1kPSOaTCwAaPVdyFz+bGnK/WxBl3QmHiaoKSMUpVe/+4n+hA7n+vGRhutPxR1KCK0PgXO2CXAbg
	AFEzC5qn0PdX/BwY0UpHJhp4CiFQtB0lrH/p9BWUVYKuiYiglw9ClDqj8L5g7jJFT0/MBcjImpNVO
	APgfZkAcp6XyXB9zMm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Bd-0000000CQf4-0DMG;
	Tue, 10 Dec 2024 18:42:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL54u-0000000CPS0-1K44
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 18:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733855725; x=1765391725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FdRhiTf0H0C251ouPst6kpD29MZnOFFx0UOQiwCT1/E=;
  b=jntojBSLmRRP+mte+sJe4coZC8GX24ST6Ez6guJ4roXgQHfdmmNxmnuD
   O2mCt3MpB17mi/57iRU8ICq4M2KLh8hlugUvdxaMk5Uqm7rxDPQosGlpB
   dVpOfh1fuccroaqz4VlTgA+p9eIfaryTwqMH9cVMrfOXFFWP1FSWwGTOC
   PK1uVwZV+i5djNO0gUlqZWAW/QBHw5ODekB8i3h+2m7lZTpW+zb0mniNe
   Rn7GX4LAFZZ2Rx6ND9lmrxmj6f1lf9jZBLF8J9B7fPTNXMqxoqBNRcHTB
   h7xVl7XsPFI4TgDLKfdVxFOXSHfUaYZxbBsbOpo4x3jf7whXPQbO400JH
   A==;
X-CSE-ConnectionGUID: q8ZyNZLNSyCCHvRyXWtcww==
X-CSE-MsgGUID: gxCYw+XnRfqceA88JsJ3Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37901804"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="37901804"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 10:35:23 -0800
X-CSE-ConnectionGUID: qMcCP1BFTf6GYnBNbWFPfQ==
X-CSE-MsgGUID: uQSxdHw8SI2pdZwNqnwP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="95321237"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 10:35:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL54l-0005r9-3A;
	Tue, 10 Dec 2024 18:35:15 +0000
Date: Wed, 11 Dec 2024 02:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com,
	conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
Message-ID: <202412110248.fdcNDwnt-lkp@intel.com>
References: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_103524_428333_F9AB49E5 
X-CRM114-Status: UNSURE (   8.74  )
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

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-interrupt-controller-Add-Sophgo-SG2042-MSI/20241209-151429
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang%40outlook.com
patch subject: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt controller
config: arm-randconfig-r131-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110248.fdcNDwnt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241211/202412110248.fdcNDwnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110248.fdcNDwnt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-sg2042-msi.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/irqchip/irq-sg2042-msi.c:64:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/irqchip/irq-sg2042-msi.c:64:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/irqchip/irq-sg2042-msi.c:64:9: sparse:     got unsigned int *

vim +/__iomem +64 drivers/irqchip/irq-sg2042-msi.c

    58	
    59	static void sg2042_msi_irq_ack(struct irq_data *d)
    60	{
    61		struct sg2042_msi_data *data  = irq_data_get_irq_chip_data(d);
    62		int bit_off = d->hwirq - data->irq_first;
    63	
  > 64		writel(1 << bit_off, (unsigned int *)data->reg_clr);
    65	
    66		irq_chip_ack_parent(d);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
