Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2339FD78797
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFS9FzNV+wsDRruB/bYgd4LGVI4Qy7cZ4gslHvdZGNA=; b=evn88VlF49WWUn
	hOKoqNacZEsYLwrh2W9UZ6lr+iiTTZ8D/Qyuo9CHLcS0BJUJsHyJeg8gs7BBwAD+W/64BQ8Wb9UF0
	M1gYYAZdlzP7kfaKIVEXV1H6+WIJkgpHFBYyihdYDLgF9+EQSB++CA2EEYOt9MS3WqsxAk53S2/zZ
	hlzSj3aOoNML32NxFBpFgzZii4pqcVuLLjEr74Sok3PLpMf9DEA5vdNptRGilHumSh67u78LJwHbh
	JLGo1iwvoSRHXQMtKB5te4Voslp0Ev/zhqHYTLvYFOhgvXLZuKpM/eNbnq3gY+f8yo7Rkazju9jgH
	kOXQd3RURz4kHesMnbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyDu-0000000BfAx-0r6C;
	Sat, 20 Dec 2025 14:46:22 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyDr-0000000BfAd-0iSO
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 14:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241979; x=1797777979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/9AqWDR0QjCmpU+CYPu2fRg5LQPeaeBa8kwPoIxDO4=;
  b=FaTM6G7xL5ssQMimG/lXJQOd8qEelDkXisyKcC+GUe3EaL75bSiaj18f
   Jf9J4NoJ28sbAMTRaMRjXZcQjgz1DCxHaNV8uH5s7OfO4bcE/VF6FvryA
   Uy8Rrw+y7E7i2TvxP8VECL/J8pbJeXjPvEsvHxI8agyUZrZI+YLmNU5Oc
   ojepeuW6pE6XkYEsAoextYbcyXRF6ajcu4RyuevD/CrIk1WHtiY3BMQcf
   JbbXoLuGTrhnw5683r/dAy28KDaexTaqWH2B59WMYATnx9/oTb6YmvyDW
   B5ou3yv8TJ2XvvrgLqWHni0xXoRuEIOBa3XZJUH0EThtWHqaVf2eeHc+u
   A==;
X-CSE-ConnectionGUID: 67nU7TmcTeCkCb48/htjyA==
X-CSE-MsgGUID: /VzqkwA3S521QS10wZmyQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79629243"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79629243"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:46:16 -0800
X-CSE-ConnectionGUID: zaOdA7FhQs+c+8EGhahraQ==
X-CSE-MsgGUID: Gd8F3kBzSy6LdBZnFHEqKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199024654"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 06:46:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyDf-000000004fu-1cUP;
	Sat, 20 Dec 2025 14:46:07 +0000
