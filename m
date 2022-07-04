Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049CEC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=us1Nx3XWTl8NWh7eHBidQgUf7QpI5OTYwKpVhS4kW6U=; b=lJnnIZlynwyhGl
	4jChgxZwKqyHdipLyZQKxfbKMwg6KctKVB8PTHLUSaqoaHsJtM/U3FX9x0fdVntDr9S5FMeKUaKv/
	7UhPZxbdG1Ml3aZ77Q/8dLFHv2BXGszQV7Wxm69Xz3w/8V6MWi3D/Wv9d7TbX7QElUxb6o4fOwaU2
	vxbT1osGrAlaXjx73OSD8G3H9Q+3WjBX1qK5rq//1zks1eNGZRRxYj70jP0TLynqvBN9hMNItZpog
	y/huMwcbQeDAp9OZ9LMSWEi+1hGIHb0xC6IfD15UJ5kT6Ien7b9ltJcUxCQZ5jl1ZLvHdCwxqW6pQ
	QeI2G24yvymXmkkqNDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Ltl-0094nG-GA; Mon, 04 Jul 2022 13:13:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Lti-0094lc-6b
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 13:13:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D3DA61507
	for <linux-riscv@lists.infradead.org>; Mon,  4 Jul 2022 13:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA39C341D2
	for <linux-riscv@lists.infradead.org>; Mon,  4 Jul 2022 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656940432;
	bh=CnKu3pTL9ZV3Laktxm3fz0s92pUc309Wza4i12uMZA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EaaC/y+r08Ug4xq29Xnk/jjaBHSJIPDNoaCHC0b/bAx+JVx+f6YzaqsG8YO83diLS
	 SFPYAoVDfMfXJQJD/W0LOBBXmwmJ3jrrjjaLojBlkNg1fEXBr/3IY6eghs3NMv6lkp
	 z8NkcUWQDBMIBJp0HnyYDQTuKk/rLTWDumEsc8EJXMGYBWqYdBWk1esVPkRU0LUwSl
	 zTWobsK706iNXOcqoaIANgtvgS859Raf4+f+hrFhfoPuyTQIG/jieterfpUTViPfIp
	 zE9jYjjlHi0Repf0ncUxtmQ8Ec1naa9T9avVRirfX130JYXgQpXc1sS3d7YjNpT4qT
	 SqmqvEFiPDG6g==
Received: by mail-vs1-f46.google.com with SMTP id j1so8948610vsj.12
        for <linux-riscv@lists.infradead.org>; Mon, 04 Jul 2022 06:13:52 -0700 (PDT)
X-Gm-Message-State: AJIora+Av5b+x+IIODnqK+PEkAvS9noGhytYJtj5B6+U7SOjnktrrkiE
	YgJCYJIaovDAg7tPjWo2i8kcVtupfFl95RPOJpg=
X-Google-Smtp-Source: AGRyM1tD+SQ1O1/eCXYDM8ZsBci+DT3mFEDYXzJs0l8d77mK4FOk06vvvdrUL72SOGsiGSdxG0ZUKNYexmkzw5KcMLI=
X-Received: by 2002:a67:ae0e:0:b0:356:c48b:401d with SMTP id
 x14-20020a67ae0e000000b00356c48b401dmr2244055vse.51.1656940431259; Mon, 04
 Jul 2022 06:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220628081707.1997728-1-guoren@kernel.org> <20220628081707.1997728-5-guoren@kernel.org>
 <YsK5o8eiVHeS+7Iw@hirez.programming.kicks-ass.net>
In-Reply-To: <YsK5o8eiVHeS+7Iw@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 4 Jul 2022 21:13:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ0cmGJHPR=TzeDJDigiEgBL5-KabbR2WkS=dGJV7jSJA@mail.gmail.com>
Message-ID: <CAJF2gTQ0cmGJHPR=TzeDJDigiEgBL5-KabbR2WkS=dGJV7jSJA@mail.gmail.com>
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
To: Peter Zijlstra <peterz@infradead.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_061354_358406_01808F70 
X-CRM114-Status: GOOD (  29.25  )
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

