Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6864EC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC3F208E7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VyIGgQS3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beGN8GEY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC3F208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzEhY+K9xzXj86YfxYHjr+jXg7KS0OSwXkQz2hHUrM4=; b=VyIGgQS3hudI1P
	bvomLtQi6uBs0XifDahvT8eD9IwLcI3R5BvVJB8XazMKAigJXSmEUNGgWUvDoXVWzYfSaV6f7O5JQ
	VddEMQKPYVQ4wf8zMKC/rn8rrL+RcrPR4J5WEWGU2d1XRta8YM9dTQhj6VvLuDyV6JtCiCh0cOI4e
	Uvs8AJbWHmKAZIufXkssgo3OgTIRoZ21xgOESNKJgOYdl2DGXv+34gzSch5+YztPaVNhCUV5sb9Wu
	yIMH8gj+ubueLDRosGaLqxx27ctu/AgJCKL5d3684LzeSsen6r/v/FVu8EkftFq0lZz+FUQofD9AL
	qf9A0hJ9LKikZR7Oc20Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUxB7-0007HG-Ge; Thu, 06 Dec 2018 17:11:09 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUxB4-00078F-D8
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 17:11:07 +0000
Received: by mail-ot1-x343.google.com with SMTP id n8so1093493otl.6
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 09:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CsQHc7pZNxS4ulmwiuUcDi6QerCVGZLPXXoqKFLAb7g=;
 b=beGN8GEYeuEmkQM6bXGZhUD7duOv1jnv9fS3l8V/he+HbSPiRMsVmZiOgJPLqk9y1X
 KVNVtq+8thaBPjswvzinRH/ak/zLW8LwFbocHO8jza4oF1C6S8IODzaS55C1jpTqGEUm
 I5X+np7mL5zGOoxZTuNg8sP4PTALFIGId6dZ1GgQvVFry7OyAeWUd5IANSiKLbe963FE
 5uFZON/NAPP5BPX4SwAO13Yx/+s+6fzExduekhBJorNaxFKNClW7mImydLz+PN4vAYtl
 6yBcJM81Qik35TAlWOuIRWn7tX5FToVYzb3KGhbHH8CVhpa6yeAI8v9su1+dB7eQGjoI
 +X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CsQHc7pZNxS4ulmwiuUcDi6QerCVGZLPXXoqKFLAb7g=;
 b=mJOMY0gbaV7VrLBewT2iouMuJ4k+iuboPHX2sfyJWYexX4alz/U5ggleauZXtSkqAi
 o6+cbLAIqLYkwyyonvRvNesobolE3UPIw3awwwfv1afV0mx1gs6uzlqRoIuKv4j4ScyG
 u4vYhkPnRr3ubpQSho6lX9870trxa7jployH5sT4eVn7qRfSXSdioSL6a1KjBADFY/Gl
 pyIlbjC2P/iwToBsQHx3GHnGG+KpZHeefA8eR23c94xBGB3QFEQkApRiN1mvEpV+2qKQ
 r34hklvnraEx6sjgN7zc7dIsFxosAnmu15P8zzocKmfZ/ZfbMPdJzNTi3LSArElAGCRA
 +2Lw==
X-Gm-Message-State: AA+aEWZ3Y0RViT3y7xeIVXxqBXSXiCop0CZWxCI992U/0vTMiLDi7gLp
 dsEFQYKMYBICEdhl9846Ssld2UEgqZ7E63DUE6U=
X-Google-Smtp-Source: AFSGD/VAXh6zRqdvGkuYk5DC78EEQRWkVXMUKtjSmO0pN6MdwHNgERGjT+477PByhcjjkaQXWvpFNtdrTAtlL0pLgj4=
X-Received: by 2002:a9d:8e4:: with SMTP id 91mr17933662otf.169.1544116255139; 
 Thu, 06 Dec 2018 09:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-2-david.abdurachmanov@gmail.com>
 <CAGXu5jJkQjyhz5GP+mCPTA9yH8rLds=Vuz9g_ed+hZ0Co7Lqeg@mail.gmail.com>
