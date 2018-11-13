Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C076C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 23:34:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC042175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 23:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tRIf4iAf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="l9YbYQJP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC042175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxZqjAW774SooaUgwEs/vXduSEf3CiG6XghO7MuQz9I=; b=tRIf4iAfpxBpWO
	4JIsBvUjun1FXvQPvyvc/8+MxxgS2flL5Fh0TO8w7hQjleuvVwqzGh90ky84htsqCQBI5WrvtJDLe
	9iQPvhUTt8x5E/vo9Wjf3j7psPAFIqh8LXbZrSbYFOltyPUpuu0DM3WHOPBfR6455W/ijPM3j2RrJ
	oP35A6pug8uerAn28yGBjX6qnsuI6mMNxyly6xEcxpAttkSt+JfYmKdMLEyojQfLXjr3RD2UyBjM4
	dPvXJuPrC532gEVlv1+BDeeq8opIkntocT77FBVThCi6TowhSQHMNYB1pUeprgRCeIYwCGfJUFuNU
	8GNbkpIsPeKy4GrQfpCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMiCm-0007np-4k; Tue, 13 Nov 2018 23:34:48 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMiCj-0007kf-1P
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 23:34:46 +0000
Received: by mail-lj1-x242.google.com with SMTP id t22-v6so12435350lji.7
 for <linux-riscv@lists.infradead.org>; Tue, 13 Nov 2018 15:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nWq7ef/SjtP3Gjl4njFZ9w5AGVsDZlza+6bcQVEdBmo=;
 b=l9YbYQJPpD7fgJbCOLN2zWtgXnjjwFd9VEMVW+VTrstBBBtdtIl92+3X2H4pGfzRYy
 yAAm+nFqBpU8XYZxZK5shpIn9mSW6BPuMbkPrnqeAgAIssTI25aWcNXKP2DEDZBYlKyl
 hbjh3YHWRp6nDXpmw1pwZQMLK0Q1eyhtyGfHVReXsuY6E7LZfkUcR39Yci9rI7WpbWuY
 ujNHM+X9sNEDVpJ8gItvUkq4XfWE/sJdpA2z0JQx5d28hqFZ+hggtt8SDAwmze2QsUxe
 A7VtvIWWeHEPe63iMKt5tuS2j48SA6mU4tcbnTSeGrtqYLoR4sOMw+HSNQUXraglCuiD
 ureQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nWq7ef/SjtP3Gjl4njFZ9w5AGVsDZlza+6bcQVEdBmo=;
 b=GxWfVvBKaHNRclt7/nwqjImQzf3RO2hcac5P5P7JmlDDE5Llm6JpMljG96DuqdLl3K
 UFklOfAFb7/3bMSxfSiQoBSuEtZWUBiL1U2tzApHz8e4fVBea6iaWSUk0qDD5rGqhVhC
 kfuqSjoLqiwi2ed4ZD1oQYjuMqcMQtlakK7vay137bvTS995BJq6b8FOsPJUGFNMdTIP
 qhqA+co1A71r0m/Sd52VH7sx3rR7PFsEUWmABKXb9cnqEY6RivCqmODWWLz6hL2pxbiz
 jNEHzKqe0RqynuqdX4K1f5/TZn321O2M28Fqo72UZ7muaGMIHucpzRQESYGUoVjRIh6v
 rc7A==
X-Gm-Message-State: AGRZ1gKzOiOoJXZKQZt/+7qArLZ9g8/ra3MeqKUT9RYNnFrFC+Uf0Q27
 QUkaaj/ahL2FQkrN7hO5iMv13fqRtnor4+mN8MgL1YA=
X-Google-Smtp-Source: AJdET5fDgdnrstcBypHfRUe0+5Lm4TXTBFki3A1LQ83zoRMEmq4Omgu0FZxaBawv7C4m2a8UA7fbC4C/FtWgcpQHA3g=
X-Received: by 2002:a2e:8605:: with SMTP id
 a5-v6mr4191188lji.145.1542152069713; 
 Tue, 13 Nov 2018 15:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20181029104854.17432-2-david.abdurachmanov@gmail.com>
 <mhng-ea3feb87-2525-4cb8-be30-f73729d6a092@palmer-si-x1c4>
