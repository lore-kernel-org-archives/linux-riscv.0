Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF70C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 15:01:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47962076D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 15:01:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s19u3mdU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lE2w7J5T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B47962076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i2XgtySIYG6IVQJz+llMYA84GAtiu6V9DHxs8KVqG/M=; b=s19u3mdUyxJ5Dc6txTKQoGPcS
	HBs5MO2ORdMyftZlZZkyKwpjXIBiteNxAw2IIvpDcX462PSkZQ+ttvmDxzs94kiDijo3g7os01kZw
	bPmuHZlzz0TRs4y3p6y95/u95+wf7DArHI+EW5FIBhXLZ0xc+E1CH25Civamy2gj3XubODBVwZfjF
	4XS681N+q00smV4hY/2W7rB/kUe4OFlWFgAmHWdzFHO3mJsp1HwPhKv+vQvqxculSzREMcWTgXCrs
	/wffCcHy95drzLOIbZFTNhfPB8n0kEzTfNh3/WEV8ygCToFkUjPJw3LF16epHPzpFcloVdQMtLmS1
	KkH/bmxBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX3zv-0000Sp-DO; Mon, 26 Oct 2020 15:01:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX3zr-0000Rt-Ir
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 15:01:20 +0000
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A460520773
 for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2020 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603724478;
 bh=6xoA9tfWbHJnUNQ8CX/97sKNWmaFDpPvLKBxvu46ZqQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lE2w7J5Tof2Ei1KRY8VmPbjjjTqsaN5vnCI9CU6PtLIM/ernzF97D/HZUBVwY/Fpj
 p0pQhbe1PUu9HJ5Op350ZxdgO2NR9oa+LbH7qtEBNeJG/gnA4s5wqUUBtmx+QjeJhF
 9He8giTH94tVYpkLzTwOgxtlcgVDIGUm1P1cxiKQ=
Received: by mail-lf1-f47.google.com with SMTP id b1so12471119lfp.11
 for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2020 08:01:17 -0700 (PDT)
X-Gm-Message-State: AOAM531IzBNU7tslYVTDVTF8TqW/MWUEAVF3Jy6pNEPvLBvNulq6RG+B
 rkSGa3i/wQQWUHuWQzyQPsCUzYrAqEftNRpgnNo=
X-Google-Smtp-Source: ABdhPJwIrELI+CVRR/mpIJiKYYfbRAy1fqUnkyYiE6Ud2MLHsDD94mPI0iDk5K04afEI//GJgJ6+u9MHpepYZT06qaQ=
X-Received: by 2002:ac2:4888:: with SMTP id x8mr5049717lfc.248.1603724475766; 
 Mon, 26 Oct 2020 08:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
 <CAAhSdy1rqZBt5LSgs9yQwewwKXvaS23ou5Ah7Xfu3n7S9sK6RA@mail.gmail.com>
 <CAJF2gTQtcKf0R-8nJK=Jb5BdQZ1giZTEuqHjZdHEU4Gks-i+Qw@mail.gmail.com>
 <CAAhSdy3sQuErgEXp-cc15d=wJpFh6THe0dCMCQy4W-MO8ud5KQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3sQuErgEXp-cc15d=wJpFh6THe0dCMCQy4W-MO8ud5KQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 26 Oct 2020 23:01:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRMFjc=kvR5gzGaWAVTojB-MWG7bFObECVukxUYGVzdWg@mail.gmail.com>
Message-ID: <CAJF2gTRMFjc=kvR5gzGaWAVTojB-MWG7bFObECVukxUYGVzdWg@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip/irq-sifive-plic: Fixup wrong size of
 xxx_PER_HART and reg base
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_110119_757237_3196FA99 
X-CRM114-Status: GOOD (  41.24  )
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

Hi Anup,

