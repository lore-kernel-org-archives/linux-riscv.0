Return-Path: <SRS0=BUIi=DT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0DCC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 17:03:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00B22072D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 17:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zSpMzslG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="REQjzzKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A00B22072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nzj+oMsWpfG5C5Wfhyec+4E2TjKWF/NBJWJ78+HfO2M=; b=zSpMzslGxqQf9zJUkN0JhQjf+
	6IMUVdH7uPnYSqCOyWluJL+qDJBqkV0YPDBjPobXsOJKXBYFePz0OaGDNZPwQ9BzQizcgeKCVIHB3
	gtgo0ZJC5LogaFTbfxhbxzLy4rxI1ul80g6ah3HE7BTz+xbxPzklIgTflcYRgBERSB26QkOYCLxwP
	gdgkQgKsYVZZfnkm4S+8iBS2A18lZgpml9jLJJGEhw0ILbdGYkiNWDJmT/5pHBe1+iwSuLKZpOsnW
	ArOmIKVXBF+6ktusxI/s2tmVp1WLdQ9ExGxa8vhWpGK25zXIMp5pcJvqucYLq5olauEtUvIbyi0jH
	GdA0XnRhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS1Dr-0002UT-GT; Mon, 12 Oct 2020 17:02:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS1Dp-0002Tg-7R
 for linux-riscv@lists.infradead.org; Mon, 12 Oct 2020 17:02:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id d81so17748310wmc.1
 for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2020 10:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gCocwBk0zsLiLfxj4V7WicRiwG5RXcRHYmfk3RiD8UM=;
 b=REQjzzKGbFJr09J7c0ahMc56ZLqOPhPfVl1oT/bpeXleHnEO4aSqBrhI8dCH+bgxwH
 KWw8kayNxvvS0wSVrrF4Ma+eM2TiQbgl8pJ7jghVSLlVkRiI1+rAw+6z3XM3KhQsypB/
 YtoJb4HsnUxUdb5C/KMbjEEAQPqNqlq2ZBg7lpVje7rUuUOLSrB0F1Bf9iRrLIF+dpv8
 kKykuChTXtlWV6JG2nTS4RXnrpo/85JJ2lcMFRiRyjMN80MJdNV0eGVnoOE0MXoFLeCJ
 GCUGwwOnWQ0VSZT2XSv6c+Sgw+SFbYzN1pC5AW2mgYRjJceAmaFsWFCWVNGPg0r6lQq8
 utkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gCocwBk0zsLiLfxj4V7WicRiwG5RXcRHYmfk3RiD8UM=;
 b=sah/os0Sv/pyd4gbhwuLMY1Jx8HPgMyMBzNDxpo/DkQOVyQDVDZ2ScKqQIphmih95F
 AyKBgmRI4qhNqUpool8P9bGDT0EH7l53etAg7zJtGe5ZpIpuCwdKyisj+HW0C3auAwDP
 sVzjIghCYbnu3Kx/HbV1Q6hWj6m2B65/T5CfbIsScXpBQDHqOqlZ5gSbWeQCgXDk7OMl
 iF4vabK+xVjGZwSNeoTGLMNB01Hhnmddxb1VUmyhL9gQJEE1uqaWKqtGpsmCby3lQ+FT
 Rg90796jZUPD48F/RrNcj9c/iELe8Wx5kXTsTGvx4BJS5FfRT8q7/qyDsIs760eRuIzr
 KItA==
X-Gm-Message-State: AOAM533HBVW9258+T1wUFIoUdh52ZTmPs4HNR8BMMmqB+/5SJKMW2Dmp
 E/t8bHN/iPkhj1SdcIg35MxJ1BJ/XgkEyhHePPY9uA==
X-Google-Smtp-Source: ABdhPJzou3eVrc5U7Gdikdm3S33pUaKtPuc3l97KtGAW6vrk8naWp/dq3nd6Ycudnc0FS+uVbMWphTDZ7ttwrYLIdX4=
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr7352774wmh.185.1602522170285; 
 Mon, 12 Oct 2020 10:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201012135724.110579-1-greentime.hu@sifive.com>
In-Reply-To: <20201012135724.110579-1-greentime.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Oct 2020 22:32:38 +0530
Message-ID: <CAAhSdy0Jj3+gsto8oj76GkDnm1WYiDFCntM=VuxKtoABGYTK5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Enable or disable interrupt
 based on its previous setting
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_130253_397046_0C0C9202 
X-CRM114-Status: GOOD (  21.69  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 12, 2020 at 7:27 PM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> It will always enable the interrupt after calling plic_set_affinity()
> however it should set to its previous setting. Staying disabled or enabled.
>
> This patch can also fix this pwm hang issue in Unleashed board.
>
> [  919.015783] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  919.020922] rcu:     0-...0: (0 ticks this GP)
> idle=7d2/1/0x4000000000000002 softirq=1424/1424 fqs=105807
> [  919.030295]  (detected by 1, t=225825 jiffies, g=1561, q=3496)
> [  919.036109] Task dump for CPU 0:
> [  919.039321] kworker/0:1     R  running task        0    30      2 0x00000008
> [  919.046359] Workqueue: events set_brightness_delayed
> [  919.051302] Call Trace:
> [  919.053738] [<ffffffe000930d92>] __schedule+0x194/0x4de
> [  982.035783] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  982.040923] rcu:     0-...0: (0 ticks this GP)
> idle=7d2/1/0x4000000000000002 softirq=1424/1424 fqs=113325
> [  982.050294]  (detected by 1, t=241580 jiffies, g=1561, q=3509)
> [  982.056108] Task dump for CPU 0:
> [  982.059321] kworker/0:1     R  running task        0    30      2 0x00000008
> [  982.066359] Workqueue: events set_brightness_delayed
> [  982.071302] Call Trace:
> [  982.073739] [<ffffffe000930d92>] __schedule+0x194/0x4de
> [..]
>
> Fixes: bb0fed1c60cc ("irqchip/sifive-plic: Switch to fasteoi flow")
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index eaa3e9fe54e9..4cc8a2657a6d 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -137,6 +137,7 @@ static int plic_set_affinity(struct irq_data *d,
>                              const struct cpumask *mask_val, bool force)
>  {
>         unsigned int cpu;
> +       bool enable;
>         struct cpumask amask;
>         struct plic_priv *priv = irq_get_chip_data(d->irq);
>
> @@ -150,8 +151,10 @@ static int plic_set_affinity(struct irq_data *d,
>         if (cpu >= nr_cpu_ids)
>                 return -EINVAL;
>
> +       enable = !irqd_irq_disabled(d);
>         plic_irq_toggle(&priv->lmask, d, 0);
> -       plic_irq_toggle(cpumask_of(cpu), d, 1);
> +       /* Keep its original setting. */
> +       plic_irq_toggle(cpumask_of(cpu), d, enable);
>
>         irq_data_update_effective_affinity(d, cpumask_of(cpu));
>
> --
> 2.28.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Good catch. Your fix looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
