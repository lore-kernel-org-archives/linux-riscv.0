Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A1DC64EB4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 07:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B03FC2082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 07:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Me7/YezY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="uPEcMWdZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B03FC2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvUzSKb9mT6mF7b9V6lu6eL4HbpRan6Ed6QxiXaZ9hE=; b=Me7/YezYeRR1bp
	VQQ+rsQKypXJoIDuK2ckwNTxpCYok3OnfvhcHok+/wEAOPTN7Obxb+TFu2exV6EnQg3ly+mvehRmA
	PzONnoMN42zC0ZO6mG97PSiHc5VqNeN7yZcOYFTCdUgVlxEdxYCI1Sc+rOiAkvIBLLZiHMp6JUqBt
	4yjbtaimU3gIttr+vYdPAma83eGTa7EYxt/VP2D4PdueMeaLK8dlSKpTw/Y7h8QMWDPJH7JDpDfp1
	dOAxE68KkywdDYrSvGramLperE+C/YJKOjRDSa+iQ58fFh2N96tOMhRGcvZCDZ72qg4I7fxPBu5nB
	B8mvHG4OomIYbwYAPw6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSdai-0006ug-K1; Fri, 30 Nov 2018 07:52:00 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSdaf-0006tZ-2S
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 07:51:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id x10so4282695wrs.8
 for <linux-riscv@lists.infradead.org>; Thu, 29 Nov 2018 23:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xv45qPLu0+joa5b+Y6GKAI82GxpR9Cy8Z5a9laKeQas=;
 b=uPEcMWdZP/at83xuINieAReuzpCofLfhQ2sgghLqylaKxjrVBQWhhybF/pW9MmPTCA
 QBX5z5dcFffjKL2lszgfuNYjoRiSBumc7YUo2mGyiP6Os2/sBgaqXqGzO1NV2pwhqfcv
 dmZeldC5av5CL+Vado7aeYN44ASEXuhVYB9MhDH46gelYMyn8QPm3fTx441kXV0pqw36
 UqANM5B23/uhL3Zekp2u3Lhd2FNlKDrHLXiC9nE+0sR79EFE2F6IlsHUNlarWonThqbb
 UoYjrQ7W6UMWlS/Fr9J4e0j+fAZQbKmrwhQH5Gt8cFPZEEz7o9Tf1gkTMEF1GqSh1TND
 YaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xv45qPLu0+joa5b+Y6GKAI82GxpR9Cy8Z5a9laKeQas=;
 b=CXyMsDhNISeTBDrEL9RwunZK0rFlOx7lJ1p4XUGaSpWKmVQGpED+uW/hBQ9ADrqYVN
 gR0EndsylJIfljGIJ8nnSiN8uEBKdNQI+0BuoApDksz+EEs1K6UU0nA6S2zmc9UhiCgR
 qn2d8yb5NRdnvg48jA+aio2weUkRBx1dM8ceDtx7Hvuxo/gJoyhmHlUxswvfsqF/VzAa
 eZnituAk0YeOt+ZEggGu4kftWe3oAQKEpFM5F9voTINK3t8gtEK9ShlTQ4YtbUnH2J/g
 b7Yf8mJy0omh72kSp0lcz7vW1eloiEsu6Fc3L0f/o7zAn8VoZ+3U+szTVi0NGVTupH6E
 kQIg==
X-Gm-Message-State: AA+aEWYPJO37acdYfKAbaI6mq14wH1mrrKSCZVmP5C/hq8f9Ho5XlUsu
 D/Mt/1PyTc/VAGvoLOBzj3FP+DQ/qIvnNe+qOglb1g==
X-Google-Smtp-Source: AFSGD/WepqiWaRNCJED8KOJkOqZI5AWeV/2klGQWDpbhbKQORnd9RDvOP75YM+WmHWxgXNj5t5KD4wp8weCs9tRS9sQ=
X-Received: by 2002:adf:f785:: with SMTP id q5mr4258376wrp.9.1543564304458;
 Thu, 29 Nov 2018 23:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20181127100317.12809-1-anup@brainfault.org>
 <20181127100317.12809-5-anup@brainfault.org>
 <71aaed41-c794-ea82-8d87-ddcde3506067@wdc.com>
