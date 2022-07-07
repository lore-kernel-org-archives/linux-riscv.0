Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD4C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 04:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foUYAbdU1mlhyFf4w8+0BPiTacWYJW5LpB1mIUA2hiM=; b=UZPByTEDtN45C5
	2f5keBnQD663G2onJCzWtPeADieyen+clToeS49FitVNKVklqSmxfwy1ZmOCHWfe9sJUN5Z8QEVlu
	NYJgoHD/tmzQ4L9l3YAYkGeF3R1EUxRGLxD7T5kj6/qc5NTC+mTNl5tb0vdnrzxJk38sIlfMcgF4p
	girYhw+qlA4cg4ha34EBqhyBx1Z7Snm+ZKpcRkse392NlQ3rddMBFQUEscWr9eayKu3zAQd9f++Gk
	2foKDlXZTu8at9t2sZ/29h3UAaMcqwxSOul1+WFuh6DvJDJWRJR4EV9NlXoiWMinNkdJhCYR04es/
	zgpGENLH6Zip364ZjKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9JQJ-00DY2D-UW; Thu, 07 Jul 2022 04:47:31 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9JQG-00DXy3-SM
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 04:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657169248; x=1688705248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KPHeN1M2tikU2dR02upVUOR2LHepqS/qsCyrD3NSLx0=;
  b=LqdsjJk9WGFLQLzW/gtrzQlWQ4dOrPizJRd3aRBD+wPiewT7hQWN0AOU
   AoftJ7TAORquT8/g0kqH9S13NRLenep+l7TkUC5hR2OMKHCkizpX6XPqN
   241Nhj4r3760SQVjO8m18tL3cEW9Kgjt1+ZlzzsBPn1fbuSEowD0LUo3+
   h1CTfUCrlHIDI9np+55Hddl+uTVdFEQ4PU0dEGVgsCWmGoLflANanLPry
   a+FhWJBWjmk1YssyrX6VbCW9kXLmTVHnTShGkigWtiLaEAO1Wn+6uLmJm
   o1YORIDUk0HFcQAy58bCw6buRxbHctjpt8VUIYCflSFbzoCN0g/9ZjQEo
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="370246824"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="370246824"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 21:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="568356991"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 21:47:23 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9JQA-000LYg-Hb;
	Thu, 07 Jul 2022 04:47:22 +0000
Date: Thu, 7 Jul 2022 12:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: lewis.hanly@microchip.com, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, maz@kernel.org
Cc: kbuild-all@lists.01.org, paul.walmsley@sifive.com,
	conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	lewis.hanly@microchip.com
Subject: Re: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Message-ID: <202207071219.0Jw0owWG-lkp@intel.com>
References: <20220705134912.2740421-2-lewis.hanly@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705134912.2740421-2-lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_214729_052118_7EA5B956 
X-CRM114-Status: GOOD (  19.66  )
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

Hi,

I love your patch! Yet something to improve:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v5.19-rc5 next-20220706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lewis-hanly-microchip-com/Add-Polarfire-SoC-GPIO-support/20220705-220421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220707/202207071219.0Jw0owWG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f1c1cf42734c00cf02babb6220f8b68a62e86d0e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review lewis-hanly-microchip-com/Add-Polarfire-SoC-GPIO-support/20220705-220421
        git checkout f1c1cf42734c00cf02babb6220f8b68a62e86d0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_probe':
>> drivers/gpio/gpio-mpfs.c:290:20: error: 'struct irq_chip' has no member named 'parent_device'
     290 |         irq_c->chip->parent_device = dev;
         |                    ^~
