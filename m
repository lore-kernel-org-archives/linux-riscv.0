Return-Path: <SRS0=H9LG=EE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02185C2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 21:43:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6618620759
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 21:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0TTSaSR2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="p3MMIIlj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6618620759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZvbpS1U1EX0OYRWeQqRHXAYUYKrNz4zVDpReU7CpOa0=; b=0TTSaSR2zTHy2P5W3Rg3HELop
	UjYfVz2NVFFibki9TFRzJ4Bq+29roa1zGv6Lj8QPGr3we/5oDplYnkuPcTxuE9BlPIa4QHLv7LLzR
	A4690LRjynMx0K9z9+AXmxHqFlnRer1xCZLow6RkdWRgf5Bewn3d86PmFA7mFfMwT+I7avccYUkt1
	3BXzqskowAPXzv/KkmFtFe59mjBqbV52icjKDzE723YySRfHPmiN9wpKpM1yX2i9q7R2E+wymtHG+
	ymdhB+ZjJ18tM6lHOLcMfjem0nmdtQYQ/QuLusByd9nHvfud8hlq9GTrRqht53rZOTiiWacuhvsP4
	7RmfQig2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYFhb-000841-3P; Thu, 29 Oct 2020 21:43:23 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYFhY-000837-Kd
 for linux-riscv@lists.infradead.org; Thu, 29 Oct 2020 21:43:21 +0000
Received: by mail-io1-xd44.google.com with SMTP id p15so5346576ioh.0
 for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2020 14:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvaBge66Dm27tfh4je6+8HV2g9jlw8958RR2u8LBnKo=;
 b=p3MMIIljid9b3s7h4Jd/AkJCiQzEE/kkfdsXZqFxsho+2ba5sK/py0739/tnPbqnT+
 qK9Za7lqpIgwrP1L3FnxGqfBbRZDsf/pY/Dr/m6XMhmiZDwumYJSx7+KptWCbBQ1CFXW
 AbJEh8KCvQWYrMMxI8pqGOICXCcoQDaqbZTks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvaBge66Dm27tfh4je6+8HV2g9jlw8958RR2u8LBnKo=;
 b=kZCYszWIQDH2HPxojG1mNV8ZOunL5ReDazgXfE3J4aQ1f+PlVTdO+dTq1NLQPNPVzk
 2eKzsjxzjsa9MwgUqdmnHWKk5boA/PMkGgRrR8D7vbbDS+OJU6pKq4NRsUSAtv4H0QGr
 917uatHsxjv5sVf13cwwGK7bAV11y1W/Xf0cUmqYRFHB4qoO6dgHqQSUwORk/e6Vk572
 NhOJaOXiJ2X4sOsOMV83fKwyHfrVSfi+3FsMp2EBhZNp7/KCB5iEkKVSCi90gKDW3/2H
 EOU1U/zMGiiX6WplSCcLiRMEZn3HjMDIvQ29tk9iIHYf1bijaULJXM/5TWcLQjAWf7N5
 AXHg==
X-Gm-Message-State: AOAM531KHokb85kKIevRkhQInqoi7OOi2jeXsQOwuaPOuPkWh1lgbeDV
 XboIZOtTrOXxp/5r0OQI/3N8/WZlayPXGYOJBv2OS9jpeFZg
X-Google-Smtp-Source: ABdhPJwexYQl5IVrjrdlx8bXgN57z9Dn82MszyfA6Fd2iBCexafp1H1ojiwr7/nIFqL9FpjFzSn3LQMSDkXS+txjl4k=
X-Received: by 2002:a05:6638:2b3:: with SMTP id
 d19mr5409699jaq.141.1604007798044; 
 Thu, 29 Oct 2020 14:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201029023738.127472-1-greentime.hu@sifive.com>
