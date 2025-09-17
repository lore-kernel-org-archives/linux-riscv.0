Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A9CAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlE5CUYuav3WvqTW8D+ekU1kcXUmncCuCtmGml0Kztk=; b=Yqk7NWJ4Us8tOE
	ytrFlGbQt8r1QkNIbcucia01U1j9/Ig6SE9ZEshyeK4UxoTjXX/LDHNrrH2CbuBSN4REDdL5IXvIL
	tuJcBzF3AOa8bCZ/c6CstPvSIapsnRS+Ru/A66gWwGjCGoTxFTRPO6eiCo3hHUj5vyqpIdvaPHqkf
	n/GmTNqzoSh0pW5EtphxPV9RK/2ESDx1sKqnZZh6KlI3rid3eFT+YE7PrMQPUBukcD4JclL6kuMfW
	ssMoJkds5akuIJu8jxr+ScIMZrDdX4QCANJANTjVIyb7ycO3zFKdeDs/3r5cDCEpOmfDpnKFiHALw
	/XK6tdYZWbHTzfa3Qo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoqI-0000000ArUy-1CzG;
	Wed, 17 Sep 2025 09:52:50 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoqF-0000000ArUG-1Vv8
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 09:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758102767; x=1789638767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BFX6ownYzY7fkpQNkKIV0Q6ij+7Fw1P1XuX9Ln822Ro=;
  b=D7IpGn1rlu4qbWlppOk7zz9x/dQLzW8ocuoVYiC7QDH6JszhNniyYjbZ
   rVD5vnakvHpf8OqYrv7FIzvpOvkvNJXqxFXkHydWjj4iRD8yxfiDQBz1g
   xrTYK47gc3+NEZxm9Ud32/02f6q2rkmXpzTKQnwUv+w9zIn2zjW2yArt2
   RBTLkMlb5IuC1n2fAS6NaO/bZWP4/MhiUf4XiMVSuJjD/V4mrOm8r8Jon
   Z8FoNc4DjV3zsC9VAaa5ftb0Ec41mjVKiyjqkmhhy4H+oEcsXkI3gMIUJ
   yp+P0/kDTURDGOdQx+AdvlhSbJgcZBL/J7tM1S0x8FRnra9b0K/tiGP9Y
   A==;
X-CSE-ConnectionGUID: wwgdxV2BR320ytip1dB2sw==
X-CSE-MsgGUID: k9Kgqpd6Sr+dgS0r7gT3TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71507488"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="71507488"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 02:52:27 -0700
X-CSE-ConnectionGUID: fXDEHERxTC+QoYiDPK7aNg==
X-CSE-MsgGUID: rnd60lEbSgK/07jnyeF1WQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 02:52:21 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyopm-0001LH-3A;
	Wed, 17 Sep 2025 09:52:18 +0000
Date: Wed, 17 Sep 2025 17:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: Randolph Lin <randolph@andestech.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, jingoohan1@gmail.com, mani@kernel.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com,
	paul.walmsley@sifive.com, ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, randolph.sklin@gmail.com,
	tim609@andestech.com, Randolph Lin <randolph@andestech.com>
Subject: Re: [PATCH v2 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <202509171747.yJ9wsIkH-lkp@intel.com>
References: <20250916100417.3036847-5-randolph@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250916100417.3036847-5-randolph@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_025247_440918_E691445A 
X-CRM114-Status: GOOD (  12.37  )
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

Hi Randolph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linus/master v6.17-rc6 next-20250916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Randolph-Lin/PCI-dwc-Add-outbound-ATU-address-range-validation-callback/20250916-180841
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250916100417.3036847-5-randolph%40andestech.com
patch subject: [PATCH v2 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250917/202509171747.yJ9wsIkH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509171747.yJ9wsIkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509171747.yJ9wsIkH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/pci/controller/dwc/pcie-andes-qilai.c:179:22: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     179 |                 dev_err_probe(dev, ret, "Failed to Get APB registers.\n");
         |                                    ^~~
   drivers/pci/controller/dwc/pcie-andes-qilai.c:159:9: note: initialize the variable 'ret' to silence this warning
     159 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/ret +179 drivers/pci/controller/dwc/pcie-andes-qilai.c

   153	
   154	static int qilai_pcie_probe(struct platform_device *pdev)
   155	{
   156		struct qilai_pcie *pcie;
   157		struct dw_pcie *pci;
   158		struct device *dev;
   159		int ret;
   160	
   161		pcie = devm_kzalloc(&pdev->dev, sizeof(*pcie), GFP_KERNEL);
   162		if (!pcie)
   163			return -ENOMEM;
   164	
   165		pcie->pdev = pdev;
   166		platform_set_drvdata(pdev, pcie);
   167	
   168		pci = &pcie->pci;
   169		dev = &pcie->pdev->dev;
   170		pcie->pci.dev = dev;
   171		pcie->pci.ops = &qilai_pcie_ops;
   172		pcie->pci.pp.ops = &qilai_pcie_host_ops;
   173		pci->use_parent_dt_ranges = true;
   174	
   175		dw_pcie_cap_set(&pcie->pci, REQ_RES);
   176	
   177		pcie->apb_base = devm_platform_ioremap_resource_byname(pdev, "apb");
   178		if (IS_ERR(pcie->apb_base)) {
 > 179			dev_err_probe(dev, ret, "Failed to Get APB registers.\n");
   180			return PTR_ERR(pcie->apb_base);
   181		}
   182	
   183		ret = dw_pcie_host_init(&pcie->pci.pp);
   184		if (ret) {
   185			dev_err_probe(dev, ret, "Failed to initialize PCIe host\n");
   186			return ret;
   187		}
   188	
   189		qilai_pcie_iocp_cache_setup(&pcie->pci.pp);
   190	
   191		return 0;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
