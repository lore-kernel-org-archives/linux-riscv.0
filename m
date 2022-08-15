Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD92C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7iuuiZEV3u3suKnp+FfOff1wyTksVGjWgoMdAGbLeg=; b=DhMT9Gk7nFb8vU
	gD6qdQoGXKOYZJL29NtoVyZZl+itELScptpWgW4jys0tBHUjAUSBqg619ELQFysjrvTjeNmClZDVL
	UykZZ33HWI4Bm76h8IGTNww5W3j/obmikZleiKZJqzaLGV8fo+1m1kVe8ckJLicRnWZkx1HJF8vX0
	f1bzJ/GjMxC8VZBFOysqu8cwl76bKW1KaUQAzz5gRKy6qgktF1S1ABO1BVikg8mM7cOXrLPVAi3Lt
	QV2BaKTI3hRlDZk6xsQsVswGTs72yHV781/ppy1rjbs3UGvoPAJUlWlWzv92YPOjcIAZn3v6f0MGV
	RrPYFvb4Yt+DR8cTrldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNYWP-00Fb6E-Vm; Mon, 15 Aug 2022 11:44:42 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNYSY-00FXqh-SW
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 11:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660563642; x=1692099642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E+o2e7xDZrWkCt8WFcYoOrHP5fqayr1RiDjBJDwgBxM=;
  b=B2dStp559PoQwYKYovI+NbjYiFjufTmVSfNJeDido0qWEClSGgfQ+OEa
   jh1OOII9CoIUA6XDLAveWhW91aLJ/sYJ4Eq2RPPlpGXke/HdS6RYm+TKs
   BCQOEFs90te+vSfgkBDJpx0JJiKJQaaKw1dtp7SwaW3rvv6G796aU0tQ+
   UgJVeA9cgJwJiAJbALVtERfEKPG//EdEmFpaKYo4O1+9a02mSzoFgQtyY
   sm+/ES44ihQ5jnzrwhP7ctXzvWkRSFyfN0sFiSAL1Abr0DDScE42uxoON
   XsPWnKIAn+dEkYORaaMsCbdN4SKZFzl2LHNmOY9xlkKnc5b3c9iwjwZAB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="292736902"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="292736902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 04:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="582850048"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Aug 2022 04:40:33 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNYSO-0000yb-1o;
	Mon, 15 Aug 2022 11:40:32 +0000
Date: Mon, 15 Aug 2022 19:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: lewis.hanly@microchip.com, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
	maz@kernel.org
Cc: kbuild-all@lists.01.org, conor.dooley@microchip.com,
	daire.mcnamara@microchip.com, lewis.hanly@microchip.com
Subject: Re: [PATCH v5 1/1] gpio: mpfs: add polarfire soc gpio support
Message-ID: <202208151906.8v7FxH3X-lkp@intel.com>
References: <20220815070606.1298421-2-lewis.hanly@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815070606.1298421-2-lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_044043_165710_549D251C 
X-CRM114-Status: GOOD (  15.97  )
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.0-rc1 next-20220815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lewis-hanly-microchip-com/Add-Polarfire-SoC-GPIO-support/20220815-150808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220815/202208151906.8v7FxH3X-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0458963d9f39d68b20ed88e71d20ca69d835e7fe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review lewis-hanly-microchip-com/Add-Polarfire-SoC-GPIO-support/20220815-150808
        git checkout 0458963d9f39d68b20ed88e71d20ca69d835e7fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_irq_handler':
   drivers/gpio/gpio-mpfs.c:203:9: error: 'unisgned' undeclared (first use in this function)
     203 |         unisgned long status;
         |         ^~~~~~~~
   drivers/gpio/gpio-mpfs.c:203:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpio/gpio-mpfs.c:203:17: error: expected ';' before 'long'
     203 |         unisgned long status;
         |                 ^~~~~
         |                 ;
>> drivers/gpio/gpio-mpfs.c:204:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     204 |         int offset;
         |         ^~~
   drivers/gpio/gpio-mpfs.c:208:9: error: 'status' undeclared (first use in this function); did you mean 'kstatfs'?
     208 |         status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
         |         ^~~~~~
         |         kstatfs
   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_probe':
   drivers/gpio/gpio-mpfs.c:268:19: error: 'struct irq_chip' has no member named 'parent_device'
     268 |         girq->chip->parent_device = dev;
         |                   ^~


vim +204 drivers/gpio/gpio-mpfs.c

   197	
   198	static void mpfs_gpio_irq_handler(struct irq_desc *desc)
   199	{
   200		struct irq_chip *irqchip = irq_desc_get_chip(desc);
   201		struct mpfs_gpio_chip *mpfs_gpio =
   202			gpiochip_get_data(irq_desc_get_handler_data(desc));
 > 203		unisgned long status;
 > 204		int offset;
   205	
   206		chained_irq_enter(irqchip, desc);
   207	
   208		status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
   209		for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
   210			mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
   211			generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, offset));
   212		}
   213	
   214		chained_irq_exit(irqchip, desc);
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
