Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D446C04A95
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 23:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W36G66vmPGpgpXeIFiTU4ViKAJe6rSVHzfhA+VF8Mfs=; b=iJ373Pket6vN9W
	4XAGKMNQU4HLkBQLaMIOda5V3vr1Bz2Toe/8tegDKG4oZwl2a5WZ9At2DkOrpqQmkHQlmeO7aufTU
	Qse2ZJ5N/b5Kf74jVe+zYAjGR7b96wf4xmWnksnTLTs/pmlTtykIT3oy+bA8YVPOt0aVVKkH8MW7v
	8gNyq704+TbtRf3UNitL6uYyLZsF7b2hX6kMDJT6L67j3H0WoZIoKK749R2hO0fwM2OswpkgAozYl
	0TYrpF2VHHpThE42N3sp2VdITyg9zWLk5zSF4BFyCyx2pzHJ+3Li6SNCvAD6dS/dDEmPNi9X4Yl4f
	dOzc5Rw94joT1QQRGasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocb0O-000C0A-N5; Sun, 25 Sep 2022 23:25:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocb0L-000Bzh-6P
	for linux-riscv@lists.infradead.org; Sun, 25 Sep 2022 23:25:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E475612EC
	for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 23:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF1FC43141
	for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 23:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664148343;
	bh=0qWW3ytRn5sqjDChA6hp83Pha33NNRIB+EMSPBMJ1W4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QiEIB8UQYML9DR5RHuTQU83t6r3TU4wJLraulIDsfvfVsNgi/u/Ko7peUvZJrhSIo
	 qQGeuc528E/TOFTkdFT5ftrzMAK1Apz+f9/iQQp1zY8j+p9Xr9+7Tkx4VwyoK9VyK6
	 sWoovwaVAIisUMA/knsbc7F9SeEabWartQrlOmmOT/1T3uVTU+MeQIvbASIIwahpv4
	 RVJ4UsbfHnibswZDjiXsHrHo1Smgz5IpGvS4U/3hZzj1GGqRN0u/iJ2PBHFVTgJPB9
	 PBP247rYS6xMKnhDIxjkDZKqVP4M/6NS4OZ7spvr1VJXT1QmICbRy5fLNegNt3jrHd
	 S1YGjNm7YBGEQ==
Received: by mail-ot1-f53.google.com with SMTP id r34-20020a05683044a200b0065a12392fd7so3471843otv.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 16:25:43 -0700 (PDT)
X-Gm-Message-State: ACrzQf1NSlEGKbTTgXJiDiIAZHOWv1t0m1ipVwJP00B2zLt5nCWZWSr+
	VKtfmkRquzCBBehbKMyodcuTaWwh+kRJqNnEk0E=
X-Google-Smtp-Source: AMsMyM6ks0NsA08B8/+Ccexe8yxOmM2z3hYh5K0DREm4vqGj/TSiiZYOLw8pMRmxxJcEg0vfSeV6UJvIawj0R+0XeQo=
X-Received: by 2002:a05:6830:34a4:b0:65a:b03:54cc with SMTP id
 c36-20020a05683034a400b0065a0b0354ccmr8647715otu.140.1664148342896; Sun, 25
 Sep 2022 16:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220925175356.681-1-jszhang@kernel.org> <20220925175356.681-3-jszhang@kernel.org>
In-Reply-To: <20220925175356.681-3-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 26 Sep 2022 07:25:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTqup62EM9LZQ-9daKk11O0geax9Z3HmTMOxYy2mAwm=w@mail.gmail.com>
Message-ID: <CAJF2gTTqup62EM9LZQ-9daKk11O0geax9Z3HmTMOxYy2mAwm=w@mail.gmail.com>
Subject: Re: [PATCH 2/4] riscv: consolidate ret_from_kernel_thread into ret_from_fork
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_162545_336655_4378A0E4 
X-CRM114-Status: GOOD (  21.48  )
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

On Mon, Sep 26, 2022 at 2:03 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> The ret_from_kernel_thread() behaves similarly with ret_from_fork(),
> the only difference is whether call the fn(arg) or not, this can be
> acchieved by testing fn is NULL or not, I.E s0 is 0 or not.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/entry.S   | 11 +++--------
>  arch/riscv/kernel/process.c |  5 ++---
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 2207cf44a3bc..a3e1ed2fa2ac 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -323,20 +323,15 @@ END(handle_kernel_stack_overflow)
>
>  ENTRY(ret_from_fork)
>         call schedule_tail
> -       move a0, sp /* pt_regs */
> -       la ra, ret_from_exception
> -       tail syscall_exit_to_user_mode
> -ENDPROC(ret_from_fork)
> -
> -ENTRY(ret_from_kernel_thread)
> -       call schedule_tail
> +       beqz s0, 1f     /* not from kernel thread */
We can't use s0 as condition for ret_from_fork/ret_from_kernel_thread.
The s0=0 is also okay for ret_from_fork.

        /* p->thread holds context to be restored by __switch_to() */
        if (unlikely(args->fn)) {
                /* Kernel thread */
                memset(childregs, 0, sizeof(struct pt_regs));
                childregs->gp = gp_in_global;
                /* Supervisor/Machine, irqs on: */
                childregs->status = SR_PP | SR_PIE;

                p->thread.ra = (unsigned long)ret_from_kernel_thread;
                p->thread.s[0] = (unsigned long)args->fn;
                p->thread.s[1] = (unsigned long)args->fn_arg;
        } else {
                *childregs = *(current_pt_regs());
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                if (usp) /* User fork */
                        childregs->sp = usp;
                if (clone_flags & CLONE_SETTLS)
                        childregs->tp = tls;
                childregs->a0 = 0; /* Return value of fork() */
                p->thread.ra = (unsigned long)ret_from_fork;
        }
        p->thread.sp = (unsigned long)childregs; /* kernel sp */

>         /* Call fn(arg) */
>         move a0, s1
>         jalr s0
> +1:
>         move a0, sp /* pt_regs */
>         la ra, ret_from_exception
>         tail syscall_exit_to_user_mode
> -ENDPROC(ret_from_kernel_thread)
> +ENDPROC(ret_from_fork)
>
>  #ifdef CONFIG_IRQ_STACKS
>  ENTRY(call_on_stack)
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index ceb9ebab6558..67e7cd123ceb 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -34,7 +34,6 @@ EXPORT_SYMBOL(__stack_chk_guard);
>  #endif
>
>  extern asmlinkage void ret_from_fork(void);
> -extern asmlinkage void ret_from_kernel_thread(void);
>
>  void arch_cpu_idle(void)
>  {
> @@ -172,7 +171,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>                 /* Supervisor/Machine, irqs on: */
>                 childregs->status = SR_PP | SR_PIE;
>
> -               p->thread.ra = (unsigned long)ret_from_kernel_thread;
>                 p->thread.s[0] = (unsigned long)args->fn;
>                 p->thread.s[1] = (unsigned long)args->fn_arg;
>         } else {
> @@ -182,8 +180,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>                 if (clone_flags & CLONE_SETTLS)
>                         childregs->tp = tls;
>                 childregs->a0 = 0; /* Return value of fork() */
> -               p->thread.ra = (unsigned long)ret_from_fork;
> +               p->thread.s[0] = 0;
>         }
> +       p->thread.ra = (unsigned long)ret_from_fork;
>         p->thread.sp = (unsigned long)childregs; /* kernel sp */
>         return 0;
>  }
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
