Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48061C6FA8E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+LsPE0CovqIJDkNkJwOn91RjqWPgOyLjq3B1QtUIcM=; b=brh1cF8jGaE/9c
	MskBGWJc4Vc6N6R3VMPdHAYT1AIBgRBJN892F9kB1K3n/3ONalgoknPFH1yQNu/5Nk3qAlOehO0iN
	o7pwyIZ26Qjzt5xilM0w31RjcV7htmCXciVYqVkknAgWbjOpfd8yR5oNUsHFSDNqY/+BBW5mu9NbX
	tUAoZPLcP0bzv4pgQFFTPbzFN/ohJ89+fLeKpt8eWPRdvbx+Oif9MSkijPLskfUuCKzJpOMF38j6M
	slt2UaYY4VyXQOO0RbeVCGRvXOWsILrne51/ZyQQ5wlwPDiKWr97wzTWmoWWp8zeE2vVK9gVippGH
	y8V1rTQi3iFeheG/4xqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocqkh-005qQs-7C; Mon, 26 Sep 2022 16:14:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocqkf-005qQ3-1v
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 16:14:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33E3BB80AE8;
	Mon, 26 Sep 2022 16:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A613C433C1;
	Mon, 26 Sep 2022 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664208871;
	bh=9mZcmdodNYy0rjsITnD/NXiAYxYxK3U+9un+VPbrPkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBuE/xwGLEeZ6roaFJUFS6djsXxPwuG1dCuSfA81AoTrZn0z7J7G8x/NSMb6AYrgB
	 JDBr/L8v/m5x+vDaD7Y6lt9Ub1GkD9wqn2CGJFiXouY/AcK40BYnbS6QrAL5437hIx
	 rkL35UueI3VjGdjCFX63Afu0loMGh4pp5uzVNR8PEu70Tm9l+zo0gA0hJxrNPBax56
	 lzeSqkktvtttmgsOozfaswfETeYCcjcj9z/olFM+GzFGNsfgZJPPRXUZsx7EOdEyLd
	 FKVQlX0A5mJwxRJ2Ud77xCHhMS7KNQGGVj+oGJVJ4ZQiSNU5RzLjzEmz3j+9mTnJnK
	 2CQBAQ9vFtPCA==
Date: Tue, 27 Sep 2022 00:05:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/4] riscv: consolidate ret_from_kernel_thread into
 ret_from_fork
Message-ID: <YzHNr13U+SdwJHo1@xhacker>
References: <20220925175356.681-1-jszhang@kernel.org>
 <20220925175356.681-3-jszhang@kernel.org>
 <CAJF2gTTqup62EM9LZQ-9daKk11O0geax9Z3HmTMOxYy2mAwm=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTqup62EM9LZQ-9daKk11O0geax9Z3HmTMOxYy2mAwm=w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_091437_398665_1DDDFA29 
X-CRM114-Status: GOOD (  21.28  )
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

On Mon, Sep 26, 2022 at 07:25:30AM +0800, Guo Ren wrote:
> On Mon, Sep 26, 2022 at 2:03 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > The ret_from_kernel_thread() behaves similarly with ret_from_fork(),
> > the only difference is whether call the fn(arg) or not, this can be
> > acchieved by testing fn is NULL or not, I.E s0 is 0 or not.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/kernel/entry.S   | 11 +++--------
> >  arch/riscv/kernel/process.c |  5 ++---
> >  2 files changed, 5 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 2207cf44a3bc..a3e1ed2fa2ac 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -323,20 +323,15 @@ END(handle_kernel_stack_overflow)
> >
> >  ENTRY(ret_from_fork)
> >         call schedule_tail
> > -       move a0, sp /* pt_regs */
> > -       la ra, ret_from_exception
> > -       tail syscall_exit_to_user_mode
> > -ENDPROC(ret_from_fork)
> > -
> > -ENTRY(ret_from_kernel_thread)
> > -       call schedule_tail
> > +       beqz s0, 1f     /* not from kernel thread */

Hi Guo,

> We can't use s0 as condition for ret_from_fork/ret_from_kernel_thread.
> The s0=0 is also okay for ret_from_fork.

IIUC, in ret_from_fork, the s0 comes p->thread.s[0] rather than s0 in
pt_regs.

> 
>         /* p->thread holds context to be restored by __switch_to() */
>         if (unlikely(args->fn)) {
>                 /* Kernel thread */
>                 memset(childregs, 0, sizeof(struct pt_regs));
>                 childregs->gp = gp_in_global;
>                 /* Supervisor/Machine, irqs on: */
>                 childregs->status = SR_PP | SR_PIE;
> 
>                 p->thread.ra = (unsigned long)ret_from_kernel_thread;
>                 p->thread.s[0] = (unsigned long)args->fn;
>                 p->thread.s[1] = (unsigned long)args->fn_arg;
>         } else {
>                 *childregs = *(current_pt_regs());
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                 if (usp) /* User fork */
>                         childregs->sp = usp;
>                 if (clone_flags & CLONE_SETTLS)
>                         childregs->tp = tls;
>                 childregs->a0 = 0; /* Return value of fork() */
>                 p->thread.ra = (unsigned long)ret_from_fork;
>         }
>         p->thread.sp = (unsigned long)childregs; /* kernel sp */
> 

<snip>

> > @@ -182,8 +180,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >                 if (clone_flags & CLONE_SETTLS)
> >                         childregs->tp = tls;
> >                 childregs->a0 = 0; /* Return value of fork() */
> > -               p->thread.ra = (unsigned long)ret_from_fork;
> > +               p->thread.s[0] = 0;

Here we assign 0 to p->thread.s[0]

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
