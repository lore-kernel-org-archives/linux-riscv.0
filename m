Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D47EC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IW9nO1/292UYlZkDOpINJqjuJ//KytYIpZnTEUqOYpE=; b=hw3gcCrmKBETkf
	wHm3C2mHfmbG7upU3ajNOupgA/zAPkfynzGcsCD6geRJR7yuHwmW7la7wIBKPVYpHdb0Wll9GOf1u
	lvzLali+UU1A1IF7bFDzUJl4117QFlGGUiIX18DJkuYFcnvq2F8J+AZnO2/d4NdOKwgGc4sQ4dJMq
	00IWI+fL+9+LXh6z9Wgn37nby18xxsrERsoV6QMIJH7+efzmhpSi19NhgbfWuuU97mu9KZxzeRTcR
	jrMOK3neuTxWIM/gGJyssFjuTdxJhVDVKFHRAzgzdEIJG/tUQUVNLjMILx2jY7nM6VPgEONj6y1D6
	kmEwEMRMOLtRhBZoRTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZx9Y-0000000CpzR-14W0;
	Thu, 10 Jul 2025 19:41:56 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvN3-0000000Ccyy-2Jzb
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 17:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752169665; x=1783705665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fYsLiKestMpek0qN0cEg0MwyFp4HDvg6ZGLxP22SxYs=;
  b=BzE9Qa0wKEec/xY9LIVIVPxrpqeBv1OUE3VmYZ33SVuFP1RiIwUlZXB7
   YSwphhkE9/BdoV/auUr6EieJkSJt8XiFPkNfqwKYHNX8UIfYAG8zHAtVO
   M62is4Q+t2IcvV6WTxO7xQJN2YO3bxWJZX9VbF02kFRToix0xB5v2Xeni
   h1KCHkrg9T6yYp51Vep05PK0r0ABMna2Op+PE/JCuXnKc5/FqwRSfKvUD
   gt77/TWnnnkvf0AQxF0gcD19EgfvTtZvfXYp3OQiatXaTKjEmktQmWCiK
   UodmuKawdDK6qlBK31UYTj8i6xXSt+dXlO06bT4+eUYMtk1Rd2/ZxWCRb
   g==;
X-CSE-ConnectionGUID: OLDt4D0uSLq9y5wbdS8zng==
X-CSE-MsgGUID: LbPWmzGhTVant9u/WxPrfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="58226648"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="58226648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 10:47:42 -0700
X-CSE-ConnectionGUID: vAa6fRD7S8aIzxZuFlntBA==
X-CSE-MsgGUID: qOPVOyJASByw8/vBIia/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="193369281"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jul 2025 10:47:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZvMu-0005It-1P;
	Thu, 10 Jul 2025 17:47:36 +0000
Date: Fri, 11 Jul 2025 01:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Hu <nick.hu@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Nick Hu <nick.hu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 2/2] irqchip/riscv-aplic: Save and restore APLIC registers
Message-ID: <202507110131.OzZXquiC-lkp@intel.com>
References: <20250709025516.28051-3-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250709025516.28051-3-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_104745_642835_F6892B2B 
X-CRM114-Status: GOOD (  11.46  )
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

Hi Nick,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Hu/irqchip-riscv-aplic-Save-and-restore-APLIC-registers/20250709-115608
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250709025516.28051-3-nick.hu%40sifive.com
patch subject: [PATCH 2/2] irqchip/riscv-aplic: Save and restore APLIC registers
config: riscv-randconfig-r132-20250710 (https://download.01.org/0day-ci/archive/20250711/202507110131.OzZXquiC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce: (https://download.01.org/0day-ci/archive/20250711/202507110131.OzZXquiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110131.OzZXquiC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-riscv-aplic-main.c:13:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic-main.c:13:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic-main.c:13:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic-main.c:13:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic-main.c:13:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic-main.c:13:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-aplic-main.c:13:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/irqchip/irq-riscv-aplic-main.c:220:26: error: use of undeclared identifier 'valH'
     220 |                 priv->saved_msiaddrh = valH;
         |                                        ^~~~
   7 warnings and 1 error generated.


vim +/valH +220 drivers/irqchip/irq-riscv-aplic-main.c

   203	
   204	void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
   205	{
   206		u32 val;
   207	#ifdef CONFIG_RISCV_M_MODE
   208		u32 valh;
   209	
   210		if (msi_mode) {
   211			val = lower_32_bits(priv->msicfg.base_ppn);
   212			valh = FIELD_PREP(APLIC_xMSICFGADDRH_BAPPN, upper_32_bits(priv->msicfg.base_ppn));
   213			valh |= FIELD_PREP(APLIC_xMSICFGADDRH_LHXW, priv->msicfg.lhxw);
   214			valh |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXW, priv->msicfg.hhxw);
   215			valh |= FIELD_PREP(APLIC_xMSICFGADDRH_LHXS, priv->msicfg.lhxs);
   216			valh |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXS, priv->msicfg.hhxs);
   217			writel(val, priv->regs + APLIC_xMSICFGADDR);
   218			writel(valh, priv->regs + APLIC_xMSICFGADDRH);
   219			priv->saved_msiaddr = val;
 > 220			priv->saved_msiaddrh = valH;
   221		}
   222	#endif
   223	
   224		/* Setup APLIC domaincfg register */
   225		val = readl(priv->regs + APLIC_DOMAINCFG);
   226		val |= APLIC_DOMAINCFG_IE;
   227		if (msi_mode)
   228			val |= APLIC_DOMAINCFG_DM;
   229		writel(val, priv->regs + APLIC_DOMAINCFG);
   230		if (readl(priv->regs + APLIC_DOMAINCFG) != val)
   231			dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);
   232		priv->saved_domaincfg = val;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
