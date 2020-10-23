Return-Path: <SRS0=wzy2=D6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A31C4363A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 12:17:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EECB82072E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 12:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DgZ1Dpv6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="GPfFzo6w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EECB82072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KmUiv5KWm03ztXg7TS6MAR4gfh8+dLt99CvgPIBh8Bs=; b=DgZ1Dpv62jGenIi3fc1MWgL7V
	nhPV+Nc0MJG4Tf9ZoMErrYamxdxTEAQcDSHvFbSSzwXLENk1PDYNVz5IKgNQA6XLWPYPHCxWAVSJ5
	rL0/n4hfzTMUiT9vy5cLoHZ7+RvO54xEezSI08i6KrRZyQ1/bs//JyERn/8pWMrI4mestQcbnL6O1
	sUxARCPxmIkpSWLFzSQFaxFAuiTSOnup5Bh1g6rO5a+b4CsXeXgT7nZX4/iaBk1eQUC3V/++Qls7Z
	WP300Ui4nwBdCoqotaqp2bnYWwTi31WhIyFbVVog1PhHl+iWBp4fNaNUTyLaMaqJzhhpqYX0BKGhQ
	sV9HbyIew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVw0H-00078V-RI; Fri, 23 Oct 2020 12:17:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVw0G-00077z-1L
 for linux-riscv@lists.infradead.org; Fri, 23 Oct 2020 12:17:04 +0000
Received: by mail-wr1-x443.google.com with SMTP id n6so1533300wrm.13
 for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2020 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7/Fm6XaJlnf+0GZcokzUQVnv0XVQ9vwBMmUnKtUMoVY=;
 b=GPfFzo6wzNR5nULW/kco1+wYGucDFxTXnF/4x5Fhckacdc5uoFBSkDMSuf4m0I5zkp
 HVI7LtmdOiU0OpBhxqw1chCau8Q4g9r8Ahft4HuJd1NPHaBFC6y+arE2iizxUmix5uYG
 T7k8W1zPkCqJ7DwX7SPhfKYstXMV1s40rsq6jNYabfCT5hP0tReLgj4FjOdB3Ew5HyOv
 wXR/Z5QsyGssiHTL/flxO/4d33gFqUGlglolQxG9zzKhZ64N4L/P4el7XjI0iJc4ANEp
 O4+x+kXfpLTgZQXn116vT58EW16z5tWJN5GvwSZV70TOSyqPyYvIjVrN40j8tPoI37J2
 MFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/Fm6XaJlnf+0GZcokzUQVnv0XVQ9vwBMmUnKtUMoVY=;
 b=GHqWR0drLGbOiQXjX1/voFFHAwQBQFVsulTHfDDf3QLpkXBqCiV0S4nTIVIpl2kyLW
 +aQmqocdli2dAavVELO1aidLK4o0u1PnriMi/hrrp0TR6apwS5AWNm5QZvx0UsMNRR0G
 TP/S4fga4UlOpocDPQ1a85cLSbb7D/HmQkNo41+CpOlFe70ePmbBR6LC3LAinkTXaIaT
 nf1ApdeONlo18Gbv5srqcTvoiND9/8g5azv5tFGX1JxmJDbvjf8CCIXCWIG5/lVQdUyN
 NuRVSE1Ys8SifwOS4N/o6rghggzW6xcvGz/9S3nnlfnggrRrx3ftUZim+wXZHU1R0Iwj
 Yfcw==
X-Gm-Message-State: AOAM5300EpNQIwgNvEoPTMmUi12FUfPq41i1/59Yvm6LaRCaYaYpF5OO
 zH53fBL33FOKpvElSu6MKPi3Y2aDhf8SY46FlY8fHQ==
X-Google-Smtp-Source: ABdhPJzL5F1aOLgTEEtR6hKrRFXkK5t7ulAjkYe//QYMi/EC1tUVESIcHmYJcmmKVM69YJLF5YNLmhKj8ITc0YhyLFc=
X-Received: by 2002:a5d:6681:: with SMTP id l1mr2348523wru.356.1603455421182; 
 Fri, 23 Oct 2020 05:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
 <1603448245-79429-2-git-send-email-guoren@kernel.org>
In-Reply-To: <1603448245-79429-2-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2020 16:57:41 +0530
Message-ID: <CAAhSdy120ZR4ZbkHo8Us+CugaeegSR6iFu9jgHPuyvDAQwnOhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] irqchip/irq-sifive-plic: Fixup couldn't broadcast to
 multi CPUs
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_081704_203610_264F951E 
X-CRM114-Status: GOOD (  19.45  )
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

On Fri, Oct 23, 2020 at 3:48 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> If "echo 3 > /proc/irq/1/smp_affinity", we want irq 1 could be
> broadcast to CPU0 & CPU1 and one of them would pick up the irq
> handler.
>
> But current implementation couldn't let multi CPUs process the
> same IRQ concurrent.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 2e56576..0003322 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -114,15 +114,12 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
>  static void plic_irq_unmask(struct irq_data *d)
>  {
>         struct cpumask amask;
> -       unsigned int cpu;
>         struct plic_priv *priv = irq_get_chip_data(d->irq);
>
>         cpumask_and(&amask, &priv->lmask, cpu_online_mask);
> -       cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
> -                                          &amask);
> -       if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> -               return;
> -       plic_irq_toggle(cpumask_of(cpu), d, 1);
> +       cpumask_and(&amask, &amask, irq_data_get_affinity_mask(d));
> +
> +       plic_irq_toggle(&amask, d, 1);
>  }
>
>  static void plic_irq_mask(struct irq_data *d)
> @@ -136,24 +133,16 @@ static void plic_irq_mask(struct irq_data *d)
>  static int plic_set_affinity(struct irq_data *d,
>                              const struct cpumask *mask_val, bool force)
>  {
> -       unsigned int cpu;
>         struct cpumask amask;
>         struct plic_priv *priv = irq_get_chip_data(d->irq);
>
>         cpumask_and(&amask, &priv->lmask, mask_val);
> +       cpumask_and(&amask, &amask, cpu_online_mask);
>
> -       if (force)
> -               cpu = cpumask_first(&amask);
> -       else
> -               cpu = cpumask_any_and(&amask, cpu_online_mask);
> -
> -       if (cpu >= nr_cpu_ids)
> -               return -EINVAL;
> +       irq_data_update_effective_affinity(d, &amask);
>
>         plic_irq_toggle(&priv->lmask, d, 0);
> -       plic_irq_toggle(cpumask_of(cpu), d, 1);
> -
> -       irq_data_update_effective_affinity(d, cpumask_of(cpu));
> +       plic_irq_toggle(&amask, d, 1);
>
>         return IRQ_SET_MASK_OK_DONE;
>  }
> --
> 2.7.4
>

In the past, a similar patch was proposed by Zong Li (SiFive). We
have good reasons to not allow multiple CPUs handle the same IRQ.

Refer, https://lkml.org/lkml/2020/4/26/201

NACK from my side.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
