Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D46BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 10:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B989205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 10:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="liCJvwgZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Wg7PnavM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B989205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOtRL9YdwC2U9MhisBqAiDP61mQbhH4qk4/BNZgX3g0=; b=liCJvwgZsStmSB
	No6+c825iwDIIOQj0UqqQtM44OzKUL2JU7bRXwyehizaboVIKN9wpiX7OQn0Kxy47n4cmuUlrQgj6
	phAB42f8EMePk3yfAwXZTPSt9GCEI1VhKkeC4Fz+PsnFsUG+LcJKgl882exRsRNLQtLBxgROx1S+B
	PbvSErnO0vEfEuu4m8wmYJSOV4++hTuEV7yCY8137XQtXOSBRL99UGEgHI3hQ57zyCe8EerloEO83
	YQWE+a9iv8RdBaTWrREsLTeILK9Ki+0bw8t/Lgib2jqanu4WT3izmTiRKorSU1o6oHvg6WTXN2kt3
	Lkj0+a2CCnZIwBTm8q1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZCg1-0004zl-5R; Tue, 18 Dec 2018 10:32:37 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZCfx-0004yX-S4
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 10:32:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id l9so15285926wrt.13
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 02:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6YTuC8veEqcdC00DnB8iCpbVjsjm1RFbphabmuAgDsY=;
 b=Wg7PnavMsDxylnR64ewsOx6DVp9Ym5mrsCv5anM6FNWkBF+s2w4wdJjgz6BcJ8fQ8R
 WATAxridgmlUOqtvY2gdSEaQRAW6iyZSmohh6SOWCyYNTYmN22HvsT/Edx4W9b1Bq8sK
 +Nse9P6eeXSObtFHUY4c6apd0AsrHHdjSoGQ0fCg8qmbsg1nzP2D5i/fqEK3qNjupdnb
 6+31LhYqwpDv2UyncJ0PZRADXCu7j3Cjy3XNNJvEKEpHjjeo58SZ06n+NxDIjJ2YxPjl
 mduXfJ5ANr1vPcE1aXjeWMXVJidAOs9V0uddYbwZ4hWGvyTDxmvFvw3+7xfsrXdj3r55
 L2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6YTuC8veEqcdC00DnB8iCpbVjsjm1RFbphabmuAgDsY=;
 b=di5FLocmWFdOz5LKaswFzl0v3F4gQev7XLnVZRicqWaJEn40cmIhDSnCmbV6x0R7Dn
 /cuowDZEsXwBroEaumM+OS54BjV506qZNJqP/oLpTATK6fUHrzLRebA7aOXQmPfaJhoA
 N54Zy+g/J4Hus6E7RnGCpfeOsMtWzt7EknKsK/2M7Nu69AxAP9KtCq/vaSOeL3duyR+R
 x4gV1rf9MjlOb2gJ0qlspDYIplKouQU6gxNNOJMhAorjXvPmWqbGubS5+FolFmXCfqpc
 Utm9OrSydvkmpV66IDTaxlKjdn1tUKL+FgzD+idiuxbND37mExCPs1wRQbftI0Qnexzv
 n1nA==
X-Gm-Message-State: AA+aEWaLUfWDCWnq2kwpTSnLLQOzADxu+FQDOL/aLEmCMntkC4QzKQ+C
 e9vxOydXdbKDGxj3AnbvacbfN4+XdU8MW5SIA7jJ3A==
X-Google-Smtp-Source: AFSGD/VNsQJo/cgSrZWNhedsB3N29uldBE0TMTipUrWJ01nxqEXtAA724qc6HtMDu75hSPp9SstQcUY6GaKZKSJjn9Y=
X-Received: by 2002:adf:ee07:: with SMTP id y7mr14648797wrn.187.1545129140582; 
 Tue, 18 Dec 2018 02:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-7-anup@brainfault.org>
 <20181217183220.GE7086@infradead.org>
In-Reply-To: <20181217183220.GE7086@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Dec 2018 16:02:09 +0530
Message-ID: <CAAhSdy3=Hz7uuT=AEJqmZ7OJZg5Zt9MSg8QiBjEzH5wcsOH1-Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] irqchip: sifive-plic: Implement irq_set_affinity()
 for SMP host
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_023233_908154_65060595 
X-CRM114-Status: GOOD (  16.77  )
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
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 18, 2018 at 12:02 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Nov 30, 2018 at 01:32:07PM +0530, Anup Patel wrote:
> > This patch provides irq_set_affinity() implementation for PLIC driver.
> > It also updates irq_enable() such that PLIC interrupts are only enabled
> > for one of CPUs specified in IRQ affinity mask.
>
> But normally our affinity masks are that - masks of CPUs that can take
> it.  It seems a bit odd to then just pick the first one, as this means
> with default all-CPU masks we'll have all interrupts handled by the
> first CPU only.

Yes, affinity mask are CPUs which can take but there is also effective
affinity mask which represent CPUs which will actually receive IRQ.

Interrupt controllers (unlike PLIC) can support hardware IRQ balancing.
For such interrupt controllers, we inform all CPUs that can take IRQ but
interrupt controller will only deliver IRQ to only one of the CPUs.

There are quite a few interrupt controllers which only allow IRQ to
be taken by exactly one CPU. For such interrupt controllers, the
interrupt controller driver has to to pick one CPU out of CPUs which
can take IRQ (Example GICv2, GICv3, etc).

>
>
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -106,14 +106,42 @@ static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
> >
> >  static void plic_irq_enable(struct irq_data *d)
> >  {
> > -     plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 1);
> > +     unsigned int cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
> > +                                        cpu_online_mask);
> > +     WARN_ON(cpu >= nr_cpu_ids);
>
> I think this should be WARN_ON_ONCE and actually return instead of then
> proceeding using the invalid cpu index.

Sure, will update.

>
> > +#ifdef CONFIG_SMP
> static int plic_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
> > +                         bool force)
> > +{
> > +     unsigned int cpu;
> > +
> > +     if (!force)
> > +             cpu = cpumask_any_and(mask_val, cpu_online_mask);
> > +     else
> > +             cpu = cpumask_first(mask_val);
>
> maybe swap the two branches around to avoid the inversion of the force
> flag?

Sure, will update.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