On Sun, Oct 25, 2020 at 5:18 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Oct 24, 2020 at 8:40 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Fri, Oct 23, 2020 at 8:31 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Fri, Oct 23, 2020 at 3:48 PM <guoren@kernel.org> wrote:
> > > >
> > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > >
> > > > ENABLE and CONTEXT registers contain M & S status for per-hart, so
> > > > ref to the specification the correct definition is double to the
> > > > current value.
> > > >
> > > > The value of hart_base and enable_base should be calculated by real
> > > > physical hartid not software id. Sometimes the CPU node's <reg>
> > > > from dts is not equal to the sequence index.
> > > >
> > > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > > ---
> > > >  drivers/irqchip/irq-sifive-plic.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > > > index eaa3e9f..2e56576 100644
> > > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > > +++ b/drivers/irqchip/irq-sifive-plic.c
> > > > @@ -44,16 +44,16 @@
> > > >   * Each hart context has a vector of interrupt enable bits associated with it.
> > > >   * There's one bit for each interrupt source.
> > > >   */
> > > > -#define ENABLE_BASE                    0x2000
> > > > -#define     ENABLE_PER_HART            0x80
> > > > +#define ENABLE_BASE                    0x2080
> > > > +#define     ENABLE_PER_HART            0x100
> > > >
> > > >  /*
> > > >   * Each hart context has a set of control registers associated with it.  Right
> > > >   * now there's only two: a source priority threshold over which the hart will
> > > >   * take an interrupt, and a register to claim interrupts.
> > > >   */
> > > > -#define CONTEXT_BASE                   0x200000
> > > > -#define     CONTEXT_PER_HART           0x1000
> > > > +#define CONTEXT_BASE                   0x201000
> > > > +#define     CONTEXT_PER_HART           0x2000
> > > >  #define     CONTEXT_THRESHOLD          0x00
> > > >  #define     CONTEXT_CLAIM              0x04
> > > >
> > > > @@ -358,10 +358,10 @@ static int __init plic_init(struct device_node *node,
> > > >                 cpumask_set_cpu(cpu, &priv->lmask);
> > > >                 handler->present = true;
> > > >                 handler->hart_base =
> > > > -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> > > > +                       priv->regs + CONTEXT_BASE + hartid * CONTEXT_PER_HART;
> > > >                 raw_spin_lock_init(&handler->enable_lock);
> > > >                 handler->enable_base =
> > > > -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> > > > +                       priv->regs + ENABLE_BASE + hartid * ENABLE_PER_HART;
> > > >                 handler->priv = priv;
> > > >  done:
> > > >                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> > > > --
> > > > 2.7.4
> > > >
> > >
> > > There is no one-to-one mapping between PLIC context and HARTID. Instead,
> > > we have many-to-one mapping between PLIC contexts and HARTID. In other
> > > words, we have one PLIC context for each interrupt capable mode (i.e.
> > > M/S-mode) of each HART.
> > >
> > > For example, on SiFive Unleashed we have 5 HARTs but HARTID=0 has
> > > only M-mode capable of taking interrupts so we have total (1 + 2x4) = 9
> > > PLIC contexts.
> > That's OK, but what the bug I want to point out is enable_base &
> > context_base should be calculated by 'hartid' not 'i'.
>
> There is no relation between PLIC context number and HART IDs. The
> PLIC context to HART mapping is discovered from the "interrupts-extended"
> DT property of PLIC DT node. The "i" in the loop is PLIC context number.
>
> The PLIC spec does not mandate any ordering/pattern of PLIC context to
> HART mappings. Also, the interrupts-extended DT property is generic
> enough to represent any kind of PLIC context to HART mappings.
>
> Your patch breaks SiFive Unleashed board and NoMMU kernel because
> of incorrect assumptions about PLIC contexts to HART mappings.
>
> >
> > For example, how we deal with below dts configuration:
> >         cpus {
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> >                 timebase-frequency = <3000000>;
> >                 cpu@0 {
> >                         device_type = "cpu";
> >                         reg = <2>;  //********* different from index
> >                         status = "okay";
> >                         compatible = "riscv";
> >                         riscv,isa = "rv64imafdcsu";
> >                         mmu-type = "riscv,sv39";
> >                         cpu0_intc: interrupt-controller {
> >                                 #interrupt-cells = <1>;
> >                                 compatible = "riscv,cpu-intc";
> >                                 interrupt-controller;
> >                         };
> >                 };
> >                 cpu@1 {
> >                         device_type = "cpu";
> >                         reg = <3>; //********* different from index
> >                         status = "fail";
> >                         compatible = "riscv";
> >                         riscv,isa = "rv64imafdcsu";
> >                         mmu-type = "riscv,sv39";
> >                         cpu1_intc: interrupt-controller {
> >                                 #interrupt-cells = <1>;
> >                                 compatible = "riscv,cpu-intc";
> >                                 interrupt-controller;
> >                         };
> >                 };
> >       }
>
> For above DTS configuration, we need a PLIC with just 4 contexts
> (irrespective to the HART IDs).
>
> The PLIC context to HART mapping can be described using the
> interrupts-extended DT property of PLIC DT node as follows:
>     interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9
>                                          &cpu1_intc 11 &cpu1_intc 9>;
>
I have 4 harts (0, 1, 2, 3) and I want to run two Linux systems in the
same soc with 0+1 & 2+3.

In this case CPU index of dts are different from hartid.
First dts:
cpu index 0 -> hartid 0
cpu index 1 -> hartid 1

Second dts:
cpu index 0 -> hartid 2
cpu index 1 -> hartid 3

> >
> > >
> > > I would also like to highlight that this patch is forcing PLIC driver to always
> > > use PLIC S-mode context for each HART which breaks the Linux RISC-V
> > > NoMMU kernel.
> > Yes, I forgot M-mode and I will correct it.
> >
> > >
> > > There is no issue with the existing defines because these are aligned with
> > > above and latest PLIC spec.
> > > (Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc)
> > >
> > > NACK to this patch from my side.
> >
> > Here is my new patch which fixup m-mode linux:
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c
> > b/drivers/irqchip/irq-sifive-plic.c
> > index 4048657..e34e1d9 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -45,7 +45,13 @@
> >   * There's one bit for each interrupt source.
> >   */
> >  #define ENABLE_BASE                    0x2000
> > -#define     ENABLE_PER_HART            0x80
> > +#define     ENABLE_PER_HART            0x100
> > +#ifdef CONFIG_RISCV_M_MODE
> > +#define     ENABLE_OFFSET              0
> > +#else
> > +#define     ENABLE_OFFSET              0x80
> > +#endif
> > +
> >
> >  /*
> >   * Each hart context has a set of control registers associated with it.  Right
> > @@ -53,9 +59,14 @@
> >   * take an interrupt, and a register to claim interrupts.
> >   */
> >  #define CONTEXT_BASE                   0x200000
> > -#define     CONTEXT_PER_HART           0x1000
> > +#define     CONTEXT_PER_HART           0x2000
> >  #define     CONTEXT_THRESHOLD          0x00
> >  #define     CONTEXT_CLAIM              0x04
> > +#ifdef CONFIG_RISCV_M_MODE
> > +#define     CONTEXT_OFFSET             0
> > +#else
> > +#define     CONTEXT_OFFSET             0x1000
> > +#endif
> >
> >  #define        PLIC_DISABLE_THRESHOLD          0x7
> >  #define        PLIC_ENABLE_THRESHOLD           0
> > @@ -358,10 +369,10 @@ static int __init plic_init(struct device_node *node,
> >                 cpumask_set_cpu(cpu, &priv->lmask);
> >                 handler->present = true;
> >                 handler->hart_base =
> > -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> > +                       priv->regs + CONTEXT_BASE + hartid *
> > CONTEXT_PER_HART + CONTEXT_OFFSET;
> >                 raw_spin_lock_init(&handler->enable_lock);
> >                 handler->enable_base =
> > -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> > +                       priv->regs + ENABLE_BASE + hartid *
> > ENABLE_PER_HART + ENABLE_OFFSET;
> >                 handler->priv = priv;
> >  done:
> >                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> >
>
> This modified patch still breaks SiFive Unleashed board because
> it has following PLIC context to HART mappings:
> PLIC_context_0 (offset 0x0000) => HART0_M_mode_irq
> PLIC_context_1 (offset 0x1000) => HART1_M_mode_irq
> PLIC_context_2 (offset 0x2000) => HART1_S_mode_irq
> PLIC_context_3 (offset 0x3000) => HART2_M_mode_irq
> PLIC_context_4 (offset 0x4000) => HART2_S_mode_irq
> PLIC_context_5 (offset 0x5000) => HART3_M_mode_irq
> PLIC_context_6 (offset 0x6000) => HART3_S_mode_irq
> PLIC_context_7 (offset 0x7000) => HART4_M_mode_irq
> PLIC_context_8 (offset 0x8000) => HART4_S_mode_irq
Got it, thx, Our system:
PLIC_context_0 (offset 0x0000) => HART0_M_mode_irq
PLIC_context_1 (offset 0x1000) => HART0_S_mode_irq
PLIC_context_2 (offset 0x2000) => HART1_M_mode_irq
PLIC_context_3 (offset 0x3000) => HART1_S_mode_irq
PLIC_context_4 (offset 0x0000) => HART2_M_mode_irq
PLIC_context_5 (offset 0x1000) => HART2_S_mode_irq
PLIC_context_6 (offset 0x2000) => HART3_M_mode_irq
PLIC_context_7 (offset 0x3000) => HART3_S_mode_irq

If I didn't modify PLIC driver, you reconmand me write dts like this?
        cpus {
                #address-cells = <1>;
                #size-cells = <0>;
                timebase-frequency = <3000000>;
                cpu@0 {
                        device_type = "cpu";
                        reg = <0>;
                        status = "disabled"; // disabled ?
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
                        mmu-type = "riscv,sv39";
                        cpu0_intc: interrupt-controller {
                                #interrupt-cells = <1>;
                                compatible = "riscv,cpu-intc";
                                interrupt-controller;
                        };
                };
                cpu@1 {
                        device_type = "cpu";
                        reg = <1>;
                        status = "disabled"; // disabled ?
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
                        mmu-type = "riscv,sv39";
                        cpu1_intc: interrupt-controller {
                                #interrupt-cells = <1>;
                                compatible = "riscv,cpu-intc";
                                interrupt-controller;
                        };
                };
                cpu@2 {
                        device_type = "cpu";
                        reg = <2>;
                        status = "ok";
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
                        mmu-type = "riscv,sv39";
                        cpu2_intc: interrupt-controller {
                                #interrupt-cells = <1>;
                                compatible = "riscv,cpu-intc";
                                interrupt-controller;
                        };
                };
                cpu@3 {
                        device_type = "cpu";
                        reg = <3>;
                        status = "ok";
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
                        mmu-type = "riscv,sv39";
                        cpu3_intc: interrupt-controller {
                                #interrupt-cells = <1>;
                                compatible = "riscv,cpu-intc";
                                interrupt-controller;
                        };
                };
      };

                intc: interrupt-controller@3f0000000 {
                        #interrupt-cells = <1>;
                        compatible = "riscv,plic0";
                        interrupt-controller;
                        interrupts-extended = <
                                &cpu0_intc  0xffffffff &cpu0_intc  0xffffffff
                                &cpu1_intc  0xffffffff &cpu1_intc  0xffffffff
                                &cpu2_intc  0xffffffff &cpu2_intc  9
                                &cpu3_intc  0xffffffff &cpu3_intc  9
                                >;
                        reg = <0x3 0xf0000000 0x0 0x04000000>;
                        reg-names = "control";
                        riscv,max-priority = <7>;
                        riscv,ndev = <80>;
                };

Still use index to address the reg base.

>
> As-per your patch, the Linux S-mode kernel will use
> PLIC_context_3 (offset 0x3000) for HART1 which is in-correct
> because PLIC_context_3 maps to HART2 M-mode IRQ.
>
> Further with your patch, the Linux M-mode kernel will use
> PLIC_context_2 (offset 0x2000) for HART1 which is in-correct
> because PLIC_context_2 maps to HART1 S-mode IRQ.
>
> Clearly your modified patch breaks both Linux S-mode kernel
> and Linux M-mode kernel on SiFive Unleashed board.
>
> The current driver handles all above cases correctly by parsing
> the PLIC context to HART mappings from the interrupts-extended
> DT property. I don't see any bug here.
>
        soc {
                plic0: interrupt-controller@c000000 {
                        #interrupt-cells = <1>;
                        compatible = "sifive,plic-1.0.0";
                        reg = <0x0 0xc000000 0x0 0x4000000>;
                        riscv,ndev = <53>;
                        interrupt-controller;
                        interrupts-extended = <
                                &cpu0_intc 0xffffffff
                                &cpu1_intc 0xffffffff &cpu1_intc 9
                                &cpu2_intc 0xffffffff &cpu2_intc 9
                                &cpu3_intc 0xffffffff &cpu3_intc 9
                                &cpu4_intc 0xffffffff &cpu4_intc 9>;
                };

Yes, my patch will break SiFive's u54. The cpu0 hasn't S-mode and it
makes an interrupts-extended odd number. Sorry I haven't seen u54 dts
before and I just think interrupts-extended should be even.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
