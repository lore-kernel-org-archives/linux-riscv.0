Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765BBCCA473
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbqUR6XEnfTzWMRb/gSoA3PPY+rIfH9xZwxaE6alJHM=; b=cHF+hPYMgbERrO
	ChSEkBKPnowrb0VL2a8j40kebe9nZ7aQSoDBcgrgvQYRhgtES+1kTQ4BKL2NSOZiJFBHXXLamLCBc
	CF3RZ3KS6tEHkcIiPR0e4bpb3aCRON6QYPF+vwNsEXjGgifGkO9JYzi4FyM0Mm9p35p6Y5TFkfUtz
	MZSNffmxel3J6JmZUfJrKf/RneQIsnXyeSRT9Kk5bHsWe9vLREti+YPXD+gY+MtQ40e5PXTRMRayV
	20aDRWSVXh3oe1D0m0LVO8tC790MdNNLG6EXgDGDQY01fatj2II3B3nGC/gH71DbWKPEvRZLbzA1c
	tOVrpgEw0WIbVsh2W7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fK2-0060p1-QM; Tue, 21 Jun 2022 14:57:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fJz-0060ne-AF
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 14:57:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7411561708
	for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 14:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9E4C341CA
	for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655823457;
	bh=1w3ELH6FhnKTMp/aAUXabwlWVSg9Z9CE4WFemmnUsEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GzgrKNHGBAhTaX2MjfCY21Bi6QjEEJOhvy+I8oedc/A/Kyv0l9+oYavGFZRFVA3Ib
	 bCslybB+JssUwQOZCBC1KiIGksWCdZ5M/gFthvmqoYgpl/sSPjr07rINH7vDRQDSuU
	 ntZx2xoLNdDVjfY2Xk30LGOolLqQ3OLyEiMHl5dz1roy539UPQE+6HX8T0xXEMU61P
	 iXW/fXyJVl+uhAn+vPpJl1rtVY+EruxqNlThNAFYB036L1qm6UYVcPCxlrfj7bfuq6
	 M5y4ss8rgY+mBNr6X8+Pidcs/YBU9NK1u/njCJ1cT9g8l5o52shmCnD239mDlla37W
	 Z6OhfEdv7YU0w==
Received: by mail-vk1-f179.google.com with SMTP id b5so3533966vkp.4
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 07:57:37 -0700 (PDT)
X-Gm-Message-State: AJIora9KdnMf6V7YrgyRatdoAJ4st3vPkwdtEvS7NjRpRv0JQca9gANQ
	j5ENUqoy0LkzsF757jEVL+tdn86lpboAUOUqaHo=
X-Google-Smtp-Source: AGRyM1uWyyUJQ0UyBp5q+f7Fxs01MDqffDPEJtCcflVQwjX0fmBOX2yDOXb7WRZN7zemi3Wd/1HMm+rHbBQqT+hTO/M=
X-Received: by 2002:a05:6122:239:b0:36c:1187:a347 with SMTP id
 e25-20020a056122023900b0036c1187a347mr4096305vko.28.1655823456161; Tue, 21
 Jun 2022 07:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220620155404.1968739-1-guoren@kernel.org> <202206210303.Vjl4rpPv-lkp@intel.com>
In-Reply-To: <202206210303.Vjl4rpPv-lkp@intel.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 21 Jun 2022 22:57:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSyvS=52kkHiBB2BdhyVFxKL1Lym90LFC6tmsNO_5_RCQ@mail.gmail.com>
Message-ID: <CAJF2gTSyvS=52kkHiBB2BdhyVFxKL1Lym90LFC6tmsNO_5_RCQ@mail.gmail.com>
Subject: Re: [PATCH V5] riscv: Add qspinlock support
To: kernel test robot <lkp@intel.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_075739_489919_4197DEF1 
X-CRM114-Status: GOOD (  22.79  )
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

