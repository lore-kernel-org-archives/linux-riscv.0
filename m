Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3438C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:11:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765F461A02
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765F461A02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fXVjUMKhO5mH4iSv81lLo2Z9PhE/JogDqynG8awN1p8=; b=khbcWsF9wnjPfMvOMdh2z+9Rz
	X4VJGXalP+cru/KT9F7xJrWUJcgo26TOmMfFbFmp7Ka8Gsy1AXnIM1QMZPWEcRHI7+hRutUva9nTc
	tzqtZUTV6PSEA/z2X+xS1i6Z0m+RKntGjyO2xD9C1TQpuEQqe7Iq55oRtifa8H3CNM5ePjc0esYJh
	34EvYp7QSq4kpMvCn8Vtsp4JeDep9LASMVOVtaF1qwCZczCPU7V0BLyZgQMipt+RosfO2FtyzBSTL
	XgbickeHAxI6tRC/0A/rP0U2gf/9FSUlTx5sbdWA2J5eqLd3AN2IplyHrK+yLaIbfRNhXrOA8QgJm
	ehchZiXMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP2Ly-00H1Wf-83; Wed, 24 Mar 2021 12:11:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP2Lu-00H1WK-6I
 for linux-riscv@lists.infradead.org; Wed, 24 Mar 2021 12:11:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3B0D61A0B
 for <linux-riscv@lists.infradead.org>; Wed, 24 Mar 2021 12:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616587863;
 bh=kEx0TIsJHajLeIyFUwPJAU5kpomMAoLZGOL83edNDYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AnSjMG9UhEB4+85PdfpildgQIi/Yq58nviKe6bZkBkVeXl/4OMOhzilxaoK5MqKhJ
 kvzWlpvlIhUG8JNvkVzUlU3g5UiUl4btFKKJiYg/bu6cbuwUKghX7vwudnOj6P8Gk7
 rvlXPJy761kqBC76BhZ1+wLV/y750e8e5CBV0edSKzqi95C9xNv1PQ5QD4jbr9z3gy
 TMa7jNLIC+mqs+qlQ4BmkdO8+W5ngc5X80y9f3G18/1FLsnF5BEn2ErmUjU+A9G9Ka
 N7GHZZATIKFxcGEE8QhEoZBYr2Nyt3w8Dpo/xdR7Unksp79H7KYOMxtiOvvxdoSdRV
 Tr1FshV3f1I4g==
Received: by mail-lj1-f179.google.com with SMTP id f16so29944143ljm.1
 for <linux-riscv@lists.infradead.org>; Wed, 24 Mar 2021 05:11:02 -0700 (PDT)
X-Gm-Message-State: AOAM531BFASoEEzV8s6O35+ow8ZUFllKbM0giCVCeQejsCQYG17uFsoi
 mPvsyax/jUpaOAGGAS5FVlVk8i/u/oUhbqXIn8A=
X-Google-Smtp-Source: ABdhPJzViXtP8zyzgXEgbL2g8vAs/9lwuvKdvQdVrCRF9Rz67/eCIn1+cEAu3zCO2mhfx2EctG6Feq95zSC122HKV9w=
X-Received: by 2002:a2e:994e:: with SMTP id r14mr1940414ljj.115.1616587861091; 
 Wed, 24 Mar 2021 05:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <1616580892-80815-1-git-send-email-guoren@kernel.org>
 <YFsd7A6xzrWXi1l5@hirez.programming.kicks-ass.net>
In-Reply-To: <YFsd7A6xzrWXi1l5@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 24 Mar 2021 20:10:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTuraEf7uzVYJfZhFT3cGAo8w8AhLUuj8H-+TKFBmWk0A@mail.gmail.com>
Message-ID: <CAJF2gTTuraEf7uzVYJfZhFT3cGAo8w8AhLUuj8H-+TKFBmWk0A@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_121110_679545_F4A0294D 
X-CRM114-Status: GOOD (  12.77  )
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

Thx Peter,

On Wed, Mar 24, 2021 at 7:09 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Mar 24, 2021 at 10:14:52AM +0000, guoren@kernel.org wrote:
> > +static inline void arch_spin_lock(arch_spinlock_t *lock)
> > +{
> > +     arch_spinlock_t lockval;
> > +     u32 tmp;
> > +
> > +     asm volatile (
> > +             "1:     lr.w    %0, %2          \n"
> > +             "       mv      %1, %0          \n"
> > +             "       addw    %0, %0, %3      \n"
> > +             "       sc.w    %0, %0, %2      \n"
> > +             "       bnez    %0, 1b          \n"
> > +             : "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
> > +             : "r" (1 << TICKET_NEXT)
> > +             : "memory");
> >
> > +     while (lockval.tickets.next != lockval.tickets.owner) {
> > +             /*
> > +              * FIXME - we need wfi/wfe here to prevent:
> > +              *  - cache line bouncing
> > +              *  - saving cpu pipeline in multi-harts-per-core
> > +              *    processor
> > +              */
> > +             lockval.tickets.owner = READ_ONCE(lock->tickets.owner);
> > +     }
> >
> > +     __atomic_acquire_fence();
> >  }
>
> > +static inline void arch_spin_unlock(arch_spinlock_t *lock)
> >  {
> > +     smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
> > +     /* FIXME - we need ipi/sev here to notify above */
> >  }
>
> Urgh, are you saying your WFE requires an explicit SEV like on ARM ? The
Yes, I'm considering that kind of code.

> ARM64 model is far superious IMO, and then you can use
> smp_cond_load_acquire() in arch_spin_lock() and call it a day.
Great tip, thx. I'll follow that.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
