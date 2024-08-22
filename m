Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16AFC5320E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaTxQiN4Ni/m+fri9QQvkLYulSX3rHxC+M6o1aLHKr8=; b=n45/HzWUE/F9y4
	bSx26cwW270TcCEOqnenPZ2BwJ3D4e8euWcmseF4DhblaP3AJqzYidBFMuqPFE/EbaPISU2SZ/whp
	5AbOEY9BfOEWuNW6ohS9YSq9xGBJjNs7DRxWwUuehCtmWiMCTmnNZY01iqIO9e78oxDFhNIKHhXhP
	Lc+ihGGrWCdZ5sPi41kEL1x5l99nGYVcxguiZ9Y+jSDA0ZTpBwFiRIH4XHvgUcyA9s4V8iFeX3LQz
	/c1O3TqaJvacNIqbtbblIqDGauj8q/qcRmnJoZA6IZzs9zh31ZQLLZWC07S5vNeOa7+ILJ4SFqLN6
	EwZioyM0AWt4a4qW42Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shFUa-0000000ENQt-0lJV;
	Thu, 22 Aug 2024 21:37:16 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shFUW-0000000ENOs-2FCS
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 21:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724362632; x=1755898632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icQnrCzDD/QHiymbI340Kuyyn1Ca7Gddfa0MRaGXDZI=;
  b=av4EWQs/w3SjVDEmky8tEjFaARA+/d2xA4mjiTGB12fUgMKG9oKiAE5W
   D1IRdhZFYQXd88L7LtMEYWNcsWYhHxXPlTwNOVA7JbrYuzX5PAo0PC+l1
   ZViEgCbF0G4aTAg1o3XnFX94fqHeXnGOPcfaFb4jni6+CxbWOVDgaR0cg
   nmOu3Qxjjq5MD7oTa7bbYMbOS/Rs/YU6beEdyfceQphd9k3rV9gzZnZkM
   DZDilrLVZhEYCkI+/S/CAJMpNgKuoAWEmYt7Rst/HtF4YFijiLTlGD5zF
   1aEjn2Xhj8xvQbCg8DnzTsqwL3nKRHQpvcvngKPtnZPwjb48GkGeYbvVt
   Q==;
X-CSE-ConnectionGUID: qSL7NQZqQ7C0IzzI8O/MNg==
X-CSE-MsgGUID: JX8f5ZtfTxidAdo479ShxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22973255"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="22973255"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 14:37:07 -0700
X-CSE-ConnectionGUID: 2ffUV8QAQHuprfxMizfYwQ==
X-CSE-MsgGUID: RQy+U63LR4mpzcCdL5sW/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="66487955"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Aug 2024 14:37:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shFUM-000DD6-0d;
	Thu, 22 Aug 2024 21:37:02 +0000
Date: Fri, 23 Aug 2024 05:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yue Haibing <yuehaibing@huawei.com>, anup@brainfault.org,
	tglx@linutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, ruanjinjie@huawei.com, bjorn@rivosinc.com
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, yuehaibing@huawei.com
Subject: Re: [PATCH -next] irqchip/riscv-aplic: Fix NULL vs IS_ERR() bug
Message-ID: <202408230558.er4j09Nd-lkp@intel.com>
References: <20240820132857.247679-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820132857.247679-1-yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_143712_696086_6ACE340A 
X-CRM114-Status: GOOD (  11.89  )
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

Hi Yue,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240820]

url:    https://github.com/intel-lab-lkp/linux/commits/Yue-Haibing/irqchip-riscv-aplic-Fix-NULL-vs-IS_ERR-bug/20240820-213521
base:   next-20240820
patch link:    https://lore.kernel.org/r/20240820132857.247679-1-yuehaibing%40huawei.com
patch subject: [PATCH -next] irqchip/riscv-aplic: Fix NULL vs IS_ERR() bug
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240823/202408230558.er4j09Nd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230558.er4j09Nd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230558.er4j09Nd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-aplic-main.c: In function 'aplic_probe':
>> drivers/irqchip/irq-riscv-aplic-main.c:178:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     178 |         if (IS_ERR(regs))
         |         ^~
   drivers/irqchip/irq-riscv-aplic-main.c:180:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     180 |                 return PTR_ERR(regs);
         |                 ^~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:174:13: warning: unused variable 'rc' [-Wunused-variable]
     174 |         int rc;
         |             ^~
>> drivers/irqchip/irq-riscv-aplic-main.c:172:14: warning: unused variable 'msi_mode' [-Wunused-variable]
     172 |         bool msi_mode = false;
         |              ^~~~~~~~
   drivers/irqchip/irq-riscv-aplic-main.c: At top level:
