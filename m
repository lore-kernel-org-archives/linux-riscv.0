Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BF3D72379
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 11:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKVhtcmNDm2pH0lM2JcmD4Q4WS0IBtmOcSc7lLSSQ6E=; b=SSlA0ctC87Cq8Q
	apHxqjgju6PdLz5vNy1QKuXytFAfAuy1xx3WOKPqjAy2mj1O6ElO9qiUpWbh48NZ1q2AAIGRlk+Wq
	OTf/0F2UsiWFegvTltIItHZVWMSv9FrSmsfx+Jxtw5Z0HUbJu94bqY3X2N5uXMlFTI2Ol1gXkFRwD
	BjRhKtg67dgKrP3sZsCfQzbAu+FZEzlUmn2k0T1WheCXYuaEpfEIp/wAxsx86kgF5EWB2+A+gI0bR
	6l/lUiUv1c2S10IhBpuNnAf+pQugQ0p/k4jATKQZgGWiZzxfAqrd/ArZxueD90Uaq0MU9K5WElXk/
	8+V9PP+JmjLEzA01axqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFYF-00000008riA-2z5g;
	Fri, 23 Jan 2026 11:42:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFYE-00000008ri3-273m
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Jan 2026 11:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=krhV3FHYLBE8YhA6Q97kGjghPBGUI51QQtLeQoUueXc=; b=nz16epcq1+bv3jT+JL2Efzqjlo
	vE5RiIO8EpDjo21A1tWn8RUDTyZWg/aR225kF70fSzGQ0M74QIsCRN3pVL73kafyLKW7cVqFCsf8f
	s3I7F/N7IHQ7l2D3NV4stEsT+MzNelbDebe6AG2NXlmWFyI6AqoXC01S+skgwyh1HjeKhniqSqCpl
	mnZXXaEWiYFR2yoqr20bL39A/DXDfqz0Fk72Dx3KyO9rkHE0t/uS5vKYa8t3LLVy4zcWj43eVbDMN
	+JF5spZTKqtgLcz0tv5z58ObhzqtjF+2BZH4MW9g8o3JpUsW2CFcRJ1BJvNLDGEM00JaAar9AmQlm
	dFT1Xvag==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFYA-00000002HxZ-3zoy
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 11:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769168523; x=1800704523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V4Mf94EcyIDXzX94gvCBbKbFzNKoA9nJp5TA6mm7760=;
  b=NjOQVFYkLaUQ02AF5gKAtxKCGMXJItRQcG5oy89HtFoYwI5JzePQlLJH
   CXkCic6554vtV7Guxzo9FBKh7feK3Lv8pwZQBrq0udpcyahFoMf+/ArTK
   RoRubl3wyRFhYkLTwghI3lh9jPs0UkKZWxiIEJEOns47QPvz4wmPagZdV
   lBzOw6NU97eQvGRhxx2BIDDjMVuyAnlGPf5kZSF77MVdSpykf7C3fUuA9
   QPKZWc8vqygkrgy2VzKVaGQiAXlY/0sS9xp2A1Dnc7tUd+UMAXJThOd5L
   QNpIUnRZNPYfrAv3UIAEADmvXZHE8Q/A3J2DgUCo5Op7t+AHGV8q/fyTx
   A==;
X-CSE-ConnectionGUID: 7jo+tnR3T0WK+lE+h6SWcQ==
X-CSE-MsgGUID: 5ZvRdlrdTu6lKCSm1QRfVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70481957"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70481957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:41:58 -0800
X-CSE-ConnectionGUID: HfX8Xg9RSGi7be1Lr3RVNg==
X-CSE-MsgGUID: /0HznFOTRbCyDXyBJf4gng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211130239"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2026 03:41:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjFXy-00000000Tty-0dUd;
	Fri, 23 Jan 2026 11:41:50 +0000
Date: Fri, 23 Jan 2026 19:41:30 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v2 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <202601231918.PQTTcbRG-lkp@intel.com>
References: <20260122-atlantis-clocks-v2-3-c66371639e66@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122-atlantis-clocks-v2-3-c66371639e66@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_114203_396404_AD50672C 
X-CRM114-Status: GOOD (  12.32  )
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
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260123/202601231918.PQTTcbRG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231918.PQTTcbRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231918.PQTTcbRG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/tenstorrent/atlantis-ccu.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/clk/tenstorrent/atlantis-ccu.c:832:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     832 |         kfree(to_atlantis_ccu_adev(adev));
         |         ^
>> drivers/clk/tenstorrent/atlantis-ccu.c:852:10: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     852 |         cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
         |                 ^
>> drivers/clk/tenstorrent/atlantis-ccu.c:852:8: error: incompatible integer to pointer conversion assigning to 'struct atlantis_ccu_adev *' from 'int' [-Wint-conversion]
     852 |         cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:877:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     877 |         kfree(cadev);
         |         ^
   1 warning and 4 errors generated.


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
