Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25927C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 23:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zjZb6mkg4gmKr+Zz5KY3ahnRxT6+k6CJVnJkWGX6UaM=; b=xw95kCIcVVp6usBft6q/Jyqn4U
	tr0ZRTUjunIDYsIV6Y5rqq3gjV4RMijULVdrS1sl2fFokmrnLTZTlDI/Hm9BXajrOG20FpZdJK6U5
	ZHzwxlwOQII//kwJJvcg+g2skBJj2N9tXJ+ToWjzRt++vWVRVGuSZa7MtlOSbC/SVxGRhauo/EZhI
	OZXY2YYtLdSBXlAnfb6JGkzLecVLZcWBtNOBDdFW/HplobclqH7FVHBkFQ5OqKgqskhspKt61be+U
	vyeG7xA0/XIFQioFVayYu5FnQvPAmAh28j/7d6npH4gsWawu0VtWB8iV4L5Fbt9To8857HEw81Oiq
	v/0qiu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3QY8-00FQVE-0y; Thu, 08 Dec 2022 23:43:32 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3QY4-00FQSv-EX
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 23:43:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so6292257pjr.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 15:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePDFrC+thmFKubnseAgrLw6hx5tkMLW2pB1aGB33i8k=;
        b=ETvh9Z942KL/R/XGRFZOyuuyPHZNbVinppk1Sb1qW1ObiYcVxGuxTRnO48fS0NQT9u
         E3KyqcaiO7e7OJ1N1DCUKD9O5WLND9MR3gOIH7CaUpLDxHLrp6WbPCVTkp/oZjAD2TiG
         /Y1KIvehUnVmAjlMS1FAVYv+r83v9cRAh7fI5VzEEhIzwFE3ahKuaZ+dghOk8yUUHWB8
         QTRL/5+ZYVGkG8MLCe2Ikji1gkxp8TEly8F7eZdGy5lNK0aPNbiTOGVBIAz7888wRO+X
         E9GHXvxziy3GqGAoZyi7rPT2zuwvuJnytWTvdYLTwuIOor3oZDCffTzpaQsm/j084Lob
         9lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePDFrC+thmFKubnseAgrLw6hx5tkMLW2pB1aGB33i8k=;
        b=edNoIht1r2p4wGq8ePitcRAhBY0sG+Fm7v2BeuCyP7zc743EjJBIkewew7MzqZJzd5
         xzIHNIEDFt4X7sSQ9JDPQY+hvG5eQ0cqsAy5Aa6Mw62CVmeND1QOQ+fdQBKcgRcdo8kW
         TrJWkofqt9+52yn6HiCJWZ3xJnSRK/5fuBAATQTSf2Buai/DywSQLnxTFV6BXq2F6gNz
         mnziLJj0rEBC/098DjsHTVr1EKgMO0YDQ2G5DP4vNMA27lqa6TGjJeu5Mhx3wOV4BlBq
         M+jXpHCLUb94J3cFLKjkVWDcbzy/ct1uf2mbYVacqsZyM0Xjlx227x7W2n49Ng75tClr
         shtQ==
X-Gm-Message-State: ANoB5pmMN9Lh76dmUu7ZsEOG4wlZIcbL98wlU8uYSgwGOwqkZ3P9NWY9
	4sA6Axp3hvEU+4eu8jgyiAADFQ==
X-Google-Smtp-Source: AA0mqf5DR0tcvY2AOeNpUkj5TsILmq0lZ3WtCpY23k4tx7T67EYDrtQ7LWw6uKC3voHRN92tpPRQcw==
X-Received: by 2002:a17:902:6901:b0:188:c395:1756 with SMTP id j1-20020a170902690100b00188c3951756mr3202737plk.41.1670543002862;
        Thu, 08 Dec 2022 15:43:22 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e5c200b00186c5e8a8d7sm17226959plf.171.2022.12.08.15.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 15:43:21 -0800 (PST)
