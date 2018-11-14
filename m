Return-Path: <SRS0=rRaS=NZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18E7C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 23:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C07132086B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 23:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hw+jHJ/2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CVE0dams"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C07132086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=CdAoc7seBRUgUYZQ2Z7wvgCT/ju0yANDO3Sc5vpgrZs=; b=hw+jHJ/2m1sREmHZ/cOYnN9mD
	FhuzNvIiWpjT2u6d5MLaNE/1ohzwVdX0BSDFvOIMVMcEYG+0+np4u6pmaIbhYXoboSY5L+sM252VK
	od8cQ8V5HMv48utkQEYEdQXG25ORK9sVrE5Xa8ec/ipsl20kHBy9mqAldngRaB4aNYPgPKCRJ9tD0
	cE/VIq7FhoOOg4gb76LWOKwUDzeg9zFvzimr3GamYldqscemOuZMDoEbgq4wzIR8MDaIIzqv8Qqua
	X/RpWR+bdHwobkyDw8COfRy4FzXjg3xyK5OgTuWdfjc60vPvhmr6lUGV9s9OWJrXceWE6n87vrjCI
	hxd5d1C/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gN4mH-00016u-Hk; Wed, 14 Nov 2018 23:40:57 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN4mE-000169-AB
 for linux-riscv@lists.infradead.org; Wed, 14 Nov 2018 23:40:55 +0000
Received: by mail-pg1-x543.google.com with SMTP id z11so5461422pgu.0
 for <linux-riscv@lists.infradead.org>; Wed, 14 Nov 2018 15:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HDqZJVfDdm2xKhPSrI3qoQN8wl9PNy37Pa6VpKminmk=;
 b=CVE0damsV0qsfxURG7UJ6WvJvZL2xMpiI+faKFoYznrWRqwrqWF+FKimZZGuAVns2o
 xNRZVvOIuyLilK68Aaz6DzQM+c3/aG1v8VwCP/BVsPokpaXMGrwPkuYkXWiaIntvfCt2
 5weNY6m0CVvRtKNv6fl41JeIr9Flzwfc8Nz2Pew2eBJImPbfD7UIYuB67ybusv4frZaj
 TQB/jxvwPhCcjSVJMhmhvrDFy4ZfpX1q/vaHXR0mDastbyJicBCiuBVDz1PFmMO7e4WU
 ArlblZJ63Iev9RCPkv/aDbjp1Zyim1vljvP5srl5VCnXDZDuAZQhxJm1/wyhPlJyIDW4
 breA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HDqZJVfDdm2xKhPSrI3qoQN8wl9PNy37Pa6VpKminmk=;
 b=IwkA79wXLK3gxjZbQ95/W8EVxUy7sJofJZ0EooSxZ8yywCo7V6kcKm60sfRKYxQQOA
 LoH/swAe23znXaDKzsLc1ebHxWLX9xkBftMyl0j6NemocktvZAZSRFa1NpQsDrg1On1W
 LzksLndwoVC2We1x+mB+HDXeNjCGC5vZMc8sqFtE4znqYrWCXFicYTpjO6DLWieFJysn
 fImYtkRk+OxEVWTNsfasWY2F9R/qgdAXnAd9WNIFZrtGH4e582AoP81AhdO4zlsB0lWG
 KRmXee8T4Pg2j70/DiWAVvRn8GHGBqdK5hSEbxyQTCAOyHDwbzE6XVDph7Sf8an7gdst
 tM3w==
X-Gm-Message-State: AGRZ1gJI8PMhsRlYnAQolo77D1ymvXvLdFNkgaraWiISvcXAsVwH3Kad
 v9XlQ1UJVNl7rxmZWm6XmB0tTQ==
X-Google-Smtp-Source: AJdET5c4p69A/T4S79dnLW/b+BDnzfKMhBjf1BLdGoKTbjRKPdZ28swD68Ppvoj/Gw+CmNAXsH30tQ==
X-Received: by 2002:a63:5a57:: with SMTP id k23mr3598535pgm.5.1542238843505;
 Wed, 14 Nov 2018 15:40:43 -0800 (PST)
