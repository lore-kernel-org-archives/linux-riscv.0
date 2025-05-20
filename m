Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ADDC2D0CD
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 00:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxOhIcKZVxjq+qGtwZSnSakdlPwvZ1OKx3L7XxOsPZE=; b=lheFjuCaL+bqed
	bxvRy/stysxwaqhKxXw1OMjXVvcLHD4OcSvI99HCzKZG2m8qb6mx3rpW21jlnAS1ynFBGIRursKeN
	5aMbOWY2XgQ5XNsR/Wz0NwmJDpeRDvIC2j+zcy5yoa18TUSQUFsDAsHRKiVhIL1OAP00Idu87iPSg
	TrPFqE4XoSGPTf68w0ya7t7/mX8SQCMME1tARoVqjnYb5o2omyg90iTMMRQP5qvTCNl6RkouPNkU0
	jo75X+9HoJUOGE+jkKQyAv00ZoKoIG/mquxCSdNYxewKERR0r7CxY8Meb2wCurjQ1b+6v+3q+PQsU
	LVqbGE+DOMIeiaN4urSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHB35-0000000BADE-2Hg3;
	Tue, 20 May 2025 00:41:39 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHB31-0000000BAC8-1fmT
	for linux-riscv@lists.infradead.org;
	Tue, 20 May 2025 00:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747701695; x=1779237695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3yycBl/zY8X2lXOzRZ8dR0S8qgsBRsppqzz+TA9PTf8=;
  b=Xp1tLZTVXu/Tlu2qPbPrGGESXanwKktMFmgqt7X2IBtqn1CFbZMgGokI
   2fpkxdyaVcB73CC5QNTGir3JM+zb1PxLkDGC3+llYuFoTKO01vEXyz+gX
   98qh4hYv4M9nhXQvETRIkJBGOAmev4mkVoIcjWI7lrgwt5tQzxTojNf39
   FD/BpiB/i57RItg+EyF9wBuN+co2LVJvd/a9bQOQUoUrOIGc66kE0Ygu2
   EFlv9OBxCq1SgvOxs1MINiPuuyO1BIWWgWMDWS2Oiwc3T4MEs1LCzgprq
   aM5XyoRrGXtOATw5ib2Th28Q6OKojUw+f8WhXS5WbQnnnotXBBebPSjeu
   Q==;
X-CSE-ConnectionGUID: numRxX1LQBaOLC1sYrxF0Q==
X-CSE-MsgGUID: LlpuMrBMT4OqBE6576tesg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52249546"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52249546"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 17:41:32 -0700
X-CSE-ConnectionGUID: gqcRaprWR3+HcCRxrkzwgA==
X-CSE-MsgGUID: nN8kF0VgTvSZ5kM/W0ov+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144520504"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 17:41:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHB2r-000M1U-1x;
	Tue, 20 May 2025 00:41:25 +0000
Date: Tue, 20 May 2025 08:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
Message-ID: <202505200822.Av88hkk5-lkp@intel.com>
References: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_174135_509716_7D12573D 
X-CRM114-Status: GOOD (  10.44  )
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

Hi Aleksa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Paunovic-via-B4-Relay/dt-bindings-timer-mti-gcru/20250514-165347
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-2-cb0cf2922d66%40htecgroup.com
patch subject: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
config: riscv-randconfig-r121-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200822.Av88hkk5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505200822.Av88hkk5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200822.Av88hkk5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zabha'
>> drivers/clocksource/timer-riscv.c:58:16: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/clocksource/timer-riscv.c:58:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/clocksource/timer-riscv.c:58:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/clocksource/timer-riscv.c:58:16: sparse:     got unsigned int [usertype] *

vim +/__iomem +58 drivers/clocksource/timer-riscv.c

    55	
    56	static u32 __maybe_unused mmio_get_cycles_hi(void)
    57	{
  > 58		return readl_relaxed(((u32 *)riscv_time_val) + 1);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
