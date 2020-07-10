Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D55C433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 17:30:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257C620725
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 17:30:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PZPyZXUh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Iq0sROh9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257C620725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=L88EsjrL4cj9wr1rPgdhLDBJwm/SovJ1FAuU/Gj1pGI=; b=PZPyZXUhPuiCIL8b0dZFWpmEu
	KTOI/Ic0Ue92VGlRI1+BSXS89hAmD5cfEjV4od2sUxqBjYJbpssDESB2uIJGtS8hLL+TxY28U9AW0
	pfTA4yTJTt87UycYPU0ljA5Vz+6UG3hgszuPPQ6iyz4YFOdZpDV6ae7Pm+3Q5JR1E/tAytXrEocRI
	et7NBDh+6IXTx92wXrYUr+/pwHkiwR6EIFl5Z5XFlFcDvhTUsVXvC0Jvk/wbWwM5gWoRqiYU7GCZK
	VJgUS0tu+5KSEQ2GffrlLs9+93+pAwqRbQm43jHIMqcH7/vBUo71hk8EmsQQGZ6krejxpP7MeyXy/
	UvkRftPhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtwqu-0005Tg-HT; Fri, 10 Jul 2020 17:30:24 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtwqr-0005SB-IY
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 17:30:22 +0000
Received: by mail-pf1-x444.google.com with SMTP id z3so2806249pfn.12
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tTmWEqz6lUd89tDyZu3lt2tGh6dUI6Q1soQYsW2JCJk=;
 b=Iq0sROh9nDv/QnxdNYnmzniAQlTq+9F/tAmE+fB0P+oqdIGJv9M6SBZ+FCL2XB1kKz
 pJmfMVVGEAJU/fA1qJJOcB43dFKLqmhpVSkmH8zIa+xeoFkEmIw6RTtErPrkw3uvB7O4
 1soS86qCMAjSqBFDjMPu3+9jbVb0dwxIhSXa+cvGkTHG+nMa4WKaAEwnUcYnvy9jnela
 2mKXo/X5OkUoZ92KOo6xtFPqN4Kk5+64356NQ/rjBZautEk4aD8gRlvJL7Ir/QUxXeFv
 Jgu2Q8IA9YBF7OX4/aHuUmKzqYEDpHIw139KvTXca71jzVti4OYyob3HMdFczwcSptxI
 Az3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tTmWEqz6lUd89tDyZu3lt2tGh6dUI6Q1soQYsW2JCJk=;
 b=iwRcYi8nlZfoKAAwN7IY0L2NdxUeXNMPBB65zwwmHRbmybY+sBhhIJGou8q5JJ06s3
 pmwnD0iE3MhwxQwbYpHVYm7ukWEb6ye33396tUOAUo35fkfvHhuMq0E0Bt8epf2ZHzrP
 kvSLRhqsnJ+hUOyPDZP+oG0oeUOzVO/PhnImxvqgCtzUH12lW4Iebwp/PRZ3QYY6HYlr
 QgoXEnLGyDE7PMniUF4QOVeXz7MUgDNh7JqZgYFuqaTXw31VtHYthbmr/94iQ59UPGdm
 pv1H6lOzyjbbvmTZ90ZUQBlnMu2BCJNI4VqM7UfNO/PvHKOuKgEQLViO87ewMVdgmqzu
 LBLA==
X-Gm-Message-State: AOAM532MYQZIT7irevPNgNAyQqZSQOaZtxAb2Gm6MIETNcr4jms0QblT
 L/2lC1kGnz3Bb4ZYBqXYXrI78IvDyEKIdQ==
X-Google-Smtp-Source: ABdhPJxNDZlA7O43xRha9ury48i2drKmQyDtiMgBJRNThVorkoTtCGOUgfpDAyIbuKa4VWEGZyntjA==
X-Received: by 2002:aa7:9e0e:: with SMTP id y14mr49980161pfq.77.1594402219419; 
 Fri, 10 Jul 2020 10:30:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c2sm6330306pgk.77.2020.07.10.10.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 10:30:18 -0700 (PDT)
