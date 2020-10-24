Return-Path: <SRS0=l2pG=D7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AE3C388F9
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2020 03:10:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2B820578
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2020 03:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MlTPduzL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSEpSy2q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2B820578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q0PZnXJrbJdTawFpYc18iT9522Pv3v3AMZkc2iFyLwI=; b=MlTPduzLSxoK9urYjS8nv0yfE
	PCXSOlBxsANV5wcNq1FXzNkJ2LwSTF91FgRFAqHG7O/nTXeD6NvYQpSlKMKKFQZa/bofssDYKgcw4
	Yi39GOnGFqg7gfa175eg/PoVk2usSEQNWPS6MWP+l3wjp1OSofvMKC53f5WnzDvVKnma2ku5TCLLe
	0yQTYbViE7+PXe+8RX7UE2N+0ECrL0bXO4LflL+LnLieUNLauuHm88VmEFFhM0ChGLu+Lp7gv0nV+
	oOcgaE0vstrHLzxJKxCjALj7YrVerYYAwPfkKsDhCNdaIaUZxSBcwah2l3Bu+OhOEHX9p576e1wEY
	2OCl1LJKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kW9wT-00050W-Ia; Sat, 24 Oct 2020 03:10:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kW9wQ-00050C-Fv
 for linux-riscv@lists.infradead.org; Sat, 24 Oct 2020 03:10:03 +0000
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F31524654
 for <linux-riscv@lists.infradead.org>; Sat, 24 Oct 2020 03:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603509001;
 bh=T2MY35WzTyMya24fc1ZRV/JbBaR5f7YTXksJCq7PiYg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lSEpSy2qpv44JkKtncmsE8Ns/GpLo+I5kNHv92N1+B/azneD2Bp3+1DPrvhxzpMCV
 qbNVXOrpmMjZUJPfORP7SLQy7i88IMOEcg81BdTP1FXQMjgPA3TPPPlVyKFLxvfkSQ
 RqmvAG1u6euo4PGB1FoeRyU/BZkCTZhDMktLyqxs=
Received: by mail-lf1-f44.google.com with SMTP id b1so4427364lfp.11
 for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2020 20:10:00 -0700 (PDT)
X-Gm-Message-State: AOAM532Sd0h/asqYzXtgFd3Y+E5qJN+B+lvqx0NqSYMqQc14AW9Luv2P
 4C9ixlBRUPNiZVBsoes/K/nUyW3DwZnMBejfrDY=
X-Google-Smtp-Source: ABdhPJzk/Eff6yLqLbwZHcWOxTj59jpy4SEfa8P10MfMEwbh3atXnMPy370F7GDb5S/xd9ADT89o8s4JLP5bLoauvL8=
X-Received: by 2002:a19:e305:: with SMTP id a5mr1595530lfh.549.1603508999204; 
 Fri, 23 Oct 2020 20:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
 <CAAhSdy1rqZBt5LSgs9yQwewwKXvaS23ou5Ah7Xfu3n7S9sK6RA@mail.gmail.com>
In-Reply-To: <CAAhSdy1rqZBt5LSgs9yQwewwKXvaS23ou5Ah7Xfu3n7S9sK6RA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 24 Oct 2020 11:09:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQtcKf0R-8nJK=Jb5BdQZ1giZTEuqHjZdHEU4Gks-i+Qw@mail.gmail.com>
Message-ID: <CAJF2gTQtcKf0R-8nJK=Jb5BdQZ1giZTEuqHjZdHEU4Gks-i+Qw@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip/irq-sifive-plic: Fixup wrong size of
 xxx_PER_HART and reg base
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_231002_826231_5A4C78A3 
X-CRM114-Status: GOOD (  32.63  )
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

