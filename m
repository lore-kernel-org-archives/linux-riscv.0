Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B5FC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVohO/LhwmrIX0deo+Kfj/hoz8H+LbjxfEOommQCNI4=; b=oWNWA5ht38NEnH
	gV1oyXFW6TYuZ5ewrumGMRyDPb20Ht2YFs0fQxkcYez0xPyfu3+Sh34SkNAnP/8HWnvvxm32+9pLq
	3Pj0OFGUF3zJ00CRuSlxg+qjVBD8uHcpTnfbcURtJgxOrH/GdMjz9r90gt9RCjyOTpe+rwhaZKd+S
	Ea1SlE6wPuYZbKfv9h0yT8mc5QQo7aWfKMXrRExJoB7Ff3J8ikQTKto5PG9yVqdWW0UW+rC2CGAFj
	kQ1hMKbR0VfNllWLOk6YEFAunewImY6VyNOIFpo73yWMJ/84ANllxr0w2Nletci05F8dvRH8+tooc
	y5ZlVf8mrJ80Oc6EbuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01PA-0099C9-C5; Tue, 29 Nov 2022 14:16:12 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Oq-0098yZ-Rm
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:15:55 +0000
Received: by mail-ej1-x62f.google.com with SMTP id e27so34083862ejc.12
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28p5Nybo1rpmsnoEGgCuI1PFvoPigOmp1FVlfARCLEI=;
        b=0LO6RfyIF6PDQP1a0HnVo3mhkfhe3k2/fdE46iJVQLJ7Gu8kHdx5+JqY08fGyE8Ct9
         WlADV682W2pfuxXn4QnUiSjkLyPS5ZQdDBF1oFLCIE1ciUuayzLJINZ7OMbXziE3LTel
         YQ9M6svUJBxwZYtnZfuHf6ki/Jv06FyNNQfHKhwaNTlyvHFlVD9lE9H+fFFhdZQn+R9R
         /frovIXiA8EDDFs0cfy2l63oSS5GoFzHA+T5Fre0ammanuCGEsGCH7sxby4DT6fzPL/L
         f/6nLozNRdzYCdNb91mQmFFxscK8TzPprWkKGZN14NKfVUTXUYuNd3MXyE0RikJlr0cm
         SJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28p5Nybo1rpmsnoEGgCuI1PFvoPigOmp1FVlfARCLEI=;
        b=jmRdbEDuslwj+8ubz9e4tJsiR6kbz+Q+azZbckN/hV4hID7Q6wwAyagykqUy4ipsgg
         +Ei//hyLwV+O7TqcbufybBSPXiVyXN7g1BcIXwKmtQ62jhDVaeiN/KAq68+YKsXIR7mB
         pLmJfHe8+S9IlYN/TKcvWYxir+5gpPwXeoOo/13sBylY4TY9TqZRWywDFc3aE0FhjCyV
         x+AnJPu54P4igoEsEF4YCHPX6Mam8WLq3tZ7lNLYCm1oVPdpXyNY8sDjgGyxwLfA/arF
         4cVHT6RnU6qwynR8vx4xEHce+8x6GdgTXM90PwamakXNyCVgmvYUrOgxMiVlklS7oj+0
         GDGg==
X-Gm-Message-State: ANoB5pk16UgxxIDRfwll3GKl4sgtZj+5oVWA/ywE4089dBkTUCJNrGmv
	BnExVom26G8ZGieYCeZn45nuiRaT1miZFyYuZLnKgA==
X-Google-Smtp-Source: AA0mqf66DRfZfyrccTa/g3bwp+fP30fFxYUaytiD2SdQ+GpfUg3GZ5zj43+WYuFxbLLRyi/7GTOF9+NomGDNuPMMFLE=
X-Received: by 2002:a17:906:c042:b0:781:541:8f1d with SMTP id
 bm2-20020a170906c04200b0078105418f1dmr49062609ejb.117.1669731335514; Tue, 29
 Nov 2022 06:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20221126173453.306088-1-apatel@ventanamicro.com>
 <20221126173453.306088-4-apatel@ventanamicro.com> <86k03fmkox.wl-maz@kernel.org>
 <CAK9=C2Un8vH-OM8PRGgU-OijnNjmEOXya_gC=2BUMBDuhpjWPQ@mail.gmail.com> <86ilizmi40.wl-maz@kernel.org>
In-Reply-To: <86ilizmi40.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 29 Nov 2022 19:45:24 +0530
Message-ID: <CAAhSdy2rNOAqY0ErJwE-yATiu+EXhNduX13d-3pvzwETscKa_w@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] genirq: Add mechanism to multiplex a single HW IPI
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_061553_146867_A747D2F8 
X-CRM114-Status: GOOD (  39.33  )
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

