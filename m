Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1956C36010
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Apr 2025 00:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkuE/x3+yFBk6XNlJWW01sAjFoalAQ/yVwh5CRBoZVs=; b=AYf/ydJLvcICMy
	bjacMSKg33hnAnq19fyU2ESL4icKf9X26NCQho+JkSUIuVXankDmeDaFnK0cCBZ2OwyoqQ6Dd2HWv
	dLC8KEqOgNh/fYiZqKHtEsO+oPPttIbqygAOrp/Z7fM4fB5r1IeWrOgDAga83qagBMDrNxQmb1jEP
	6R9oM/OKZTzsBtgizSEIPIaZfWRwiDpDFsBg+Y2EC93f1J2op24GVo72NERLO1IIbDjrBxNz705wE
	jnHhU50pTGMSE7ezEQhhBCGIDbhOBJ082U2h20xk+BbEP8da9T3u1blikNPFzWxz4T4iKVz9+faAl
	4Gjmy+Ota9hw6EjYfsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1EBZ-0000000Ef3I-0zFN;
	Sun, 06 Apr 2025 00:48:29 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1EBW-0000000Ef2K-1nyy
	for linux-riscv@lists.infradead.org;
	Sun, 06 Apr 2025 00:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743900507; x=1775436507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RJrdvsw7uqqwA7zJ6qMZB+2wurHbFcb+WAtKDoSw9X4=;
  b=E4b9+ifoja0LIU0JotjEVOuRYT7trJ0sG114R/ttw35serkGHO7SVfFO
   ge5DPM2QtXuA79S2ozUw1M3xt2mlqzAo7MXQPwp4DnNN6O/XUoexu8+oa
   +iTRWeaFX/HkcmyCLsDJwNc7uzh9wOCZyeiRdvR54i+xvgfgAaenl+ZHU
   fnWuJKL64SOyLPGdmlEndxbdhAjOYiafLV/f5ddmg59eCJBmR5+rgwHkw
   575KZbD28PlMFrZQIrHKhegZkOObaGxliPXO6lihVVd2qv+xHsdgmDx6B
   iMVwL+7XARTH21oadSpEte9OxM+uhvxPxVZDtOXo5fNcUYLcvYg7sLTPA
   A==;
X-CSE-ConnectionGUID: zDQo54roRvOU09F4OxWLTg==
X-CSE-MsgGUID: oN3v1/nVRkip5inPYFtl6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45199376"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="45199376"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 17:48:20 -0700
X-CSE-ConnectionGUID: LR/a94YdQj6cF0zO347ilQ==
X-CSE-MsgGUID: SNZ8YTh2SNyTuVKI89Ubxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="127499625"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Apr 2025 17:48:16 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1EBJ-0002NJ-1k;
	Sun, 06 Apr 2025 00:48:13 +0000
Date: Sun, 6 Apr 2025 08:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ryo Takakura <ryotkkr98@gmail.com>, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pmladek@suse.com,
	samuel.holland@sifive.com, u.kleine-koenig@baylibre.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: Re: [PATCH v2] serial: sifive: Switch to nbcon console
Message-ID: <202504060816.EWk91sJS-lkp@intel.com>
References: <20250405145915.493173-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250405145915.493173-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_174826_509115_C8EBFD93 
X-CRM114-Status: GOOD (  10.89  )
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

Hi Ryo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryo-Takakura/serial-sifive-Switch-to-nbcon-console/20250405-230051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250405145915.493173-1-ryotkkr98%40gmail.com
patch subject: [PATCH v2] serial: sifive: Switch to nbcon console
config: arm-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060816.EWk91sJS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060816.EWk91sJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060816.EWk91sJS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/sifive.c:155: warning: Function parameter or struct member 'console_line_ended' not described in 'sifive_serial_port'


vim +155 drivers/tty/serial/sifive.c

45c054d0815b15 Paul Walmsley 2019-04-12  131  
45c054d0815b15 Paul Walmsley 2019-04-12  132  /*
45c054d0815b15 Paul Walmsley 2019-04-12  133   *
45c054d0815b15 Paul Walmsley 2019-04-12  134   */
45c054d0815b15 Paul Walmsley 2019-04-12  135  
45c054d0815b15 Paul Walmsley 2019-04-12  136  /**
180bb243de730c Lee Jones     2020-11-04  137   * struct sifive_serial_port - driver-specific data extension to struct uart_port
45c054d0815b15 Paul Walmsley 2019-04-12  138   * @port: struct uart_port embedded in this struct
45c054d0815b15 Paul Walmsley 2019-04-12  139   * @dev: struct device *
45c054d0815b15 Paul Walmsley 2019-04-12  140   * @ier: shadowed copy of the interrupt enable register
45c054d0815b15 Paul Walmsley 2019-04-12  141   * @baud_rate: UART serial line rate (e.g., 115200 baud)
180bb243de730c Lee Jones     2020-11-04  142   * @clk: reference to this device's clock
45c054d0815b15 Paul Walmsley 2019-04-12  143   * @clk_notifier: clock rate change notifier for upstream clock changes
45c054d0815b15 Paul Walmsley 2019-04-12  144   *
45c054d0815b15 Paul Walmsley 2019-04-12  145   * Configuration data specific to this SiFive UART.
45c054d0815b15 Paul Walmsley 2019-04-12  146   */
45c054d0815b15 Paul Walmsley 2019-04-12  147  struct sifive_serial_port {
45c054d0815b15 Paul Walmsley 2019-04-12  148  	struct uart_port	port;
45c054d0815b15 Paul Walmsley 2019-04-12  149  	struct device		*dev;
45c054d0815b15 Paul Walmsley 2019-04-12  150  	unsigned char		ier;
45c054d0815b15 Paul Walmsley 2019-04-12  151  	unsigned long		baud_rate;
45c054d0815b15 Paul Walmsley 2019-04-12  152  	struct clk		*clk;
45c054d0815b15 Paul Walmsley 2019-04-12  153  	struct notifier_block	clk_notifier;
328ee9dbff3941 Ryo Takakura  2025-04-05  154  	bool			console_line_ended;
45c054d0815b15 Paul Walmsley 2019-04-12 @155  };
45c054d0815b15 Paul Walmsley 2019-04-12  156  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