>> drivers/irqchip/irq-riscv-aplic-main.c:187:9: warning: data definition has no type or storage class
     187 |         msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
         |         ^~~~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:187:9: error: type defaults to 'int' in declaration of 'msi_mode' [-Wimplicit-int]
   In file included from drivers/irqchip/irq-riscv-aplic-main.c:10:
>> include/linux/of.h:168:9: error: braced-group within expression allowed only inside a function
     168 |         ({                                                              \
         |         ^
   drivers/irqchip/irq-riscv-aplic-main.c:187:40: note: in expansion of macro 'to_of_node'
     187 |         msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
         |                                        ^~~~~~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:188:9: error: expected identifier or '(' before 'if'
     188 |         if (msi_mode)
         |         ^~
>> drivers/irqchip/irq-riscv-aplic-main.c:190:9: error: expected identifier or '(' before 'else'
     190 |         else
         |         ^~~~
   drivers/irqchip/irq-riscv-aplic-main.c:192:9: error: expected identifier or '(' before 'if'
     192 |         if (rc)
         |         ^~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/irqchip/irq-riscv-aplic-main.c:12:
>> include/linux/dev_printk.h:111:10: error: expected identifier or '(' before ')' token
     111 |         })
         |          ^
   include/linux/dev_printk.h:154:9: note: in expansion of macro 'dev_printk_index_wrap'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-aplic-main.c:193:17: note: in expansion of macro 'dev_err'
     193 |                 dev_err(dev, "failed to setup APLIC in %s mode\n", msi_mode ? "MSI" : "direct");
         |                 ^~~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:195:9: error: expected identifier or '(' before 'return'
     195 |         return rc;
         |         ^~~~~~
>> drivers/irqchip/irq-riscv-aplic-main.c:196:1: error: expected identifier or '(' before '}' token
     196 | }
         | ^


vim +187 drivers/irqchip/irq-riscv-aplic-main.c

2333df5ae51ead Anup Patel  2024-03-07  168  
2333df5ae51ead Anup Patel  2024-03-07  169  static int aplic_probe(struct platform_device *pdev)
2333df5ae51ead Anup Patel  2024-03-07  170  {
2333df5ae51ead Anup Patel  2024-03-07  171  	struct device *dev = &pdev->dev;
2333df5ae51ead Anup Patel  2024-03-07 @172  	bool msi_mode = false;
2333df5ae51ead Anup Patel  2024-03-07  173  	void __iomem *regs;
2333df5ae51ead Anup Patel  2024-03-07 @174  	int rc;
2333df5ae51ead Anup Patel  2024-03-07  175  
2333df5ae51ead Anup Patel  2024-03-07  176  	/* Map the MMIO registers */
2333df5ae51ead Anup Patel  2024-03-07  177  	regs = devm_platform_ioremap_resource(pdev, 0);
bb109b384dab1e Yue Haibing 2024-08-20 @178  	if (IS_ERR(regs))
2333df5ae51ead Anup Patel  2024-03-07  179  		dev_err(dev, "failed map MMIO registers\n");
bb109b384dab1e Yue Haibing 2024-08-20  180  		return PTR_ERR(regs);
2333df5ae51ead Anup Patel  2024-03-07  181  	}
2333df5ae51ead Anup Patel  2024-03-07  182  
2333df5ae51ead Anup Patel  2024-03-07  183  	/*
2333df5ae51ead Anup Patel  2024-03-07  184  	 * If msi-parent property is present then setup APLIC MSI
2333df5ae51ead Anup Patel  2024-03-07  185  	 * mode otherwise setup APLIC direct mode.
2333df5ae51ead Anup Patel  2024-03-07  186  	 */
2333df5ae51ead Anup Patel  2024-03-07 @187  	msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
2333df5ae51ead Anup Patel  2024-03-07 @188  	if (msi_mode)
ca8df97fe6798a Anup Patel  2024-03-07  189  		rc = aplic_msi_setup(dev, regs);
2333df5ae51ead Anup Patel  2024-03-07 @190  	else
2333df5ae51ead Anup Patel  2024-03-07  191  		rc = aplic_direct_setup(dev, regs);
2333df5ae51ead Anup Patel  2024-03-07  192  	if (rc)
2333df5ae51ead Anup Patel  2024-03-07  193  		dev_err(dev, "failed to setup APLIC in %s mode\n", msi_mode ? "MSI" : "direct");
2333df5ae51ead Anup Patel  2024-03-07  194  
2333df5ae51ead Anup Patel  2024-03-07 @195  	return rc;
2333df5ae51ead Anup Patel  2024-03-07 @196  }
2333df5ae51ead Anup Patel  2024-03-07  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
