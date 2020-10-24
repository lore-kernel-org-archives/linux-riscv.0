Return-Path: <SRS0=l2pG=D7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C138DC55179
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2020 03:39:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E837321D43
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2020 03:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lzkl1uIg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnHE3LKN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E837321D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zmi9jqf9mvtt528S6PBr1XhZN+/AY4klxhXXnGs2wl4=; b=lzkl1uIgmZGPK+A/fe6mCh+Jc
	VwTd6VCXBGiDEJAov5q+bT1+iP2UkJwWN4QjhB9s4oDqPiy3JIjZKEfKdSSH+IMFDJQrUAxZ0dr4d
	MBrSmpp/SAtTxgPpLxfA4ec6I+qjaUKC7n7dzKHL/Kh5jJbB2/2bf0eOTAMpA1FzJYRwmEOHC8MK/
	vgHDGcflp4jVWnxpa6i/jYJnI7U5V5mhPw7ZIMRl3SUhwYvskctEavZE90aq5Ea9PlBMfW8i/amad
	RhgrD9yqRxsB+o7yLFvYCjEHgv0ReYqfV4jaVk3jcJrstuIaTQ2CdkwCs5bqw0+26uCyXB8aasees
	VFSDhlnGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWAOR-00067W-Ng; Sat, 24 Oct 2020 03:38:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWAOM-00066r-N5
 for linux-riscv@lists.infradead.org; Sat, 24 Oct 2020 03:38:56 +0000
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F30052225E
 for <linux-riscv@lists.infradead.org>; Sat, 24 Oct 2020 03:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603510733;
 bh=YMEvV6dcm7AXyyY8ChedIM35amwdXFyfa+CzZQS9MyQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HnHE3LKNsDzMMu0iWImTJUna+X9HmmVJG1IjwvSTCLQj3XaPgwExLsX+glRnjcLQ9
 bV4YUPoQXKICOdHSjxa/TSx1Yp1c+gNz1+p4ZN1D4c/Aa8yyshyZFKC2cxqyfttWSX
 kKnXCTsYHRn7zUj27u0yw48XhIcC6bQfYGGCxSj4=
Received: by mail-lj1-f175.google.com with SMTP id 23so3664722ljv.7
 for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2020 20:38:52 -0700 (PDT)
X-Gm-Message-State: AOAM533kCVvms+9qf0THJoLhoerAbYEtU6ofKVY+vOAiIjCUscywf5vT
 192qsPPeuVZ37coH9yvySxTcwcFsGX2PdffiwFo=
X-Google-Smtp-Source: ABdhPJwS47a6FTAP5XSOgGk7uEC69QnjfNkTN8FFkuqc3/SlH47dOWNVpu0Wmnq2yDK280vAeWi7bAn77duFmXouOKo=
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr1842690ljj.250.1603510731255; 
 Fri, 23 Oct 2020 20:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
 <1603448245-79429-2-git-send-email-guoren@kernel.org>
 <CAAhSdy120ZR4ZbkHo8Us+CugaeegSR6iFu9jgHPuyvDAQwnOhQ@mail.gmail.com>
In-Reply-To: <CAAhSdy120ZR4ZbkHo8Us+CugaeegSR6iFu9jgHPuyvDAQwnOhQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 24 Oct 2020 11:38:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRnDxrOBTLL+=Kk9BjftH-xE=NX1zpLaxv7Xsb4L5XgAA@mail.gmail.com>
Message-ID: <CAJF2gTRnDxrOBTLL+=Kk9BjftH-xE=NX1zpLaxv7Xsb4L5XgAA@mail.gmail.com>
Subject: Re: [PATCH 2/3] irqchip/irq-sifive-plic: Fixup couldn't broadcast to
 multi CPUs
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_233855_067378_90726CF2 
X-CRM114-Status: GOOD (  23.99  )
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

On Fri, Oct 23, 2020 at 8:17 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Oct 23, 2020 at 3:48 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > If "echo 3 > /proc/irq/1/smp_affinity", we want irq 1 could be
> > broadcast to CPU0 & CPU1 and one of them would pick up the irq
> > handler.
> >
> > But current implementation couldn't let multi CPUs process the
> > same IRQ concurrent.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 23 ++++++-----------------
> >  1 file changed, 6 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 2e56576..0003322 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -114,15 +114,12 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
> >  static void plic_irq_unmask(struct irq_data *d)
> >  {
> >         struct cpumask amask;
> > -       unsigned int cpu;
> >         struct plic_priv *priv = irq_get_chip_data(d->irq);
> >
> >         cpumask_and(&amask, &priv->lmask, cpu_online_mask);
> > -       cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
> > -                                          &amask);
> > -       if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> > -               return;
> > -       plic_irq_toggle(cpumask_of(cpu), d, 1);
> > +       cpumask_and(&amask, &amask, irq_data_get_affinity_mask(d));
> > +
> > +       plic_irq_toggle(&amask, d, 1);
> >  }
> >
> >  static void plic_irq_mask(struct irq_data *d)
> > @@ -136,24 +133,16 @@ static void plic_irq_mask(struct irq_data *d)
> >  static int plic_set_affinity(struct irq_data *d,
> >                              const struct cpumask *mask_val, bool force)
> >  {
> > -       unsigned int cpu;
> >         struct cpumask amask;
> >         struct plic_priv *priv = irq_get_chip_data(d->irq);
> >
> >         cpumask_and(&amask, &priv->lmask, mask_val);
> > +       cpumask_and(&amask, &amask, cpu_online_mask);
> >
> > -       if (force)
> > -               cpu = cpumask_first(&amask);
> > -       else
> > -               cpu = cpumask_any_and(&amask, cpu_online_mask);
> > -
> > -       if (cpu >= nr_cpu_ids)
> > -               return -EINVAL;
> > +       irq_data_update_effective_affinity(d, &amask);
> >
> >         plic_irq_toggle(&priv->lmask, d, 0);
> > -       plic_irq_toggle(cpumask_of(cpu), d, 1);
> > -
> > -       irq_data_update_effective_affinity(d, cpumask_of(cpu));
> > +       plic_irq_toggle(&amask, d, 1);
> >
> >         return IRQ_SET_MASK_OK_DONE;
> >  }
> > --
> > 2.7.4
> >
>
> In the past, a similar patch was proposed by Zong Li (SiFive). We
> have good reasons to not allow multiple CPUs handle the same IRQ.
>
> Refer, https://lkml.org/lkml/2020/4/26/201
>
> NACK from my side.
Thx for sharing the information, I agree with Zong Li & Greentime's
aspect: Don't limit the usage of PLIC! We could let (one hart -> one
irq) as default.

I also agree that using irq broadcast indiscriminately can cause
performance problems. (Anup and Mark Z's view)

I think you've discussed enough at that time and l won't persist the patch.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
