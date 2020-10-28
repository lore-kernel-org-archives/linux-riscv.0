Return-Path: <SRS0=H9LG=EE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8B9C4363A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 04:00:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3551620759
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 04:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szol6Vx+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="tKM+1r4U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3551620759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sjNjm0nKqBQiu8AASrXwQ0rkT09c2od/5JOCxIEGOTs=; b=szol6Vx+GM3ky0+VXYLu4p9PC
	aSb/PwlOc4tK56ScK2AhZj4/HBukdvm55XDEsMXfV1zkgoWlqcGdquoVENNaM/2bVhd+TmhCj4Yn+
	WmNg/CVd33vuzRZaHBM81MhOOtYwTz6LPaAV+9DzC+Y/+MRJpLqU9CbLHk8NqQbewISzTI/Zt1Fdt
	hkFm2isyUYjdEH4fmyc+CIdytrko+Rc/Rgppjb3k+PXwqupQDjRfimlMH10OAIhI6codTYXL4PoT5
	aj/+y6l5jyR1IZA+JOs7jruDswnlugW5c2Z1W2qmlafUMkFbY9fXXhP2mtV1sU7704v21H9OzkUDy
	A6E7h/f/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXz6x-0002lb-SA; Thu, 29 Oct 2020 04:00:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXz6v-0002lE-2f
 for linux-riscv@lists.infradead.org; Thu, 29 Oct 2020 04:00:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id k18so1151611wmj.5
 for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2020 21:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tpeooy8wpsToDwsOdwFpvl4B9ZetpSNBYYInBLrWE8U=;
 b=tKM+1r4Ut5sf5k2wb98FALa10lW2Kot9y9BiIkoPkHh5XdwtWcBN7uTiMgNMdPjXVT
 nP6AwjNmjjJb0OT9m2SHItlkHU6Ptuw2FVHBJqQkVgKWakxJRN165PlGxce8enYih7oq
 7nPtXyehHOHk1ldkJsDTImw/2stH9rjqgIE0G85QrFv5B/aZ0RoIrce15m2bY0L5rpmf
 0GufrCPFEyQKDhVlFdsJZV5R5/XLBDCUsTBmtp9qOR3z5v7dl3RuOqNBxVN7MZ+IKQXV
 VWrxinpNeMnX0pPGlkXnzFM1nLE1/3Y3w4sQE+vhqtepTpj7AlQnEUjcVtMcU2IBEgjj
 42tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tpeooy8wpsToDwsOdwFpvl4B9ZetpSNBYYInBLrWE8U=;
 b=J/annXUO/KMSfEmrHuOR4gWurZCf+u3b05nXMRIKyC6SxzFYSHFgK4OsX+khTN6Hw8
 daoGS2k8ED3O8BuDryThHKKw+EcwlA0aF7sa18x2egLiVvVGQovWrBuNQzhCVy/TjsKh
 50peTNQ09rfjDBsVOlLa3qRB1dmS0n9+O269S2cd3Q/Zq34fXsL1SQK1Agyt8MEL+HEa
 eimwWRaMHjuP79M3k7bVY9Du81elS1y6xaMo/uRPbK1HXyFZaLSI36Q76F9ueqaksUKu
 YjS6utIbL0J7MJppnKmMfuMY4SKl5fSV7awrqFhPJ3L3E67qFyo6t1BpnnDe2tYfYd5D
 jr4w==
X-Gm-Message-State: AOAM532eYcG4AGsBSwXmJZVv7n1hvtbnlOb2URHbSoV1le0p8A8TYJVx
 hxyHVFSKW0qDHebz7CXd6KUUuohvM63uoMuYsaofMw==
X-Google-Smtp-Source: ABdhPJzoT0s4+vop2ihCnVixx2wrnJC4maNK2V+TvBOApGJVpy9PWntQxCddR04yvblWGz9Rpwl1nCVxrdzEE2GmFoc=
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr2145549wml.134.1603944021772; 
 Wed, 28 Oct 2020 21:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201029023738.127472-1-greentime.hu@sifive.com>
In-Reply-To: <20201029023738.127472-1-greentime.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2020 21:39:15 +0530
Message-ID: <CAAhSdy2SWFNCj6D1FbjB_vp0f068Y0OpC9hr8V+-ohB-8bkT7w@mail.gmail.com>
Subject: Re: [RFC PATCH] irqchip/sifive-plic: Fix getting wrong chip_data when
 interrupt is hierarchy
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_000025_264293_67EE5BB6 
X-CRM114-Status: GOOD (  23.61  )
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
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 8:07 AM Greentime Hu <greentime.hu@sifive.com> wrote:
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

The PATCH which added multi-PLIC support was not tested
with hierarchical GPIO irqchip. I guess that's why we never saw
this issue previously. Thanks for investigating and fixing this.

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