Date: Fri, 10 Jul 2020 10:30:18 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Jul 2020 10:29:46 PDT (-0700)
Subject: Re: [PATCH v2 2/2] riscv: Enable context tracking
In-Reply-To: <1d89d5a6b54ca3d3203cb02ff4548b4eb9820c61.1592989082.git.greentime.hu@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-21b29738-a664-4209-89e8-763e32a59a4e@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_133021_672934_A3EA7CF4 
X-CRM114-Status: GOOD (  23.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>,
 greentime.hu@sifive.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 24 Jun 2020 02:03:16 PDT (-0700), greentime.hu@sifive.com wrote:
> This patch implements and enables context tracking for riscv (which is a
> prerequisite for CONFIG_NO_HZ_FULL support)
>
> It adds checking for previous state in the entry that all excepttions and
> interrupts goes to and calls context_tracking_user_exit() if it comes from
> user space. It also calls context_tracking_user_enter() if it will return
> to user space before restore_all.
>
> This patch is tested with the dynticks-testing testcase in
> qemu-system-riscv64 virt machine and Unleashed board.
> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
>
> We can see the log here. The tick got mostly stopped during the execution
> of the user loop.
>
>                         _-----=> irqs-off
>                        / _----=> need-resched
>                       | / _---=> hardirq/softirq
>                       || / _--=> preempt-depth
>                       ||| /     delay
>      TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
>         | |       |   ||||       |         |
>    <idle>-0     [001] d..2   604.183512: sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=taskset next_pid=273 next_prio=120
> user_loop-273   [001] d.h1   604.184788: hrtimer_expire_entry: hrtimer=000000002eda5fab function=tick_sched_timer now=604176096300
> user_loop-273   [001] d.s2   604.184897: workqueue_queue_work: work struct=00000000383402c2 function=vmstat_update workqueue=00000000f36d35d4 req_cpu=1 cpu=1
> user_loop-273   [001] dns2   604.185039: tick_stop: success=0 dependency=SCHED
> user_loop-273   [001] dn.1   604.185103: tick_stop: success=0 dependency=SCHED
> user_loop-273   [001] d..2   604.185154: sched_switch: prev_comm=taskset prev_pid=273 prev_prio=120 prev_state=R+ ==> next_comm=kworker/1:1 next_pid=46 next_prio=120
>     <...>-46    [001] ....   604.185194: workqueue_execute_start: work struct 00000000383402c2: function vmstat_update
>     <...>-46    [001] d..2   604.185266: sched_switch: prev_comm=kworker/1:1 prev_pid=46 prev_prio=120 prev_state=I ==> next_comm=taskset next_pid=273 next_prio=120
> user_loop-273   [001] d.h1   604.188812: hrtimer_expire_entry: hrtimer=000000002eda5fab function=tick_sched_timer now=604180133400
> user_loop-273   [001] d..1   604.189050: tick_stop: success=1 dependency=NONE
> user_loop-273   [001] d..2   614.251386: sched_switch: prev_comm=user_loop prev_pid=273 prev_prio=120 prev_state=X ==> next_comm=swapper/1 next_pid=0 next_prio=120
>    <idle>-0     [001] d..2   614.315391: sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=taskset next_pid=276 next_prio=120
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/Kconfig        |  1 +
>  arch/riscv/kernel/entry.S | 23 +++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 128192e14ff2..17520e11815b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -52,6 +52,7 @@ config RISCV
>  	select HAVE_ARCH_SECCOMP_FILTER
>  	select HAVE_ARCH_TRACEHOOK
>  	select HAVE_ASM_MODVERSIONS
> +	select HAVE_CONTEXT_TRACKING
>  	select HAVE_COPY_THREAD_TLS
>  	select HAVE_DMA_CONTIGUOUS if MMU
>  	select HAVE_EBPF_JIT if MMU
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index cae7e6d4c7ef..6ed579fc1073 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -97,6 +97,14 @@ _save_context:
>  	la gp, __global_pointer$
>  .option pop
>
> +#ifdef CONFIG_CONTEXT_TRACKING
> +	/* If previous state is in user mode, call context_tracking_user_exit. */
> +	andi a0, s1, SR_SPP

I've changed that to SR_PP, as I don't see any reason why this should depend on
MMU.

I think this is correct: we're using scratch==0 elsewhere to detect recursive
traps, but we've blown that away by this point so it's not an option.  I don't
know of any reason why PP wouldn't be accurate.

> +	bnez a0, skip_context_tracking
> +	call context_tracking_user_exit
> +
> +skip_context_tracking:
> +#endif
>  	la ra, ret_from_exception
>  	/*
>  	 * MSB of cause differentiates between
> @@ -137,6 +145,17 @@ _save_context:
>  	tail do_trap_unknown
>
>  handle_syscall:
> +#ifdef CONFIG_CONTEXT_TRACKING
> +	/* Recover a0 - a7 for system calls */
> +	REG_L x10, PT_A0(sp)
> +	REG_L x11, PT_A1(sp)
> +	REG_L x12, PT_A2(sp)
> +	REG_L x13, PT_A3(sp)
> +	REG_L x14, PT_A4(sp)
> +	REG_L x15, PT_A5(sp)
> +	REG_L x16, PT_A6(sp)
> +	REG_L x17, PT_A7(sp)
> +#endif
>  	 /* save the initial A0 value (needed in signal handlers) */
>  	REG_S a0, PT_ORIG_A0(sp)
>  	/*
> @@ -205,6 +224,10 @@ resume_userspace:
>  	andi s1, s0, _TIF_WORK_MASK
>  	bnez s1, work_pending
>
> +#ifdef CONFIG_CONTEXT_TRACKING
> +	call context_tracking_user_enter
> +#endif
> +
>  	/* Save unwound kernel stack pointer in thread_info */
>  	addi s0, sp, PT_SIZE_ON_STACK
>  	REG_S s0, TASK_TI_KERNEL_SP(tp)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