Date: Sat, 20 Dec 2025 22:45:45 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/3] riscv: introduce percpu.h into include/asm
Message-ID: <202512202218.FI6bB5kV-lkp@intel.com>
References: <20251216014721.42262-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216014721.42262-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_064619_296171_C328532E 
X-CRM114-Status: GOOD (  10.63  )
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
[also build test WARNING on v6.19-rc1 next-20251219]
[cannot apply to bpf-next/net bpf-next/master bpf/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhui-Cui/riscv-remove-irqflags-h-inclusion-in-asm-bitops-h/20251216-094956
base:   linus/master
patch link:    https://lore.kernel.org/r/20251216014721.42262-3-cuiyunhui%40bytedance.com
patch subject: [PATCH v3 2/3] riscv: introduce percpu.h into include/asm
config: riscv-randconfig-002-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202218.FI6bB5kV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202218.FI6bB5kV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202218.FI6bB5kV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     846 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> mm/slub.c:4385:9: warning: variable '__old' is uninitialized when used within its own initialization [-Wuninitialized]
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4386 |                                              &old.freelist_tid, new.freelist_tid);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   include/asm-generic/percpu.h:520:2: note: expanded from macro 'this_cpu_try_cmpxchg64'
     520 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg64)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:110:24: note: expanded from macro '__cpu_fallback_try_cmpxchg'
     110 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ~~~~~~~~~~~~~~^~~~~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/atomic/atomic-instrumented.h:4810:32: note: expanded from macro 'cmpxchg_relaxed'
    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:265:24: note: expanded from macro 'arch_cmpxchg_relaxed'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     266 |                       SC_SFX(""), CAS_SFX(""),                          \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     267 |                       SC_PREPEND(""), SC_APPEND(""),                    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     268 |                       CAS_PREPEND(""), CAS_APPEND(""))
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:218:32: note: expanded from macro '_arch_cmpxchg'
     218 |         __typeof__(*(__ptr)) __old = (old);                             \
         |                              ~~~~~    ^~~
   mm/slub.c:4385:9: error: instruction requires the following: RV64I Base Instruction Set
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   include/asm-generic/percpu.h:520:47: note: expanded from macro 'this_cpu_try_cmpxchg64'
     520 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg64)
         |                                                      ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         0:      lr.d s9, 0(a1)
         |                 ^
   mm/slub.c:4385:9: error: instruction requires the following: RV64I Base Instruction Set
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   include/asm-generic/percpu.h:520:47: note: expanded from macro 'this_cpu_try_cmpxchg64'
     520 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg64)
         |                                                      ^
   <inline asm>:3:2: note: instantiated into assembly here
       3 |         sc.d a3, a0, 0(a1)
         |         ^
   mm/slub.c:4385:9: error: instruction requires the following: RV64I Base Instruction Set
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   include/asm-generic/percpu.h:520:47: note: expanded from macro 'this_cpu_try_cmpxchg64'
     520 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg64)
         |                                                      ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         0:      lr.d s9, 0(a1)
         |                 ^
   mm/slub.c:4385:9: error: instruction requires the following: RV64I Base Instruction Set
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   include/asm-generic/percpu.h:520:47: note: expanded from macro 'this_cpu_try_cmpxchg64'
     520 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg64)
         |                                                      ^
   <inline asm>:3:2: note: instantiated into assembly here
       3 |         sc.d a3, a0, 0(a1)
         |         ^
   mm/slub.c:4385:9: error: instruction requires the following: RV64I Base Instruction Set
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   include/asm-generic/percpu.h:520:47: note: expanded from macro 'this_cpu_try_cmpxchg64'
     520 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg64)
         |                                                      ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         0:      lr.d s10, 0(a1)
         |                 ^
   mm/slub.c:4385:9: error: instruction requires the following: RV64I Base Instruction Set
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   include/asm-generic/percpu.h:520:47: note: expanded from macro 'this_cpu_try_cmpxchg64'
     520 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg64)
         |                                                      ^
   <inline asm>:3:2: note: instantiated into assembly here
       3 |         sc.d a3, a0, 0(a1)
         |         ^
   mm/slub.c:4385:9: error: instruction requires the following: RV64I Base Instruction Set


vim +/__old +4385 mm/slub.c

0b303fb402862d Vlastimil Babka 2021-05-08  4376  
6801be4f2653e5 Peter Zijlstra  2023-05-31  4377  static inline bool
6801be4f2653e5 Peter Zijlstra  2023-05-31  4378  __update_cpu_freelist_fast(struct kmem_cache *s,
6801be4f2653e5 Peter Zijlstra  2023-05-31  4379  			   void *freelist_old, void *freelist_new,
6801be4f2653e5 Peter Zijlstra  2023-05-31  4380  			   unsigned long tid)
6801be4f2653e5 Peter Zijlstra  2023-05-31  4381  {
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4382  	struct freelist_tid old = { .freelist = freelist_old, .tid = tid };
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4383  	struct freelist_tid new = { .freelist = freelist_new, .tid = next_tid(tid) };
6801be4f2653e5 Peter Zijlstra  2023-05-31  4384  
b244358e9a1cd6 Vlastimil Babka 2025-11-07 @4385  	return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4386  					     &old.freelist_tid, new.freelist_tid);
6801be4f2653e5 Peter Zijlstra  2023-05-31  4387  }
6801be4f2653e5 Peter Zijlstra  2023-05-31  4388  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
