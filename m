Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20A6C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 16:49:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B922320850
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 16:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="koOaOU0V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JHmEBsHY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B922320850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0d/wJPzJUHFUWMGDXLCzLyF55U7ejke8275Q9MOJg4=; b=koOaOU0VgobKtE
	Kz2GjPXOdXukNXtsdJSmlsOn3h4kYPvYbzcLLaq/8ZS2qCyPWzggULDR8o871fq3dCp0TrjpPDTeZ
	q7xF5vnLw9dL9pQzJetkbKtYtNGuemvvtuFrv8LvflBU6uhnJS4d9G97K47RNMYRgICo8XIwvNhg6
	l7zF7CAJv8eru6U3YEPd14CyfAzkVaSERKPQqSi5zU7RerV4++zEM40jU7vj24RAsYYZzu75yiVsZ
	aMAxuX4SbGAhDu1FX/Ydwdul6OnFjN5oHWhBR+qHmf+5zwKdIsCgkSdWWoHsxSnNa+OAqifLPaOfi
	/Jdrryu6xs1eTSPQMRvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUwqC-0001eX-PX; Thu, 06 Dec 2018 16:49:32 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUwop-0008S2-CE
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 16:48:18 +0000
Received: by mail-yb1-xb42.google.com with SMTP id z2-v6so935143ybj.2
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xwCJ/l0ExQEEZ6VCTiFIiDTYVjuXXSdUnCk3ofmsV7w=;
 b=JHmEBsHYRNp+z5ErKNOYB2ayeCvlBAHMEGrNujYfGdksbsOwdsv2lebxVwA9B9xqCQ
 BjTQIbIzbmma3mtqtRbAPqUPecwL2EiCquL/mXRp3lmU82EkaiLDc75sSa1ltE8vqw5a
 XaQURGo1zBME3WybHog+BScj4OcuHGkDhTwEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwCJ/l0ExQEEZ6VCTiFIiDTYVjuXXSdUnCk3ofmsV7w=;
 b=JcPanLb6b3W3xTHMEwq+XoSmYoyAgEafdsf2loonPfmvT6V14XLb3EIRM66jzc+3Nl
 LuzsXPZX5b+txusZa3uu0k95RMqdgoHbOURbD7uV3eHrmqs2HsY9ufQrUkgu/QQuU++p
 t9fp0AZPJw/OJKgzsf+F2fqKtXD2smUpB94aywO34X5rZnk3QN14jcODhGCLl7KgXevW
 VBhiTTGsqDLoXVdy+YrQGtgbfnfttxAy+W4SYVVaXYjeTRDyaDQawcMuPEqiBTR8xQIG
 aPtV9zBg0fWKpvQeQ0TEr643PZbKDXIuJUyuwVJmJ0xreQ6/6Sx8CfAc1EpFb27RXpYG
 8TAQ==
X-Gm-Message-State: AA+aEWZzVSqNuFHt40f2+5wBcO0GdqmhhWUUDYjiWsMtGVecnpNT4m+o
 EGAcRDkhFJ6Tvso3NKTONj3mitArwa4=
X-Google-Smtp-Source: AFSGD/W8zVuG9rE9vmkY5GhjbSDtjQZSqLgDEU6A0eXXv0eN/+h3LjEilBggJzSF3o4GtikIL3GEag==
X-Received: by 2002:a81:695:: with SMTP id 143mr29352837ywg.370.1544114875404; 
 Thu, 06 Dec 2018 08:47:55 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id x4sm726979ywj.80.2018.12.06.08.47.53
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 08:47:54 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id w203so931646ybg.3
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 08:47:53 -0800 (PST)
X-Received: by 2002:a25:b783:: with SMTP id n3mr2639193ybh.141.1544114873483; 
 Thu, 06 Dec 2018 08:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-2-david.abdurachmanov@gmail.com>
