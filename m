Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF16C56201
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 23:05:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A51206D8
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 23:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FjQxuq7d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="Ljc5nOFS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A51206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iR4CqGHVVbFwUjOikWP3in5RBPJ+12n7TX2PHVVnwKc=; b=FjQxuq7dgukKbqoMwn1PlGwMY
	YOGExELzLAJPJOCAYOUvQixqQNhB7P6wghqkandCGhveZkBhXk7CYaUEIyy0LFZW0zcr4JAyJHnPM
	f4E/AoAHQBJ20WhcYgcrhyS4CpOPp9rX3RIM7WqsoWZkDnufx7a4SNCtipruyHGAptCBO+nOmJbST
	6QnD2jcNpKx21gtxqkjIM9Z0mNSBfB40JWS1KlnSa2HwZhmXBgtRdsShawVNAuvagkCL5izHBnYGy
	oV246mBPzAbrZmNAtLmmTliHuBc7lzS9EYRQHebvmwwlvz40JT4xHYPFiTER/5v7ZsjE6KOEoD4iT
	BRF3AIuAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki3qG-00080T-Tm; Wed, 25 Nov 2020 23:04:52 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki3qE-0007zi-6q
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 23:04:51 +0000
Received: by mail-il1-x141.google.com with SMTP id w8so128991ilg.12
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 15:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n80jANQ791F1uYlgeCOHCwoU6m/GjmzT+RDoAHWuShA=;
 b=Ljc5nOFSGE0oUsNzgjIQivK/F9mFcYKMqTbiKFtScVgSASpxt4xKDsYOLc1wpkcn6U
 /z+cQUJXJD9TwYbn5uCHScFNXoFmA3O2+1jcM1UXzJWUM84hVeZwVm5I/IWDVaU4spID
 o6CQNrymmg0eRSzGt2535ERfWs6k04flSlVgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n80jANQ791F1uYlgeCOHCwoU6m/GjmzT+RDoAHWuShA=;
 b=BhQIstnh67x9wPoi6tPav0FOBsrzmkbf/MAiQo7Rb3beMz+9/EfGTj6Qhc5BUXk+R4
 IOuxFbtzhlqpH30P2czKXcKLAuBKU1fB3hwIbhZVShILA+T9IIhAlNtna4KS1nXfKMAj
 KUnNUzzBD7eBlxwc4MhwkHPPdclBODuu5ZrWM9uHRwAV//Zki1iuejZpnPAgrPW1fBCe
 +i/wKVsqrcMy7P+r1sKHeCgThTBptCen8ZJ8GtOOMD64njgjfbJZ7TWq5Cds2Syk5KU8
 YbKnbppyQYneHbKzndHeyiMmxgsCE1tZJvo8qb2rgzHuFVafiSYjIEkWzOiRsgKlvplA
 L0Tg==
X-Gm-Message-State: AOAM530GaEV/vWQG86rUQW4313AfQF4chhsRh9tKwYdq/9Uv622FcvjL
 dn+orhwI6rJYuMMTAfZdUrYjN0IcZf1/f/Api4vc
X-Google-Smtp-Source: ABdhPJz+4t7wrduVH3d8A+koKfT4Z1fdFQxju4GHQnVPyZ74YajFyvuWekWbYQq+LjMcrOr28efcd5YagE37y/JwsN4=
X-Received: by 2002:a92:d588:: with SMTP id a8mr78720iln.79.1606345488504;
 Wed, 25 Nov 2020 15:04:48 -0800 (PST)
MIME-Version: 1.0
References: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
 <20201124112054.106960-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20201124112054.106960-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 25 Nov 2020 15:04:39 -0800
Message-ID: <CAOnJCU+YAy9put26aC4yYZ5j8yMayLnJm9wy7W=auYPLE2QFfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Add dump stack in show_regs
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_180450_292331_61537148 
X-CRM114-Status: GOOD (  21.94  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 3:17 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Like commit 1149aad10b1e ("arm64: Add dump_backtrace() in show_regs"),
> dump the stack in riscv show_regs as common code expects.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> NOTE: The patches based on
> https://patchwork.kernel.org/project/linux-riscv/list/?series=383349
>
>  arch/riscv/include/asm/bug.h        |  1 +
>  arch/riscv/include/asm/stacktrace.h |  2 ++
>  arch/riscv/kernel/process.c         |  9 ++++++++-
>  arch/riscv/kernel/stacktrace.c      | 10 ++++++++--
>  arch/riscv/kernel/traps.c           |  3 ++-
>  5 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index d6f1ec08d97b..d3804a2f9aad 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -85,6 +85,7 @@ do {                                                          \
>  struct pt_regs;
>  struct task_struct;
>
> +void __show_regs(struct pt_regs *regs);
>  void die(struct pt_regs *regs, const char *str);
>  void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr);
>
> diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
> index 470a65c4ccdc..3450c1912afd 100644
> --- a/arch/riscv/include/asm/stacktrace.h
> +++ b/arch/riscv/include/asm/stacktrace.h
> @@ -13,5 +13,7 @@ struct stackframe {
>
>  extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>                                     bool (*fn)(void *, unsigned long), void *arg);
> +extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
> +                          const char *loglvl);
>
>  #endif /* _ASM_RISCV_STACKTRACE_H */
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 19225ec65db6..e41b733abeaa 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -18,6 +18,7 @@
>  #include <asm/unistd.h>
>  #include <asm/processor.h>
>  #include <asm/csr.h>
> +#include <asm/stacktrace.h>
>  #include <asm/string.h>
>  #include <asm/switch_to.h>
>  #include <asm/thread_info.h>
> @@ -39,7 +40,7 @@ void arch_cpu_idle(void)
>         local_irq_enable();
>  }
>
> -void show_regs(struct pt_regs *regs)
> +void __show_regs(struct pt_regs *regs)
>  {
>         show_regs_print_info(KERN_DEFAULT);
>
> @@ -69,6 +70,12 @@ void show_regs(struct pt_regs *regs)
>         pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
>                 regs->status, regs->badaddr, regs->cause);
>  }
> +void show_regs(struct pt_regs *regs)
> +{
> +       __show_regs(regs);
> +       if (!user_mode(regs))
> +               dump_backtrace(regs, NULL, KERN_DEFAULT);
> +}
>
>  void start_thread(struct pt_regs *regs, unsigned long pc,
>         unsigned long sp)
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 48b870a685b3..76dadf6d396b 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -101,10 +101,16 @@ static bool print_trace_address(void *arg, unsigned long pc)
>         return true;
>  }
>
> +void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
> +                   const char *loglvl)
> +{
> +       pr_cont("%sCall Trace:\n", loglvl);
> +       walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
> +}
> +
>  void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
>  {
> -       pr_cont("Call Trace:\n");
> -       walk_stackframe(task, NULL, print_trace_address, (void *)loglvl);
> +       dump_backtrace(NULL, task, loglvl);
>  }
>
>  static bool save_wchan(void *arg, unsigned long pc)
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index ad14f4466d92..570eb078b1e1 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/irq.h>
>
> +#include <asm/bug.h>
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/csr.h>
> @@ -66,7 +67,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
>                         tsk->comm, task_pid_nr(tsk), signo, code, addr);
>                 print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
>                 pr_cont("\n");
> -               show_regs(regs);
> +               __show_regs(regs);
>         }
>
>         force_sig_fault(signo, code, (void __user *)addr);
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

LGTM.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