On Fri, Oct 23, 2020 at 8:31 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Oct 23, 2020 at 3:48 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > ENABLE and CONTEXT registers contain M & S status for per-hart, so
> > ref to the specification the correct definition is double to the
> > current value.
> >
> > The value of hart_base and enable_base should be calculated by real
> > physical hartid not software id. Sometimes the CPU node's <reg>
> > from dts is not equal to the sequence index.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index eaa3e9f..2e56576 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -44,16 +44,16 @@
> >   * Each hart context has a vector of interrupt enable bits associated with it.
> >   * There's one bit for each interrupt source.
> >   */
> > -#define ENABLE_BASE                    0x2000
> > -#define     ENABLE_PER_HART            0x80
> > +#define ENABLE_BASE                    0x2080
> > +#define     ENABLE_PER_HART            0x100
> >
> >  /*
> >   * Each hart context has a set of control registers associated with it.  Right
> >   * now there's only two: a source priority threshold over which the hart will
> >   * take an interrupt, and a register to claim interrupts.
> >   */
> > -#define CONTEXT_BASE                   0x200000
> > -#define     CONTEXT_PER_HART           0x1000
> > +#define CONTEXT_BASE                   0x201000
> > +#define     CONTEXT_PER_HART           0x2000
> >  #define     CONTEXT_THRESHOLD          0x00
> >  #define     CONTEXT_CLAIM              0x04
> >
> > @@ -358,10 +358,10 @@ static int __init plic_init(struct device_node *node,
> >                 cpumask_set_cpu(cpu, &priv->lmask);
> >                 handler->present = true;
> >                 handler->hart_base =
> > -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> > +                       priv->regs + CONTEXT_BASE + hartid * CONTEXT_PER_HART;
> >                 raw_spin_lock_init(&handler->enable_lock);
> >                 handler->enable_base =
> > -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> > +                       priv->regs + ENABLE_BASE + hartid * ENABLE_PER_HART;
> >                 handler->priv = priv;
> >  done:
> >                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> > --
> > 2.7.4
> >
>
> There is no one-to-one mapping between PLIC context and HARTID. Instead,
> we have many-to-one mapping between PLIC contexts and HARTID. In other
> words, we have one PLIC context for each interrupt capable mode (i.e.
> M/S-mode) of each HART.
>
> For example, on SiFive Unleashed we have 5 HARTs but HARTID=0 has
> only M-mode capable of taking interrupts so we have total (1 + 2x4) = 9
> PLIC contexts.
That's OK, but what the bug I want to point out is enable_base &
context_base should be calculated by 'hartid' not 'i'.

For example, how we deal with below dts configuration:
        cpus {
                #address-cells = <1>;
                #size-cells = <0>;
                timebase-frequency = <3000000>;
                cpu@0 {
                        device_type = "cpu";
                        reg = <2>;  //********* different from index
                        status = "okay";
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
                        reg = <3>; //********* different from index
                        status = "fail";
                        compatible = "riscv";
                        riscv,isa = "rv64imafdcsu";
                        mmu-type = "riscv,sv39";
                        cpu1_intc: interrupt-controller {
                                #interrupt-cells = <1>;
                                compatible = "riscv,cpu-intc";
                                interrupt-controller;
                        };
                };
      }

>
> I would also like to highlight that this patch is forcing PLIC driver to always
> use PLIC S-mode context for each HART which breaks the Linux RISC-V
> NoMMU kernel.
Yes, I forgot M-mode and I will correct it.

>
> There is no issue with the existing defines because these are aligned with
> above and latest PLIC spec.
> (Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc)
>
> NACK to this patch from my side.

Here is my new patch which fixup m-mode linux:

diff --git a/drivers/irqchip/irq-sifive-plic.c
b/drivers/irqchip/irq-sifive-plic.c
index 4048657..e34e1d9 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -45,7 +45,13 @@
  * There's one bit for each interrupt source.
  */
 #define ENABLE_BASE                    0x2000
-#define     ENABLE_PER_HART            0x80
+#define     ENABLE_PER_HART            0x100
+#ifdef CONFIG_RISCV_M_MODE
+#define     ENABLE_OFFSET              0
+#else
+#define     ENABLE_OFFSET              0x80
+#endif
+

 /*
  * Each hart context has a set of control registers associated with it.  Right
@@ -53,9 +59,14 @@
  * take an interrupt, and a register to claim interrupts.
  */
 #define CONTEXT_BASE                   0x200000
-#define     CONTEXT_PER_HART           0x1000
+#define     CONTEXT_PER_HART           0x2000
 #define     CONTEXT_THRESHOLD          0x00
 #define     CONTEXT_CLAIM              0x04
+#ifdef CONFIG_RISCV_M_MODE
+#define     CONTEXT_OFFSET             0
+#else
+#define     CONTEXT_OFFSET             0x1000
+#endif

 #define        PLIC_DISABLE_THRESHOLD          0x7
 #define        PLIC_ENABLE_THRESHOLD           0
@@ -358,10 +369,10 @@ static int __init plic_init(struct device_node *node,
                cpumask_set_cpu(cpu, &priv->lmask);
                handler->present = true;
                handler->hart_base =
-                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
+                       priv->regs + CONTEXT_BASE + hartid *
CONTEXT_PER_HART + CONTEXT_OFFSET;
                raw_spin_lock_init(&handler->enable_lock);
                handler->enable_base =
-                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
+                       priv->regs + ENABLE_BASE + hartid *
ENABLE_PER_HART + ENABLE_OFFSET;
                handler->priv = priv;
 done:
                for (hwirq = 1; hwirq <= nr_irqs; hwirq++)

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