In-Reply-To: <71aaed41-c794-ea82-8d87-ddcde3506067@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 Nov 2018 13:21:40 +0530
Message-ID: <CAAhSdy2KkBT2gcxiJsV1XUOQvbp0CXA4OM1VCJzMeCBQ3FWTfQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] irqchip: sifive-plic: Implement irq_set_affinity()
 for SMP host
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181129_235157_118450_1BE658CC 
X-CRM114-Status: GOOD (  23.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 30, 2018 at 11:29 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 11/27/18 2:04 AM, Anup Patel wrote:
> > Currently on SMP host, all CPUs take external interrupts routed via
> > PLIC. All CPUs will try to claim a given external interrupt but only
> > one of them will succeed while other CPUs would simply resume whatever
> > they were doing before. This means if we have N CPUs then for every
> > external interrupt N-1 CPUs will always fail to claim it and waste
> > their CPU time.
> >
> > Instead of above, external interrupts should be taken by only one CPU
> > and we should have provision to explicity specify IRQ affinity from
> s/explicity/explicitly

Sure, I will update it.

>
> > kernel-space or user-space.
> >
> > This patch provides irq_set_affinity() implementation for PLIC driver.
> > It also updates irq_enable() such that PLIC interrupts are only enabled
> > for one of CPUs specified in IRQ affinity mask.
> >
> > With this patch in-place, we can change IRQ affinity at any-time from
> > user-space using procfs.
> >
> > Example:
> >
> > / # cat /proc/interrupts
> >             CPU0       CPU1       CPU2       CPU3
> >    8:         44          0          0          0  SiFive PLIC   8  virtio0
> >   10:         48          0          0          0  SiFive PLIC  10  ttyS0
> > IPI0:        55        663         58        363  Rescheduling interrupts
> > IPI1:         0          1          3         16  Function call interrupts
> > / #
> > / #
> > / # echo 4 > /proc/irq/10/smp_affinity
> > / #
> > / # cat /proc/interrupts
> >             CPU0       CPU1       CPU2       CPU3
> >    8:         45          0          0          0  SiFive PLIC   8  virtio0
> >   10:        160          0         17          0  SiFive PLIC  10  ttyS0
> > IPI0:        68        693         77        410  Rescheduling interrupts
> > IPI1:         0          2          3         16  Function call interrupts
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > ---
> >   drivers/irqchip/irq-sifive-plic.c | 35 +++++++++++++++++++++++++++++--
> >   1 file changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index ffd4deaca057..fec7da3797fa 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -98,14 +98,42 @@ static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
> >
> >   static void plic_irq_enable(struct irq_data *d)
> >   {
> > -     plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 1);
> > +     unsigned int cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
> > +                                        cpu_online_mask);
> > +     WARN_ON(cpu >= nr_cpu_ids);
> > +     plic_irq_toggle(cpumask_of(cpu), d->hwirq, 1);
> >   }
> >
> >   static void plic_irq_disable(struct irq_data *d)
> >   {
> > -     plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 0);
> > +     plic_irq_toggle(cpu_possible_mask, d->hwirq, 0);
> >   }
> >
> > +#ifdef CONFIG_SMP
> > +static int plic_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
> > +                         bool force)
> > +{
> > +     unsigned int cpu;
> > +
> > +     if (!force)
> > +             cpu = cpumask_any_and(mask_val, cpu_online_mask);
> > +     else
> > +             cpu = cpumask_first(mask_val);
> > +
> > +     if (cpu >= nr_cpu_ids)
> > +             return -EINVAL;
> > +
> > +     if (!irqd_irq_disabled(d)) {
> > +             plic_irq_toggle(cpu_possible_mask, d->hwirq, 0);
> > +             plic_irq_toggle(cpumask_of(cpu), d->hwirq, 1);
>
> irq is disabled for a fraction of time for cpu as well.
> You can use cpumask_andnot to avoid that.
>
>
> Moreover, something is weird here. I tested the patch in Unleashed with
> a debug statement.
>
> Here are the cpumask plic_set_affinity receives.

The smp_affinity in procfs takes hex values as input.

1 = CPU0
2 = CPU1
3 = CPU0-1
4 = CPU2
... and so on ...

>
> # echo 0 > /proc[  280.810000] plic: plic_set_affinity: set affinity [0-1]
> [  280.810000] plic: plic_set_affinity: cpu = [0] irq = 4

OK, this is strange.

> # echo 1 > /proc[  286.290000] plic: plic_set_affinity: set affinity [0]
> [  286.290000] plic: plic_set_affinity: cpu = [0] irq = 4

This is correct.

> # echo 2 > /proc[  292.130000] plic: plic_set_affinity: set affinity [1]
> [  292.130000] plic: plic_set_affinity: cpu = [1] irq = 4

This is correct.

> # echo 3 > /proc[  297.750000] plic: plic_set_affinity: set affinity [0-1]
> [  297.750000] plic: plic_set_affinity: cpu = [0] irq = 4

This is correct.

>
> # echo 2 > /proc/irq/4/smp_affinity
> [  322.850000] plic: plic_set_affinity: set affinity [1]
> [  322.850000] plic: plic_set_affinity: cpu = [1] irq = 4

This is correct.

>
> I have not figured out why it receive cpu mask for 0 & 3.
> Not sure if logical cpu id to hart id mapping is responsible for other
> two case. I will continue to test tomorrow.

Except value '0', all cases are correct.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
