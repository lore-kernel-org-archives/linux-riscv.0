Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A545E7717F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Dec 2024 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tI8hsl0LeeFdb7iEhBMB2xkNllemT75ikGswZpOEwUc=; b=4DkTrRRXaHHRFc
	yjW2AeQDECKe1WJDB3d7rUWZ06SLNgG/FmAi402Cp4oXbcbgC8T6edGe0teQnsCdm1c+CLEEAlr/c
	GTwXG04x2s/lqTajIpYrFoW+wycWCvHRuIOyvHC0E0RlRWwHcx51PZpwOMXR36b7c13cpUk3zWn3I
	EtLyvcweZcNOsRCDju6IOnUH+4ecFaRwRQdNQUAl4o+A3enLFfJflc3u/J1iQcBobIb8U29Nib/CN
	SLKU01UNDJU3a3BawShqp5Fh60wfQy2CRaDNnjpsyP02dgYnhdooyqhVDV037xuhjqqZ7J7pVKbzJ
	ibviiIg82FVKaihmnK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMnNe-00000007r06-0LnE;
	Sun, 15 Dec 2024 12:05:50 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMnNa-00000007qyi-1PjI
	for linux-riscv@lists.infradead.org;
	Sun, 15 Dec 2024 12:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734264346; x=1765800346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9kJLi0dXcGI0Nv+xmsFVcopdmVnhaH0hQ44/xOLTk5Y=;
  b=Vw5It/VxplXyQkWosvZDj+oDwRYyGDXXrjrCujwNvtlVuyFxnCrGHfk4
   TG6Kg5isBRyo6qf5gOVe9TMAlpgUT0mnVkriHI7v7buQDOaFsN5h8if0S
   kBge7nrmoapOYyZ16qXXl0YLSvNo+0T39sqSuG5/ZA75ytR1PJZjSg00g
   sfFv8tnpy6NDGKh/e679bwFJEtA0FXH92cfnYxz+7mUmsHCHWsIikKC1W
   BjKxz+LTDAdsavGJCnoyyycr8xe5keDOynco3QSylo8aDo/kdlZlE4+2k
   F2fFnQgnMaRwM27UUd3bcUYC4jQdMzo6jEmTeaI1TzXn/kmyu5Pxyq3zq
   A==;
X-CSE-ConnectionGUID: uWYtjcLAT3OGRQ1DiR56Uw==
X-CSE-MsgGUID: fcSQdmyiQl21zp+/c7LCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="22246183"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="22246183"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 04:05:40 -0800
X-CSE-ConnectionGUID: P8R3k7+lQM2ZtLbYVrag9A==
X-CSE-MsgGUID: RVCG9s3BRyChlgkgpNp+Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="97504875"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Dec 2024 04:05:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMnNM-000Db4-09;
	Sun, 15 Dec 2024 12:05:32 +0000
