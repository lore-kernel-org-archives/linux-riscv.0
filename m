Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7558EB64CA
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Sep 2024 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEEaiEQezGOjd2ir4h6qcRAT9EliR0bJ4FI0U9cSBY4=; b=DjZZQ5pOXd+MMV
	JXwT0DWml9q0l9+h10dv4c6GTwmd1gZDpInefvqTYVflHVoJI9ddO2i7atgl/RvlFL7cbdjX6A1gG
	GolDOjUfjDXXmxIqxE01KWWTldHClQ6gSP6bbyXUuumx86NL4mFRNzS9ic1YuqJMReVvXas9vFgi7
	I8VttJnIGC8TBWxEwAGig5Ji3vowIEZUDCymIakii+TwADiyLJ49JBg7wWyDpUbdkmZEb9eE276Yw
	bGkcsD8vlNmh5Nw/YoHwnEDQBh9zdZJrtD6LNx2zBaT4psIXGQ7XK9MyrAy9ijV+UQQZaeflggfgz
	nDOJ036z647whtp7yeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smziU-0000000FPHS-2177;
	Sat, 07 Sep 2024 17:59:22 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smziQ-0000000FPGc-2SsP
	for linux-riscv@lists.infradead.org;
	Sat, 07 Sep 2024 17:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725731958; x=1757267958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7W+Y2WI2P8yRIyWHBY18RxuM3cQNL1ZRi9/hscrP9ew=;
  b=XcaoKdXLvNwDhyZK0ruXzdM/xuKLrdWHK6a+rHkbzVc3db1TEyyxbZMg
   r4/IRUUy62IeKhuzt3CDtdJRbq5IGTmYAgco8bpfQwyxplWwPPTShsrMQ
   rAUcihb9MDBbxyeCdRkP+iIkuPqpYwukB/vU5toA3Nnc2JBOn7os7iWzu
   fxKu1Jvi/1S7E0rpyjpYHobcXG0p0m05BRgX8BhfYZBEV+yMHxzHO6xx+
   s9t88ltfcIWk2ze2BCaKCoVRKzLx/pYfYCiNgReecne2nXX4Mk/VD9ZCL
   gE7Hs/Xg+XcMFZo7daqRcJrsXJGygbhNYaw+bpoc3/upaRGWDTEdAa2iV
   w==;
X-CSE-ConnectionGUID: qMQr1lNHQ3ur+mCLL4pcNw==
X-CSE-MsgGUID: FnjADKbkT1yDrvN1RD2mRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="49882571"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="49882571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:59:11 -0700
X-CSE-ConnectionGUID: l8Vfll+VRQ+MA6fVyOu7BA==
X-CSE-MsgGUID: 6UhShR+JQPmdIVXJXH/Kjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66041591"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2024 10:59:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smziD-000Cot-1z;
	Sat, 07 Sep 2024 17:59:05 +0000
Date: Sun, 8 Sep 2024 01:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, ukleinek@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PWM
Message-ID: <202409080100.h6lX5Asm-lkp@intel.com>
References: <3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_105918_700212_BE15DE4C 
X-CRM114-Status: GOOD (  10.31  )
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

[auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-pwm-sophgo-add-bindings-for-sg2042/20240905-201303
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang%40outlook.com
patch subject: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PWM
config: m68k-randconfig-r133-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080100.h6lX5Asm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240908/202409080100.h6lX5Asm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080100.h6lX5Asm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-sophgo-sg2042.c:99:34: warning: 'sg2042_pwm_match' defined but not used [-Wunused-const-variable=]
      99 | static const struct of_device_id sg2042_pwm_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/sg2042_pwm_match +99 drivers/pwm/pwm-sophgo-sg2042.c

    98	
  > 99	static const struct of_device_id sg2042_pwm_match[] = {
   100		{ .compatible = "sophgo,sg2042-pwm" },
   101		{ },
   102	};
   103	MODULE_DEVICE_TABLE(of, sg2042_pwm_match);
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
