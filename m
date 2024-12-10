Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77E9E7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 18:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iTh+FmW6pxUyScSYKTjT24XH/DUlgcrNWkNcr1IByk=; b=k/68h61cagPyhU
	7HnwU5iPU/8HeOba0Ggo/BK1u092ymn5XAwk76u79+G6hBKcplQJHDpMU1xjBnl6i7LyEi3VicPrQ
	abioZ+NNLlS9y7wsBA7PCzJSkakNf66peogYfHQeO0TV2oFPTPGDI4BesUBBcrikvBO3MbgNuaEwX
	G3KQu4SXyK7eirVppSVMYjbNBPbVLR6n4ZLNsjrCH84umXrlrKHTpRyi/yrrXmv/LRq+Y1IOQAEqR
	JmWl0ZeoSHApLseOOhcDnRfTAcvpJfkhwd0ogPk+/yfHvxG3IPpvm+wLqU+dMnBZmI6fwU9n5mMwJ
	tYufh6B1fdTrHsvDQWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Ee-0000000CROI-0Sxv;
	Tue, 10 Dec 2024 18:45:28 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Ea-0000000CRNa-49dA
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 18:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733856325; x=1765392325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=olsdmyoTmIU3QYXVIY/p+lmELkDwTdQFw0IaChjqdS0=;
  b=JIG3BqeEPMOxGizDSBuXd6Dt+N6HED9eTfY9x+KgJ0387yox9r65SWhx
   NqGHT+zlm5cSAhrnA1UbobIwV5UVgGY3z4zwxLyp3br9HTC75p0+y2MXo
   HkrPa5dZLq6rTXGvcud0W0+OaGuj3ph/dESdt0s6mOdbYDXGi+AHJn3qt
   SdBlba2NI8INgrRwTPZKIWlMqDJbMiqfiSb8B4ZG+B3UuURQsFxcbvC7X
   ZdLz5nLJ52KJTMfLo08ZdyGU/cL4X0qze6XNuBDAgOnGFKA//MbopXhjh
   d8NEWqclY5ZURik5iIWbaCyzmVKXioHcHu0Ghofbgqej32M+w5AmWZ3UC
   w==;
X-CSE-ConnectionGUID: eSx1aJIQRiOhP/QcyGnuNg==
X-CSE-MsgGUID: gUrmYpkITLqu57qfI5dsXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37998037"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="37998037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 10:45:25 -0800
X-CSE-ConnectionGUID: xwJAx2YfSxGQy3OsTuV+mg==
X-CSE-MsgGUID: UVkc0sTeTx61geoqNG5FMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="100537468"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2024 10:45:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL5ES-0005rl-2p;
	Tue, 10 Dec 2024 18:45:16 +0000
Date: Wed, 11 Dec 2024 02:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com,
	conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
Message-ID: <202412110221.35ohPaia-lkp@intel.com>
References: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_104525_072885_D4263B0B 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-interrupt-controller-Add-Sophgo-SG2042-MSI/20241209-151429
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang%40outlook.com
patch subject: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt controller
config: alpha-randconfig-r063-20241211 (https://download.01.org/0day-ci/archive/20241211/202412110221.35ohPaia-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110221.35ohPaia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110221.35ohPaia-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-sg2042-msi.c:273:34: warning: 'sg2042_msi_of_match' defined but not used [-Wunused-const-variable=]
     273 | static const struct of_device_id sg2042_msi_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/sg2042_msi_of_match +273 drivers/irqchip/irq-sg2042-msi.c

   272	
 > 273	static const struct of_device_id sg2042_msi_of_match[] = {
   274		{ .compatible	= "sophgo,sg2042-msi" },
   275		{}
   276	};
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