Date: Sun, 15 Dec 2024 20:04:59 +0800
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
Message-ID: <202412151947.yDHMy3jh-lkp@intel.com>
References: <1d82eff3670f60df24228e5c83cf663c6dd61eaf.1733726572.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d82eff3670f60df24228e5c83cf663c6dd61eaf.1733726572.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_040546_424229_DBC2E25D 
X-CRM114-Status: GOOD (  13.80  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-pci-Add-Sophgo-SG2042-PCIe-host/20241209-152613
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/1d82eff3670f60df24228e5c83cf663c6dd61eaf.1733726572.git.unicorn_wang%40outlook.com
patch subject: [PATCH v2 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
config: sh-randconfig-r071-20241215 (https://download.01.org/0day-ci/archive/20241215/202412151947.yDHMy3jh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151947.yDHMy3jh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412151947.yDHMy3jh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/cadence/pcie-sg2042.c:23:
   drivers/pci/controller/cadence/../../../irqchip/irq-msi-lib.h:25:39: warning: 'struct msi_domain_info' declared inside parameter list will not be visible outside of this definition or declaration
      25 |                                struct msi_domain_info *info);
         |                                       ^~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-sg2042.c:306:15: error: variable 'sg2042_pcie_msi_parent_ops' has initializer but incomplete type
     306 | static struct msi_parent_ops sg2042_pcie_msi_parent_ops = {
         |               ^~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-sg2042.c:307:10: error: 'struct msi_parent_ops' has no member named 'required_flags'
     307 |         .required_flags         = SG2042_PCIE_MSI_FLAGS_REQUIRED,
         |          ^~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-sg2042.c:301:41: error: 'MSI_FLAG_USE_DEF_DOM_OPS' undeclared here (not in a function)
     301 | #define SG2042_PCIE_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |      \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:307:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_REQUIRED'
     307 |         .required_flags         = SG2042_PCIE_MSI_FLAGS_REQUIRED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-sg2042.c:302:41: error: 'MSI_FLAG_USE_DEF_CHIP_OPS' undeclared here (not in a function)
     302 |                                         MSI_FLAG_USE_DEF_CHIP_OPS)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:307:35: note: in expansion of macro 'SG2042_PCIE_MSI_FLAGS_REQUIRED'
     307 |         .required_flags         = SG2042_PCIE_MSI_FLAGS_REQUIRED,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:301:40: warning: excess elements in struct initializer
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
>> drivers/pci/controller/cadence/pcie-sg2042.c:308:10: error: 'struct msi_parent_ops' has no member named 'supported_flags'
     308 |         .supported_flags        = SG2042_PCIE_MSI_FLAGS_SUPPORTED,
         |          ^~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-sg2042.c:304:41: error: 'MSI_GENERIC_FLAGS_MASK' undeclared here (not in a function)
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
>> drivers/pci/controller/cadence/pcie-sg2042.c:309:10: error: 'struct msi_parent_ops' has no member named 'bus_select_mask'
     309 |         .bus_select_mask        = MATCH_PCI_MSI,
         |          ^~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/../../../irqchip/irq-msi-lib.h:15:33: warning: excess elements in struct initializer
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
>> drivers/pci/controller/cadence/pcie-sg2042.c:310:10: error: 'struct msi_parent_ops' has no member named 'bus_select_token'
     310 |         .bus_select_token       = DOMAIN_BUS_NEXUS,
         |          ^~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:310:35: warning: excess elements in struct initializer
     310 |         .bus_select_token       = DOMAIN_BUS_NEXUS,
         |                                   ^~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:310:35: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
>> drivers/pci/controller/cadence/pcie-sg2042.c:311:10: error: 'struct msi_parent_ops' has no member named 'prefix'
     311 |         .prefix                 = "SG2042-",
         |          ^~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:311:35: warning: excess elements in struct initializer
     311 |         .prefix                 = "SG2042-",
         |                                   ^~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:311:35: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
>> drivers/pci/controller/cadence/pcie-sg2042.c:312:10: error: 'struct msi_parent_ops' has no member named 'init_dev_msi_info'
     312 |         .init_dev_msi_info      = msi_lib_init_dev_msi_info,
         |          ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:312:35: warning: excess elements in struct initializer
     312 |         .init_dev_msi_info      = msi_lib_init_dev_msi_info,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/cadence/pcie-sg2042.c:312:35: note: (near initialization for 'sg2042_pcie_msi_parent_ops')
   drivers/pci/controller/cadence/pcie-sg2042.c: In function 'sg2042_pcie_setup_msi':
>> drivers/pci/controller/cadence/pcie-sg2042.c:344:22: error: 'struct irq_domain' has no member named 'msi_parent_ops'
     344 |         parent_domain->msi_parent_ops = &sg2042_pcie_msi_parent_ops;
         |                      ^~
   drivers/pci/controller/cadence/pcie-sg2042.c: At top level:
>> drivers/pci/controller/cadence/pcie-sg2042.c:306:30: error: storage size of 'sg2042_pcie_msi_parent_ops' isn't known
     306 | static struct msi_parent_ops sg2042_pcie_msi_parent_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sg2042_pcie_msi_parent_ops +306 drivers/pci/controller/cadence/pcie-sg2042.c

   300	
 > 301	#define SG2042_PCIE_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |	\
 > 302						MSI_FLAG_USE_DEF_CHIP_OPS)
   303	
 > 304	#define SG2042_PCIE_MSI_FLAGS_SUPPORTED MSI_GENERIC_FLAGS_MASK
   305	
 > 306	static struct msi_parent_ops sg2042_pcie_msi_parent_ops = {
 > 307		.required_flags		= SG2042_PCIE_MSI_FLAGS_REQUIRED,
 > 308		.supported_flags	= SG2042_PCIE_MSI_FLAGS_SUPPORTED,
 > 309		.bus_select_mask	= MATCH_PCI_MSI,
 > 310		.bus_select_token	= DOMAIN_BUS_NEXUS,
 > 311		.prefix			= "SG2042-",
 > 312		.init_dev_msi_info	= msi_lib_init_dev_msi_info,
   313	};
   314	
   315	static int sg2042_pcie_setup_msi(struct sg2042_pcie *pcie, struct device_node *msi_node)
   316	{
   317		struct device *dev = pcie->cdns_pcie->dev;
   318		struct fwnode_handle *fwnode = of_node_to_fwnode(dev->of_node);
   319		struct irq_domain *parent_domain;
   320		int ret = 0;
   321	
   322		if (!of_property_read_bool(msi_node, "msi-controller"))
   323			return -ENODEV;
   324	
   325		ret = of_irq_get_byname(msi_node, "msi");
   326		if (ret <= 0) {
   327			dev_err(dev, "%pOF: failed to get MSI irq\n", msi_node);
   328			return ret;
   329		}
   330		pcie->msi_irq = ret;
   331	
   332		irq_set_chained_handler_and_data(pcie->msi_irq,
   333						 sg2042_pcie_msi_chained_isr, pcie);
   334	
   335		parent_domain = irq_domain_create_linear(fwnode, MSI_DEF_NUM_VECTORS,
   336							 &sg2042_pcie_msi_domain_ops, pcie);
   337		if (!parent_domain) {
   338			dev_err(dev, "%pfw: Failed to create IRQ domain\n", fwnode);
   339			return -ENOMEM;
   340		}
   341		irq_domain_update_bus_token(parent_domain, DOMAIN_BUS_NEXUS);
   342	
   343		parent_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
 > 344		parent_domain->msi_parent_ops = &sg2042_pcie_msi_parent_ops;
   345	
   346		pcie->msi_domain = parent_domain;
   347	
   348		ret = sg2042_pcie_init_msi_data(pcie);
   349		if (ret) {
   350			dev_err(dev, "Failed to initialize MSI data!\n");
   351			return ret;
   352		}
   353	
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