On Mon, Nov 28, 2022 at 5:00 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 28 Nov 2022 11:13:30 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Mon, Nov 28, 2022 at 4:04 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Sat, 26 Nov 2022 17:34:49 +0000,
> > > Anup Patel <apatel@ventanamicro.com> wrote:
> > > >
> > > > +static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
> > > > +{
> > > > +     u32 ibit = BIT(irqd_to_hwirq(d));
> > > > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> > > > +     struct cpumask *send_mask = &icpu->send_mask;
> > > > +     unsigned long flags;
> > > > +     int cpu;
> > > > +
> > > > +     /*
> > > > +      * We use send_mask as a per-CPU variable so disable local
> > > > +      * interrupts to avoid being preempted.
> > > > +      */
> > > > +     local_irq_save(flags);
> > >
> > > The correct way to avoid preemption is to use preempt_disable(), which
> > > is a lot cheaper than disabling interrupt on most architectures.
> >
> > Okay, I will update.
> >
> > >
> > > > +
> > > > +     cpumask_clear(send_mask);
> > >
> > > This thing is likely to be unnecessarily expensive on very large
> > > systems, as it is proportional to the number of CPUs.
> > >
> > > > +
> > > > +     for_each_cpu(cpu, mask) {
> > > > +             icpu = per_cpu_ptr(ipi_mux_pcpu, cpu);
> > > > +             atomic_or(ibit, &icpu->bits);
> > >
> > > The original code had an atomic_fetch_or_release() to allow eliding
> > > the IPI if the target interrupt was already pending. Why is that code
> > > gone? This is a pretty cheap and efficient optimisation.
> >
> > That optimization is causing RCU stalls on QEMU RISC-V virt
> > machine with large number of CPUs.
>
> Then there is a bug somewhere, either in the implementation of the
> atomic operations or in QEMU. Or maybe even in the original code
> (though this looks unlikely given how heavily this is used on actual
> HW - I'm typing this email from one of these machines, and I'd be
> pretty annoyed if I was missing IPIs).
>
> In any case, please don't paper over this.

I was trying to defer the optimization to a later stage until this
issue was fixed for RISC-V.

Anyways, I found the root cause. This turned out to be missing
broadcast timer initialization in time_init() for RISC-V. Removing
the optimization over here was simply hiding the issue.

I will bring back the optimization in the next patch revision.

>
> >
> > >
> > > > +
> > > > +             /*
> > > > +              * The atomic_or() above must complete before
> > > > +              * the atomic_read() below to avoid racing with
> > > > +              * ipi_mux_unmask().
> > > > +              */
> > > > +             smp_mb__after_atomic();
> > > > +
> > > > +             if (atomic_read(&icpu->enable) & ibit)
> > > > +                     cpumask_set_cpu(cpu, send_mask);
> > > > +     }
> > > > +
> > > > +     /* Trigger the parent IPI */
> > > > +     ipi_mux_send(send_mask);
> > >
> > > IPIs are very rarely made pending on more than a single CPU at a
> > > time. The overwhelming majority of them are targeting a single CPU. So
> > > accumulating bits to avoid doing two or more "send" actions only
> > > penalises the generic case.
> > >
> > > My conclusion is that this "send_mask" can probably be removed,
> > > together with the preemption fiddling.
> >
> > So, we should call ipi_mux_send() for one target CPU at a time ?
>
> I think so, as it matches my measurements from a few years ago. It
> also simplifies things significantly, leading to better performance
> for the common case. Add some instrumentation and see whether this is
> still the case though.

I did not see any difference in the hackbench running on QEMU RISC-V.
I will simplify ipi_mux_send() like you suggested.

>
> >
> > >
> > > > +
> > > > +     local_irq_restore(flags);
> > > > +}
> > > > +
> > > > +static const struct irq_chip ipi_mux_chip = {
> > > > +     .name           = "IPI Mux",
> > > > +     .irq_mask       = ipi_mux_mask,
> > > > +     .irq_unmask     = ipi_mux_unmask,
> > > > +     .ipi_send_mask  = ipi_mux_send_mask,
> > > > +};
> > >
> > > OK, you have now dropped the superfluous pre/post handlers. But the
> > > need still exists. Case in point, the aic_handle_ipi() prologue and
> > > epilogue to the interrupt handling. I have suggested last time that
> > > the driver could provide the actual struct irq_chip in order to
> > > provide the callbacks it requires.
> >
> > The aic_handle_ipi() can simply call ipi_mux_process() between
> > the prologue and epilogue.
>
> Hmm. OK. That's not what I had in mind, but fair enough.
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
