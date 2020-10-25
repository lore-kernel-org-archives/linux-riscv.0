Return-Path: <SRS0=yHzA=EA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9323C388F7
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2020 09:18:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A13A22259
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2020 09:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sOK9HRbc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="qYv8LP6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A13A22259
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KS5Uuss6reC5d/iyg7DkonjfuNAVw73MNv5q7Gwgrog=; b=sOK9HRbcvJ2LuAUececeQxKGx
	gcOj5oZRl698lZ0VHgvhsaAniz2lh8s8sPpAaZ3y2N3zty1wze9LUiEAxIurI0ZC9qflWqWugGSMG
	Exg8IVvuHbLu/DhxkQSz7R7m0Tp7Fb5rGwubZoptNxqXmgqlh0bXvk5xCOIfVDsCg7BC/U0wnNBpH
	0SOpyeiWsGIwae2gDKssPrD0/PgfqQJ3A6Hom3RCxHJwcG9fputlLtCKU5m3HzWd2lUvVP8qzcRNk
	L5v1kkeZPro2fmbjMSGi3ZSJxpi7ntoQ/L9ZkDMARhejuQMQ0pI3BPg4cfqF1pL2Qyl7aSLQLv0pe
	hNZd1EdLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWcAA-0004uQ-Ta; Sun, 25 Oct 2020 09:18:06 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWcA8-0004tv-As
 for linux-riscv@lists.infradead.org; Sun, 25 Oct 2020 09:18:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id q5so9062243wmq.0
 for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2020 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RaBV5OGSgizc6bOjbQAcBV6/+c0YkBXr0HBp0wiO2C4=;
 b=qYv8LP6BYP30hyFi4I6uJhDIbsZqGNJF95Lmm3CTlq9IUd4PeCDyeYWr8v613s8Zi0
 2bRuHQc/zWhruysDT2dcdfX9OOPxPxdhka9SmHSfXWqIz/l0MuDenz82f2i1J1+nUmZg
 2KGvYs8CdmSHYH8z6sMgVd2KIQpwxPCpyj0k/P/46aWsHMyk9qNKgFdKfrUmML82RMuq
 xkfSknx0o03zd1B16lde5AKl8y3jHaicMAytC83hSY+C7LzAUhv0FREpbpzn1v1m2Ebf
 CenGAa8vi2+9E/+Xxuu7WpTkxZM06TzMvfXD8VdUQtb1HpRPecK1f9SFQkkbetLTCxV2
 Ew6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaBV5OGSgizc6bOjbQAcBV6/+c0YkBXr0HBp0wiO2C4=;
 b=WETivnNTk5LS85kYuZqe/9xQNt9ghgyugZPm0KoTS8EepYx9Hww/VkvGE5Yg2WhW6Y
 l79BHv2zMf1QiqF+JsHjpw5z2im5XEAbUN4g5tXmjIfT7MQysVV8tyDw7j0MHrKfV6Ij
 rXXow4tg15qi937O08mHJg2pJURm3nPcpRpak/qQiPkK2U9R3vNdIthW5IoLwO5hh0NA
 2+55nYau+vxQHRhdKinptbr3DVxvlawr0Qp9urgg0upADnnK8Va+YI8YpzVmpsm6hCE0
 za8VyJUEmsoqUPISjJEqUy7t0FbVMCwDH1zJkHagP1EN4IY58CliNda5I/rG2c5m8v0o
 Al5Q==
X-Gm-Message-State: AOAM533cNqKkhIfEGgDZV6FcisyH4cadDcN2GHqLUnVd8pykVh6EFrJU
 ibV17giB4Gl6R/I8nK2UaYvqDlFGWT5fSx7wC5KZr3WYLMF9EIpQ
X-Google-Smtp-Source: ABdhPJzqljm3rNjuFJ0TcMA11xsO/2wA5XDCmDKyV+cnBRdnwYg9pK3iZWkiGftU6hNatz9ef03f2R7TCanD3XDyUCg=
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr11184462wml.134.1603617478740; 
 Sun, 25 Oct 2020 02:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
 <CAAhSdy1rqZBt5LSgs9yQwewwKXvaS23ou5Ah7Xfu3n7S9sK6RA@mail.gmail.com>
 <CAJF2gTQtcKf0R-8nJK=Jb5BdQZ1giZTEuqHjZdHEU4Gks-i+Qw@mail.gmail.com>
