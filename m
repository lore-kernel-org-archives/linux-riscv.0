Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A993E77180
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ni2fyXj4q/L9RQQ0TMCg5PVyCNLQoiLx2AlU3QlsQ3I=; b=XfNjoB/L3jJzB4
	oXPfjttovMkp0CsXW+G26AQnA4d4jvAGe5EhjSCzo3ZzHojciF9+zdmjpPFLsAyCfxmoCQgpTN45T
	rILYQltn8DXxOxU1L23JUy6RlT2vsBCkKM95n7wsNe1OuYgxd7r55B/umhCkvbS53ye/Gffybq6no
	wAWNcID5G6pp7yyYvccw2WvtpCm8eZRTbj36vXW+ysYqI1cdjKtF0sJIFaBbQMOryfcITTKS4e1ou
	KaSYjc244tKPBFqg/wkSEmuwuPjzzgNpw/kAfc+shcH3wHI8/I198SH3WBa7ZTj7ESg5j04UFnBX3
	BwNbVWTw0SFFfLUw+Y6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKupB-0000000Aa8E-3uh5;
	Tue, 10 Dec 2024 07:38:29 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKup9-0000000Aa6y-0Ijn
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 07:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733816307; x=1765352307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H6C+H0ERg2udqpIlH6eX06oEpkp6sFJgzrUzQhN7GMk=;
  b=Sidpz7Jr0ey2/yklr/uX/VvPemqq7b9IpKRR1DUQYA3BXv67rUWyGBdx
   r8LvmrjQ2MxAHV8anq/f8n4wW0Qj4bE8knRJAavHyQOcjVD624yhNhG9H
   waVrjF66t+oTu6sIYH4elBzoZFEyVtgXTeAvmZxeTqXxeMPiL/V1okqkA
   lBi2D56+D6bkYLdjkDAgyGrocRVFO6fmX9pV5G7f/RDGqDR+H4O2mYq0t
   kHIq2Up670T4f/FLJIdpsSqeYmHWc7eRNOodYajfU61gId716qpXk5YZi
   bhhsR3qPJw+5PeJixPsxfjuhcOvnNQGiWtTGGDakn6J94PFUNeqkrSMbC
   w==;
X-CSE-ConnectionGUID: nGF0lKJHSSq5WYpGxslzgg==
X-CSE-MsgGUID: bz/CpuMKQsW1P58XF2ws8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45543317"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45543317"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:38:25 -0800
X-CSE-ConnectionGUID: Rq4nbTcHSlu/PC9fbFCHXQ==
X-CSE-MsgGUID: imrIX125Q92cD6pes/MbMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="126217843"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 23:38:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKup0-0005Fd-0c;
	Tue, 10 Dec 2024 07:38:18 +0000
Date: Tue, 10 Dec 2024 15:37:17 +0800
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
Message-ID: <202412101545.Psk65SvD-lkp@intel.com>
References: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_233827_151915_30334E3C 
X-CRM114-Status: UNSURE (   9.05  )
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
config: arm-randconfig-r131-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101545.Psk65SvD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241210/202412101545.Psk65SvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101545.Psk65SvD-lkp@intel.com/

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
