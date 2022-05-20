Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A88BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 03:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soKOPN/2BXdfdD1EhJUiuq/HSUC8e8/6GfxFFindMH4=; b=yk2k3ocSh4IOzy
	91QkmabhNoTQbX2+y3e+UMYXD4J7I48g/T/Sd5ycml1zgyFzLOhUuqxuZu+HIKU90HX8X1KmolX8F
	hJ/5lR/xOsbuRtb4zssw42l88TmyvONHv5RUm/iTOF+fYXsZO8U++vYOf6dngbf9B18WnZXuaF9e4
	VHydKsxLYBTE1IPTfwsUOmYN0xzbvAviKlbv3MjxOQODZD8ngRFYpmMZ/zgzL2/392z+fr5AwHy54
	oOJxZ6V2uO8musis2Vl9VUuEWbUrNSRFoX0j7FhjtNGjloYCIEtf50UhYvn/aDCsJpH94P2Z2io67
	0kYkJI9GmmsM84VAz2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrtK3-00AIhk-Uu; Fri, 20 May 2022 03:29:03 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrtK0-00AIgn-K1
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 03:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653017340; x=1684553340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bwtmELOb6mYHFvOqw/JuCovmhmbf6QCAoAqaOXD1uJo=;
 b=DxtWTVUfGgWznESiAx15hW/tWwlzTBRNTXo1wr5sGTjAqwYWw44MPJt2
 CqGMR95pvgUUyLNaqrM5hbzSgf95QtgCnmt5uCkiF25KOIE2DNkuzwj2w
 aI6KrEjPOLro4Mva7AyUKOPwGKnzVHeBA7U0Ke9VkIotcWtOpz17UWMyh
 Lf+c4VutaMAFYXHKXZ9UqI+HzBEbzKxOsMb8qUzOUMFV8lJguxtJYCP8v
 DtnDwn+dYhmFc48FyC5c/HHY5P2LsUVrMB3xRmRaSj1UbDZPerf3Rse6i
 thne4zOdluBLr+7OdcQhGKRnfwrCfnfxdApofyoE73ChI2x+GuDxqziZe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="254522752"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="254522752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 20:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="674411271"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 19 May 2022 20:28:53 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrtJt-0004Eh-3v;
 Fri, 20 May 2022 03:28:53 +0000
Date: Fri, 20 May 2022 11:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>
Cc: kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] gpio: sifive: Make the irqchip immutable
Message-ID: <202205201122.xuM6bWUt-lkp@intel.com>
References: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_202900_775926_EA8D5E76 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on linusw-gpio/for-next v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/gpio-sifive-Make-the-irqchip-immutable/20220518-224530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 210e04ff768142b96452030c4c2627512b30ad95
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220520/202205201122.xuM6bWUt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3db66356e9f7309998a9172feeb84d8b226ad539
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/gpio-sifive-Make-the-irqchip-immutable/20220518-224530
        git checkout 3db66356e9f7309998a9172feeb84d8b226ad539
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-sifive.c:151:27: error: 'IRQCHIP_IMMUTABLE' undeclared here (not in a function); did you mean 'IS_IMMUTABLE'?
     151 |         .flags          = IRQCHIP_IMMUTABLE,
         |                           ^~~~~~~~~~~~~~~~~
         |                           IS_IMMUTABLE
>> drivers/gpio/gpio-sifive.c:152:9: error: 'GPIOCHIP_IRQ_RESOURCE_HELPERS' undeclared here (not in a function)
     152 |         GPIOCHIP_IRQ_RESOURCE_HELPERS,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sifive.c:152:9: warning: excess elements in struct initializer
   drivers/gpio/gpio-sifive.c:152:9: note: (near initialization for 'sifive_gpio_irqchip')
   drivers/gpio/gpio-sifive.c: In function 'sifive_gpio_probe':
