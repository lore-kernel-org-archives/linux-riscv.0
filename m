Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5896C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 02:53:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5AC60FC2
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 02:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E5AC60FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlVNUCLQm9NfkJZyhg0h5F3jorRcDPC6037Vbf51QIw=; b=eCxek+xdwOm9pi
	P8Ne10zAMKp52kS9nQekLYcipZ19gzotzzcgQd3s5s34dB+KB4JR7TcKlz4M7rCp2SkaeEbrMKQWf
	Lr+m+D3MNOBbyGy8cJiiQDIb0ixmFhBVuB8aUUmVlFdkM5hDCLhA8TL9mw4hI1Mizu7+o8uCUVQ/R
	aykvdiEWyytVP4gj8WyvSg/5unu0RDPXKZMrIpmBj5Mvlh7evtHExwtiDpbyUtJrm7rKeNg/ZCiRv
	M+daIjYmgVLKyCzbeBidVzcEBCfb4TlnU8G6CH2LPwVMtRY/VS2+Cp+xqbdkSdLNwYHs1sKnDd3dC
	byIrm2GjWeM9MOKENitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhNS7-00F8LM-2m; Mon, 01 Nov 2021 02:53:39 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhNS3-00F8Ir-Re
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 02:53:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id m22so26225741wrb.0
 for <linux-riscv@lists.infradead.org>; Sun, 31 Oct 2021 19:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OvbOQpgpKa/5ij2ev10oZE8n6rmgG4chJJBzT/WxPJ0=;
 b=diIfg/CNueN8pMnCSN/txdouYqdEB7R13PondC3mzFuIywkxT/4fharfu2kkesKGY1
 UnWYWe70KFjZ3mfGRzkUJtSx8xTgz+L0uNBTh1xa1Lk7Wief1CgV+7s7XrsyPTCj+azq
 HgPttcFRHP5ejF/nQcxl+Z7SgbFcY9+SOSNumAdDpodezNBWCJzXUZDox3xccZ/FDOAT
 gZXXKBdDn/G6/AWmEdS7FyXe/FdoOB4Lx9/sEes55248auuHwZzACuDMQrf8q6T8foK2
 n38IL/wWQOLV3kN/dc5bv5I6Kw8y+FDDhGU3r+2NYog+2xCQfbDyY/2WURJ/07XMlCJc
 +6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OvbOQpgpKa/5ij2ev10oZE8n6rmgG4chJJBzT/WxPJ0=;
 b=dAafKoXyTo22BQSw0a97VfDkY8Y1TsJUNxEFT1L/x51W3CXyiZE8dp5X36zwbkTalY
 JUfTNLLGSteT9SlCwNXIQRYqJGt2uKuMKnv9yDCPjU4gAg/ipJvdG74S7Vl1Q7mBVD4r
 /aUZBMuTZvtaDWcJDGj/lHVmON4B3ZmjkVEDoJ/n7namS9wFZo7WrKbYPS0rs97rt9hp
 ktfqNmxHgsb2kTxysRsAKDu66NtU/zYbEr4I8tQzbUBzC8oRxZ2Cl2aLSRYvYbDMphN0
 sAR1r8C5fIO5mPjVfpRrVmLVi4m6HJShlQGfaiMDUa7CEiaYOaTntqs7VwXx5e6P+lx7
 QUjQ==
X-Gm-Message-State: AOAM533h/iKBX3XmlLU5DKXpdD5nyYS1ImDJ/b2ZM1Zdra5Lojxs1ULB
 b1Obdz+v1thgwtKkEmR+GPwbdXfn6g855mhZnYLXkg==
X-Google-Smtp-Source: ABdhPJwouoUj164/5xoi25/rch+6KuRfZi1QqakhntCC4/6ov2KkbfvMaMe6RBq8MifprVJ2w0UyWfVUNidosFu1r1k=
X-Received: by 2002:a05:6000:1a45:: with SMTP id
 t5mr22392605wry.306.1635735206224; 
 Sun, 31 Oct 2021 19:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-4-guoren@kernel.org>
 <87a6ixbcse.wl-maz@kernel.org>
 <20211028135523.5cf4b66b@redslave.neermore.group>
 <87sfwl9oxg.wl-maz@kernel.org>
 <CAJF2gTR3CqtmKZKS3fOQ9mzSLn7_oh7YoSSmWP1YM=ujB_srMw@mail.gmail.com>
