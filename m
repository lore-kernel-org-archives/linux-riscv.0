Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E00FD3B98C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7sflTgESGPbkIm0kUuh5GpyprR1zfn/UdAodfRhsx0=; b=BYVEZxOf2aFihI
	A4BbF+FPkGBR9x5FcMWWRGyr9BFqp5ozLKIHXqPPthv7YpYUR0irKQX1on7+i98KIg22NXucbwfIV
	NXAyP/lgxYFgb5h0qtEfQY7a/3RUP5K/gYbth/qsv/0jUJgSCzRPkCEzgsfmXX4G1hqO286vmgw6g
	7djx7DhvbL2c/RnIRPrsVHlmS7uQOxDoEo4OdbnT5Qm1FjnWBFb5oaB9HV6daMNnRQKfIBvTZ5ZoW
	MS2JFMRob47sWzRv8dHCz4df+HmxISfO7roWApV25hVv/HsqTbh6Nix+bFhn0/gLSALQtq2Hu1pMP
	oGyVZHsJRZJGaM1ZbSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT26F-0000000EdIk-1p68;
	Tue, 09 Dec 2025 18:06:11 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT26B-0000000EdIP-3SJY
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 18:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765303568; x=1796839568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=07h+7iBXoZF2/As0GV/qDmBkKOgLQ1vyvDX4HcfGzyM=;
  b=JL3CLzO9cWjIyBk+SFpw4cO6M/rYD/KNWHF/4BnV3X5CtjlEgOFYzdJm
   135gfdbgEzEtooOjTcnxRrfYZoANkpd/YsWOHt8zXIJXuLf9QGVKBTCTy
   XwuACPZuDu9NvJf5jaqFumo322H3iAOH3+k/svUha5wq5HeXpZR9GQhC1
   TdJYne6TIUFUhiY9/iPTGcxJMVpkMVx8CB7UZPfYY6ixOd9BH3ZKHpDAf
   UNzsguABgNrRcUqIFgm9FL5EEqLpy6QB1/NMPZSdIlUHirVZdy3Pu6bgC
   XFsl1CS7jVSja9dbcgHPl6va6QWrCODNoRlCHJytYJ5d+OEdDAWT716n0
   g==;
X-CSE-ConnectionGUID: TVN9qgfeRL+IUN2KA/xVLQ==
X-CSE-MsgGUID: Iu3pCrbpSOqO05IlFbJ6Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84680298"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="84680298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 10:06:06 -0800
X-CSE-ConnectionGUID: xx2RS3ENS1mxbMIde3HKOQ==
X-CSE-MsgGUID: Q8HV4iIJR0mlQaeYpVEStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="227325758"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 10:05:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT261-0000000028F-1sZw;
	Tue, 09 Dec 2025 18:05:57 +0000
Date: Wed, 10 Dec 2025 02:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>, aou@eecs.berkeley.edu,
	alex@ghiti.fr, andii@kernel.org, andybnac@gmail.com,
	apatel@ventanamicro.com, ast@kernel.org, ben.dooks@codethink.co.uk,
	bjorn@kernel.org, bpf@vger.kernel.org, charlie@rivosinc.com,
	cl@gentwo.org, conor.dooley@microchip.com, cyrilbur@tenstorrent.com,
	daniel@iogearbox.net, debug@rivosinc.com, dennis@kernel.org,
	eddyz87@gmail.com, haoluo@google.com, john.fastabend@gmail.com,
	jolsa@kernel.org, kpsingh@kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk, martin.lau@linux.dev, palmer@dabbelt.com,
	pjw@kernel.org, puranjay@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] riscv: introduce percpu.h into include/asm
Message-ID: <202512100134.TRTNjFGL-lkp@intel.com>
References: <20251208034944.73113-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251208034944.73113-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_100607_935309_01F88BEE 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi Yunhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18 next-20251209]
[cannot apply to bpf-next/net bpf-next/master bpf/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhui-Cui/riscv-remove-irqflags-h-inclusion-in-asm-bitops-h/20251208-115407
base:   linus/master
patch link:    https://lore.kernel.org/r/20251208034944.73113-3-cuiyunhui%40bytedance.com
patch subject: [PATCH v2 2/3] riscv: introduce percpu.h into include/asm
config: riscv-randconfig-r132-20251209 (https://download.01.org/0day-ci/archive/20251210/202512100134.TRTNjFGL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100134.TRTNjFGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100134.TRTNjFGL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/gfs2/file.c: note: in included file (through include/linux/irqflags.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
--
   fs/gfs2/trans.c: note: in included file (through include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h):
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/riscv/include/asm/percpu.h:113:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)

vim +113 arch/riscv/include/asm/percpu.h

   108	
   109	#define PERCPU_OP_8_16(op_name, op, expr, final_op)			\
   110		PERCPU_8_16_OP(op_name, op, 8, .b, u8, expr, final_op);		\
   111		PERCPU_8_16_OP(op_name, op, 16, .h, u16, expr, final_op)
   112	
 > 113	PERCPU_OP_8_16(add, add, val, add)
   114	PERCPU_OP_8_16(andnot, and, ~val, and)
   115	PERCPU_OP_8_16(or, or, val, or)
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
