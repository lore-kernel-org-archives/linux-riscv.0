Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF13AE7716A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Dec 2024 09:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJSzi+Dajz7PVClNn5RQ9B163jhGLz9TAatmpGq7Xi0=; b=mQHkX86clit4iC
	ztR6X46l0P4zMY5ijXzbdnTQw1pU734WWOb2jUIOStNXds/V36xj7mkG/PPNh9GIv3cgDWsOJUcZ4
	m8YRnJQh3xxHwA9fdBN6O5BZpb/j/zfjhPUjd8pjF9XXZjwh6nsOCyfBT9ujXPlrfpF6cyXL7DsPz
	ZW66eb8beP1YXX+YHqyxoQJtTpkDqVBNGK6/Q24RrrLPWUXj2EOZQCYvORRinq9MLHsLdavQipRqL
	NWOZmhY3VrexTkzxDKWsGcMGjYw2Sxv9AefPTZvSa35BdMAiikLfO/dHmxkYQi5BBg2Jkr4ySe3Jw
	W+1m70fI9OP5QDYH50gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMklk-00000007fsY-2zMC;
	Sun, 15 Dec 2024 09:18:32 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMklh-00000007frI-2tuq
	for linux-riscv@lists.infradead.org;
	Sun, 15 Dec 2024 09:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734254310; x=1765790310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gOFMlC93rzTys2ywdCU7XfZ3NWMuDFC1Y2dBKFeIrRU=;
  b=TiGS162Torx089g5D3r0EVGDkqKePwQQ01rUpOmxEsf7fU1YVTCCg6yG
   eIXSabl3gCYWCdFlI1o438LvaiXjTrgo0HnTvUj4kUEAXnIw5QxHgjLqg
   sakK0JdUhlUxaIxf+RNaP/HGOpf6CbCf+FAOC7Psv7j3K36Rg+AnpPKqx
   IfBPZ8F3XO7DBlXuhyRyQA3lulxMAfjnmLNheklkFNPgiemIDMudz5BUm
   xbJhLlOJSDBFMGt+EmlxY0RrKCebKicb3wntt1JEGnIv1oDhQZ+4Rn4do
   MsnEFGCOVjXVxZFlkM6ydiehRQysWlg3JXvAcagaUwcPC1Q+kRDkWNyxA
   Q==;
X-CSE-ConnectionGUID: bK33CP00SbOjku5Cdswa5A==
X-CSE-MsgGUID: Qvf1tTVtQdGSUOruSo/6Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45139914"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45139914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 01:18:28 -0800
X-CSE-ConnectionGUID: U3KsVvy2SGKSfoAXon5cPw==
X-CSE-MsgGUID: 4p8/FwS1R7KjSwCz7AR3OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="127745779"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2024 01:18:21 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMklX-000DXG-0A;
	Sun, 15 Dec 2024 09:18:19 +0000
Date: Sun, 15 Dec 2024 17:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, unicorn_wang@outlook.com, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
	lee@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com, helgaas@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <202412151758.8ckkzHnf-lkp@intel.com>
