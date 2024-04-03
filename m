Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619C5CD1294
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 19:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hMJSzbrRfIjpuJh8Rqk3pn2IstrX3g95bJx+EQKP3s=; b=PyEuq+0ee59S8h
	cXFcIRrEm6V/w4hLjXrG/saFHYP/f7GdxH5TcFmCF+Vs8z+YCFvwjXXIC1JZx+9cQsxJvc3qlffSO
	rsS7euEkERcuxJmiVl9R9ibrkB/rmEFO76geEuLcM6w4AwXh5eva5xjAdeCzQknbAaXmQeVdqJwyT
	aN3XEa+SHeBoYWXEL8sAfJrveumVmHCLIQyUzryYnW/mtQD2PlTmzMkp4ieYL7QVm5DTFh5GloMhI
	LhlJrf78GM1euwL4028cM1tJ0woR9+pYbHbob/KnbCD6DMZuhqTPGPkMiBZ6SZNOBkIwxLONBrSAm
	3F8okK+7I53K/KWn+4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs6j2-000000001w7-3BFC;
	Wed, 03 Apr 2024 19:56:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs6iy-000000001uf-1uVe
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 19:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E0196150C;
	Wed,  3 Apr 2024 19:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3A6C433F1;
	Wed,  3 Apr 2024 19:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712174203;
	bh=qy2c8g78O518PO9O6KiZAFu1Ifp8jJwqGnz0VLfkXp0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=PcX24eMcI3r7RMuyiQtrdT8VNobuQKE7qDwRG7xa37VjD5kc/Xx41+a+Cb52paHq0
	 KaceVi8Oe9+qRPi0GuEmV2AtxD2JvTGAE1YW+jXb3POR+gVzfHA1hlSSh3EFTcLmTS
	 vzOnz34ygzA/82y8tPPcGA+QS9L1heyXaQ/ZeMWqbc9iJJt06OgESedUPv2LWTGe6X
	 Hapzco7aMc1HdW7cSPObY/IoDDZw/AKTggKWbHcmJcFWas9Cu/nTc9urIqk89BEAgA
	 W7UhLFX7Fbn8+V+QDZAa+m6AQIOP0/NaMlwAoYNW4YNF3vlR1x8vmZwCKQoCX9ZTB8
	 nIydySl/aw1DQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B7698CE0D85; Wed,  3 Apr 2024 12:56:42 -0700 (PDT)
Date: Wed, 3 Apr 2024 12:56:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org,
	clang-built-linux <llvm@lists.linux.dev>,
	Linux PM <linux-pm@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: kernel/sched/core.c:961:15: error: incompatible pointer to
 integer conversion passing 'typeof
Message-ID: <8d5dcb8c-6fc8-4e01-b20e-970809bf842e@paulmck-laptop>
References: <CA+G9fYtj3aBdRreBmKZDQApEe2x8mugycPgN+_J5ebJzXDEq4g@mail.gmail.com>
 <CAKfTPtC9YgbZgGNK82MhhzzsD3P6j64+w6oieJMDKQNOmrC4FQ@mail.gmail.com>
 <20240403160041.GA1252923@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403160041.GA1252923@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_125644_640594_E74A8711 