On Mon, Jul 4, 2022 at 5:58 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jun 28, 2022 at 04:17:06AM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Some architecture has a flexible requirement on the type of spinlock.
> > Some LL/SC architectures of ISA don't force micro-arch to give a strong
> > forward guarantee. Thus different kinds of memory model micro-arch would
> > come out in one ISA. The ticket lock is suitable for exclusive monitor
> > designed LL/SC micro-arch with limited cores and "!NUMA". The
> > queue-spinlock could deal with NUMA/large-scale scenarios with a strong
> > forward guarantee designed LL/SC micro-arch.
> >
> > So, make the spinlock a combo with feature.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  include/asm-generic/spinlock.h | 43 ++++++++++++++++++++++++++++++++--
> >  kernel/locking/qspinlock.c     |  2 ++
> >  2 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> > index f41dc7c2b900..a9b43089bf99 100644
> > --- a/include/asm-generic/spinlock.h
> > +++ b/include/asm-generic/spinlock.h
> > @@ -28,34 +28,73 @@
> >  #define __ASM_GENERIC_SPINLOCK_H
> >
> >  #include <asm-generic/ticket_spinlock.h>
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +#include <linux/jump_label.h>
> > +#include <asm-generic/qspinlock.h>
> > +
> > +DECLARE_STATIC_KEY_TRUE(use_qspinlock_key);
> > +#endif
> > +
> > +#undef arch_spin_is_locked
> > +#undef arch_spin_is_contended
> > +#undef arch_spin_value_unlocked
> > +#undef arch_spin_lock
> > +#undef arch_spin_trylock
> > +#undef arch_spin_unlock
> >
> >  static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
> >  {
> > -     ticket_spin_lock(lock);
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +     if (static_branch_likely(&use_qspinlock_key))
> > +             queued_spin_lock(lock);
> > +     else
> > +#endif
> > +             ticket_spin_lock(lock);
> >  }
> >
> >  static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
> >  {
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +     if (static_branch_likely(&use_qspinlock_key))
> > +             return queued_spin_trylock(lock);
> > +#endif
> >       return ticket_spin_trylock(lock);
> >  }
> >
> >  static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
> >  {
> > -     ticket_spin_unlock(lock);
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +     if (static_branch_likely(&use_qspinlock_key))
> > +             queued_spin_unlock(lock);
> > +     else
> > +#endif
> > +             ticket_spin_unlock(lock);
> >  }
> >
> >  static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
> >  {
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +     if (static_branch_likely(&use_qspinlock_key))
> > +             return queued_spin_is_locked(lock);
> > +#endif
> >       return ticket_spin_is_locked(lock);
> >  }
> >
> >  static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> >  {
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +     if (static_branch_likely(&use_qspinlock_key))
> > +             return queued_spin_is_contended(lock);
> > +#endif
> >       return ticket_spin_is_contended(lock);
> >  }
> >
> >  static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> >  {
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +     if (static_branch_likely(&use_qspinlock_key))
> > +             return queued_spin_value_unlocked(lock);
> > +#endif
> >       return ticket_spin_value_unlocked(lock);
> >  }
>
> Urggghhhh....
>
> I really don't think you want this in generic code. Also, I'm thinking
> any arch that does this wants to make sure it doesn't inline any of this
Your advice is the same with Arnd, I would move static_branch out of generic.

> stuff. That is, said arch must not have ARCH_INLINE_SPIN_*
What do you mean? I've tested with ARCH_INLINE_SPIN_* and it's okay
with EXPORT_SYMBOL(use_qspinlock_key).

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 47e12ab9c822..4587fb544326 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -32,6 +32,32 @@ config RISCV
        select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
        select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
        select ARCH_HAS_UBSAN_SANITIZE_ALL
+       select ARCH_INLINE_READ_LOCK if !PREEMPTION
+       select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
+       select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION
+       select ARCH_INLINE_READ_LOCK_IRQSAVE if !PREEMPTION
+       select ARCH_INLINE_READ_UNLOCK if !PREEMPTION
+       select ARCH_INLINE_READ_UNLOCK_BH if !PREEMPTION
+       select ARCH_INLINE_READ_UNLOCK_IRQ if !PREEMPTION
+       select ARCH_INLINE_READ_UNLOCK_IRQRESTORE if !PREEMPTION
+       select ARCH_INLINE_WRITE_LOCK if !PREEMPTION
+       select ARCH_INLINE_WRITE_LOCK_BH if !PREEMPTION
+       select ARCH_INLINE_WRITE_LOCK_IRQ if !PREEMPTION
+       select ARCH_INLINE_WRITE_LOCK_IRQSAVE if !PREEMPTION
+       select ARCH_INLINE_WRITE_UNLOCK if !PREEMPTION
+       select ARCH_INLINE_WRITE_UNLOCK_BH if !PREEMPTION
+       select ARCH_INLINE_WRITE_UNLOCK_IRQ if !PREEMPTION
+       select ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE if !PREEMPTION
+       select ARCH_INLINE_SPIN_TRYLOCK if !PREEMPTION
+       select ARCH_INLINE_SPIN_TRYLOCK_BH if !PREEMPTION
+       select ARCH_INLINE_SPIN_LOCK if !PREEMPTION
+       select ARCH_INLINE_SPIN_LOCK_BH if !PREEMPTION
+       select ARCH_INLINE_SPIN_LOCK_IRQ if !PREEMPTION
+       select ARCH_INLINE_SPIN_LOCK_IRQSAVE if !PREEMPTION
+       select ARCH_INLINE_SPIN_UNLOCK if !PREEMPTION
+       select ARCH_INLINE_SPIN_UNLOCK_BH if !PREEMPTION
+       select ARCH_INLINE_SPIN_UNLOCK_IRQ if !PREEMPTION
+       select ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE if !PREEMPTION
        select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
        select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
        select ARCH_STACKWALK

Shall I add the above diff in the next version of the patch series?

>
> And if you're going to force things out of line, then I think you can
> get better code using static_call().
Good point, thx.

>
> *shudder*...



--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
