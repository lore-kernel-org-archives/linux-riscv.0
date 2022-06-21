Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB4EC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tez0WMhDV08GYXinYHvIlghdirFkBIcFKJ3q+iP4Mvk=; b=y4n41W3Nzlne6B
	Yh4qt+hqkMuKtV1euKaleH+I4Wr1SC8TN8A+Os7c48JfW2EZPSfLBnDztjf+W4tQxfLT9oafMMDrS
	9Qh4nGaTpHzkTbvlMbwSxUxQNl6C6wYbI67S46LKCd0rD79fd7tECUGeusWHRT73fFrTfhyjXC+nc
	mAKiFHMUxkiTjTXwbB5spFYmKeiwrAxuizwg3H0aVT10n3fNmNY/EjxzPtE2XlvaVr78pmCh7UvN6
	dgUGQStgvYX1PkqyTPvYkxhmAaN3p/FFtOOSI2KrH3TT49A2GLO259QbK5CGty2shYSh0huSlhk3R
	m8aCWWSJ1KoqrrK/GBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3eis-005pke-9i; Tue, 21 Jun 2022 14:19:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3eip-005pjn-Au
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 14:19:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D13F6B817C7
	for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 14:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8481CC341C7
	for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655821152;
	bh=xsqhjkB45BEYmefcO9bNLsPwMxzS84jxJu4eErdAPd4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XsXGUm/rKsXlIkwgRhzFGeXH/BetaaT3jZ5R7jsxQ5/HRCiK4EtMVr8mj4dX9+7/d
	 zJWJ+1+Lkl+X0HkdDlfcfeuCyFQlYeL6G1Xp7RaWFe1PRe0v1037SsfEi2mwXgfB0X
	 CLy7J4qWxGfVpc51HoVrlB+PCDTke7quL+2PYBmPSf98gC9De8AuwGzNtqbggcAkiK
	 jnC6/jbH5AGlgjY6JniwFwKm9jTICLj3PFijPTBfFLgSyVbdyOEfSt+k3+puS7iTzQ
	 Sph10pVpAmosdT85RbAGi2vzInCQ5sHFTwgqn88TxyLAErreiYOgjZebrnAXZ0/rNP
	 nWsHMrFNWOFng==
Received: by mail-vk1-f179.google.com with SMTP id b81so6746511vkf.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 07:19:12 -0700 (PDT)
X-Gm-Message-State: AJIora8Kks49KZu8nCOq0pHutB97awb9V3sGxywdk5imrhBLrElNtCJY
	Uf0B55E4vrsEm6g8OS8wfgvQAly6G19hj8S5t88=
X-Google-Smtp-Source: AGRyM1uc5cR/RDQm7d1NEX92QyW/XotGEMoJ0yAFY4eRDjrsHuAXlh6ICLKpAfZp5Kg08D4AzgE4JZEPUzAVPdvS3Vk=
X-Received: by 2002:ac5:cdcc:0:b0:36c:547d:d9c4 with SMTP id
 u12-20020ac5cdcc000000b0036c547dd9c4mr1944089vkn.2.1655821151426; Tue, 21 Jun
 2022 07:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220620155404.1968739-1-guoren@kernel.org> <a498a2ff-2503-b25c-53c9-55f5f2480bf6@microchip.com>
In-Reply-To: <a498a2ff-2503-b25c-53c9-55f5f2480bf6@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 21 Jun 2022 22:19:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQXjGF-ZJs59zUq4iE_3-kkSgSaPc0dLzkL8KOYe4weAQ@mail.gmail.com>
Message-ID: <CAJF2gTQXjGF-ZJs59zUq4iE_3-kkSgSaPc0dLzkL8KOYe4weAQ@mail.gmail.com>
Subject: Re: [PATCH V5] riscv: Add qspinlock support
To: Conor.Dooley@microchip.com
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_071915_700120_E284899A 
X-CRM114-Status: GOOD (  35.34  )
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

Okay