>> drivers/gpio/gpio-mpfs.c:310:23: error: implicit declaration of function 'devm_request_irq'; did you mean 'can_request_irq'? [-Werror=implicit-function-declaration]
     310 |                 ret = devm_request_irq(&pdev->dev, irq,
         |                       ^~~~~~~~~~~~~~~~
         |                       can_request_irq
>> drivers/gpio/gpio-mpfs.c:312:40: error: 'IRQF_SHARED' undeclared (first use in this function)
     312 |                                        IRQF_SHARED, mpfs_gpio->gc.label, mpfs_gpio);
         |                                        ^~~~~~~~~~~
   drivers/gpio/gpio-mpfs.c:312:40: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +290 drivers/gpio/gpio-mpfs.c

   240	
   241	static int mpfs_gpio_probe(struct platform_device *pdev)
   242	{
   243		struct clk *clk;
   244		struct device *dev = &pdev->dev;
   245		struct device_node *node = pdev->dev.of_node;
   246		struct mpfs_gpio_chip *mpfs_gpio;
   247		int i, ret, ngpio;
   248		struct gpio_irq_chip *irq_c;
   249	
   250		mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
   251		if (!mpfs_gpio)
   252			return -ENOMEM;
   253	
   254		mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
   255		if (IS_ERR(mpfs_gpio->base)) {
   256			dev_err(dev, "failed to allocate device memory\n");
   257			return PTR_ERR(mpfs_gpio->base);
   258		}
   259		clk = devm_clk_get(&pdev->dev, NULL);
   260		if (IS_ERR(clk))
   261			return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to get clock\n");
   262	
   263		ret = clk_prepare_enable(clk);
   264		if (ret)
   265			return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
   266	
   267		mpfs_gpio->clk = clk;
   268	
   269		spin_lock_init(&mpfs_gpio->lock);
   270	
   271		ngpio = of_irq_count(node);
   272		if (ngpio > NUM_GPIO) {
   273			dev_err(dev, "too many interrupts\n");
   274			goto cleanup_clock;
   275		}
   276	
   277		mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
   278		mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
   279		mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
   280		mpfs_gpio->gc.get = mpfs_gpio_get;
   281		mpfs_gpio->gc.set = mpfs_gpio_set;
   282		mpfs_gpio->gc.base = -1;
   283		mpfs_gpio->gc.ngpio = ngpio;
   284		mpfs_gpio->gc.label = dev_name(dev);
   285		mpfs_gpio->gc.parent = dev;
   286		mpfs_gpio->gc.owner = THIS_MODULE;
   287	
   288		irq_c = &mpfs_gpio->gc.irq;
   289		irq_c->chip = &mpfs_gpio_irqchip;
 > 290		irq_c->chip->parent_device = dev;
   291		irq_c->handler = handle_simple_irq;
   292	
   293		ret = devm_irq_alloc_descs(&pdev->dev, -1, 0, ngpio, 0);
   294		if (ret < 0) {
   295			dev_err(dev, "failed to allocate descs\n");
   296			goto cleanup_clock;
   297		}
   298	
   299		/*
   300		 * Setup the interrupt handlers. Interrupts can be
   301		 * direct and/or non-direct mode, based on register value:
   302		 * GPIO_INTERRUPT_FAB_CR.
   303		 */
   304		for (i = 0; i < ngpio; i++) {
   305			int irq = platform_get_irq_optional(pdev, i);
   306	
   307			if (irq < 0)
   308				continue;
   309	
 > 310			ret = devm_request_irq(&pdev->dev, irq,
   311					       mpfs_gpio_irq_handler,
 > 312					       IRQF_SHARED, mpfs_gpio->gc.label, mpfs_gpio);
   313			if (ret) {
   314				dev_err(&pdev->dev, "failed to request irq %d: %d\n",
   315					irq, ret);
   316				goto cleanup_clock;
   317			}
   318		}
   319	
   320		ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
   321		if (ret)
   322			goto cleanup_clock;
   323	
   324		platform_set_drvdata(pdev, mpfs_gpio);
   325		dev_info(dev, "Microchip MPFS GPIO registered %d GPIOs\n", ngpio);
   326	
   327		return 0;
   328	
   329	cleanup_clock:
   330		clk_disable_unprepare(mpfs_gpio->clk);
   331		return ret;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