In-Reply-To: <mhng-ea3feb87-2525-4cb8-be30-f73729d6a092@palmer-si-x1c4>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 13 Nov 2018 18:34:18 -0500
Message-ID:
 <CAHC9VhS4qqr888_-aS_y5jD7XHaiVG45tkEbEX1Y=pr0nFN69g@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add audit support
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181113_153445_084269_88390841 
X-CRM114-Status: GOOD (  22.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113233418.8lgupAQ6p3OraMCbtKgFQJ-fg8lyoRqkFjsBOP8oycs@z>

On Tue, Nov 13, 2018 at 5:07 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> On Mon, 29 Oct 2018 03:48:53 PDT (-0700), david.abdurachmanov@gmail.com wrote:
> > On RISC-V (riscv) audit is supported through generic lib/audit.c.
> > The patch adds required arch specific definitions.
> >
> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > ---
> >  arch/riscv/Kconfig                   |  1 +
> >  arch/riscv/include/asm/ptrace.h      |  5 +++++
> >  arch/riscv/include/asm/syscall.h     | 10 ++++++++++
> >  arch/riscv/include/asm/thread_info.h |  6 ++++++
> >  arch/riscv/kernel/entry.S            |  4 ++--
> >  include/uapi/linux/audit.h           |  2 ++
> >  6 files changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index a344980287a5..8e6d404a4ed0 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -28,6 +28,7 @@ config RISCV
> >       select GENERIC_STRNLEN_USER
> >       select GENERIC_SMP_IDLE_THREAD
> >       select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
> > +     select HAVE_ARCH_AUDITSYSCALL
> >       select HAVE_MEMBLOCK
> >       select HAVE_MEMBLOCK_NODE_MAP
> >       select HAVE_DMA_CONTIGUOUS
> > diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> > index 2c5df945d43c..62c5e9d35596 100644
> > --- a/arch/riscv/include/asm/ptrace.h
> > +++ b/arch/riscv/include/asm/ptrace.h
> > @@ -113,6 +113,11 @@ static inline void frame_pointer_set(struct pt_regs *regs,
> >       SET_FP(regs, val);
> >  }
> >
> > +static inline unsigned long regs_return_value(struct pt_regs *regs)
> > +{
> > +     return regs->a0;
> > +}
> > +
> >  #endif /* __ASSEMBLY__ */
> >
> >  #endif /* _ASM_RISCV_PTRACE_H */
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index 8d25f8904c00..bba3da6ef157 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -18,6 +18,7 @@
> >  #ifndef _ASM_RISCV_SYSCALL_H
> >  #define _ASM_RISCV_SYSCALL_H
> >
> > +#include <uapi/linux/audit.h>
> >  #include <linux/sched.h>
> >  #include <linux/err.h>
> >
> > @@ -99,4 +100,13 @@ static inline void syscall_set_arguments(struct task_struct *task,
> >       memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
> >  }
> >
> > +static inline int syscall_get_arch(void)
> > +{
> > +#ifdef CONFIG_64BIT
> > +     return AUDIT_ARCH_RISCV64;
> > +#else
> > +     return AUDIT_ARCH_RISCV32;
> > +#endif
> > +}
> > +
> >  #endif       /* _ASM_RISCV_SYSCALL_H */
> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> > index f8fa1cd2dad9..1c9cc8389928 100644
> > --- a/arch/riscv/include/asm/thread_info.h
> > +++ b/arch/riscv/include/asm/thread_info.h
> > @@ -80,13 +80,19 @@ struct thread_info {
> >  #define TIF_RESTORE_SIGMASK  4       /* restore signal mask in do_signal() */
> >  #define TIF_MEMDIE           5       /* is terminating due to OOM killer */
> >  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
> > +#define TIF_SYSCALL_AUDIT    7       /* syscall auditing */
> >
> >  #define _TIF_SYSCALL_TRACE   (1 << TIF_SYSCALL_TRACE)
> >  #define _TIF_NOTIFY_RESUME   (1 << TIF_NOTIFY_RESUME)
> >  #define _TIF_SIGPENDING              (1 << TIF_SIGPENDING)
> >  #define _TIF_NEED_RESCHED    (1 << TIF_NEED_RESCHED)
> > +#define _TIF_SYSCALL_TRACEPOINT      (1 << TIF_SYSCALL_TRACEPOINT)
> > +#define _TIF_SYSCALL_AUDIT   (1 << TIF_SYSCALL_AUDIT)
> >
> >  #define _TIF_WORK_MASK \
> >       (_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
> >
> > +#define _TIF_SYSCALL_WORK \
> > +     (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
> > +
> >  #endif /* _ASM_RISCV_THREAD_INFO_H */
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index fa2c08e3c05e..2a6c2e7aaff3 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -202,7 +202,7 @@ handle_syscall:
> >       REG_S s2, PT_SEPC(sp)
> >       /* Trace syscalls, but only if requested by the user. */
> >       REG_L t0, TASK_TI_FLAGS(tp)
> > -     andi t0, t0, _TIF_SYSCALL_TRACE
> > +     andi t0, t0, _TIF_SYSCALL_WORK
> >       bnez t0, handle_syscall_trace_enter
> >  check_syscall_nr:
> >       /* Check to make sure we don't jump to a bogus syscall number. */
> > @@ -222,7 +222,7 @@ ret_from_syscall:
> >       REG_S a0, PT_A0(sp)
> >       /* Trace syscalls, but only if requested by the user. */
> >       REG_L t0, TASK_TI_FLAGS(tp)
> > -     andi t0, t0, _TIF_SYSCALL_TRACE
> > +     andi t0, t0, _TIF_SYSCALL_WORK
> >       bnez t0, handle_syscall_trace_exit
> >
> >  ret_from_exception:
> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index 818ae690ab79..d0e037a96a7b 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -399,6 +399,8 @@ enum {
> >  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
> >  #define AUDIT_ARCH_PPC64     (EM_PPC64|__AUDIT_ARCH_64BIT)
> >  #define AUDIT_ARCH_PPC64LE   (EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> > +#define AUDIT_ARCH_RISCV32   (EM_RISCV|__AUDIT_ARCH_LE)
> > +#define AUDIT_ARCH_RISCV64   (EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> >  #define AUDIT_ARCH_S390              (EM_S390)
> >  #define AUDIT_ARCH_S390X     (EM_S390|__AUDIT_ARCH_64BIT)
> >  #define AUDIT_ARCH_SH                (EM_SH)
>
> I can't seem to figure out how to dig the rest of the thread out of my inbox
> (I'm in an airport), so I'm just replying here.
>
> I've added this to next-audit, which will soon filter into for-next.  I'm not
> sure if this is 100% settled, but I can't find any issues with it so I think
> it's best to get this out for testing.

If you RISCV guys are happy, and it is passing the audit-testsuite
(which I believe it is based on some brief discussions with David on
Freenode), then I think it is okay from my point of view.

-- 
paul moore
www.paul-moore.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