Received: from localhost ([64.114.255.97])
 by smtp.gmail.com with ESMTPSA id m85-v6sm23480771pfj.171.2018.11.14.15.40.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Nov 2018 15:40:42 -0800 (PST)
Date: Wed, 14 Nov 2018 15:40:42 -0800 (PST)
X-Google-Original-Date: Wed, 14 Nov 2018 14:45:14 PST (-0800)
Subject: Re: [PATCH 1/2] riscv: add audit support
In-Reply-To: <CAHC9VhS4qqr888_-aS_y5jD7XHaiVG45tkEbEX1Y=pr0nFN69g@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: paul@paul-moore.com
Message-ID: <mhng-09b7e83c-b82b-4428-af68-512af496a10b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_154054_354113_E60322BD 
X-CRM114-Status: GOOD (  24.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-audit@redhat.com, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 david.abdurachmanov@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181114234042.8326hqDecnFlwwZMhyHYEKE_MIQSHIg3-SF_kGG3RAU@z>

On Tue, 13 Nov 2018 15:34:18 PST (-0800), paul@paul-moore.com wrote:
> On Tue, Nov 13, 2018 at 5:07 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> On Mon, 29 Oct 2018 03:48:53 PDT (-0700), david.abdurachmanov@gmail.com wrote:
>> > On RISC-V (riscv) audit is supported through generic lib/audit.c.
>> > The patch adds required arch specific definitions.
>> >
>> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>> > ---
>> >  arch/riscv/Kconfig                   |  1 +
>> >  arch/riscv/include/asm/ptrace.h      |  5 +++++
>> >  arch/riscv/include/asm/syscall.h     | 10 ++++++++++
>> >  arch/riscv/include/asm/thread_info.h |  6 ++++++
>> >  arch/riscv/kernel/entry.S            |  4 ++--
>> >  include/uapi/linux/audit.h           |  2 ++
>> >  6 files changed, 26 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index a344980287a5..8e6d404a4ed0 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -28,6 +28,7 @@ config RISCV
>> >       select GENERIC_STRNLEN_USER
>> >       select GENERIC_SMP_IDLE_THREAD
>> >       select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
>> > +     select HAVE_ARCH_AUDITSYSCALL
>> >       select HAVE_MEMBLOCK
>> >       select HAVE_MEMBLOCK_NODE_MAP
>> >       select HAVE_DMA_CONTIGUOUS
>> > diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
>> > index 2c5df945d43c..62c5e9d35596 100644
>> > --- a/arch/riscv/include/asm/ptrace.h
>> > +++ b/arch/riscv/include/asm/ptrace.h
>> > @@ -113,6 +113,11 @@ static inline void frame_pointer_set(struct pt_regs *regs,
>> >       SET_FP(regs, val);
>> >  }
>> >
>> > +static inline unsigned long regs_return_value(struct pt_regs *regs)
>> > +{
>> > +     return regs->a0;
>> > +}
>> > +
>> >  #endif /* __ASSEMBLY__ */
>> >
>> >  #endif /* _ASM_RISCV_PTRACE_H */
>> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
>> > index 8d25f8904c00..bba3da6ef157 100644
>> > --- a/arch/riscv/include/asm/syscall.h
>> > +++ b/arch/riscv/include/asm/syscall.h
>> > @@ -18,6 +18,7 @@
>> >  #ifndef _ASM_RISCV_SYSCALL_H
>> >  #define _ASM_RISCV_SYSCALL_H
>> >
>> > +#include <uapi/linux/audit.h>
>> >  #include <linux/sched.h>
>> >  #include <linux/err.h>
>> >
>> > @@ -99,4 +100,13 @@ static inline void syscall_set_arguments(struct task_struct *task,
>> >       memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
>> >  }
>> >
>> > +static inline int syscall_get_arch(void)
>> > +{
>> > +#ifdef CONFIG_64BIT
>> > +     return AUDIT_ARCH_RISCV64;
>> > +#else
>> > +     return AUDIT_ARCH_RISCV32;
>> > +#endif
>> > +}
>> > +
>> >  #endif       /* _ASM_RISCV_SYSCALL_H */
>> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>> > index f8fa1cd2dad9..1c9cc8389928 100644
>> > --- a/arch/riscv/include/asm/thread_info.h
>> > +++ b/arch/riscv/include/asm/thread_info.h
>> > @@ -80,13 +80,19 @@ struct thread_info {
>> >  #define TIF_RESTORE_SIGMASK  4       /* restore signal mask in do_signal() */
>> >  #define TIF_MEMDIE           5       /* is terminating due to OOM killer */
>> >  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
>> > +#define TIF_SYSCALL_AUDIT    7       /* syscall auditing */
>> >
>> >  #define _TIF_SYSCALL_TRACE   (1 << TIF_SYSCALL_TRACE)
>> >  #define _TIF_NOTIFY_RESUME   (1 << TIF_NOTIFY_RESUME)
>> >  #define _TIF_SIGPENDING              (1 << TIF_SIGPENDING)
>> >  #define _TIF_NEED_RESCHED    (1 << TIF_NEED_RESCHED)
>> > +#define _TIF_SYSCALL_TRACEPOINT      (1 << TIF_SYSCALL_TRACEPOINT)
>> > +#define _TIF_SYSCALL_AUDIT   (1 << TIF_SYSCALL_AUDIT)
>> >
>> >  #define _TIF_WORK_MASK \
>> >       (_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
>> >
>> > +#define _TIF_SYSCALL_WORK \
>> > +     (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
>> > +
>> >  #endif /* _ASM_RISCV_THREAD_INFO_H */
>> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> > index fa2c08e3c05e..2a6c2e7aaff3 100644
>> > --- a/arch/riscv/kernel/entry.S
>> > +++ b/arch/riscv/kernel/entry.S
>> > @@ -202,7 +202,7 @@ handle_syscall:
>> >       REG_S s2, PT_SEPC(sp)
>> >       /* Trace syscalls, but only if requested by the user. */
>> >       REG_L t0, TASK_TI_FLAGS(tp)
>> > -     andi t0, t0, _TIF_SYSCALL_TRACE
>> > +     andi t0, t0, _TIF_SYSCALL_WORK
>> >       bnez t0, handle_syscall_trace_enter
>> >  check_syscall_nr:
>> >       /* Check to make sure we don't jump to a bogus syscall number. */
>> > @@ -222,7 +222,7 @@ ret_from_syscall:
>> >       REG_S a0, PT_A0(sp)
>> >       /* Trace syscalls, but only if requested by the user. */
>> >       REG_L t0, TASK_TI_FLAGS(tp)
>> > -     andi t0, t0, _TIF_SYSCALL_TRACE
>> > +     andi t0, t0, _TIF_SYSCALL_WORK
>> >       bnez t0, handle_syscall_trace_exit
>> >
>> >  ret_from_exception:
>> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
>> > index 818ae690ab79..d0e037a96a7b 100644
>> > --- a/include/uapi/linux/audit.h
>> > +++ b/include/uapi/linux/audit.h
>> > @@ -399,6 +399,8 @@ enum {
>> >  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
>> >  #define AUDIT_ARCH_PPC64     (EM_PPC64|__AUDIT_ARCH_64BIT)
>> >  #define AUDIT_ARCH_PPC64LE   (EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>> > +#define AUDIT_ARCH_RISCV32   (EM_RISCV|__AUDIT_ARCH_LE)
>> > +#define AUDIT_ARCH_RISCV64   (EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>> >  #define AUDIT_ARCH_S390              (EM_S390)
>> >  #define AUDIT_ARCH_S390X     (EM_S390|__AUDIT_ARCH_64BIT)
>> >  #define AUDIT_ARCH_SH                (EM_SH)
>>
>> I can't seem to figure out how to dig the rest of the thread out of my inbox
>> (I'm in an airport), so I'm just replying here.
>>
>> I've added this to next-audit, which will soon filter into for-next.  I'm not
>> sure if this is 100% settled, but I can't find any issues with it so I think
>> it's best to get this out for testing.
>
> If you RISCV guys are happy, and it is passing the audit-testsuite
> (which I believe it is based on some brief discussions with David on
> Freenode), then I think it is okay from my point of view.

I haven't run the test suite personally, but I trust that David has done so if 
he said so (I remember having seen him say he did as well).

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
