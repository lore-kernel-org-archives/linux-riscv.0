Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D1FC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBGrbxy7mR0w50zWH1h/9TvaHybcDdpj14klvb9OOLk=; b=vLP2H5uOXaCam7
	oC1Auso+7EoTf5V9OCDFXaaJEMSnBr7FlQfMlEgqiTZPA6dY5SWruZRrCtw7h6mIqC5qIKaH4CDaf
	qdQpvCHZShtK3XSDcjlsfN4G7hLEAKF2xYW+TqAaKRO1Vv5IHjT8JJLIu5vhWSDqtYDw901PNOB48
	nyknhZcHAd7DaqZowd/oKTxIKFxpQ3iPtUfCom865rnk0P8+bOLE8yr/gvlbBjRocBwUS45/AOTAj
	y3iDzTvHuNjci3qDfYCaH2iG9WUIRrjYr6q2cp1nMWV+EuKcErUecBKQ6ad+ZkSlV4QrhtckDdrDm
	YRFqxACZe0cCn184j6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFb3p-00BWTL-2L; Wed, 11 Jan 2023 13:22:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFb3g-00BWQK-JZ
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:22:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F51661D1B
	for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 13:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F215BC4339E
	for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 13:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673443343;
	bh=WqpP15dPBJRpIKvrusU6JyT5rkDM538Zoeb9APxP3Vc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KRMkDLM8XtOeYyghJIfkzi8KblJLCcu0bE2nqyLg1WfiVHN0EFwaiLs6YJnyUOXBJ
	 tPMgH6K1c9b6yJdzERtwo5/KDLMBihm/LkEFSzocayWlX42GHJkPq2Svt4A4pkMUru
	 m6oi8ehxkDS4j3rZE1I9t5G5b7CEFokV7gRyNKxSYPhLrqCYsvDeBfDVw9GLuiPnqW
	 mYWzqmteULj+zRKP2hFni/68U0/7b1EJ1kP914bSJPdfORnFlTi2LfwPM/NYrq2mfU
	 Ic6syGuciunN6M+H6mQcwAqnJ1LlTTgv67ZqzVmGPZtYQVgbrC08To/19SPMTyDJ0w
	 kh+Bn+Am006fQ==
Received: by mail-ed1-f45.google.com with SMTP id i15so22304127edf.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 05:22:22 -0800 (PST)
X-Gm-Message-State: AFqh2kpVRaqHZfCXYKGc8TYhu6i8ZVynx+SNLge6V5V/LwS0bAx+Id4t
	xKSXKS2JmxjyhuTKUGDsHIqgG4giHFE9NADPSOk=
X-Google-Smtp-Source: AMrXdXtS26Yr3ozZ4stDJwuSTJl5cHPl3A84rtoZBgUd1+9pSn2HAMtOpAKid8uCnEz8FrI5A7nOoQoDKoNa2QavWa4=
X-Received: by 2002:a05:6402:785:b0:497:37db:303a with SMTP id
 d5-20020a056402078500b0049737db303amr1754019edy.117.1673443341085; Wed, 11
 Jan 2023 05:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20230107133549.4192639-1-guoren@kernel.org> <20230107133549.4192639-2-guoren@kernel.org>
 <Y7xMvAJXjHaus0Bm@FVFF77S0Q05N>
In-Reply-To: <Y7xMvAJXjHaus0Bm@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 11 Jan 2023 21:22:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRzS0hBdqBUNbijvKKx3Kf_mY55XSkUyPJsfOK8p15_Mw@mail.gmail.com>
Message-ID: <CAJF2gTRzS0hBdqBUNbijvKKx3Kf_mY55XSkUyPJsfOK8p15_Mw@mail.gmail.com>
Subject: Re: [PATCH -next V6 1/7] riscv: ftrace: Fixup panic by disabling preemption
To: Mark Rutland <mark.rutland@arm.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	suagrfillet@gmail.com, andy.chiu@sifive.com, e.shatokhin@yadro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_052224_755400_0705006E 
X-CRM114-Status: GOOD (  27.05  )
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

On Tue, Jan 10, 2023 at 1:20 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Sat, Jan 07, 2023 at 08:35:43AM -0500, guoren@kernel.org wrote:
> > From: Andy Chiu <andy.chiu@sifive.com>
> >
> > In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> > forming a jump that jumps to an address over 4K. This may cause errors
> > if we want to enable kernel preemption and remove dependency from
> > patching code with stop_machine(). For example, if a task was switched
> > out on auipc. And, if we changed the ftrace function before it was
> > switched back, then it would jump to an address that has updated 11:0
> > bits mixing with previous XLEN:12 part.
> >
> > p: patched area performed by dynamic ftrace
> > ftrace_prologue:
> > p|      REG_S   ra, -SZREG(sp)
> > p|      auipc   ra, 0x? ------------> preempted
> >                                       ...
> >                               change ftrace function
> >                                       ...
> > p|      jalr    -?(ra) <------------- switched back
> > p|      REG_L   ra, -SZREG(sp)
> > func:
> >       xxx
> >       ret
>
> What happens on SMP but not !PREEMPTION; can't a CPU be in the middle of this
> while you're patching the sequence?
Yes, when PREEMPTION, a timer interrupt between auipc & jalr may cause
context_switch. And riscv uses stop_machine for patch_text. Then, we
may modify auipc part, but only execute the jalr part when return.

>
> Do you have any guarantee as to the atomicity and ordering of instruction
> fetches?
Not yet. If the region is short, we could use nop + jalr pair instead.
Only one jalr instruction makes the entry atomicity.

There are already several proposed solutions:
1. Make stop_machine guarantee all CPU out of preemption point.
2. Expand -fpatchable-function-entry from 4 to 24, and make detour
codes atomicity.
3. We want to propose a solution to make auipc by hardware mask_irq.
For more details, see:
https://www.youtube.com/watch?v=4JkkkXuEvCw


>
> Thanks,
> Mark.
>
> >
> > Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e2b656043abf..ee0d39b26794 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -138,7 +138,7 @@ config RISCV
> >       select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> >       select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> >       select HAVE_FUNCTION_GRAPH_TRACER
> > -     select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> > +     select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
> >
> >  config ARCH_MMAP_RND_BITS_MIN
> >       default 18 if 64BIT
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