On Mon, Jun 20, 2022 at 11:58 PM <Conor.Dooley@microchip.com> wrote:
>
>
>
> On 20/06/2022 16:54, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Enable qspinlock and meet the requirements mentioned in a8ad07e5240c9
> > ("asm-generic: qspinlock: Indicate the use of mixed-size atomics").
> >
> >  - RISC-V atomic_*_release()/atomic_*_acquire() are implemented with
> >    own relaxed version plus acquire/release_fence for RCsc
> >    synchronization.
> >
> >  - RISC-V LR/SC pairs could provide a strong/weak forward guarantee
> >    that depends on micro-architecture. And RISC-V ISA spec has given
> >    out several limitations to let hardware support strict forward
> >    guarantee (RISC-V User ISA - 8.3 Eventual Success of
> >    Store-Conditional Instructions). Some riscv cores such as BOOMv3
> >    & XiangShan could provide strict & strong forward guarantee (The
> >    cache line would be kept in an exclusive state for Backoff cycles,
> >    and only this core's interrupt could break the LR/SC pair).
> >
> >  - RISC-V could provide cheap atomic_fetch_or_acquire() with RCsc.
> >
> >  - RISC-V only provides relaxed xhg16 to support qspinlock.
> >
> > The first version of patch was made in 2019.1 [1]. The second version
> > was made in 2020.11 [2].
> >
> > [1] https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/#r
> > [2] https://lore.kernel.org/linux-riscv/1606225437-22948-2-git-send-email-guoren@kernel.org/
> >
> > Change V5:
> >  - Update comment with RISC-V forward guarantee feature.
> >  - Back to V3 direction and optimize asm code.
> >
> > Change V4:
> >  - Remove custom sub-word xchg implementation
> >  - Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32 in locking/qspinlock
> >
> > Change V3:
> >  - Coding convention by Peter Zijlstra's advices
> >
> > Change V2:
> >  - Coding convention in cmpxchg.h
> >  - Re-implement short xchg
> >  - Remove char & cmpxchg implementations
>
> Hey,
> How come the changelog is inside the commit message?
> I assume its a copy paste error..
> Thanks,
> Conor.
>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Waiman Long <longman@redhat.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig                      |  9 +++++++++
> >  arch/riscv/include/asm/Kbuild           |  4 ++--
> >  arch/riscv/include/asm/cmpxchg.h        | 16 ++++++++++++++++
> >  arch/riscv/include/asm/spinlock.h       | 12 ++++++++++++
> >  arch/riscv/include/asm/spinlock_types.h | 12 ++++++++++++
> >  5 files changed, 51 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/spinlock.h
> >  create mode 100644 arch/riscv/include/asm/spinlock_types.h
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 32ffef9f6e5b..3b0b117b4e95 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -333,6 +333,15 @@ config NODES_SHIFT
> >         Specify the maximum number of NUMA Nodes available on the target
> >         system.  Increases memory reserved to accommodate various tables.
> >
> > +config RISCV_USE_QUEUED_SPINLOCKS
> > +     bool "Using queued spinlock instead of ticket-lock"
> > +     depends on SMP && MMU
> > +     select ARCH_USE_QUEUED_SPINLOCKS
> > +     default y if NUMA
> > +     help
> > +       Make sure your micro arch LL/SC has a strong forward progress guarantee.
> > +       Otherwise, stay at ticket-lock.
> > +
> >  config RISCV_ALTERNATIVE
> >       bool
> >       depends on !XIP_KERNEL
> > diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> > index 504f8b7e72d4..e066ccab6417 100644
> > --- a/arch/riscv/include/asm/Kbuild
> > +++ b/arch/riscv/include/asm/Kbuild
> > @@ -2,10 +2,10 @@
> >  generic-y += early_ioremap.h
> >  generic-y += flat.h
> >  generic-y += kvm_para.h
> > +generic-y += mcs_spinlock.h
> >  generic-y += parport.h
> > -generic-y += spinlock.h
> > -generic-y += spinlock_types.h
> >  generic-y += qrwlock.h
> >  generic-y += qrwlock_types.h
> > +generic-y += qspinlock.h
> >  generic-y += user.h
> >  generic-y += vmlinux.lds.h
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > index 12debce235e5..f7f8e359d3ac 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -17,6 +17,22 @@
> >       __typeof__(new) __new = (new);                                  \
> >       __typeof__(*(ptr)) __ret;                                       \
> >       switch (size) {                                                 \
> > +     case 2:                                                         \
> > +             u32 temp;                                               \
> > +             u32 shif = ((ulong)__ptr & 2) ? 16 : 0;                 \
> > +             u32 mask = 0xffff << shif;                              \
> > +             __ptr = (__typeof__(ptr))((ulong)__ptr & ~(ulong)2);    \
> > +             __asm__ __volatile__ (                                  \
> > +                     "0:     lr.w %0, %2\n"                          \
> > +                     "       and  %1, %0, %z3\n"                     \
> > +                     "       or   %1, %1, %z4\n"                     \
> > +                     "       sc.w %1, %1, %2\n"                      \
> > +                     "       bnez %1, 0b\n"                          \
> > +                     : "=&r" (__ret), "=&r" (temp), "+A" (*__ptr)    \
> > +                     : "rJ" (~mask), "rJ" (__new << shif)            \
> > +                     : "memory");                                    \
> > +             __ret = (__ret & mask) >> shif;                         \
> > +             break;                                                  \
> >       case 4:                                                         \
> >               __asm__ __volatile__ (                                  \
> >                       "       amoswap.w %0, %2, %1\n"                 \
> > diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> > new file mode 100644
> > index 000000000000..fd3fd09cff52
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/spinlock.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_SPINLOCK_H
> > +#define __ASM_SPINLOCK_H
> > +
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +#include <asm/qspinlock.h>
> > +#include <asm/qrwlock.h>
> > +#else
> > +#include <asm-generic/spinlock.h>
> > +#endif
> > +
> > +#endif /* __ASM_SPINLOCK_H */
> > diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
> > new file mode 100644
> > index 000000000000..9281237b5f4e
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/spinlock_types.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_SPINLOCK_TYPES_H
> > +#define __ASM_SPINLOCK_TYPES_H
> > +
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +#include <asm-generic/qspinlock_types.h>
> > +#include <asm-generic/qrwlock_types.h>
> > +#else
> > +#include <asm-generic/spinlock_types.h>
> > +#endif
> > +
> > +#endif /* __ASM_SPINLOCK_TYPES_H */



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
