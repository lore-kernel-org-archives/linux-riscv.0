Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A19CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 03:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2C2foKz9/qf2gzk6t4EHBXy9ciPeHlgzr2Z8bEAwfk=; b=Osr4XgzDo2JOA4
	ETMy+w8pFlDbl2hMXPTFKqs6k6Rl72817UfMuwJnFcZH/BrkNirfxZTh8rrOc2zMJnMNKNrOry8zy
	O+VJ1v0HhwFavTksWcIP3Ij3VKuoqm9XonPu2BNT0iI+djtUbEFob9gDpf99RBopP08FFDIoUaSbk
	dvPBQOFc7c6zEXo1W7afSDTF6eNOXfuA9Ri0qio/LdQuMOIcuKHrbb4RLm9Qze/j2B1ntAZdqGs70
	LvDLZRkwfJll3dynn2PU1bd2cG5lunteHhR8Pq8r/vqG2Jy2oJAI2U7xF4EObmWNoZWeC6sisLT2o
	5U1bFly8esVUmPJ0ydqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okztj-00EH9D-8P; Wed, 19 Oct 2022 03:37:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okztg-00EH8g-7a
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 03:37:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71D2361751
	for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 03:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A2AC43144
	for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 03:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666150654;
	bh=EBF7VIq95F0DlBovf75OXNo51TgwpOaJQk8sFi+3rGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UGg9XV5EIZthWJmdnrWrxtPEA4SN8lCB3zDnH4dLN9nwDYjDWHlR440bIlui36/LY
	 DF8X7ZslF+D5wzuGoOooFhPss2UAYFMLqOdptKBWzHRk0tAC2kg6hmCCN8rtCM66Dp
	 R5CThAhrZxSRzjhX0YxFaXuWs1unVvDHtUFD7mhzpdfGXxsZiTlCP2fnA38eRcfHWf
	 cP+7RcvupWGiozxXtrAWavzX5ZlBed6krW4ZKPpiRTW9UXbR4eGito1gwGczZ1t3AU
	 TwTTB9XsBxAScv1+BPuljdsFkrMpgIEiXvjOiBud3Uud4HfgPItn7GzdUUhO8xQCjR
	 18z/2JZR5VFxA==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-131dda37dddso19269708fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 20:37:34 -0700 (PDT)
X-Gm-Message-State: ACrzQf3moqdM4idVrCZxtBD4/SehnVDDB4uTWcmWR3/Y8alOdj+V3xeC
	OBd/EbznYrDGXua7LsvhModMgkse+Zk6WZzAqr0=
X-Google-Smtp-Source: AMsMyM6s66yoxrTHtul+Q7dLuF9JNyuwHLHxceRCvOIwSBtvoSv327hMUd/fYCGuUid+/N63e/gy/y1T88F8Ij1MX3w=
X-Received: by 2002:a05:6870:4413:b0:136:66cc:6af8 with SMTP id
 u19-20020a056870441300b0013666cc6af8mr20753144oah.112.1666150653930; Tue, 18
 Oct 2022 20:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220928162007.3791-1-jszhang@kernel.org> <20220928162007.3791-3-jszhang@kernel.org>
In-Reply-To: <20220928162007.3791-3-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 Oct 2022 11:37:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQNiv=HSZUcgOeLWmvoEgx6=YdGAruH56LOhUv-gG2HMQ@mail.gmail.com>
Message-ID: <CAJF2gTQNiv=HSZUcgOeLWmvoEgx6=YdGAruH56LOhUv-gG2HMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: consolidate ret_from_kernel_thread into ret_from_fork
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_203736_376986_E6DA3570 
X-CRM114-Status: GOOD (  21.42  )
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

I would involve this patch in the generic entry series. It would help
remove the ret_from_kernel_thread part in the entry.S.

On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
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