In-Reply-To: <CAJF2gTQtcKf0R-8nJK=Jb5BdQZ1giZTEuqHjZdHEU4Gks-i+Qw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2020 14:47:47 +0530
Message-ID: <CAAhSdy3sQuErgEXp-cc15d=wJpFh6THe0dCMCQy4W-MO8ud5KQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip/irq-sifive-plic: Fixup wrong size of
 xxx_PER_HART and reg base
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201025_051804_507882_C57B34DD 
X-CRM114-Status: GOOD (  36.03  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Jason Cooper <jason@lakedaemon.net>,
 wesley@sifive.com, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Oct 24, 2020 at 8:40 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Fri, Oct 23, 2020 at 8:31 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, Oct 23, 2020 at 3:48 PM <guoren@kernel.org> wrote:
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > ENABLE and CONTEXT registers contain M & S status for per-hart, so
> > > ref to the specification the correct definition is double to the
> > > current value.
> > >
> > > The value of hart_base and enable_base should be calculated by real
> > > physical hartid not software id. Sometimes the CPU node's <reg>
> > > from dts is not equal to the sequence index.
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > ---
> > >  drivers/irqchip/irq-sifive-plic.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > > index eaa3e9f..2e56576 100644
> > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > +++ b/drivers/irqchip/irq-sifive-plic.c
> > > @@ -44,16 +44,16 @@
> > >   * Each hart context has a vector of interrupt enable bits associated with it.
> > >   * There's one bit for each interrupt source.
> > >   */
> > > -#define ENABLE_BASE                    0x2000
> > > -#define     ENABLE_PER_HART            0x80
> > > +#define ENABLE_BASE                    0x2080
> > > +#define     ENABLE_PER_HART            0x100
> > >
> > >  /*
> > >   * Each hart context has a set of control registers associated with it.  Right
> > >   * now there's only two: a source priority threshold over which the hart will
> > >   * take an interrupt, and a register to claim interrupts.
> > >   */
> > > -#define CONTEXT_BASE                   0x200000
> > > -#define     CONTEXT_PER_HART           0x1000
> > > +#define CONTEXT_BASE                   0x201000
> > > +#define     CONTEXT_PER_HART           0x2000
> > >  #define     CONTEXT_THRESHOLD          0x00
> > >  #define     CONTEXT_CLAIM              0x04
> > >
> > > @@ -358,10 +358,10 @@ static int __init plic_init(struct device_node *node,
> > >                 cpumask_set_cpu(cpu, &priv->lmask);
> > >                 handler->present = true;
> > >                 handler->hart_base =
> > > -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> > > +                       priv->regs + CONTEXT_BASE + hartid * CONTEXT_PER_HART;
> > >                 raw_spin_lock_init(&handler->enable_lock);
> > >                 handler->enable_base =
> > > -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> > > +                       priv->regs + ENABLE_BASE + hartid * ENABLE_PER_HART;
> > >                 handler->priv = priv;
> > >  done:
> > >                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> > > --
> > > 2.7.4
> > >
> >
> > There is no one-to-one mapping between PLIC context and HARTID. Instead,
> > we have many-to-one mapping between PLIC contexts and HARTID. In other
> > words, we have one PLIC context for each interrupt capable mode (i.e.
> > M/S-mode) of each HART.
> >
> > For example, on SiFive Unleashed we have 5 HARTs but HARTID=0 has
> > only M-mode capable of taking interrupts so we have total (1 + 2x4) = 9
> > PLIC contexts.
> That's OK, but what the bug I want to point out is enable_base &
> context_base should be calculated by 'hartid' not 'i'.

There is no relation between PLIC context number and HART IDs. The
PLIC context to HART mapping is discovered from the "interrupts-extended"
DT property of PLIC DT node. The "i" in the loop is PLIC context number.

The PLIC spec does not mandate any ordering/pattern of PLIC context to
HART mappings. Also, the interrupts-extended DT property is generic
enough to represent any kind of PLIC context to HART mappings.

Your patch breaks SiFive Unleashed board and NoMMU kernel because
of incorrect assumptions about PLIC contexts to HART mappings.

>
> For example, how we deal with below dts configuration:
>         cpus {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 timebase-frequency = <3000000>;
>                 cpu@0 {
>                         device_type = "cpu";
>                         reg = <2>;  //********* different from index
>                         status = "okay";
>                         compatible = "riscv";
>                         riscv,isa = "rv64imafdcsu";
>                         mmu-type = "riscv,sv39";
>                         cpu0_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 compatible = "riscv,cpu-intc";
>                                 interrupt-controller;
>                         };
>                 };
>                 cpu@1 {
>                         device_type = "cpu";
>                         reg = <3>; //********* different from index
>                         status = "fail";
>                         compatible = "riscv";
>                         riscv,isa = "rv64imafdcsu";
>                         mmu-type = "riscv,sv39";
>                         cpu1_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 compatible = "riscv,cpu-intc";
>                                 interrupt-controller;
>                         };
>                 };
>       }