Date: Thu, 08 Dec 2022 15:43:21 -0800 (PST)
X-Google-Original-Date: Thu, 08 Dec 2022 15:42:19 PST (-0800)
Subject: Re: [PATCH] RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path
In-Reply-To: <CAJF2gTTZS0YG_C=YkYB+8X78_7Aqp2fmfJrLvSjPLCT34CXjnA@mail.gmail.com>
CC: abrestic@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Atish Patra <atishp@rivosinc.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-004caa98-a957-474e-a5e9-61338d0c3789@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_154328_707136_DC09046F 
X-CRM114-Status: GOOD (  48.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Nov 2022 07:54:47 PST (-0800), guoren@kernel.org wrote:
> On Mon, Nov 14, 2022 at 11:42 PM Andrew Bresticker
> <abrestic@rivosinc.com> wrote:
>>
>> On Mon, Nov 14, 2022 at 10:31 AM Conor Dooley
>> <conor.dooley@microchip.com> wrote:
>> >
>> > On Mon, Nov 14, 2022 at 10:20:30AM -0500, Andrew Bresticker wrote:
>> > > On Mon, Nov 14, 2022 at 9:43 AM Guo Ren <guoren@kernel.org> wrote:
>> > > >
>> > > > On Sat, Nov 12, 2022 at 6:31 AM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>> > > > >
>> > > > > The return to userspace path in entry.S may enable interrupts without the
>> > > > > corresponding lockdep annotation, producing a splat[0] when DEBUG_LOCKDEP
>> > > > > is enabled. Simply calling __trace_hardirqs_on() here gets a bit messy
>> > > > > due to the use of RA to point back to ret_from_exception, so just move
>> > > > > the whole slow-path loop into C. It's more readable and it lets us use
>> > > > > local_irq_{enable,disable}(), avoiding the need for manual annotations
>> > > > > altogether.
>> > > > Could generic_entry solve your problem? please try:
>> > > > https://lore.kernel.org/linux-riscv/20221103075047.1634923-1-guoren@kernel.org/
>> > >
>> > > Indeed it does, as I mentioned below, however it wasn't clear to me
>> > > how close your series was to landing so I'v emailed this small fix for
>> > > the existing bug in case your series does not make it into 6.2
>> >
>> > The backportablilty of this 26+, 26- change has to be considered too.
>> > The generic entry patchset has 20x the changes and would not ordinarily
>> > be stable material. How much of that series would be required to solve
>> > the problem?
>>
>> We'd need up to patch 6, "riscv: convert to generic entry":
>> https://lore.kernel.org/linux-riscv/20221103075047.1634923-7-guoren@kernel.org/
> Yes, but 6 needs 1 and 5, and they are very small patches.

I'm just going to take this one, for the ease of backporting.  The 
generic entry one keeps getting re-spun and I'm not sure it'll be in 
time for 6.2, so at least this way we can get the fix in now.

I've merge th is just on top of 6.1-rc1, so it's easier to deal with any 
conflicts later.

Thanks!

>
>>
>> -Andrew
>>
>> >
>> > > >
>> > > > >
>> > > > > [0]:
>> > > > >   ------------[ cut here ]------------
>> > > > >   DEBUG_LOCKS_WARN_ON(!lockdep_hardirqs_enabled())
>> > > > >   WARNING: CPU: 2 PID: 1 at kernel/locking/lockdep.c:5512 check_flags+0x10a/0x1e0
>> > > > >   Modules linked in:
>> > > > >   CPU: 2 PID: 1 Comm: init Not tainted 6.1.0-rc4-00160-gb56b6e2b4f31 #53
>> > > > >   Hardware name: riscv-virtio,qemu (DT)
>> > > > >   epc : check_flags+0x10a/0x1e0
>> > > > >   ra : check_flags+0x10a/0x1e0
>> > > > >   <snip>
>> > > > >    status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
>> > > > >   [<ffffffff808edb90>] lock_is_held_type+0x78/0x14e
>> > > > >   [<ffffffff8003dae2>] __might_resched+0x26/0x22c
>> > > > >   [<ffffffff8003dd24>] __might_sleep+0x3c/0x66
>> > > > >   [<ffffffff80022c60>] get_signal+0x9e/0xa70
>> > > > >   [<ffffffff800054a2>] do_notify_resume+0x6e/0x422
>> > > > >   [<ffffffff80003c68>] ret_from_exception+0x0/0x10
>> > > > >   irq event stamp: 44512
>> > > > >   hardirqs last  enabled at (44511): [<ffffffff808f901c>] _raw_spin_unlock_irqrestore+0x54/0x62
>> > > > >   hardirqs last disabled at (44512): [<ffffffff80008200>] __trace_hardirqs_off+0xc/0x14
>> > > > >   softirqs last  enabled at (44472): [<ffffffff808f9fbe>] __do_softirq+0x3de/0x51e
>> > > > >   softirqs last disabled at (44467): [<ffffffff80017760>] irq_exit+0xd6/0x104
>> > > > >   ---[ end trace 0000000000000000 ]---
>> > > > >   possible reason: unannotated irqs-on.
>> > > > >
>> > > > > Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
>> > > > > ---
>> > > > > This should also theoretically be fixed by the conversion to generic entry,
>> > > > > but it's not clear how far away that series is from landing.
>> > > > > ---
>> > > > >  arch/riscv/kernel/entry.S  | 18 +++++-------------
>> > > > >  arch/riscv/kernel/signal.c | 34 +++++++++++++++++++++-------------
>> > > > >  2 files changed, 26 insertions(+), 26 deletions(-)
>> > > > >
>> > > > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> > > > > index b9eda3fcbd6d..58dfa8595e19 100644
>> > > > > --- a/arch/riscv/kernel/entry.S
>> > > > > +++ b/arch/riscv/kernel/entry.S
>> > > > > @@ -263,12 +263,11 @@ ret_from_exception:
>> > > > >  #endif
>> > > > >         bnez s0, resume_kernel
>> > > > >
>> > > > > -resume_userspace:
>> > > > >         /* Interrupts must be disabled here so flags are checked atomically */
>> > > > >         REG_L s0, TASK_TI_FLAGS(tp) /* current_thread_info->flags */
>> > > > >         andi s1, s0, _TIF_WORK_MASK
>> > > > > -       bnez s1, work_pending
>> > > > > -
>> > > > > +       bnez s1, resume_userspace_slow
>> > > > > +resume_userspace:
>> > > > >  #ifdef CONFIG_CONTEXT_TRACKING_USER
>> > > > >         call user_enter_callable
>> > > > >  #endif
>> > > > > @@ -368,19 +367,12 @@ resume_kernel:
>> > > > >         j restore_all
>> > > > >  #endif
>> > > > >
>> > > > > -work_pending:
>> > > > > +resume_userspace_slow:
>> > > > >         /* Enter slow path for supplementary processing */
>> > > > > -       la ra, ret_from_exception
>> > > > > -       andi s1, s0, _TIF_NEED_RESCHED
>> > > > > -       bnez s1, work_resched
>> > > > > -work_notifysig:
>> > > > > -       /* Handle pending signals and notify-resume requests */
>> > > > > -       csrs CSR_STATUS, SR_IE /* Enable interrupts for do_notify_resume() */
>> > > > >         move a0, sp /* pt_regs */
>> > > > >         move a1, s0 /* current_thread_info->flags */
>> > > > > -       tail do_notify_resume
>> > > > > -work_resched:
>> > > > > -       tail schedule
>> > > > > +       call do_work_pending
>> > > > > +       j resume_userspace
>> > > > >
>> > > > >  /* Slow paths for ptrace. */
>> > > > >  handle_syscall_trace_enter:
>> > > > > diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
>> > > > > index 5c591123c440..bfb2afa4135f 100644
>> > > > > --- a/arch/riscv/kernel/signal.c
>> > > > > +++ b/arch/riscv/kernel/signal.c
>> > > > > @@ -313,19 +313,27 @@ static void do_signal(struct pt_regs *regs)
>> > > > >  }
>> > > > >
>> > > > >  /*
>> > > > > - * notification of userspace execution resumption
>> > > > > - * - triggered by the _TIF_WORK_MASK flags
>> > > > > + * Handle any pending work on the resume-to-userspace path, as indicated by
>> > > > > + * _TIF_WORK_MASK. Entered from assembly with IRQs off.
>> > > > >   */
>> > > > > -asmlinkage __visible void do_notify_resume(struct pt_regs *regs,
>> > > > > -                                          unsigned long thread_info_flags)
>> > > > > +asmlinkage __visible void do_work_pending(struct pt_regs *regs,
>> > > > > +                                         unsigned long thread_info_flags)
>> > > > >  {
>> > > > > -       if (thread_info_flags & _TIF_UPROBE)
>> > > > > -               uprobe_notify_resume(regs);
>> > > > > -
>> > > > > -       /* Handle pending signal delivery */
>> > > > > -       if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>> > > > > -               do_signal(regs);
>> > > > > -
>> > > > > -       if (thread_info_flags & _TIF_NOTIFY_RESUME)
>> > > > > -               resume_user_mode_work(regs);
>> > > > > +       do {
>> > > > > +               if (thread_info_flags & _TIF_NEED_RESCHED) {
>> > > > > +                       schedule();
>> > > > > +               } else {
>> > > > > +                       local_irq_enable();
>> > > > > +                       if (thread_info_flags & _TIF_UPROBE)
>> > > > > +                               uprobe_notify_resume(regs);
>> > > > > +                       /* Handle pending signal delivery */
>> > > > > +                       if (thread_info_flags & (_TIF_SIGPENDING |
>> > > > > +                                                _TIF_NOTIFY_SIGNAL))
>> > > > > +                               do_signal(regs);
>> > > > > +                       if (thread_info_flags & _TIF_NOTIFY_RESUME)
>> > > > > +                               resume_user_mode_work(regs);
>> > > > > +               }
>> > > > > +               local_irq_disable();
>> > > > > +               thread_info_flags = read_thread_flags();
>> > > > > +       } while (thread_info_flags & _TIF_WORK_MASK);
>> > > > >  }
>> > > > The more graceful code has been written in kernel/entry/common.c.
>> > > > Let's base it on that:
>> > > >
>> > > > static unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
>> > > >                                             unsigned long ti_work)
>> > > > {
>> > > >         /*
>> > > >          * Before returning to user space ensure that all pending work
>> > > >          * items have been completed.
>> > > >          */
>> > > >         while (ti_work & EXIT_TO_USER_MODE_WORK) {
>> > > >
>> > > >                 local_irq_enable_exit_to_user(ti_work);
>> > > >
>> > > >                 if (ti_work & _TIF_NEED_RESCHED)
>> > > >                         schedule();
>> > > >
>> > > >                 if (ti_work & _TIF_UPROBE)
>> > > >                         uprobe_notify_resume(regs);
>> > > >
>> > > >                 if (ti_work & _TIF_PATCH_PENDING)
>> > > >                         klp_update_patch_state(current);
>> > > >
>> > > >                 if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>> > > >                         arch_do_signal_or_restart(regs);
>> > > >
>> > > >                 if (ti_work & _TIF_NOTIFY_RESUME)
>> > > >                         resume_user_mode_work(regs);
>> > > >
>> > > >                 /* Architecture specific TIF work */
>> > > >                 arch_exit_to_user_mode_work(regs, ti_work);
>> > > >
>> > > >                 /*
>> > > >                  * Disable interrupts and reevaluate the work flags as they
>> > > >                  * might have changed while interrupts and preemption was
>> > > >                  * enabled above.
>> > > >                  */
>> > > >                 local_irq_disable_exit_to_user();
>> > > >
>> > > >                 /* Check if any of the above work has queued a
>> > > > deferred wakeup */
>> > > >                 tick_nohz_user_enter_prepare();
>> > > >
>> > > >                 ti_work = read_thread_flags();
>> > > >         }
>> > > >
>> > > >         /* Return the latest work state for arch_exit_to_user_mode() */
>> > > >         return ti_work;
>> > > > }
>> > > >
>> > > > > --
>> > > > > 2.25.1
>> > > > >
>> > > >
>> > > >
>> > > > --
>> > > > Best Regards
>> > > >  Guo Ren
>> > >
>> > > _______________________________________________
>> > > linux-riscv mailing list
>> > > linux-riscv@lists.infradead.org
>> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
