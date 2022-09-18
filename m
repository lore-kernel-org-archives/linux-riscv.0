Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF460ECAAD8
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsqQyGmrVxYY65kpT9fBqY8W2a/lemJpovlOQrcJJEY=; b=Wbh1j+VjQgS1Hh
	x2n55bC9XhquZJZ7BGTPWmI8pjdYBMp1w7Xr4AKKBWa0NPu7MDS9pK4IIFTvf8evmNp0B1spL8oOU
	7zPhhT8MYxBkA44bMPDAsfACi2OrT7othHmUnamwwa4Vd1iwpmJcASrvsxNRYqga0gL5Svar/W3lA
	d0ZUk5MbPd3k1sVo+iw4L/0GKfi2KpNGP6KhPa4TthvB9rBkQUjgkhE4F2yEhT3uiAe5qpfCltv7F
	mCLmNFPDt4ApV7C+t5Xj0ckNxFqJslq+73fx1XdcV2EzT+Z8wG9vochJZwU63LNueYvr9dKgSN1l0
	7jnJ43GtjlLWoCS0+3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwRm-0009au-HE; Sun, 18 Sep 2022 15:43:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwRj-0009Y1-Ph
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 15:43:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0602861588
	for <linux-riscv@lists.infradead.org>; Sun, 18 Sep 2022 15:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECFFC433B5
	for <linux-riscv@lists.infradead.org>; Sun, 18 Sep 2022 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663515781;
	bh=Gty9P/czjefiuXZWB6LKKbrVJ4pdX99Qh35Mhu5P2qA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q3ylBQ4ZTUPBdoowu1NWx51ytODTvOrSORtk9GPi/t0doqlwzlbbIzs+mHb8bY7tf
	 FSjruNFXHpTyrmVQkfdkmXaISDCwpkAV4oL9dJbNE9thdL2FyDZOkXq9hummvN8SYt
	 jrxZBFJcON8cA66lCLveVCWVQ8OQ+bryVp1BCsYso5Lufqq/+znAETI3cgrLoI1fbr
	 iYPIzpsf4guezT4ZlbnRtlq/t3+y/IyQD/1++QNfQ0EzDLIzU8BDvjiWGv1pv4r87A
	 a5aPJYYS7qk2oyNoHxt/FGRts34rPrb1EKdUQDeNx7GD13m+v+lNcLppfMLFaDIeGI
	 vCbHeCel+1n1g==
Received: by mail-ot1-f53.google.com with SMTP id x23-20020a056830409700b00655c6dace73so15977880ott.11
        for <linux-riscv@lists.infradead.org>; Sun, 18 Sep 2022 08:43:01 -0700 (PDT)
X-Gm-Message-State: ACrzQf0X07wLb+a3wgDZwQroNWMl67g8uunHEbAdnUphEeT3OwU4swZI
	4Yc4itOJbSV25yrDpY0mXZpbxmdVY+V8a7iHss8=
X-Google-Smtp-Source: AMsMyM5VAQ8ulT0AN374moEVw3KR2QDbOFFbovmSHIi5Y57iHCk8N98mtwLJp4t/Svt/yiOl1PVI33PYLN0tL7q0y1Y=
X-Received: by 2002:a05:6830:1213:b0:65a:9a2:daf3 with SMTP id
 r19-20020a056830121300b0065a09a2daf3mr730850otp.308.1663515780520; Sun, 18
 Sep 2022 08:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-8-guoren@kernel.org>
 <YxoR5Fv6hOkzMSTg@linutronix.de>
In-Reply-To: <YxoR5Fv6hOkzMSTg@linutronix.de>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 18 Sep 2022 23:42:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSV9HQ+6A1kh48_MjWir7mtfE7+9P9--s-aqPpt9cb7sw@mail.gmail.com>
Message-ID: <CAJF2gTSV9HQ+6A1kh48_MjWir7mtfE7+9P9--s-aqPpt9cb7sw@mail.gmail.com>
Subject: Re: [PATCH V4 7/8] riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_084303_978924_7CC09B08 
X-CRM114-Status: GOOD (  13.88  )
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

On Fri, Sep 9, 2022 at 12:01 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2022-09-07 22:25:05 [-0400], guoren@kernel.org wrote:
> > --- a/arch/riscv/kernel/irq.c
> > +++ b/arch/riscv/kernel/irq.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/seq_file.h>
> >  #include <asm/smp.h>
> >  #include <asm/vmap_stack.h>
> > +#include <asm/softirq_stack.h>
> >
> >  #ifdef CONFIG_IRQ_STACKS
> >  static DEFINE_PER_CPU(ulong *, irq_stack_ptr);
> > @@ -38,6 +39,21 @@ static void init_irq_stacks(void)
> >               per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
> >  }
> >  #endif /* CONFIG_VMAP_STACK */
> > +
> > +#ifndef CONFIG_PREEMPT_RT
>
> Could you please replace it with
>         #ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
Thx, I would.

>
> instead? See
>         https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=8cbb2b50ee2dcb082675237eaaa48fe8479f8aa5
>
> > +static void do_riscv_softirq(struct pt_regs *regs)
> > +{
> > +     __do_softirq();
> > +}
> > +
> > +void do_softirq_own_stack(void)
> > +{
> > +     ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id());
> > +
> > +     call_on_stack(NULL, sp, do_riscv_softirq, 0);
> > +}
> > +#endif /* CONFIG_PREEMPT_RT */
> > +
> >  #else
> >  static void init_irq_stacks(void) {}
> >  #endif /* CONFIG_IRQ_STACKS */
>
> Sebastian



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