In-Reply-To: <CAGXu5jJkQjyhz5GP+mCPTA9yH8rLds=Vuz9g_ed+hZ0Co7Lqeg@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 6 Dec 2018 18:10:43 +0100
Message-ID: <CAEn-LTrdhQ2mEq=k3q=1wt+X7+S40t5OvXGKtw46VXUzeDNvaQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_091106_474822_271A847C 
X-CRM114-Status: GOOD (  24.04  )
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
Cc: aou@eecs.berkeley.edu, Will Drewry <wad@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 luto@amacapital.net, Green Hu <green.hu@gmail.com>,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 5:47 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> >
> > The patch adds support for SECCOMP and SECCOMP_FILTER (BPF).
> >
> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > ---
> >  arch/riscv/Kconfig                   | 14 ++++++++++++++
> >  arch/riscv/include/asm/thread_info.h |  5 ++++-
> >  arch/riscv/kernel/entry.S            | 27 +++++++++++++++++++++++++--
> >  arch/riscv/kernel/ptrace.c           |  8 ++++++++
> >  4 files changed, 51 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index a4f48f757204..49cd8e251547 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -29,6 +29,7 @@ config RISCV
> >         select GENERIC_SMP_IDLE_THREAD
> >         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
> >         select HAVE_ARCH_AUDITSYSCALL
> > +       select HAVE_ARCH_SECCOMP_FILTER
> >         select HAVE_MEMBLOCK_NODE_MAP
> >         select HAVE_DMA_CONTIGUOUS
> >         select HAVE_FUTEX_CMPXCHG if FUTEX
> > @@ -228,6 +229,19 @@ menu "Kernel features"
> >
> >  source "kernel/Kconfig.hz"
> >
> > +config SECCOMP
> > +       bool "Enable seccomp to safely compute untrusted bytecode"
> > +       help
> > +         This kernel feature is useful for number crunching applications
> > +         that may need to compute untrusted bytecode during their
> > +         execution. By using pipes or other transports made available to
> > +         the process as file descriptors supporting the read/write
> > +         syscalls, it's possible to isolate those applications in
> > +         their own address space using seccomp. Once seccomp is
> > +         enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
> > +         and the task is only allowed to execute a few safe syscalls
> > +         defined by each seccomp mode.
> > +
> >  endmenu
> >
> >  menu "Boot options"
> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> > index 1c9cc8389928..1fd6e4130cab 100644
> > --- a/arch/riscv/include/asm/thread_info.h
> > +++ b/arch/riscv/include/asm/thread_info.h
> > @@ -81,6 +81,7 @@ struct thread_info {
> >  #define TIF_MEMDIE             5       /* is terminating due to OOM killer */
> >  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
> >  #define TIF_SYSCALL_AUDIT      7       /* syscall auditing */
> > +#define TIF_SECCOMP                    8       /* syscall secure computing */
> >
> >  #define _TIF_SYSCALL_TRACE     (1 << TIF_SYSCALL_TRACE)
> >  #define _TIF_NOTIFY_RESUME     (1 << TIF_NOTIFY_RESUME)
> > @@ -88,11 +89,13 @@ struct thread_info {
> >  #define _TIF_NEED_RESCHED      (1 << TIF_NEED_RESCHED)
> >  #define _TIF_SYSCALL_TRACEPOINT        (1 << TIF_SYSCALL_TRACEPOINT)
> >  #define _TIF_SYSCALL_AUDIT     (1 << TIF_SYSCALL_AUDIT)
> > +#define _TIF_SECCOMP           (1 << TIF_SECCOMP)
> >
> >  #define _TIF_WORK_MASK \
> >         (_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
> >
> >  #define _TIF_SYSCALL_WORK \
> > -       (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
> > +       (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT \
> > +        _TIF_SECCOMP )
> >
> >  #endif /* _ASM_RISCV_THREAD_INFO_H */
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 355166f57205..e88ccbfa61ee 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -207,8 +207,25 @@ check_syscall_nr:
> >         /* Check to make sure we don't jump to a bogus syscall number. */
> >         li t0, __NR_syscalls
> >         la s0, sys_ni_syscall
> > -       /* Syscall number held in a7 */
> > -       bgeu a7, t0, 1f
> > +       /*
> > +        * The tracer can change syscall number to valid/invalid value.
> > +        * We use syscall_set_nr helper in syscall_trace_enter thus we
> > +        * cannot trust the current value in a7 and have to reload from
> > +        * the current task pt_regs.
> > +        */
> > +       REG_L a7, PT_A7(sp)
> > +       /*
> > +        * Syscall number held in a7.
> > +        * If syscall number is above allowed value, redirect to ni_syscall.
> > +        */
> > +       bge a7, t0, 1f
> > +       /*
> > +        * Check if syscall is rejected by tracer or seccomp, i.e., a7 == -1.
> > +        * If yes, we pretend it was executed.
> > +        */
> > +       li t1, -1
> > +       beq a7, t1, ret_from_syscall_rejected
> > +       /* Call syscall */
> >         la s0, sys_call_table
> >         slli t0, a7, RISCV_LGPTR
> >         add s0, s0, t0
> > @@ -219,6 +236,12 @@ check_syscall_nr:
> >  ret_from_syscall:
> >         /* Set user a0 to kernel a0 */
> >         REG_S a0, PT_A0(sp)
> > +       /*
> > +        * We didn't execute the actual syscall.
> > +        * Seccomp already set return value for the current task pt_regs.
> > +        * (If it was configured with SECCOMP_RET_ERRNO/TRACE)
> > +        */
> > +ret_from_syscall_rejected:
> >         /* Trace syscalls, but only if requested by the user. */
> >         REG_L t0, TASK_TI_FLAGS(tp)
> >         andi t0, t0, _TIF_SYSCALL_WORK
> > diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> > index c1b51539c3e2..598e48b8ca2b 100644
> > --- a/arch/riscv/kernel/ptrace.c
> > +++ b/arch/riscv/kernel/ptrace.c
> > @@ -160,6 +160,14 @@ void do_syscall_trace_enter(struct pt_regs *regs)
> >                 if (tracehook_report_syscall_entry(regs))
> >                         syscall_set_nr(current, regs, -1);
> >
> > +       /*
> > +        * Do the secure computing after ptrace; failures should be fast.
> > +        * If this fails we might have return value in a0 from seccomp
> > +        * (via SECCOMP_RET_ERRNO/TRACE).
> > +        */
> > +       if (secure_computing(NULL) == -1)
> > +               syscall_set_nr(current, regs, -1);
>
> On a -1 return, this should return immediately -- it should not
> continue to process trace_sys_enter(), etc.

Ops! No idea how I missed that.
Will fix it.

> -Kees
>
> > +
> >  #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
> >         if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> >                 trace_sys_enter(regs, syscall_get_nr(current, regs));
> > --
> > 2.19.2
> >
>
>
> --
> Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