X-CRM114-Status: GOOD (  19.96  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 03, 2024 at 09:00:41AM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> + Paul McKenney
> 
> On Wed, Apr 03, 2024 at 03:26:05PM +0200, Vincent Guittot wrote:
> > Hi Naresh,
> > 
> > Adding riscv people
> > 
> > On Wed, 3 Apr 2024 at 09:38, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > The riscv clang-17 defconfig build failed due to following warnings / errors
> > > on the Linux next-20240402.
> > 
> > Could you confirm that there is no problem with other arch and/or
> > other toolchain ?
> 
> This is not a clang specific issue, it happens with GCC too:

Some of these are fixed, but there are a few remaining failures.

I have pulled this series from -next, and apologies for putting it in
too soon.

							Thanx, Paul

>   $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- mrproper defconfig kernel/sched/core.o
>   kernel/sched/core.c: In function '__wake_q_add':
>   arch/riscv/include/asm/cmpxchg.h:175:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
>     175 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>         |                                                              ^~~~~
>         |                                                              |
>         |                                                              struct wake_q_node *
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c:961:22: note: in expansion of macro 'cmpxchg_relaxed'
>     961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>         |                      ^~~~~~~~~~~~~~~
>   In file included from arch/riscv/include/asm/cmpxchg.h:12,
>                    from arch/riscv/include/asm/atomic.h:19,
>                    from include/linux/atomic.h:7,
>                    from include/linux/cpumask.h:14,
>                    from include/linux/smp.h:13,
>                    from include/linux/lockdep.h:14,
>                    from include/linux/spinlock.h:63,
>                    from include/linux/wait.h:9,
>                    from include/linux/wait_bit.h:8,
>                    from include/linux/fs.h:6:
>   include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct wake_q_node *'
>      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>         |                                          ~~~~~~~~~~^~~
>   arch/riscv/include/asm/cmpxchg.h:175:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
>     175 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>         |                                                                     ^~~~~
>         |                                                                     |
>         |                                                                     struct wake_q_node *
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c:961:22: note: in expansion of macro 'cmpxchg_relaxed'
>     961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>         |                      ^~~~~~~~~~~~~~~
>   include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct wake_q_node *'
>      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>         |                                                         ~~~~~~~~~~^~~
>   arch/riscv/include/asm/cmpxchg.h:175:23: warning: assignment to 'struct wake_q_node *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
>     175 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>         |                       ^
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c:961:22: note: in expansion of macro 'cmpxchg_relaxed'
>     961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>         |                      ^~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:179:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
>     179 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                                                                ^~~~~
>         |                                                                |
>         |                                                                struct wake_q_node *
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c:961:22: note: in expansion of macro 'cmpxchg_relaxed'
>     961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>         |                      ^~~~~~~~~~~~~~~
>   include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct wake_q_node *'
>      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
>         |                                            ~~~~~~~~~~^~~
>   arch/riscv/include/asm/cmpxchg.h:179:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
>     179 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                                                                       ^~~~~
>         |                                                                       |
>         |                                                                       struct wake_q_node *
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c:961:22: note: in expansion of macro 'cmpxchg_relaxed'
>     961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>         |                      ^~~~~~~~~~~~~~~
>   include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct wake_q_node *'
>      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
>         |                                                           ~~~~~~~~~~^~~
>   arch/riscv/include/asm/cmpxchg.h:179:23: warning: assignment to 'struct wake_q_node *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
>     179 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                       ^
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c:961:22: note: in expansion of macro 'cmpxchg_relaxed'
>     961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>         |                      ^~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:179:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     179 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c:961:22: note: in expansion of macro 'cmpxchg_relaxed'
>     961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>         |                      ^~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:180:9: note: here
>     180 |         case 4:                                                         \
>         |         ^~~~
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4810:9: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    4810 |         raw_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c:961:22: note: in expansion of macro 'cmpxchg_relaxed'
>     961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
>         |                      ^~~~~~~~~~~~~~~
>   kernel/sched/sched.h: In function 'mm_cid_put_lazy':
>   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/sched.h:3292:14: note: in expansion of macro 'try_cmpxchg'
>    3292 |             !try_cmpxchg(&this_cpu_ptr(pcpu_cid)->cid, &cid, MM_CID_UNSET))
>         |              ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/sched.h:3292:14: note: in expansion of macro 'try_cmpxchg'
>    3292 |             !try_cmpxchg(&this_cpu_ptr(pcpu_cid)->cid, &cid, MM_CID_UNSET))
>         |              ^~~~~~~~~~~
>   kernel/sched/sched.h: In function 'mm_cid_get':
>   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/sched.h:3429:21: note: in expansion of macro 'try_cmpxchg'
>    3429 |                 if (try_cmpxchg(&this_cpu_ptr(pcpu_cid)->cid, &cid, MM_CID_UNSET))
>         |                     ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/sched.h:3429:21: note: in expansion of macro 'try_cmpxchg'
>    3429 |                 if (try_cmpxchg(&this_cpu_ptr(pcpu_cid)->cid, &cid, MM_CID_UNSET))
>         |                     ^~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_relaxed':
>   arch/riscv/include/asm/cmpxchg.h:179:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     179 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:180:9: note: here
>     180 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:212:30: note: in expansion of macro '__cmpxchg_relaxed'
>     212 |         (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),                   \
>         |                              ^~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:89:29: note: in expansion of macro 'arch_cmpxchg_relaxed'
>      89 | #define raw_cmpxchg_relaxed arch_cmpxchg_relaxed
>         |                             ^~~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>   kernel/sched/core.c: In function '__sched_mm_cid_migrate_from_try_steal_cid':
>   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11724:14: note: in expansion of macro 'try_cmpxchg'
>   11724 |         if (!try_cmpxchg(&src_pcpu_cid->cid, &src_cid, lazy_cid))
>         |              ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11724:14: note: in expansion of macro 'try_cmpxchg'
>   11724 |         if (!try_cmpxchg(&src_pcpu_cid->cid, &src_cid, lazy_cid))
>         |              ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11760:14: note: in expansion of macro 'try_cmpxchg'
>   11760 |         if (!try_cmpxchg(&src_pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
>         |              ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11760:14: note: in expansion of macro 'try_cmpxchg'
>   11760 |         if (!try_cmpxchg(&src_pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
>         |              ^~~~~~~~~~~
>   kernel/sched/core.c: In function 'task_mm_cid_work':
>   arch/riscv/include/asm/cmpxchg.h:333:25: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~
>   kernel/sched/core.c:11945:23: note: in expansion of macro 'cmpxchg'
>   11945 |                 res = cmpxchg(&mm->mm_cid_next_scan, old_scan, next_scan);
>         |                       ^~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~
>   kernel/sched/core.c:11945:23: note: in expansion of macro 'cmpxchg'
>   11945 |                 res = cmpxchg(&mm->mm_cid_next_scan, old_scan, next_scan);
>         |                       ^~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:333:25: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11953:14: note: in expansion of macro 'try_cmpxchg'
>   11953 |         if (!try_cmpxchg(&mm->mm_cid_next_scan, &old_scan, next_scan))
>         |              ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11953:14: note: in expansion of macro 'try_cmpxchg'
>   11953 |         if (!try_cmpxchg(&mm->mm_cid_next_scan, &old_scan, next_scan))
>         |              ^~~~~~~~~~~
>   kernel/sched/core.c: In function 'sched_mm_cid_remote_clear':
>   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11841:14: note: in expansion of macro 'try_cmpxchg'
>   11841 |         if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
>         |              ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11841:14: note: in expansion of macro 'try_cmpxchg'
>   11841 |         if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
>         |              ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11874:21: note: in expansion of macro 'try_cmpxchg'
>   11874 |                 if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
>         |                     ^~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
>     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4880:9: note: in expansion of macro 'raw_try_cmpxchg'
>    4880 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>         |         ^~~~~~~~~~~~~~~
>   kernel/sched/core.c:11874:21: note: in expansion of macro 'try_cmpxchg'
>   11874 |                 if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
>         |                     ^~~~~~~~~~~
>   kernel/sched/sched.h: In function 'mm_cid_pcpu_unset':
>   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~
>   kernel/sched/sched.h:3310:23: note: in expansion of macro 'cmpxchg'
>    3310 |                 res = cmpxchg(&this_cpu_ptr(pcpu_cid)->cid, cid, MM_CID_UNSET);
>         |                       ^~~~~~~
>   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>     334 |         case 4:                                                         \
>         |         ^~~~
>   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>         |                              ^~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>         |         ^~~~~~~~~~~
>   kernel/sched/sched.h:3310:23: note: in expansion of macro 'cmpxchg'
>    3310 |                 res = cmpxchg(&this_cpu_ptr(pcpu_cid)->cid, cid, MM_CID_UNSET);
>         |                       ^~~~~~~
> 
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > riscv:
> > >   build:
> > >     * clang-17-lkftconfig - Failed
> > >     * rv32-clang-17-defconfig - Failed
> > >     * clang-17-tinyconfig - Failed
> > >     * rv32-clang-17-tinyconfig - Failed
> > >     * clang-17-defconfig - Failed
> > >     * clang-17-allnoconfig - Failed
> > >     * rv32-clang-17-allnoconfig - Failed
> > >
> > > Build log:
> > > -------
> > > kernel/sched/core.c:961:15: error: incompatible pointer to integer
> > > conversion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node
> > > *') to parameter of type 'uintptr_t' (aka 'unsigned long')
> > > [-Wint-conversion]
> > >   961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
> > >       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > There is no recent change on this code. Could it be a change in
> > cmpxchg_relaxed ?
> 
> Yes, it is caused by commit df35ee400e06 ("riscv: Emulate one-byte and
> two-byte cmpxchg") in -next. There is another thread on this problem
> with a suggested diff that resolves it for me (there are other issues
> with that change as well such as break not being in the correct
> location):
> 
> https://lore.kernel.org/Zgz98szFLLjTIZSO@yujie-X299/
> 
> Cheers,
> Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
