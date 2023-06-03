Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122A9C7EE24
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOi1uhfhIOgL6xFZjl+2gclYQocxTT650aGWHRCBGiQ=; b=VDGjTsg4w6ZBEP
	rOPmE6URaKOuspFynZ1+nZr02UfQEW0cc6B/WsNhvUsuaokKeqTX+0oVP0tWplaw2Ism+D3fhNpMv
	fRQWy5C80vJZEstmDM63PU2vW3bVn+KRYh3LiKarDuunTLF7KJYXvNabZ3vEj8t4/GwesDOe+pZ0h
	JnPWNgKTH21SIcCZgDSqLKWSPDnq/J5MaS49/v2oJ9tFMzEKFsDbkJ/YEwbcBQF1t3WmC3R963vXN
	c7Oz0AHb/o8E1OND9k2GooNhLjASExAwyMM7YYcQF9uYcutEBA0amhsxog4uEyVcUAvnwuYzpPRR2
	joC/J8R70nenK9ju3jNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5VN9-00AFDV-0O;
	Sat, 03 Jun 2023 17:49:03 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5VN2-00AFBs-3C
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 17:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685814536; x=1717350536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GFg7AW6jCtnAXjw+8qg5r6EgwDiKi2rSwpOiz19TbiM=;
  b=W4ELd522NbQ+i51ITTzvuc9RoFns2Z/l1/AoTvWOuhTXutB//XGvNgKK
   RC/LiCF2AVzZQTjO6qsuxP2+Vn/w0pvSQGpo5IN6tUHU1MgYpJalyVBv9
   +1TIYZGsAW3DD1kA4aYtwIW9gum+qWqn7FncC7UDzHlyyh9N6sk1mvoZz
   I26g9PXP+GdPUGXqICYN4XXk9rPbw/ea7k+CLzgKoqlnbCC9jpvWoSjw2
   fuls1V9KQlygR5kohnw1CqdTqRtuzv85EtOQraXeIGNiCcmlcXCcisC83
   qiYDTUxFPN93Ds4ewLJEdUUGenEPTm06Zg5vDPNvJEk7LScmiBuLg6Y+Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="353589899"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="353589899"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 10:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="778061812"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="778061812"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2023 10:48:46 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5VMr-0001rV-1p;
	Sat, 03 Jun 2023 17:48:45 +0000
Date: Sun, 4 Jun 2023 01:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, andy.shevchenko@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] gpio: sifive: Add missing check for platform_get_irq
Message-ID: <202306040153.RPAlkz3U-lkp@intel.com>
References: <20230602072755.7314-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230602072755.7314-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_104857_077725_60B8E1D0 
X-CRM114-Status: GOOD (  13.34  )
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

Hi Jiasheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.4-rc4 next-20230602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiasheng-Jiang/gpio-sifive-Add-missing-check-for-platform_get_irq/20230602-152856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20230602072755.7314-1-jiasheng%40iscas.ac.cn
patch subject: [PATCH v2] gpio: sifive: Add missing check for platform_get_irq
config: openrisc-randconfig-m041-20230531 (https://download.01.org/0day-ci/archive/20230604/202306040153.RPAlkz3U-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306040153.RPAlkz3U-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-sifive.c:226 sifive_gpio_probe() warn: unsigned 'chip->irq_number[i]' is never less than zero.

vim +226 drivers/gpio/gpio-sifive.c

   179	
   180	static int sifive_gpio_probe(struct platform_device *pdev)
   181	{
   182		struct device *dev = &pdev->dev;
   183		struct device_node *node = pdev->dev.of_node;
   184		struct device_node *irq_parent;
   185		struct irq_domain *parent;
   186		struct gpio_irq_chip *girq;
   187		struct sifive_gpio *chip;
   188		int ret, ngpio, i;
   189	
   190		chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
   191		if (!chip)
   192			return -ENOMEM;
   193	
   194		chip->base = devm_platform_ioremap_resource(pdev, 0);
   195		if (IS_ERR(chip->base)) {
   196			dev_err(dev, "failed to allocate device memory\n");
   197			return PTR_ERR(chip->base);
   198		}
   199	
   200		chip->regs = devm_regmap_init_mmio(dev, chip->base,
   201						   &sifive_gpio_regmap_config);
   202		if (IS_ERR(chip->regs))
   203			return PTR_ERR(chip->regs);
   204	
   205		ngpio = of_irq_count(node);
   206		if (ngpio > SIFIVE_GPIO_MAX) {
   207			dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
   208				SIFIVE_GPIO_MAX);
   209			return -ENXIO;
   210		}
   211	
   212		irq_parent = of_irq_find_parent(node);
   213		if (!irq_parent) {
   214			dev_err(dev, "no IRQ parent node\n");
   215			return -ENODEV;
   216		}
   217		parent = irq_find_host(irq_parent);
   218		of_node_put(irq_parent);
   219		if (!parent) {
   220			dev_err(dev, "no IRQ parent domain\n");
   221			return -ENODEV;
   222		}
   223	
   224		for (i = 0; i < ngpio; i++) {
   225			chip->irq_number[i] = platform_get_irq(pdev, i);
 > 226			if (chip->irq_number[i] < 0)
   227				return chip->irq_number[i];
   228		}
   229	
   230		ret = bgpio_init(&chip->gc, dev, 4,
   231				 chip->base + SIFIVE_GPIO_INPUT_VAL,
   232				 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
   233				 NULL,
   234				 chip->base + SIFIVE_GPIO_OUTPUT_EN,
   235				 chip->base + SIFIVE_GPIO_INPUT_EN,
   236				 BGPIOF_READ_OUTPUT_REG_SET);
   237		if (ret) {
   238			dev_err(dev, "unable to init generic GPIO\n");
   239			return ret;
   240		}
   241	
   242		/* Disable all GPIO interrupts before enabling parent interrupts */
   243		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IE, 0);
   244		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IE, 0);
   245		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IE, 0);
   246		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
   247		chip->irq_state = 0;
   248	
   249		chip->gc.base = -1;
   250		chip->gc.ngpio = ngpio;
   251		chip->gc.label = dev_name(dev);
   252		chip->gc.parent = dev;
   253		chip->gc.owner = THIS_MODULE;
   254		girq = &chip->gc.irq;
   255		gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
   256		girq->fwnode = of_node_to_fwnode(node);
   257		girq->parent_domain = parent;
   258		girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
   259		girq->handler = handle_bad_irq;
   260		girq->default_type = IRQ_TYPE_NONE;
   261	
   262		platform_set_drvdata(pdev, chip);
   263		return gpiochip_add_data(&chip->gc, chip);
   264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
