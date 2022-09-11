Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D51C6FA83
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Sep 2022 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dmmi5Wk6au6r6/LUw0QehQzMowLDBcF6PtWdVEdtFt4=; b=jRxSR0plbvce5+
	YDG9xacqCgblvy64jhzXVshDoedV0OKTzdfJhgQ6Z312iF1O8qdHHNMFT4DsfumrTArYn+NYVxwQ2
	HHGHkFHCov64My7OAGt+OIcjopKHpbK+N+Q5Iy+K4Vgc0cloFvlio7rBUY2XLY1gn0323YKubjlq2
	5dc9XVVvxZ+YUYmMiJXedADrLC7IVaPk8LtVi+DaTZSPTsTe8JBxwmldcwJ7Tug/mK7mcEFIt1BwI
	c/T+96WoZK18BpWGxqLv7jeBkTDVMjkNi1uOrGIC/0kuM5F0JvwV7oq9QLHrdKGmMIQ4YWTAVO4gF
	XvOoPQ1ZnRPJYISSdOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXPhs-00386d-1l; Sun, 11 Sep 2022 16:21:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXPhp-00384Z-9k
	for linux-riscv@lists.infradead.org; Sun, 11 Sep 2022 16:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8A116100A
	for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 16:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA02AC4314A
	for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662913269;
	bh=cGfWdjsunVGfPSZnLvUn5+vhKZzaMGDo1120Cm21tzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OJZM7TB1QZmLpOAIyyPwJcx8NRaqx5j+pAjfCr2xcwoE3+zV1aGr5/cE6kV6WqVR7
	 0wAVfPHFVmmQGbgSjhbD9YEoHs1XPMlYbdzvjB+MUiWh3QMzuiAXfqGQ9J7LeKw1DW
	 TVq1O8kp+Bic50n3bgVUlHhwK/klb0T0OGWMckWabjgqMSIOyyFh1r/9e6x4I9WEmC
	 Jo0ge8oYF0f11+slT29Sd0CUc2G1i6QQJmoRs5T8Y9IwTH5YaMjTLVfrm45kvfp5be
	 xiezNqH4HuB0gn95EKH7crldsJqvAMFBH8k1Akwo44F9fqheyF2AX5IgWGg4GSWssM
	 QajM4oqxmC1fg==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-12803ac8113so17318510fac.8
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 09:21:09 -0700 (PDT)
X-Gm-Message-State: ACgBeo3fFYtwo1tTFs5NJv4pipJmCjCpcZfGr+o6ycDk47tGTo3Iq7Wp
	F/ivAfCmRmehgNncIgJ3NapvxpGr2bVx5+wdaB0=
X-Google-Smtp-Source: AA6agR4WxSXlbU7Po+4Z/ivfavMWvRhtAeEpn4FFnOVslawINbxBs1npyJelq94Jp0sGwlqNn9hCLLS7FNwOfa+P5tA=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr2811184oao.112.1662913268609; Sun, 11
 Sep 2022 09:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-5-guoren@kernel.org>
 <Yxmaz7wJPEBQ7Vki@hirez.programming.kicks-ass.net> <CAJF2gTSs4Ycu52DH6NUzdMXQGMT51XU6x-fgQ-_OpRne+vkTqQ@mail.gmail.com>
 <Yx36JRG64DtuDrRz@hirez.programming.kicks-ass.net>
In-Reply-To: <Yx36JRG64DtuDrRz@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 12 Sep 2022 00:20:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRKJmn_+Otg4NMG0rGU6zziOgfcpsFwBcE=nEKb9s9jTg@mail.gmail.com>
Message-ID: <CAJF2gTRKJmn_+Otg4NMG0rGU6zziOgfcpsFwBcE=nEKb9s9jTg@mail.gmail.com>
Subject: Re: [PATCH V4 4/8] riscv: traps: Add noinstr to prevent
 instrumentation inserted
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, bigeasy@linutronix.de, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_092113_458612_847F8EBC 
X-CRM114-Status: GOOD (  17.35  )
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

On Sun, Sep 11, 2022 at 11:09 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sat, Sep 10, 2022 at 05:17:44PM +0800, Guo Ren wrote:
>
> > > > -asmlinkage __visible __trap_section void name(struct pt_regs *regs)  \
> > > > +asmlinkage __visible __trap_section void noinstr name(struct pt_regs *regs)  \
> > >
> > > But now you have __trap_section and noinstr both adding a section
> > > attribute.
> >
> > Oops, thx for correcting. Here is my solution.
> >
> > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > index 635e6ec26938..eba744caa711 100644
> > --- a/arch/riscv/kernel/traps.c
> > +++ b/arch/riscv/kernel/traps.c
> > @@ -92,9 +92,11 @@ static void do_trap_error(struct pt_regs *regs, int
> > signo, int code,
> >  }
> >
> >  #if defined(CONFIG_XIP_KERNEL) && defined(CONFIG_RISCV_ALTERNATIVE)
> > -#define __trap_section         __section(".xip.traps")
> > +#define __trap_section                                                 \
> > +       noinline notrace __attribute((__section__(".xip.traps")))       \
> > +       __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
> >  #else
> > -#define __trap_section
> > +#define __trap_section noinstr
> >  #endif
>
> This is almost guaranteed to get out of sync when the compiler guys add
> yet another sanitizier. Please consider picking up this patch:
>
>   https://lore.kernel.org/all/20211110115736.3776-7-jiangshanlai@gmail.com/
Thx, that is what I want.

>
> and using __noinstr_section(".xip.traps")



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