For above DTS configuration, we need a PLIC with just 4 contexts
(irrespective to the HART IDs).

The PLIC context to HART mapping can be described using the
interrupts-extended DT property of PLIC DT node as follows:
    interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9
                                         &cpu1_intc 11 &cpu1_intc 9>;

>
> >
> > I would also like to highlight that this patch is forcing PLIC driver to always
> > use PLIC S-mode context for each HART which breaks the Linux RISC-V
> > NoMMU kernel.
> Yes, I forgot M-mode and I will correct it.
>
> >
> > There is no issue with the existing defines because these are aligned with
> > above and latest PLIC spec.
> > (Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc)
> >
> > NACK to this patch from my side.
>
> Here is my new patch which fixup m-mode linux:
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c
> b/drivers/irqchip/irq-sifive-plic.c
> index 4048657..e34e1d9 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -45,7 +45,13 @@
>   * There's one bit for each interrupt source.
>   */
>  #define ENABLE_BASE                    0x2000
> -#define     ENABLE_PER_HART            0x80
> +#define     ENABLE_PER_HART            0x100
> +#ifdef CONFIG_RISCV_M_MODE
> +#define     ENABLE_OFFSET              0
> +#else
> +#define     ENABLE_OFFSET              0x80
> +#endif
> +
>
>  /*
>   * Each hart context has a set of control registers associated with it.  Right
> @@ -53,9 +59,14 @@
>   * take an interrupt, and a register to claim interrupts.
>   */
>  #define CONTEXT_BASE                   0x200000
> -#define     CONTEXT_PER_HART           0x1000
> +#define     CONTEXT_PER_HART           0x2000
>  #define     CONTEXT_THRESHOLD          0x00
>  #define     CONTEXT_CLAIM              0x04
> +#ifdef CONFIG_RISCV_M_MODE
> +#define     CONTEXT_OFFSET             0
> +#else
> +#define     CONTEXT_OFFSET             0x1000
> +#endif
>
>  #define        PLIC_DISABLE_THRESHOLD          0x7
>  #define        PLIC_ENABLE_THRESHOLD           0
> @@ -358,10 +369,10 @@ static int __init plic_init(struct device_node *node,
>                 cpumask_set_cpu(cpu, &priv->lmask);
>                 handler->present = true;
>                 handler->hart_base =
> -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> +                       priv->regs + CONTEXT_BASE + hartid *
> CONTEXT_PER_HART + CONTEXT_OFFSET;
>                 raw_spin_lock_init(&handler->enable_lock);
>                 handler->enable_base =
> -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> +                       priv->regs + ENABLE_BASE + hartid *
> ENABLE_PER_HART + ENABLE_OFFSET;
>                 handler->priv = priv;
>  done:
>                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
>

This modified patch still breaks SiFive Unleashed board because
it has following PLIC context to HART mappings:
PLIC_context_0 (offset 0x0000) => HART0_M_mode_irq
PLIC_context_1 (offset 0x1000) => HART1_M_mode_irq
PLIC_context_2 (offset 0x2000) => HART1_S_mode_irq
PLIC_context_3 (offset 0x3000) => HART2_M_mode_irq
PLIC_context_4 (offset 0x4000) => HART2_S_mode_irq
PLIC_context_5 (offset 0x5000) => HART3_M_mode_irq
PLIC_context_6 (offset 0x6000) => HART3_S_mode_irq
PLIC_context_7 (offset 0x7000) => HART4_M_mode_irq
PLIC_context_8 (offset 0x8000) => HART4_S_mode_irq

As-per your patch, the Linux S-mode kernel will use
PLIC_context_3 (offset 0x3000) for HART1 which is in-correct
because PLIC_context_3 maps to HART2 M-mode IRQ.

Further with your patch, the Linux M-mode kernel will use
PLIC_context_2 (offset 0x2000) for HART1 which is in-correct
because PLIC_context_2 maps to HART1 S-mode IRQ.

Clearly your modified patch breaks both Linux S-mode kernel
and Linux M-mode kernel on SiFive Unleashed board.

The current driver handles all above cases correctly by parsing
the PLIC context to HART mappings from the interrupts-extended
DT property. I don't see any bug here.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
