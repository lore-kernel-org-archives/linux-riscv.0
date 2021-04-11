Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB1EC433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 16:51:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41BDC610A2
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 16:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41BDC610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JQQpyCokiw68v8NNACPMDLGMBooDv6wytDS3IYwLVrA=; b=n4m42v2n+W8RCPcoo1rOh62UF
	j/CtzCAc7a9cGmGLE5La0Q7d9kC1p1Tbzwdt0yQRtNlHta8XwLwN60TkmholQ9qVqDULkUQn5IiwK
	op7mF7v6M5sRjMFt/cBdNvR7eQj/l88nWtQxxdo/JUlW8VxVsaf0oIIrSP8omPdm5SoBm6/iu9FyI
	PkLqrSX3mvjkSHc163HuecLv9DCchNKYej83OxzCFXpbqogX3+ohmYROtLKMWtU6dNdNHJYOGNBnN
	ztVpC/N6nDFWbAS+8OunMjieF1NXM9Qt+B/vcZi2EHIsbLbID+VQvqg3eSp4xaxjO54ASQ2lz/3RA
	4qrZU7bcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVdIx-004mq9-El; Sun, 11 Apr 2021 16:51:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVdIv-004mq3-9F
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 16:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jJSH1nH1qe9xY4Moz9qedRRkbZegjukeIMy7lX53poQ=; b=BMLGHqKRuwkL1Z2/hQuPVfS4gB
 lVb9lRrvyZWfT5m4GZZkDhNCDBgyhp9chYZkazPXVmrg9LQeD7jJ/MSQzW6nlsTocbnDyDA8l/TY0
 tOPHta/yB5lt3FYW3yxMvEw3xmYRIYGwnPZkl+KcVwvTR/cFOtTcD3TzMIhgS8/0FNUKueSrTWPvr
 SjaEKwisQaQbkBEbOWKpHQwh2SM9QTru7O8iMHpzqB2VuGiVvIDxtUk5uOrSInsIadqWKQAykkzcH
 lWR7SlXcPeAseHl7tDvP8OS6NpEF1EL/RFEwikzYQm8j6tdODiBs91HdSM6Brc9kMHzJPhd2ehOSS
 aa98AryA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVdIs-005bib-5m
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 16:51:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F24FD610A2
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618159877;
 bh=hdSLHeSFPSGynlGflxt+p7hzQD3ysw8VuEPN1TxHROo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u92ZNmVK9Okwh6sssywhSfccMkrhyVbN0i1TzFQL6ubJe69Tup7uioO2B9iqMd86R
 PyZ0nIQIDEDoAUcp4VH3s3x2J9YyjO1zaUEf9DXia28SOTL+AZwrnhWgZObeZK35IP
 Mworx49ICMEC1ZgjZOImQCDKTztZLllqG/G/tp0f0ABdVW6WKi7ogEnZtNlnYGmPa+
 MD6EfRtXCYXjrj3jRMIr4dmsz4f0usPxap0g6auXFA0M/p8yMcdcHUVSzB1kZJoz1R
 fipLWLnhth24IQWAQi0DnJ53iaGzHPfzM1CfxsJ9DLxzUApTJSn1eIRnqbr7xsq9Gx
 f15Nu2dLaaTdA==
Received: by mail-lf1-f42.google.com with SMTP id n138so17564225lfa.3
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 09:51:16 -0700 (PDT)
X-Gm-Message-State: AOAM530xIwOo1EB51zkUfd+HCGU4WaAjpPb7tueb6A76GBdVJNYqzBe/
 jEqCo4g30J6+Z4pbXsHgG3M2CUZy6aDdgNVeFvY=
X-Google-Smtp-Source: ABdhPJwytlwOM+Rr5ik6o9Gt0Np/mypGW3IwYId67m7mmduUv1Bjo9G3FOhKEOOdYbF0Wmx6IQxmHYMGzhwXowpdgyc=
X-Received: by 2002:ac2:4191:: with SMTP id z17mr5521549lfh.557.1618159875345; 
 Sun, 11 Apr 2021 09:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-4-git-send-email-guoren@kernel.org>
 <CAJF2gTQRGWetpvvtXOn8_KzH8EQwL6VG02AoKBUWTkE69Xn6Kg@mail.gmail.com>
