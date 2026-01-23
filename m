Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717C4D6CFDC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsHmFCHZGQHaLfefn3CNTPubW50UmK+lQNrWytVezp0=; b=ucJLYvrM+uXx9b
	We5L/W8ylEaFlhaYnWdn748I1jq+iuvs+n7ALQh3rPXNCQzXpOLL9B1wjvIBLSCW+HyokFSSUGnd/
	H0H03AixkL1AfxBc4rX4cVkyRHBSba5AcygvBKox2Wgx1J4q0AjQH2EaggFA2+FnzlYCQipmky2OL
	czLUtt8b3hOheq5+TJIjCJQJjBNuWtgEfiXkTLpW7wRn7cYQVVtcY55NveI1QsrP0GI1DoF5nLzmI
	3Mjj1uvvzCzc6ca1A2h5PlEW2uNSvVZhCoHMqMc2Jyovt+cm9htzw0S9HQFiTJ8t+tHTI4zumzScF
	vkAjvXy1sRGe1oScTE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBDt-00000008L9z-43ux;
	Fri, 23 Jan 2026 07:04:49 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBDq-00000008L91-2HQv
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 07:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769151886; x=1800687886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GmuuJ/Cvslff5ZuKmPfah+mae6v3I0Ocxmn9Mpws1Qw=;
  b=D8B9OB12sD8wmpBit76OlUTVosgeClotmZd9ucxRPCXqhYzryRptfTwS
   UnA16CKh1hLmpj+6Bhw8427nxmFzSwK/PM6G9RTYklQTMRJlCrK6+SICI
   MfzDiZAzWkckdJ9UKBSqbj8ATsOrA71wqsPXwE3rqAoaiF0QmlOvK6e8d
   TXFOBhskl6Bp68Yl3ck54HQC2WSNy4Q1Gf1lg3euX6Lvc2gvoTv9OocUD
   l9WAYG+Ythbj1oTwO5DY7dKQrxgRWebHZWECGfzMQ/o3gS1i+rcYHll0B
   PxKLnM5L7vPFiiZMb29/xVKi+SMp/aLkwA/6gdfgUiQCzzaE2NQuK6PB/
   g==;
X-CSE-ConnectionGUID: 1MQj2WWOSUuNp6wkir4Lpw==
X-CSE-MsgGUID: V1WWNgQoQtCJvINNkHh//Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74034309"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="74034309"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 23:04:42 -0800
X-CSE-ConnectionGUID: GYRlra5nRZyY6FyBGLASbQ==
X-CSE-MsgGUID: QDxjfPAzTkad+3BbclmPvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211954459"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jan 2026 23:04:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjBDe-00000000TcY-3HmG;
	Fri, 23 Jan 2026 07:04:34 +0000
Date: Fri, 23 Jan 2026 15:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org,
	mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v2 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <202601231402.YbzFbWJb-lkp@intel.com>
References: <20260122-atlantis-clocks-v2-3-c66371639e66@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122-atlantis-clocks-v2-3-c66371639e66@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_230446_629050_99896D56 
X-CRM114-Status: GOOD (  11.79  )
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

Hi Anirudh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Srinivasan/dt-bindings-soc-tenstorrent-Add-tenstorrent-atlantis-syscon/20260123-064135
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260122-atlantis-clocks-v2-3-c66371639e66%40oss.tenstorrent.com
patch subject: [PATCH v2 3/3] clk: tenstorrent: Add Atlantis clock controller driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260123/202601231402.YbzFbWJb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231402.YbzFbWJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231402.YbzFbWJb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/tenstorrent/atlantis-ccu.c: In function 'atlantis_cadev_release':
>> drivers/clk/tenstorrent/atlantis-ccu.c:832:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     832 |         kfree(to_atlantis_ccu_adev(adev));
         |         ^~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c: In function 'atlantis_ccu_adev_register':
>> drivers/clk/tenstorrent/atlantis-ccu.c:852:17: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     852 |         cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
         |                 ^~~~~~~
>> drivers/clk/tenstorrent/atlantis-ccu.c:852:15: error: assignment to 'struct atlantis_ccu_adev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     852 |         cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
         |               ^


vim +/kfree +832 drivers/clk/tenstorrent/atlantis-ccu.c

   827	
   828	static void atlantis_cadev_release(struct device *dev)
   829	{
   830		struct auxiliary_device *adev = to_auxiliary_dev(dev);
   831	
 > 832		kfree(to_atlantis_ccu_adev(adev));
   833	}
   834	
   835	static void atlantis_adev_unregister(void *data)
   836	{
   837		struct auxiliary_device *adev = data;
   838	
   839		auxiliary_device_delete(adev);
   840		auxiliary_device_uninit(adev);
   841	}
   842	
   843	static int atlantis_ccu_adev_register(struct device *dev,
   844					      struct atlantis_ccu *ccu,
   845					      const struct atlantis_ccu_data *data,
   846					      const char *adev_name)
   847	{
   848		struct atlantis_ccu_adev *cadev;
   849		struct auxiliary_device *adev;
   850		int ret;
   851	
 > 852		cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
   853		if (!cadev)
   854			return -ENOMEM;
   855	
   856		cadev->regmap = ccu->regmap;
   857	
   858		adev = &cadev->adev;
   859		adev->name = adev_name;
   860		adev->dev.parent = dev;
   861		adev->dev.release = atlantis_cadev_release;
   862		adev->dev.of_node = dev->of_node;
   863	
   864		ret = auxiliary_device_init(adev);
   865		if (ret)
   866			goto err_free_cadev;
   867	
   868		ret = auxiliary_device_add(adev);
   869		if (ret) {
   870			auxiliary_device_uninit(adev);
   871			return ret;
   872		}
   873	
   874		return devm_add_action_or_reset(dev, atlantis_adev_unregister, adev);
   875	
   876	err_free_cadev:
   877		kfree(cadev);
   878	
   879		return ret;
   880	}
   881	static int atlantis_ccu_probe(struct platform_device *pdev)
   882	{
   883		const struct atlantis_ccu_data *data;
   884		struct device *dev = &pdev->dev;
   885		int ret;
   886	
   887		struct atlantis_ccu *ccu = devm_kzalloc(dev, sizeof(*ccu), GFP_KERNEL);
   888	
   889		if (!ccu)
   890			return -ENOMEM;
   891	
   892		ccu->dev = dev;
   893	
   894		ccu->base = devm_platform_ioremap_resource(pdev, 0);
   895		if (IS_ERR(ccu->base))
   896			return dev_err_probe(dev, PTR_ERR(ccu->base),
   897					     "Failed to map registers\n");
   898	
   899		ccu->regmap = devm_regmap_init_mmio(dev, ccu->base,
   900						    &atlantis_ccu_regmap_config);
   901		if (IS_ERR(ccu->regmap))
   902			return dev_err_probe(dev, PTR_ERR(ccu->regmap),
   903					     "Failed to init regmap\n");
   904	
   905		data = of_device_get_match_data(dev);
   906	
   907		ret = atlantis_ccu_clocks_register(dev, ccu, data);
   908		if (ret)
   909			return dev_err_probe(dev, ret, "failed to register clocks\n");
   910	
   911		ret = atlantis_ccu_adev_register(dev, ccu, data, data->reset_name);
   912		if (ret)
   913			return dev_err_probe(dev, ret, "failed to register resets\n");
   914	
   915		return 0;
   916	}
   917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