In-Reply-To: <20201029023738.127472-1-greentime.hu@sifive.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 29 Oct 2020 14:43:07 -0700
Message-ID: <CAOnJCUJhvF1Jz0NZi=Ox1Uf+mKqOnNx2w2dmyf-z=tFuAhFOLg@mail.gmail.com>
Subject: Re: [RFC PATCH] irqchip/sifive-plic: Fix getting wrong chip_data when
 interrupt is hierarchy
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_174320_812197_D908861A 
X-CRM114-Status: GOOD (  24.31  )
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
Cc: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 28, 2020 at 7:37 PM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> This oops is caused by a wrong chip_data and it is because plic_irq_unmask
> uses irq_get_chip_data(irq_data->irq) to get the chip_data. However it may
> get another irq_data with the same irq_data->irq if it is hierarchy.
>
> In this case, it will get irq_data of sifive_gpio_irqchip instead of
> plic_chip so that it will get a wrong chip_data and then the wrong lmask
> of it to cause this oops.
>
> To fix this issue, we can use irq_data_get_irq_chip_data(irq_data) to get
> the correct chip_data of plic_chip.
>
> (gdb) p d
> $11 = (struct irq_data *) 0xffffffe1f695f620
> (gdb) p *d
> $9 = {
>   mask = 0,
>   irq = 57,
>   hwirq = 6,
>   common = 0xffffffe1f695f600,
>   chip = 0xffffffe0018b5630 <sifive_gpio_irqchip>,
>   domain = 0xffffffe1f692c400,
>   parent_data = 0xffffffe1f68482c0,
>   chip_data = 0xffffffe1f564a820
> }
>
> (gdb) p d
> $6 = (struct irq_data *) 0xffffffe1f68482c0
> (gdb) p *d
> $7 = {
>   mask = 0,
>   irq = 57,
>   hwirq = 29,
>   common = 0xffffffe1f695f600,
>   chip = 0xffffffe0018b5070 <plic_chip>,
>   domain = 0xffffffe1f6635e00,
>   parent_data = 0x0,
>   chip_data = 0xffffffe1f660f1a0
> }
>
> [    3.030165] ------------[ cut here ]------------
> [    3.034614] WARNING: CPU: 1 PID: 1 at drivers/irqchip/irq-sifive-plic.c:125 plic_irq_unmask+0xc4/0x114
> [    3.043887] Modules linked in:
> [    3.046932] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.9.0 #1
> [    3.052748] epc: ffffffe000588e90 ra : ffffffe000588e88 sp : ffffffe1f6753940
> [    3.059869]  gp : ffffffe001978f48 tp : ffffffe1f6748000 t0 : ffffffe001995cb0
> [    3.067080]  t1 : ffffffe001995be8 t2 : 73616d61202c343a s0 : ffffffe1f67539a0
> [    3.074288]  s1 : ffffffe1f4968140 a0 : 00000000000000b2 a1 : 0000000000000000
> [    3.081497]  a2 : 00000000000000c2 a3 : 0000000000000000 a4 : 381c5a89432fe900
> [    3.088707]  a5 : 0000000000000004 a6 : 0000000000000000 a7 : 00000000000001aa
> [    3.095916]  s2 : ffffffe1f5901020 s3 : ffffffe00197a0a8 s4 : ffffffe001978b0c
> [    3.103125]  s5 : ffffffe00197a1f0 s6 : 0000000000000008 s7 : ffffffe1f4983c9c
> [    3.110335]  s8 : ffffffe1f4983c68 s9 : ffffffe1f4983c00 s10: ffffffe00000117c
> [    3.117544]  s11: 0000000000000000 t3 : 0000000000000007 t4 : 0000000000000000
> [    3.124753]  t5 : 66666666663a6b73 t6 : ffffffe001988479
> [    3.130052] status: 0000000200000100 badaddr: ffffffe001978b0c cause: 0000000000000003
> [    3.137959] ---[ end trace dbc1129f842ecba3 ]---
>
> Fixes: f1ad1133b18f ("irqchip/sifive-plic: Add support for multiple PLICs")
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 4048657ece0a..6f432d2a5ceb 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -99,7 +99,7 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
>                                    struct irq_data *d, int enable)
>  {
>         int cpu;
> -       struct plic_priv *priv = irq_get_chip_data(d->irq);
> +       struct plic_priv *priv = irq_data_get_irq_chip_data(d);
>
>         writel(enable, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
>         for_each_cpu(cpu, mask) {
> @@ -115,7 +115,7 @@ static void plic_irq_unmask(struct irq_data *d)
>  {
>         struct cpumask amask;
>         unsigned int cpu;
> -       struct plic_priv *priv = irq_get_chip_data(d->irq);
> +       struct plic_priv *priv = irq_data_get_irq_chip_data(d);
>
>         cpumask_and(&amask, &priv->lmask, cpu_online_mask);
>         cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
> @@ -127,7 +127,7 @@ static void plic_irq_unmask(struct irq_data *d)
>
>  static void plic_irq_mask(struct irq_data *d)
>  {
> -       struct plic_priv *priv = irq_get_chip_data(d->irq);
> +       struct plic_priv *priv = irq_data_get_irq_chip_data(d);
>
>         plic_irq_toggle(&priv->lmask, d, 0);
>  }
> @@ -138,7 +138,7 @@ static int plic_set_affinity(struct irq_data *d,
>  {
>         unsigned int cpu;
>         struct cpumask amask;
> -       struct plic_priv *priv = irq_get_chip_data(d->irq);
> +       struct plic_priv *priv = irq_data_get_irq_chip_data(d);
>
>         cpumask_and(&amask, &priv->lmask, mask_val);
>
> --
> 2.28.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks for the fix.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