In-Reply-To: <CAJF2gTQRGWetpvvtXOn8_KzH8EQwL6VG02AoKBUWTkE69Xn6Kg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 12 Apr 2021 00:51:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQpmgzXb+oi3uHuQ5e1awS2AwOtm4XJo8ce6pVkuXst+Q@mail.gmail.com>
Message-ID: <CAJF2gTQpmgzXb+oi3uHuQ5e1awS2AwOtm4XJo8ce6pVkuXst+Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] riscv: locks: Introduce ticket-based spinlock
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 linux-xtensa@linux-xtensa.org, openrisc@lists.librecores.org, 
 sparclinux <sparclinux@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_095118_287871_9F2DE26A 
X-CRM114-Status: GOOD (  30.48  )
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

On Mon, Apr 12, 2021 at 12:02 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Mar 31, 2021 at 10:32 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This patch introduces a ticket lock implementation for riscv, along the
> > same lines as the implementation for arch/arm & arch/csky.
> >
> > We still use qspinlock as default.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/riscv/Kconfig                      |  7 ++-
> >  arch/riscv/include/asm/spinlock.h       | 84 +++++++++++++++++++++++++
> >  arch/riscv/include/asm/spinlock_types.h | 17 +++++
> >  3 files changed, 107 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 67cc65ba1ea1..34d0276f01d5 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -34,7 +34,7 @@ config RISCV
> >         select ARCH_WANT_FRAME_POINTERS
> >         select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> >         select ARCH_USE_QUEUED_RWLOCKS
> > -       select ARCH_USE_QUEUED_SPINLOCKS
> > +       select ARCH_USE_QUEUED_SPINLOCKS        if !RISCV_TICKET_LOCK
> >         select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
> >         select CLONE_BACKWARDS
> >         select CLINT_TIMER if !MMU
> > @@ -344,6 +344,11 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
> >         def_bool y
> >         depends on NUMA
> >
> > +config RISCV_TICKET_LOCK
> > +       bool "Ticket-based spin-locking"
> > +       help
> > +         Say Y here to use ticket-based spin-locking.
> > +
> >  config RISCV_ISA_C
> >         bool "Emit compressed instructions when building Linux"
> >         default y
> > diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> > index a557de67a425..90b7eaa950cf 100644
> > --- a/arch/riscv/include/asm/spinlock.h
> > +++ b/arch/riscv/include/asm/spinlock.h
> > @@ -7,7 +7,91 @@
> >  #ifndef _ASM_RISCV_SPINLOCK_H
> >  #define _ASM_RISCV_SPINLOCK_H
> >
> > +#ifdef CONFIG_RISCV_TICKET_LOCK
> > +#ifdef CONFIG_32BIT
> > +#define __ASM_SLLIW "slli\t"
> > +#define __ASM_SRLIW "srli\t"
> > +#else
> > +#define __ASM_SLLIW "slliw\t"
> > +#define __ASM_SRLIW "srliw\t"
> > +#endif
> > +
> > +/*
> > + * Ticket-based spin-locking.
> > + */
> > +static inline void arch_spin_lock(arch_spinlock_t *lock)
> > +{
> > +       arch_spinlock_t lockval;
> > +       u32 tmp;
> > +
> > +       asm volatile (
> > +               "1:     lr.w    %0, %2          \n"
> > +               "       mv      %1, %0          \n"
> > +               "       addw    %0, %0, %3      \n"
> > +               "       sc.w    %0, %0, %2      \n"
> > +               "       bnez    %0, 1b          \n"
> > +               : "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
> > +               : "r" (1 << TICKET_NEXT)
> > +               : "memory");
> > +
> > +       smp_cond_load_acquire(&lock->tickets.owner,
> > +                                       VAL == lockval.tickets.next);
> It's wrong, blew is fixup:
>
> diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
> index fe98ad8ece51..2be627ceb9df 100644
> --- a/arch/csky/include/asm/spinlock.h
> +++ b/arch/csky/include/asm/spinlock.h
> @@ -27,7 +27,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>                 : "r"(p), "r"(ticket_next)
>                 : "cc");
>
> -       smp_cond_load_acquire(&lock->tickets.owner,
> +       if (lockval.owner != lockval.tickets.next)
> +               smp_cond_load_acquire(&lock->tickets.owner,
>                                         VAL == lockval.tickets.next);
eh... plus __smp_acquire_fence:

       if (lockval.owner != lockval.tickets.next)
               smp_cond_load_acquire(&lock->tickets.owner,
                                        VAL == lockval.tickets.next);
       else
               __smp_acquire_fence();

> > +}
> > +
> > +static inline int arch_spin_trylock(arch_spinlock_t *lock)
> > +{
> > +       u32 tmp, contended, res;
> > +
> > +       do {
> > +               asm volatile (
> > +               "       lr.w    %0, %3          \n"
> > +               __ASM_SRLIW    "%1, %0, %5      \n"
> > +               __ASM_SLLIW    "%2, %0, %5      \n"
> > +               "       or      %1, %2, %1      \n"
> > +               "       li      %2, 0           \n"
> > +               "       sub     %1, %1, %0      \n"
> > +               "       bnez    %1, 1f          \n"
> > +               "       addw    %0, %0, %4      \n"
> > +               "       sc.w    %2, %0, %3      \n"
> > +               "1:                             \n"
> > +               : "=&r" (tmp), "=&r" (contended), "=&r" (res),
> > +                 "+A" (lock->lock)
> > +               : "r" (1 << TICKET_NEXT), "I" (TICKET_NEXT)
> > +               : "memory");
> > +       } while (res);
> > +
> > +       if (!contended)
> > +               __atomic_acquire_fence();
> > +
> > +       return !contended;
> > +}
> > +
> > +static inline void arch_spin_unlock(arch_spinlock_t *lock)
> > +{
> > +       smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
> > +}
> > +
> > +static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> > +{
> > +       return lock.tickets.owner == lock.tickets.next;
> > +}
> > +
> > +static inline int arch_spin_is_locked(arch_spinlock_t *lock)
> > +{
> > +       return !arch_spin_value_unlocked(READ_ONCE(*lock));
> > +}
> > +
> > +static inline int arch_spin_is_contended(arch_spinlock_t *lock)
> > +{
> > +       struct __raw_tickets tickets = READ_ONCE(lock->tickets);
> > +
> > +       return (tickets.next - tickets.owner) > 1;
> > +}
> > +#define arch_spin_is_contended arch_spin_is_contended
> > +#else /* CONFIG_RISCV_TICKET_LOCK */
> >  #include <asm/qspinlock.h>
> > +#endif /* CONFIG_RISCV_TICKET_LOCK */
> > +
> >  #include <asm/qrwlock.h>
> >
> >  #endif /* _ASM_RISCV_SPINLOCK_H */
> > diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
> > index d033a973f287..afbb19841d0f 100644
> > --- a/arch/riscv/include/asm/spinlock_types.h
> > +++ b/arch/riscv/include/asm/spinlock_types.h
> > @@ -10,7 +10,24 @@
> >  # error "please don't include this file directly"
> >  #endif
> >
> > +#ifdef CONFIG_RISCV_TICKET_LOCK
> > +#define TICKET_NEXT    16
> > +
> > +typedef struct {
> > +       union {
> > +               u32 lock;
> > +               struct __raw_tickets {
> > +                       /* little endian */
> > +                       u16 owner;
> > +                       u16 next;
> > +               } tickets;
> > +       };
> > +} arch_spinlock_t;
> > +
> > +#define __ARCH_SPIN_LOCK_UNLOCKED      { { 0 } }
> > +#else
> >  #include <asm-generic/qspinlock_types.h>
> > +#endif
> >  #include <asm-generic/qrwlock_types.h>
> >
> >  #endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
> > --
> > 2.17.1
> >
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