In-Reply-To: <20181206150156.28210-2-david.abdurachmanov@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 6 Dec 2018 08:47:41 -0800
X-Gmail-Original-Message-ID: <CAGXu5jJkQjyhz5GP+mCPTA9yH8rLds=Vuz9g_ed+hZ0Co7Lqeg@mail.gmail.com>
Message-ID: <CAGXu5jJkQjyhz5GP+mCPTA9yH8rLds=Vuz9g_ed+hZ0Co7Lqeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_084808_388308_A75A6FED 
X-CRM114-Status: GOOD (  23.89  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Will Drewry <wad@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, green.hu@gmail.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> The patch adds support for SECCOMP and SECCOMP_FILTER (BPF).
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/Kconfig                   | 14 ++++++++++++++
>  arch/riscv/include/asm/thread_info.h |  5 ++++-
>  arch/riscv/kernel/entry.S            | 27 +++++++++++++++++++++++++--
>  arch/riscv/kernel/ptrace.c           |  8 ++++++++
>  4 files changed, 51 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a4f48f757204..49cd8e251547 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -29,6 +29,7 @@ config RISCV
>         select GENERIC_SMP_IDLE_THREAD
>         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
>         select HAVE_ARCH_AUDITSYSCALL
> +       select HAVE_ARCH_SECCOMP_FILTER
>         select HAVE_MEMBLOCK_NODE_MAP
>         select HAVE_DMA_CONTIGUOUS
>         select HAVE_FUTEX_CMPXCHG if FUTEX
> @@ -228,6 +229,19 @@ menu "Kernel features"
>
>  source "kernel/Kconfig.hz"
>
> +config SECCOMP
> +       bool "Enable seccomp to safely compute untrusted bytecode"
> +       help
> +         This kernel feature is useful for number crunching applications
> +         that may need to compute untrusted bytecode during their
> +         execution. By using pipes or other transports made available to
> +         the process as file descriptors supporting the read/write
> +         syscalls, it's possible to isolate those applications in
> +         their own address space using seccomp. Once seccomp is
> +         enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
> +         and the task is only allowed to execute a few safe syscalls
> +         defined by each seccomp mode.
> +
>  endmenu
>
>  menu "Boot options"
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 1c9cc8389928..1fd6e4130cab 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -81,6 +81,7 @@ struct thread_info {
>  #define TIF_MEMDIE             5       /* is terminating due to OOM killer */
>  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
>  #define TIF_SYSCALL_AUDIT      7       /* syscall auditing */
> +#define TIF_SECCOMP                    8       /* syscall secure computing */
>
>  #define _TIF_SYSCALL_TRACE     (1 << TIF_SYSCALL_TRACE)
>  #define _TIF_NOTIFY_RESUME     (1 << TIF_NOTIFY_RESUME)
> @@ -88,11 +89,13 @@ struct thread_info {
>  #define _TIF_NEED_RESCHED      (1 << TIF_NEED_RESCHED)
>  #define _TIF_SYSCALL_TRACEPOINT        (1 << TIF_SYSCALL_TRACEPOINT)
>  #define _TIF_SYSCALL_AUDIT     (1 << TIF_SYSCALL_AUDIT)
> +#define _TIF_SECCOMP           (1 << TIF_SECCOMP)
>
>  #define _TIF_WORK_MASK \
>         (_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
>
>  #define _TIF_SYSCALL_WORK \
> -       (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
> +       (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT \
> +        _TIF_SECCOMP )
>
>  #endif /* _ASM_RISCV_THREAD_INFO_H */
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 355166f57205..e88ccbfa61ee 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -207,8 +207,25 @@ check_syscall_nr:
>         /* Check to make sure we don't jump to a bogus syscall number. */
>         li t0, __NR_syscalls
>         la s0, sys_ni_syscall
> -       /* Syscall number held in a7 */
> -       bgeu a7, t0, 1f
> +       /*
> +        * The tracer can change syscall number to valid/invalid value.
> +        * We use syscall_set_nr helper in syscall_trace_enter thus we
> +        * cannot trust the current value in a7 and have to reload from
> +        * the current task pt_regs.
> +        */
> +       REG_L a7, PT_A7(sp)
> +       /*
> +        * Syscall number held in a7.
> +        * If syscall number is above allowed value, redirect to ni_syscall.
> +        */
> +       bge a7, t0, 1f
> +       /*
> +        * Check if syscall is rejected by tracer or seccomp, i.e., a7 == -1.
> +        * If yes, we pretend it was executed.
> +        */
> +       li t1, -1
> +       beq a7, t1, ret_from_syscall_rejected
> +       /* Call syscall */
>         la s0, sys_call_table
>         slli t0, a7, RISCV_LGPTR
>         add s0, s0, t0
> @@ -219,6 +236,12 @@ check_syscall_nr:
>  ret_from_syscall:
>         /* Set user a0 to kernel a0 */
>         REG_S a0, PT_A0(sp)
> +       /*
> +        * We didn't execute the actual syscall.
> +        * Seccomp already set return value for the current task pt_regs.
> +        * (If it was configured with SECCOMP_RET_ERRNO/TRACE)
> +        */
> +ret_from_syscall_rejected:
>         /* Trace syscalls, but only if requested by the user. */
>         REG_L t0, TASK_TI_FLAGS(tp)
>         andi t0, t0, _TIF_SYSCALL_WORK
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index c1b51539c3e2..598e48b8ca2b 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -160,6 +160,14 @@ void do_syscall_trace_enter(struct pt_regs *regs)
>                 if (tracehook_report_syscall_entry(regs))
>                         syscall_set_nr(current, regs, -1);
>
> +       /*
> +        * Do the secure computing after ptrace; failures should be fast.
> +        * If this fails we might have return value in a0 from seccomp
> +        * (via SECCOMP_RET_ERRNO/TRACE).
> +        */
> +       if (secure_computing(NULL) == -1)
> +               syscall_set_nr(current, regs, -1);

On a -1 return, this should return immediately -- it should not
continue to process trace_sys_enter(), etc.

-Kees

> +
>  #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
>         if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>                 trace_sys_enter(regs, syscall_get_nr(current, regs));
> --
> 2.19.2
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