In-Reply-To: <CAJF2gTR3CqtmKZKS3fOQ9mzSLn7_oh7YoSSmWP1YM=ujB_srMw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Nov 2021 08:23:14 +0530
Message-ID: <CAAhSdy1WrxbMsiWkwOXd_76A6wNAh05C1QQ-oFXoE9U-F0akiA@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] irqchip/sifive-plic: Fixup thead, c900-plic
 request_threaded_irq with ONESHOT
To: Guo Ren <guoren@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_195335_927382_7DF082D0 
X-CRM114-Status: GOOD (  40.40  )
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

On Mon, Nov 1, 2021 at 7:50 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Thu, Oct 28, 2021 at 10:58 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Thu, 28 Oct 2021 11:55:23 +0100,
> > Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> > >
> > > Hello Marc and Guo Ren!
> > >
> > > On Mon, 25 Oct 2021 11:48:33 +0100
> > > Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > > On Sun, 24 Oct 2021 02:33:03 +0100,
> > > > guoren@kernel.org wrote:
> > > > >
> > > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > > >
> > > > > When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the
> > > > > driver, only the first interrupt could be handled, and continue irq
> > > > > is blocked by hw. Because the thead,c900-plic couldn't complete
> > > > > masked irq source which has been disabled in enable register. Add
> > > > > thead_plic_chip which fix up c906-plic irq source completion
> > > > > problem by unmask/mask wrapper.
> > > > >
> > > > > Here is the description of Interrupt Completion in PLIC spec [1]:
> > > > >
> > > > > The PLIC signals it has completed executing an interrupt handler by
> > > > > writing the interrupt ID it received from the claim to the
> > > > > claim/complete register. The PLIC does not check whether the
> > > > > completion ID is the same as the last claim ID for that target. If
> > > > > the completion ID does not match an interrupt source that is
> > > > > currently enabled for the target, the ^^ ^^^^^^^^^ ^^^^^^^
> > > > > completion is silently ignored.
> > > >
> > > > Given this bit of the spec...
> > > >
> > > > > +static void plic_thead_irq_eoi(struct irq_data *d)
> > > > > +{
> > > > > + struct plic_handler *handler =
> > > > > this_cpu_ptr(&plic_handlers); +
> > > > > + if (irqd_irq_masked(d)) {
> > > > > +         plic_irq_unmask(d);
> > > > > +         writel(d->hwirq, handler->hart_base +
> > > > > CONTEXT_CLAIM);
> > > > > +         plic_irq_mask(d);
> > > > > + } else {
> > > > > +         writel(d->hwirq, handler->hart_base +
> > > > > CONTEXT_CLAIM);
> > > > > + }
> > > > > +}
> > > > > +
> > > >
> > > > ... it isn't obvious to me why this cannot happen on an SiFive PLIC.
> > >
> > > This indeed happens with SiFive PLIC. I am currently tinkering with
> > > da9063 RTC on SiFive Unmatched, and ALARM irq fires only once. However
> > > with changes proposed by Guo Ren in plic_thead_irq_eoi, everything
> > > begins to work fine.
> > >
> > > May be these change should be propagated to plic_irq_eoi instead of
> > > making a new function ?
> >
> > That's my impression too. I think the T-Head defect is pretty much
> > immaterial when you consider how 'interesting' the PLIC architecture
> > is.
> Which is the "T-Head defect" you mentioned here?
>  1. Auto masking with claim + complete (I don't think it's a defect,
> right? May I add a new patch to utilize the feature to decrease a
> little duplicate mask/unmask operations in the future?)

This is definitely a defect and non-compliance for T-HEAD because
no sane interrupt controller would mask interrupt upon claim and this
is not what RISC-V PLIC defines.

>  2. EOI failed when masked

This defect exists for both RISC-V PLIC and T-HEAD PLIC
because of the way interrupt completion is defined.

>
> > Conflating EOI and masking really is a misfeature...
> I think the problem is riscv PLIC reuse enable bit as mask bit. I
> recommend separating them. That means:

There are no per-interrupt mask bits. We only have per-context
and per-interrupt enable bits which is used to provide mask/unmask
functionality expected by the irqchip framework.

I don't see how this is a problem for RISC-V PLIC. The only real
issue with RISC-V PLIC is the fact the interrupt completion will be
ignored for a masked interrupt which is what Marc is pointing at.

Regards,
Anup

>  - EOI still depends on enable bit.
>  - Add mask/unmask bit regs to do the right thing.



>
> >
> >         M.
> >
> > --
> > Without deviation from the norm, progress is not possible.
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