Fixed: with "{}" protect to meet clang requirement.

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 12debce235e5..492104d45a23 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -17,6 +17,23 @@
        __typeof__(new) __new = (new);                                  \
        __typeof__(*(ptr)) __ret;                                       \
        switch (size) {                                                 \
+       case 2: {                                                       \
+               u32 temp;                                               \
+               u32 shif = ((ulong)__ptr & 2) ? 16 : 0;                 \
+               u32 mask = 0xffff << shif;                              \
+               __ptr = (__typeof__(ptr))((ulong)__ptr & ~(ulong)2);    \
+               __asm__ __volatile__ (                                  \
+                       "0:     lr.w %0, %2\n"                          \
+                       "       and  %1, %0, %z3\n"                     \
+                       "       or   %1, %1, %z4\n"                     \
+                       "       sc.w %1, %1, %2\n"                      \
+                       "       bnez %1, 0b\n"                          \
+                       : "=&r" (__ret), "=&r" (temp), "+A" (*__ptr)    \
+                       : "rJ" (~mask), "rJ" (__new << shif)            \
+                       : "memory");                                    \
+               __ret = (__ret & mask) >> shif;                         \
+               break;                                                  \
+       }                                                               \
        case 4:                                                         \
                __asm__ __volatile__ (                                  \
                        "       amoswap.w %0, %2, %1\n"                 \

On Tue, Jun 21, 2022 at 3:58 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on soc/for-next]
> [also build test ERROR on linus/master v5.19-rc2 next-20220617]
> [cannot apply to tip/locking/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-qspinlock-support/20220620-235653
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20220621/202206210303.Vjl4rpPv-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/326f4a13941845b6ef1c4f4eaba049fe265f52bf
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-qspinlock-support/20220620-235653
>         git checkout 326f4a13941845b6ef1c4f4eaba049fe265f52bf
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:7:
>    In file included from include/linux/gfp.h:6:
>    In file included from include/linux/mmzone.h:8:
>    In file included from include/linux/spinlock.h:62:
>    In file included from include/linux/lockdep.h:14:
>    In file included from include/linux/smp.h:13:
>    In file included from include/linux/cpumask.h:13:
>    In file included from include/linux/atomic.h:7:
> >> arch/riscv/include/asm/atomic.h:299:1: error: expected expression
>    ATOMIC_OPS()
>    ^
>    arch/riscv/include/asm/atomic.h:292:2: note: expanded from macro 'ATOMIC_OPS'
>            ATOMIC_OP(int,   , 4)
>            ^
>    arch/riscv/include/asm/atomic.h:249:9: note: expanded from macro 'ATOMIC_OP'
>            return __xchg_relaxed(&(v->counter), n, size);                  \
>                   ^
>    arch/riscv/include/asm/cmpxchg.h:21:3: note: expanded from macro '__xchg_relaxed'
>                    u32 temp;                                               \
>                    ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:7:
>    In file included from include/linux/gfp.h:6:
>    In file included from include/linux/mmzone.h:8:
>    In file included from include/linux/spinlock.h:62:
>    In file included from include/linux/lockdep.h:14:
>    In file included from include/linux/smp.h:13:
>    In file included from include/linux/cpumask.h:13:
>    In file included from include/linux/atomic.h:7:
> >> arch/riscv/include/asm/atomic.h:299:1: error: use of undeclared identifier 'temp'; did you mean 'bcmp'?
>    arch/riscv/include/asm/atomic.h:292:2: note: expanded from macro 'ATOMIC_OPS'
>            ATOMIC_OP(int,   , 4)
>            ^
>    arch/riscv/include/asm/atomic.h:249:9: note: expanded from macro 'ATOMIC_OP'
>            return __xchg_relaxed(&(v->counter), n, size);                  \
>                   ^
>    arch/riscv/include/asm/cmpxchg.h:31:28: note: expanded from macro '__xchg_relaxed'
>                            : "=&r" (__ret), "=&r" (temp), "+A" (*__ptr)    \
>                                                    ^
>    include/linux/string.h:159:12: note: 'bcmp' declared here
>    extern int bcmp(const void *,const void *,__kernel_size_t);
>               ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:7:
>    In file included from include/linux/gfp.h:6:
>    In file included from include/linux/mmzone.h:8:
>    In file included from include/linux/spinlock.h:62:
>    In file included from include/linux/lockdep.h:14:
>    In file included from include/linux/smp.h:13:
>    In file included from include/linux/cpumask.h:13:
>    In file included from include/linux/atomic.h:7:
> >> arch/riscv/include/asm/atomic.h:299:1: error: invalid lvalue in asm output
>    ATOMIC_OPS()
>    ^~~~~~~~~~~~
>    arch/riscv/include/asm/atomic.h:292:2: note: expanded from macro 'ATOMIC_OPS'
>            ATOMIC_OP(int,   , 4)
>            ^~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/atomic.h:249:9: note: expanded from macro 'ATOMIC_OP'
>            return __xchg_relaxed(&(v->counter), n, size);                  \
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:31:28: note: expanded from macro '__xchg_relaxed'
>                            : "=&r" (__ret), "=&r" (temp), "+A" (*__ptr)    \
>                                                    ^~~~
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:7:
>    In file included from include/linux/gfp.h:6:
>    In file included from include/linux/mmzone.h:8:
>    In file included from include/linux/spinlock.h:62:
>    In file included from include/linux/lockdep.h:14:
>    In file included from include/linux/smp.h:13:
>    In file included from include/linux/cpumask.h:13:
>    In file included from include/linux/atomic.h:7:
> >> arch/riscv/include/asm/atomic.h:299:1: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
>    arch/riscv/include/asm/atomic.h:292:2: note: expanded from macro 'ATOMIC_OPS'
>            ATOMIC_OP(int,   , 4)
>            ^
>    arch/riscv/include/asm/atomic.h:249:9: note: expanded from macro 'ATOMIC_OP'
>            return __xchg_relaxed(&(v->counter), n, size);                  \
>                   ^
>    arch/riscv/include/asm/cmpxchg.h:22:7: note: expanded from macro '__xchg_relaxed'
>                    u32 shif = ((ulong)__ptr & 2) ? 16 : 0;                 \
>                        ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:700:
>    In file included from include/linux/huge_mm.h:8:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
>                    return (set->sig[3] | set->sig[2] |
>                            ^        ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
>            unsigned long sig[_NSIG_WORDS];
>            ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:700:
>    In file included from include/linux/huge_mm.h:8:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
>                    return (set->sig[3] | set->sig[2] |
>                                          ^        ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
>            unsigned long sig[_NSIG_WORDS];
>            ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:700:
>    In file included from include/linux/huge_mm.h:8:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
>                    return  (set1->sig[3] == set2->sig[3]) &&
>                             ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
>            unsigned long sig[_NSIG_WORDS];
>            ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:700:
>    In file included from include/linux/huge_mm.h:8:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
>                    return  (set1->sig[3] == set2->sig[3]) &&
>                                             ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
>            unsigned long sig[_NSIG_WORDS];
>            ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:700:
>    In file included from include/linux/huge_mm.h:8:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
>                            (set1->sig[2] == set2->sig[2]) &&
>                             ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
>            unsigned long sig[_NSIG_WORDS];
>            ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:700:
>    In file included from include/linux/huge_mm.h:8:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
>                            (set1->sig[2] == set2->sig[2]) &&
>                                             ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
>            unsigned long sig[_NSIG_WORDS];
>            ^
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
>    In file included from include/linux/mm.h:700:
>    In file included from include/linux/huge_mm.h:8:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
>    _SIG_SET_BINOP(sigorsets, _sig_or)
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
>                    a3 = a->sig[3]; a2 = a->sig[2];                         \
>                         ^      ~
>
>
> vim +299 arch/riscv/include/asm/atomic.h
>
> fab957c11efe2f Palmer Dabbelt 2017-07-10  298
> 5ce6c1f3535fa8 Andrea Parri   2018-03-09 @299  ATOMIC_OPS()
> fab957c11efe2f Palmer Dabbelt 2017-07-10  300
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
