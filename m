Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21520C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 22:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kF+Nud+dSLbBpXkqDY4C/qLA1tVW6Xjm12HgYwmKHxo=; b=FvMTuj/J4BK1GP
	z85TYZGrO47ekomILhaPKVfHK4rzQ/3yDxi0oUNRk7SVipK85If3qD9+Ca+HhOS+8hi94snC7SfUC
	aUvd32QBB29T6g7Qu+BgHDkmFxFWnnbf+tJn75bMtTZQ26c4AI+REvv2SYeBlbRfRK7VbkKibum5p
	8LV+PKf744uy048J8a5P3vEeYa9FOu07Pyv53Wkt3mxB7m1BYij5ZjBiNYq9O/ftMehju035Sgwij
	4rZLQFw+EHXA14Y9bllmCZ8rELsXqNNdVqldbA/B6NoX6SIkvayNhsaDc9wr6zFy1x8EYyDPSF7OU
	y1NlCYJYjmUV5ZHFdVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpcAZ-0000000BUyU-0YR9;
	Wed, 27 Mar 2024 22:54:55 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpcAU-0000000BUxO-1Lez
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 22:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711580090; x=1743116090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ancmOeO68m/jYuGYzzAFJLG5SA6z3QUCP6Wp4sl5CqE=;
  b=lEE35dhKxNhx2HwuClwp3TtSFkpDwvU17J4GZwB4m/1LQhQHwpvJS/u8
   QpAUZ8q/xDaTK26iv4+hOTk7E3ON6pfLWq1Ny2lRsSrEal2hv7LWET6G4
   ZoU26J/aUnjcIn0D1av6AnpuR6+7G34Kch08Ttx4WlPpRDUgz0OBtxofI
   3A23tNWiy979bEugw52Z3sAG7UVZ1wugi16YQrxBKH89ra9Cy22EAGF2I
   wD6wrXyjb9asZhzupnKbQEPYyXNOOxT3BNcwtQD/aMsiWmdzSMq7HDLST
   lMNnx8fwUd5vIHAGazyUHem9AN9jlYJrjoWkhta5wl5AsPyRRVDq21tq7
   Q==;
X-CSE-ConnectionGUID: ptO4nWUHSzmBzvBRESEwyA==
X-CSE-MsgGUID: 8aHREkLMSVaHa0hjCDxjoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6931342"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6931342"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 15:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="21107711"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2024 15:54:44 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpcAL-0001Zq-2g;
	Wed, 27 Mar 2024 22:54:41 +0000
Date: Thu, 28 Mar 2024 06:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] clocksource/drivers/timer-clint: Add T-Head C9xx
 clint support
Message-ID: <202403280636.SLv93x6B-lkp@intel.com>
References: <20240325164021.3229-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325164021.3229-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_155450_397258_A88AA3D1 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Jisheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.9-rc1 next-20240327]
[cannot apply to tip/timers/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-nommu-remove-PAGE_OFFSET-hardcoding/20240326-021401
base:   linus/master
patch link:    https://lore.kernel.org/r/20240325164021.3229-6-jszhang%40kernel.org
patch subject: [PATCH 5/5] clocksource/drivers/timer-clint: Add T-Head C9xx clint support
config: riscv-randconfig-r131-20240326 (https://download.01.org/0day-ci/archive/20240328/202403280636.SLv93x6B-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240328/202403280636.SLv93x6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280636.SLv93x6B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-clint.c:253:19: warning: 'c900_clint_timer_init_dt' defined but not used [-Wunused-function]
     253 | static int __init c900_clint_timer_init_dt(struct device_node *np)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/c900_clint_timer_init_dt +253 drivers/clocksource/timer-clint.c

   252	
 > 253	static int __init c900_clint_timer_init_dt(struct device_node *np)
   254	{
   255		is_c900_clint = true;
   256		return clint_timer_init_dt(np);
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
