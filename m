Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151D0C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 02:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eS2pcFDydh1niUGhGvuF8Bf9n5+sjcZ0/tBZyra8b6k=; b=HW/igFzS2f1Zu2
	p5dMHpIEHkR1Tb3ogFK2AywBYaY8CppTLi+mS4gUBcJj1jhpdMTlPwbT5fLTl4eK3cbK402co8gyf
	Iv/RHlgWeGryftGtP48FalzF7yFn+5G614zJ6MrbG3m+8eCccRJdVtBvU5pDsGm0I2eie8diupdxc
	M0Vw5+fjFeyFPXwuqsy6Je4q2PjM6SL2S49w08vCvqEyAY7DXz7G8T8JUN2A/SrbAzmOhLmjUGns4
	UJ7QH6Z3EhV4VFvzbc1Ok23SAFrsnRf4KMEifUHzYgt8eyi7EQ1rrKQYpXPA5hg8PCuvq+OINXhC6
	yQAsEKRxwr2AvBXgGUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogzOZ-00BQyI-F3; Sat, 08 Oct 2022 02:16:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogzOW-00BQx7-Jv
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 02:16:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1EAA61E39
	for <linux-riscv@lists.infradead.org>; Sat,  8 Oct 2022 02:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD00C4314F
	for <linux-riscv@lists.infradead.org>; Sat,  8 Oct 2022 02:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665195409;
	bh=fJZiXIczXHKWSWOJREIPZZI4lyDP1osRfKH0d9gMG9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XJdre88GuzkyX8miOvR5lz7t5nMrVg+RdgltnzIt7wijp9gBMVTJ5Ugj94xyDWOvT
	 R7UFdbISnUHuUSzaVN1xGm8DM8NQ2SA76723qzSFI6O2mVqcAXL0E1P7kRCR+qH8UR
	 yQXckh7ShWuPweU1ibuRee4wrAHXyPfhH8rL7ts5yP505HgqsGK2HFNvQj0akqKl0/
	 gY8Ls0GkczDGLnRi/9nl/29QrOhsVIiSwCoJuylivZHNb7lLUXG0I/K0eMAwaXLNmr
	 YafuAPSA2CNX7ychb2j3Pu9FOXHJIoT3dBu4skrfit9fXonENb7AJxXaH8q56IOB74
	 kPYBqli3C+Zmg==
Received: by mail-oi1-f175.google.com with SMTP id d64so7446422oia.9
        for <linux-riscv@lists.infradead.org>; Fri, 07 Oct 2022 19:16:49 -0700 (PDT)
X-Gm-Message-State: ACrzQf1UZLTEDJSL+sC3k/zM49yWjiUNzzlBX95kStqdSmuLnp4dlN60
	+X4/FI3DVKAeF1b8v5rZvEqef07F8W/Z9CxMA1E=
X-Google-Smtp-Source: AMsMyM4WITxFNS7eyExidUgQiJ5ich4TeNeqmzLVzbaZ1CMDMKDcOXm1GjRQmdAu1Nym8En0zhJcdL3W8uqF1Vnen3U=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr9188426oiw.112.1665195408646; Fri, 07
 Oct 2022 19:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221002012451.2351127-1-guoren@kernel.org> <20221002012451.2351127-6-guoren@kernel.org>
 <YzrKQkK4Kfbd7Wik@FVFF77S0Q05N>
In-Reply-To: <YzrKQkK4Kfbd7Wik@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 8 Oct 2022 10:16:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQTWAGwdOta4_QQx0Q6h2OKjJuz43a_OWt0R9XVe3Rzbw@mail.gmail.com>
Message-ID: <CAJF2gTQTWAGwdOta4_QQx0Q6h2OKjJuz43a_OWt0R9XVe3Rzbw@mail.gmail.com>
Subject: Re: [PATCH V6 05/11] riscv: traps: Add noinstr to prevent
 instrumentation inserted
To: Mark Rutland <mark.rutland@arm.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, zouyipeng@huawei.com, 
	bigeasy@linutronix.de, David.Laight@aculab.com, chenzhongjin@huawei.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_191652_757590_9ECB4736 
X-CRM114-Status: GOOD (  26.02  )
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

On Mon, Oct 3, 2022 at 7:41 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Sat, Oct 01, 2022 at 09:24:45PM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Without noinstr the compiler is free to insert instrumentation (think
> > all the k*SAN, KCov, GCov, ftrace etc..) which can call code we're not
> > yet ready to run this early in the entry path, for instance it could
> > rely on RCU which isn't on yet, or expect lockdep state. (by peterz)
> >
> > Link: https://lore.kernel.org/linux-riscv/YxcQ6NoPf3AH0EXe@hirez.programming.kicks-ass.net/raw
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/kernel/traps.c | 4 ++--
> >  arch/riscv/mm/fault.c     | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > index 635e6ec26938..588e17c386c6 100644
> > --- a/arch/riscv/kernel/traps.c
> > +++ b/arch/riscv/kernel/traps.c
> > @@ -92,9 +92,9 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
> >  }
> >
> >  #if defined(CONFIG_XIP_KERNEL) && defined(CONFIG_RISCV_ALTERNATIVE)
> > -#define __trap_section               __section(".xip.traps")
> > +#define __trap_section __noinstr_section(".xip.traps")
>
> I assume that for CONFIG_XIP_KERNEL, KPROBES is not possible, and so functions
> marked with __trap_section don't need to be excluded from kprobes.
>
> Is that assumption correct, or does something need to be done to inhibit that?
Correct!

In riscv, "we select HAVE_KPROBES if !XIP_KERNEL", so don't worry
about that. I don't think we could enable kprobe for XIP_KERNEL in the
future.

>
> Thanks,
> Mark.
>
> >  #else
> > -#define __trap_section
> > +#define __trap_section noinstr
> >  #endif
> >  #define DO_ERROR_INFO(name, signo, code, str)                                \
> >  asmlinkage __visible __trap_section void name(struct pt_regs *regs)  \
> > diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> > index f2fbd1400b7c..c7829289e806 100644
> > --- a/arch/riscv/mm/fault.c
> > +++ b/arch/riscv/mm/fault.c
> > @@ -203,7 +203,7 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
> >   * This routine handles page faults.  It determines the address and the
> >   * problem, and then passes it off to one of the appropriate routines.
> >   */
> > -asmlinkage void do_page_fault(struct pt_regs *regs)
> > +asmlinkage void noinstr do_page_fault(struct pt_regs *regs)
> >  {
> >       struct task_struct *tsk;
> >       struct vm_area_struct *vma;
> > --
> > 2.36.1
> >



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