References: <1d82eff3670f60df24228e5c83cf663c6dd61eaf.1733726572.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d82eff3670f60df24228e5c83cf663c6dd61eaf.1733726572.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_011829_876320_9398E5D0 
X-CRM114-Status: GOOD (  12.27  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-pci-Add-Sophgo-SG2042-PCIe-host/20241209-152613
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/1d82eff3670f60df24228e5c83cf663c6dd61eaf.1733726572.git.unicorn_wang%40outlook.com
patch subject: [PATCH v2 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
config: sh-randconfig-r071-20241215 (https://download.01.org/0day-ci/archive/20241215/202412151758.8ckkzHnf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151758.8ckkzHnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412151758.8ckkzHnf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/cadence/pcie-sg2042.c:23:
>> drivers/pci/controller/cadence/../../../irqchip/irq-msi-lib.h:25:39: warning: 'struct msi_domain_info' declared inside parameter list will not be visible outside of this definition or declaration
      25 |                                struct msi_domain_info *info);
         |                                       ^~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:306:15: error: variable 'sg2042_pcie_msi_parent_ops' has initializer but incomplete type
     306 | static struct msi_parent_ops sg2042_pcie_msi_parent_ops = {
         |               ^~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:307:10: error: 'struct msi_parent_ops' has no member named 'required_flags'
     307 |         .required_flags         = SG2042_PCIE_MSI_FLAGS_REQUIRED,
         |          ^~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:301:41: error: 'MSI_FLAG_USE_DEF_DOM_OPS' undeclared here (not in a function)
     301 | #define SG2042_PCIE_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |      \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:307:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_REQUIRED'
     307 |         .required_flags         = SG2042_PCIE_MSI_FLAGS_REQUIRED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:302:41: error: 'MSI_FLAG_USE_DEF_CHIP_OPS' undeclared here (not in a function)
     302 |                                         MSI_FLAG_USE_DEF_CHIP_OPS)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:307:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_REQUIRED'
     307 |         .required_flags         = SG2042_PCIE_MSI_FLAGS_REQUIRED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-sg2042.c:301:40: warning: excess elements in struct initializer
     301 | #define SG2042_PCIE_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |      \
         |                                        ^
   drivers/pci/controller/cadence/pcie-sg2042.c:307:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_REQUIRED'
     307 |         .required_flags         = SG2042_PCIE_MSI_FLAGS_REQUIRED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:301:40: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
     301 | #define SG2042_PCIE_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |      \
         |                                        ^
   drivers/pci/controller/cadence/pcie-sg2042.c:307:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_REQUIRED'
     307 |         .required_flags         = SG2042_PCIE_MSI_FLAGS_REQUIRED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:308:10: error: 'struct msi_parent_ops' has no member named 'supported_flags'
     308 |         .supported_flags        = SG2042_PCIE_MSI_FLAGS_SUPPORTED,
         |          ^~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:304:41: error: 'MSI_GENERIC_FLAGS_MASK' undeclared here (not in a function)
     304 | #define SG2042_PCIE_MSI_FLAGS_SUPPORTED MSI_GENERIC_FLAGS_MASK
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:308:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_SUPPORTED'
     308 |         .supported_flags        = SG2042_PCIE_MSI_FLAGS_SUPPORTED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:304:41: warning: excess elements in struct initializer
     304 | #define SG2042_PCIE_MSI_FLAGS_SUPPORTED MSI_GENERIC_FLAGS_MASK
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:308:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_SUPPORTED'
     308 |         .supported_flags        = SG2042_PCIE_MSI_FLAGS_SUPPORTED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:304:41: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
     304 | #define SG2042_PCIE_MSI_FLAGS_SUPPORTED MSI_GENERIC_FLAGS_MASK
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:308:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_SUPPORTED'
     308 |         .supported_flags        = SG2042_PCIE_MSI_FLAGS_SUPPORTED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:309:10: error: 'struct msi_parent_ops' has no member named 'bus_select_mask'
     309 |         .bus_select_mask        = MATCH_PCI_MSI,
         |          ^~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/../../../irqchip/irq-msi-lib.h:15:33: warning: excess elements in struct initializer
      15 | #define MATCH_PCI_MSI           (0)
         |                                 ^
   drivers/pci/controller/cadence/pcie-sg2042.c:309:35: note: in expansion of macro 'MATCH_PCI_MSI'
     309 |         .bus_select_mask        = MATCH_PCI_MSI,
         |                                   ^~~~~~~~~~~~~
   drivers/pci/controller/cadence/../../../irqchip/irq-msi-lib.h:15:33: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
      15 | #define MATCH_PCI_MSI           (0)
         |                                 ^
   drivers/pci/controller/cadence/pcie-sg2042.c:309:35: note: in expansion of macro 'MATCH_PCI_MSI'
     309 |         .bus_select_mask        = MATCH_PCI_MSI,
         |                                   ^~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:310:10: error: 'struct msi_parent_ops' has no member named 'bus_select_token'
     310 |         .bus_select_token       = DOMAIN_BUS_NEXUS,
         |          ^~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:310:35: warning: excess elements in struct initializer
     310 |         .bus_select_token       = DOMAIN_BUS_NEXUS,
         |                                   ^~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:310:35: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
   drivers/pci/controller/cadence/pcie-sg2042.c:311:10: error: 'struct msi_parent_ops' has no member named 'prefix'
     311 |         .prefix                 = "SG2042-",
         |          ^~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:311:35: warning: excess elements in struct initializer
     311 |         .prefix                 = "SG2042-",
         |                                   ^~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:311:35: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
   drivers/pci/controller/cadence/pcie-sg2042.c:312:10: error: 'struct msi_parent_ops' has no member named 'init_dev_msi_info'
     312 |         .init_dev_msi_info      = msi_lib_init_dev_msi_info,
         |          ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:312:35: warning: excess elements in struct initializer
     312 |         .init_dev_msi_info      = msi_lib_init_dev_msi_info,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:312:35: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
   drivers/pci/controller/cadence/pcie-sg2042.c: In function 'sg2042_pcie_setup_msi':
   drivers/pci/controller/cadence/pcie-sg2042.c:344:22: error: 'struct irq_domain' has no member named 'msi_parent_ops'
     344 |         parent_domain->msi_parent_ops = &sg2042_pcie_msi_parent_ops;
         |                      ^~
   drivers/pci/controller/cadence/pcie-sg2042.c: At top level:
   drivers/pci/controller/cadence/pcie-sg2042.c:306:30: error: storage size of 'sg2042_pcie_msi_parent_ops' isn't known
     306 | static struct msi_parent_ops sg2042_pcie_msi_parent_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +25 drivers/pci/controller/cadence/../../../irqchip/irq-msi-lib.h

72e257c6f058032 Thomas Gleixner 2024-06-23  11  
8c41ccec839c622 Thomas Gleixner 2024-06-23  12  #ifdef CONFIG_PCI_MSI
8c41ccec839c622 Thomas Gleixner 2024-06-23  13  #define MATCH_PCI_MSI		BIT(DOMAIN_BUS_PCI_MSI)
8c41ccec839c622 Thomas Gleixner 2024-06-23  14  #else
8c41ccec839c622 Thomas Gleixner 2024-06-23 @15  #define MATCH_PCI_MSI		(0)
8c41ccec839c622 Thomas Gleixner 2024-06-23  16  #endif
8c41ccec839c622 Thomas Gleixner 2024-06-23  17  
496436f4a514a3f Thomas Gleixner 2024-06-23  18  #define MATCH_PLATFORM_MSI	BIT(DOMAIN_BUS_PLATFORM_MSI)
496436f4a514a3f Thomas Gleixner 2024-06-23  19  
72e257c6f058032 Thomas Gleixner 2024-06-23  20  int msi_lib_irq_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
72e257c6f058032 Thomas Gleixner 2024-06-23  21  			      enum irq_domain_bus_token bus_token);
72e257c6f058032 Thomas Gleixner 2024-06-23  22  
72e257c6f058032 Thomas Gleixner 2024-06-23  23  bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
72e257c6f058032 Thomas Gleixner 2024-06-23  24  			       struct irq_domain *real_parent,
72e257c6f058032 Thomas Gleixner 2024-06-23 @25  			       struct msi_domain_info *info);
72e257c6f058032 Thomas Gleixner 2024-06-23  26  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
