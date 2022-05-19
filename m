Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B430BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6izVUkfgTfdBlZ9yAg5m2VIpCpgU7KCvd7Sfui9kT0k=; b=N3Gp0u6MrY9mgO
	vhR0ZJwOlzq6ceZeG/8vO/mgSvMDyuUi5TDIVz8h+6yTa3qeqflElpYAK+eRE4RgSfQn++v0yDums
	xSsYd2JZorl+lQp2k4ogj7TfPnsehuxYwaUC+7AxsZhCtPnXjyzOWzCBw1BjhfzFkR2JBSx4qcpz4
	7EUY6Qs8RWdHT+78sG7q2SteQ4uPycamlHrqdit+5S5VQnh8IGjMOZWuBGULv4HlEfwoHueNwm8gg
	Jm9PmsPPrLAXJMJz8ZS2g5lK8tQ3hq0ZUZzHIrNH8YGJaiH4efaZnn42EOcgF9ySemLzYovyAxpUR
	FKJSYiqnbcIaHDZBAGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrcrs-006CKR-1w; Thu, 19 May 2022 09:54:52 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrcrp-006CJx-Bu
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 09:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652954089; x=1684490089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ianvgrjB2LA6T5h0+CpKIBJrfBMf6ztwJ6Wy3WIhev4=;
 b=g4RiXR/9ch/rlV7p3XKCCI+NB5w1W0IBhBN6h9FuhoC4X0eRPMCJxcoH
 qH8enfWpZiVZBYKZBNf8YbWrbBJ5Bh6LwxCCeNInY+TjnYeC46j7h34T4
 rxjGhdeQ4+M42pVGPRZFotXO3xoqPWV75ZKP92qNV98yRXkg719pImyVz
 kLAtsM0K+k7j59i/8r2wx1T+aWoca296TqSQcgGPyhP+/PyGJTMPG7x4p
 9vobAyLcmw9W9syQbfnJ17XlzbryfhnY5MDTDwuart+6E5Ri5cN2IYnL1
 YKiGtPFywYG9M4u9cQ8CR4kyvTWkV6ZIBW/htSaZSg6mB0q6SJEeVh1c7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="252641000"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="252641000"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="524012201"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 19 May 2022 02:54:44 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrcrj-0003Nh-Fx;
 Thu, 19 May 2022 09:54:43 +0000
Date: Thu, 19 May 2022 17:53:56 +0800
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
Message-ID: <202205191755.tvTer2iD-lkp@intel.com>
References: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_025449_457274_91972F7F 
X-CRM114-Status: GOOD (  14.79  )
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on linusw-gpio/for-next v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/gpio-sifive-Make-the-irqchip-immutable/20220518-224530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 210e04ff768142b96452030c4c2627512b30ad95
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220519/202205191755.tvTer2iD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3db66356e9f7309998a9172feeb84d8b226ad539
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/gpio-sifive-Make-the-irqchip-immutable/20220518-224530
        git checkout 3db66356e9f7309998a9172feeb84d8b226ad539
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-sifive.c:151:27: error: 'IRQCHIP_IMMUTABLE' undeclared here (not in a function); did you mean 'IS_IMMUTABLE'?
     151 |         .flags          = IRQCHIP_IMMUTABLE,
         |                           ^~~~~~~~~~~~~~~~~
         |                           IS_IMMUTABLE
   drivers/gpio/gpio-sifive.c:152:9: error: 'GPIOCHIP_IRQ_RESOURCE_HELPERS' undeclared here (not in a function)
     152 |         GPIOCHIP_IRQ_RESOURCE_HELPERS,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-sifive.c:152:9: warning: excess elements in struct initializer
   drivers/gpio/gpio-sifive.c:152:9: note: (near initialization for 'sifive_gpio_irqchip')
   drivers/gpio/gpio-sifive.c: In function 'sifive_gpio_probe':
   drivers/gpio/gpio-sifive.c:249:9: error: implicit declaration of function 'gpio_irq_chip_set_chip' [-Werror=implicit-function-declaration]
     249 |         gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +152 drivers/gpio/gpio-sifive.c

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
   151		.flags		= IRQCHIP_IMMUTABLE,
 > 152		GPIOCHIP_IRQ_RESOURCE_HELPERS,
   153	};
   154	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
