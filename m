Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22575C83030
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 18:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32VMp5+D1rkEArUMXNi8r0nwYUrwPtAgkOZdVJeGHwM=; b=0fsxQ2x5t0tgxv
	ZIPWGNFYd5ihnWFcTMuQgYLsMh9O2SUnb+Mz2D2vOjYnBAYSV7zvmQG1lKW3oVmZiAIRPwVL8RvcT
	qwu1ncRGpA8ncjJJVWXig/gmiFxX6l/dz6jGHFrCvmVLs+XUpj/Dlp+KaJU6WsVRxOrl6/O6+HgJj
	rqdTtFPO2TQ2C9iaBe7EMIC7eNUT6OJGbHQhxNEDvo9waLHoVtOGDc75jNCJkYNx3lGVBUIW1X2Po
	QQGx156A7Wi1pHrhi28xbVnJv1Gvj0PmPIFxtpe1ITmiUpVaIaC6z9GX9nbbTyZriTQaJQuryHqOc
	U99X03oWjX1bTFhgLm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY7uG-0000000Gryt-3zm2;
	Sat, 05 Jul 2025 18:46:36 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY7uD-0000000GryQ-23DZ
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 18:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751741193; x=1783277193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z0yzV/VPkDfvyUx/xopWYC8B14lYUePBKBtLJOQOW6U=;
  b=JF1TQKxV5H9ZXxL3oWV3O8afVuymFkgxxcs3ijkeMJs/BWJZASQQacTQ
   3ZUfybOdy17t/yOsAYP6K6+E8Nn+QWzeI9Vn7dMZ7kta3ldNTNp1ADewm
   C21LzT4CWJaAglpZNM3i7horWN9VOgOmCZoVlD9xew7jPcjjAmZEma2Mc
   wQHmDjnX4orKsemSVaL8OhwHyHeW/WX6TIP4CIeDhtZRd1UMOXHj2aQTv
   zaxnNrxs2g9yz2n1jQNqq2jry+A1cf8NVYIOe5vo7V+BstGHk3vV2ktC6
   16x6LAJuqaiE9qJHJzHjA7fZj876vkrmdJ+8OKl21fqzELyuzRfYA0qIA
   A==;
X-CSE-ConnectionGUID: dFQ0Brv/TXCZWZHTaoo/Kw==
X-CSE-MsgGUID: bWy+x2OGTDWHIMAieegDew==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="65079093"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="65079093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 11:46:31 -0700
X-CSE-ConnectionGUID: YtCQ6xlMTd6QNYDFXdZszw==
X-CSE-MsgGUID: hhfPyBMXRqeKWA/pf1pBJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="154988400"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Jul 2025 11:46:27 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY7u5-0004fv-0y;
	Sat, 05 Jul 2025 18:46:25 +0000
Date: Sun, 6 Jul 2025 02:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v5 2/2] usb: dwc3: add generic driver to support flattened
Message-ID: <202507060206.iiBP6CQi-lkp@intel.com>
References: <20250705-dwc3_generic-v5-2-9dbc53ea53d2@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705-dwc3_generic-v5-2-9dbc53ea53d2@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_114633_608375_9B395EDC 
X-CRM114-Status: GOOD (  10.33  )
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

Hi Ze,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9946fe286439c2aeaa7953b8c316efe5b83d515]

url:    https://github.com/intel-lab-lkp/linux/commits/Ze-Huang/dt-bindings-usb-dwc3-add-support-for-SpacemiT-K1/20250705-210419
base:   d9946fe286439c2aeaa7953b8c316efe5b83d515
patch link:    https://lore.kernel.org/r/20250705-dwc3_generic-v5-2-9dbc53ea53d2%40linux.dev
patch subject: [PATCH v5 2/2] usb: dwc3: add generic driver to support flattened
config: arc-randconfig-001-20250706 (https://download.01.org/0day-ci/archive/20250706/202507060206.iiBP6CQi-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060206.iiBP6CQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060206.iiBP6CQi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-generic-plat.c:151:12: warning: 'dwc3_generic_runtime_idle' defined but not used [-Wunused-function]
    static int dwc3_generic_runtime_idle(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-generic-plat.c:144:12: warning: 'dwc3_generic_runtime_resume' defined but not used [-Wunused-function]
    static int dwc3_generic_runtime_resume(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-generic-plat.c:137:12: warning: 'dwc3_generic_runtime_suspend' defined but not used [-Wunused-function]
    static int dwc3_generic_runtime_suspend(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-generic-plat.c:121:12: warning: 'dwc3_generic_resume' defined but not used [-Wunused-function]
    static int dwc3_generic_resume(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-generic-plat.c:107:12: warning: 'dwc3_generic_suspend' defined but not used [-Wunused-function]
    static int dwc3_generic_suspend(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~~


vim +/dwc3_generic_runtime_idle +151 drivers/usb/dwc3/dwc3-generic-plat.c

   106	
 > 107	static int dwc3_generic_suspend(struct device *dev)
   108	{
   109		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   110		int ret;
   111	
   112		ret = dwc3_pm_suspend(&dwc3->dwc);
   113		if (ret)
   114			return ret;
   115	
   116		clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
   117	
   118		return 0;
   119	}
   120	
 > 121	static int dwc3_generic_resume(struct device *dev)
   122	{
   123		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   124		int ret;
   125	
   126		ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
   127		if (ret)
   128			return ret;
   129	
   130		ret = dwc3_pm_resume(&dwc3->dwc);
   131		if (ret)
   132			return ret;
   133	
   134		return 0;
   135	}
   136	
 > 137	static int dwc3_generic_runtime_suspend(struct device *dev)
   138	{
   139		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   140	
   141		return dwc3_runtime_suspend(&dwc3->dwc);
   142	}
   143	
 > 144	static int dwc3_generic_runtime_resume(struct device *dev)
   145	{
   146		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   147	
   148		return dwc3_runtime_resume(&dwc3->dwc);
   149	}
   150	
 > 151	static int dwc3_generic_runtime_idle(struct device *dev)
   152	{
   153		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   154	
   155		return dwc3_runtime_idle(&dwc3->dwc);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