>> drivers/gpio/gpio-sifive.c:249:9: error: implicit declaration of function 'gpio_irq_chip_set_chip' [-Werror=implicit-function-declaration]
     249 |         gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +151 drivers/gpio/gpio-sifive.c

   141	
   142	static const struct irq_chip sifive_gpio_irqchip = {
   143		.name		= "sifive-gpio",
   144		.irq_set_type	= sifive_gpio_irq_set_type,
   145		.irq_mask	= irq_chip_mask_parent,
   146		.irq_unmask	= irq_chip_unmask_parent,
   147		.irq_enable	= sifive_gpio_irq_enable,
   148		.irq_disable	= sifive_gpio_irq_disable,
   149		.irq_eoi	= sifive_gpio_irq_eoi,
   150		.irq_set_affinity = sifive_gpio_irq_set_affinity,
 > 151		.flags		= IRQCHIP_IMMUTABLE,
 > 152		GPIOCHIP_IRQ_RESOURCE_HELPERS,
   153	};
   154	
   155	static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
   156						     unsigned int child,
   157						     unsigned int child_type,
   158						     unsigned int *parent,
   159						     unsigned int *parent_type)
   160	{
   161		struct sifive_gpio *chip = gpiochip_get_data(gc);
   162		struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);
   163	
   164		*parent_type = IRQ_TYPE_NONE;
   165		*parent = irqd_to_hwirq(d);
   166	
   167		return 0;
   168	}
   169	
   170	static const struct regmap_config sifive_gpio_regmap_config = {
   171		.reg_bits = 32,
   172		.reg_stride = 4,
   173		.val_bits = 32,
   174		.fast_io = true,
   175		.disable_locking = true,
   176	};
   177	
   178	static int sifive_gpio_probe(struct platform_device *pdev)
   179	{
   180		struct device *dev = &pdev->dev;
   181		struct device_node *node = pdev->dev.of_node;
   182		struct device_node *irq_parent;
   183		struct irq_domain *parent;
   184		struct gpio_irq_chip *girq;
   185		struct sifive_gpio *chip;
   186		int ret, ngpio, i;
   187	
   188		chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
   189		if (!chip)
   190			return -ENOMEM;
   191	
   192		chip->base = devm_platform_ioremap_resource(pdev, 0);
   193		if (IS_ERR(chip->base)) {
   194			dev_err(dev, "failed to allocate device memory\n");
   195			return PTR_ERR(chip->base);
   196		}
   197	
   198		chip->regs = devm_regmap_init_mmio(dev, chip->base,
   199						   &sifive_gpio_regmap_config);
   200		if (IS_ERR(chip->regs))
   201			return PTR_ERR(chip->regs);
   202	
   203		ngpio = of_irq_count(node);
   204		if (ngpio > SIFIVE_GPIO_MAX) {
   205			dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
   206				SIFIVE_GPIO_MAX);
   207			return -ENXIO;
   208		}
   209	
   210		irq_parent = of_irq_find_parent(node);
   211		if (!irq_parent) {
   212			dev_err(dev, "no IRQ parent node\n");
   213			return -ENODEV;
   214		}
   215		parent = irq_find_host(irq_parent);
   216		if (!parent) {
   217			dev_err(dev, "no IRQ parent domain\n");
   218			return -ENODEV;
   219		}
   220	
   221		for (i = 0; i < ngpio; i++)
   222			chip->irq_number[i] = platform_get_irq(pdev, i);
   223	
   224		ret = bgpio_init(&chip->gc, dev, 4,
   225				 chip->base + SIFIVE_GPIO_INPUT_VAL,
   226				 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
   227				 NULL,
   228				 chip->base + SIFIVE_GPIO_OUTPUT_EN,
   229				 chip->base + SIFIVE_GPIO_INPUT_EN,
   230				 BGPIOF_READ_OUTPUT_REG_SET);
   231		if (ret) {
   232			dev_err(dev, "unable to init generic GPIO\n");
   233			return ret;
   234		}
   235	
   236		/* Disable all GPIO interrupts before enabling parent interrupts */
   237		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IE, 0);
   238		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IE, 0);
   239		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IE, 0);
   240		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
   241		chip->irq_state = 0;
   242	
   243		chip->gc.base = -1;
   244		chip->gc.ngpio = ngpio;
   245		chip->gc.label = dev_name(dev);
   246		chip->gc.parent = dev;
   247		chip->gc.owner = THIS_MODULE;
   248		girq = &chip->gc.irq;
 > 249		gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
   250		girq->fwnode = of_node_to_fwnode(node);
   251		girq->parent_domain = parent;
   252		girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
   253		girq->handler = handle_bad_irq;
   254		girq->default_type = IRQ_TYPE_NONE;
   255	
   256		platform_set_drvdata(pdev, chip);
   257		return gpiochip_add_data(&chip->gc, chip);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
