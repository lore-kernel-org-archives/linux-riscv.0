Return-Path: <SRS0=GKXU=DU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98630C433E7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2020 01:32:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA2020870
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2020 01:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OexczJtj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="pZEbmEr9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EA2020870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k1qi6LxxShy6xuaGeR+2UiE0Buy3IpzKoGeZomFcb7k=; b=OexczJtj6nqMtkrVYKvOCicyH
	laB8qwCiLHWqp84HVUNRzDG5fqCBHapsOEGUhjCkRxWU0jnTojW6QP93JW/hmTH2cgT+otQSgToKt
	JxLeXfjUiWC9LmzE3qb028nA3QNQwa3WyZu9MCWAaQFqGYQVnbDwmEQTyjVN1Wl52hC+qbGvp5rM0
	LcIUQoBA7s1BL9l+S5daZXTH/INOvUB+xbD0Y55gKxwcttRCog/bII/mtY2F+Q2SahLahllGDLjPz
	cnRBggGHDwAiphEVlh47Wjquv6TuLp++UBTGC4a01RYEzM1VSXO2b0+RC2zvXJv973ubCYaiFvOAo
	1LSZ7Hp5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS9AT-0006eV-TP; Tue, 13 Oct 2020 01:31:57 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS9AR-0006e9-F9
 for linux-riscv@lists.infradead.org; Tue, 13 Oct 2020 01:31:56 +0000
Received: by mail-il1-x141.google.com with SMTP id t18so18348350ilo.12
 for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2020 18:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+6Ztw7jbOmA581hZd3dtxpZftTR2fcd6tnRuJa6WYo=;
 b=pZEbmEr9bQcIZ2o9YE29d8a/NvK5F3YeHSshot4Y7g5dNDbfoCqvMnHBRCi9UJRqeN
 Thb0/GdQ193YqnvZLBd8jn1YlAo2iKikyVMjFSVsX1wvo3IJYiFCal27S3QjDa2hgnT6
 nrLwZmhigVmhALy8FJnOcQzyRsNYOXPA+QPtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+6Ztw7jbOmA581hZd3dtxpZftTR2fcd6tnRuJa6WYo=;
 b=NK3LPInaGPKVYzmI3tv3t0S15ZSWuDFQPecnmrcs0/KEW3NBDMdn63q52lB6gnQda9
 aFwm6fRZHqaq1jFFyzC6ed389UzOntLlljGJ56dT/pKcOAZDHzFWMc1Y5nrclWeddJQX
 hb4JlGs4ccVdE5ReO1iApVpCEvkkWL+JcwnGoTJKsAKVIZT0PJaVyid0/mhkx7qPogFG
 fzc1mlEK1RrN5t8FVpxAP+yrui1Uak1D8SBYflo+bdeS92ryDkO2yJC7/8+OG8dHpybP
 VQ7HLyCyYs3T+++A47Z3N4xnJAcHX6e/WYDS6Vsr8w/khZuUndKVneQehj2eSTlOQ1yw
 9xtQ==
X-Gm-Message-State: AOAM5315aI3JUb6k+dhiAm5BnXLyw9hQ4sYCVQMpZknJa/a2niPn1qM2
 XbTSIweV1VXD22+oUEWBm7UBHdwruoSZ4YlhwD/a
X-Google-Smtp-Source: ABdhPJyrzsYD5zMnBZ/1QiHJ4BOApq7CZqI4Dso1cg5+duue25ZASsBHhP1llxgj03dQFqrMSTwYL8hP5liEYyS/wtc=
X-Received: by 2002:a92:91db:: with SMTP id e88mr1178834ill.126.1602552713836; 
 Mon, 12 Oct 2020 18:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201012135724.110579-1-greentime.hu@sifive.com>
In-Reply-To: <20201012135724.110579-1-greentime.hu@sifive.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 12 Oct 2020 18:31:43 -0700
Message-ID: <CAOnJCULYeoBGOBwbBo3izZsQpkgFvPotaH+FJ+5M2SWG=m=ypA@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Enable or disable interrupt
 based on its previous setting
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_213155_595630_0AFB3F5E 
X-CRM114-Status: GOOD (  21.09  )
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

On Mon, Oct 12, 2020 at 6:57 AM Greentime Hu <greentime.hu@sifive.com> wrote:
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

LGTM.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
