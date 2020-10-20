Return-Path: <SRS0=/4kn=D3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0617DC433E7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 08:40:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D7822240
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 08:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IFB+CmYZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="V77vpMhw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70D7822240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P1mB86oHWFJL7Dk8OFepnUmQnDuPaxuxrP7hT5llEgc=; b=IFB+CmYZzbfIICbTv1rSLy2Go
	KlnUGU1T7w0HmAIGFrJjQDVuO0KGLk7lhdvNyAWBQOQ+kkqLHWNcJ8RzBYuOLciWQE9tZtGxe4mtj
	aXYdWf6s+nPaPlO23W7QXf0QcKbfIEjKhKMQkfLVdFtyuL3B0wC5+6M3WgASsmO3WojDK7pJUtq0e
	i8mpmTrIWm+iaZlU7T4lvv0IjM9or4StOx3OKtqp2pbbmlkGw75s2mJl8GI3uVzFM6TObEzS6SEbO
	/t0yd9427lexXyccx1y9kws0qe0Mou9nocE5fu1vgEvTNzyFXhtL+ixM8K0kx/XaE2PJG8lRVZEFA
	K9TUW30wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUnBc-0000Kg-0R; Tue, 20 Oct 2020 08:40:04 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUnBZ-0000JW-5g
 for linux-riscv@lists.infradead.org; Tue, 20 Oct 2020 08:40:02 +0000
Received: by mail-wr1-x442.google.com with SMTP id x7so1084371wrl.3
 for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2020 01:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SUh/HgM+ua4NwVRYsXhIRglonIVZJrlor5QZYC9gpY4=;
 b=V77vpMhwIw+3HwH8CM2qAFK9RNuXrN0WlM5hHqoxwPYWYnGcsQZLYmrHXsTwC/b2tB
 sfBDlilU4lbEbEX0u1ypCLPJb9Y1vSL45IUIFn7+B2TZetoF/mN44NgeDciJrq+K7hmy
 08M4MO7L0ZPiEaqz/cJbv+Wm8KnaO9sXrd1VXJ2nPkQuUVCDqE2hBMRokScAToTyxKDC
 xFKQSkiQ4RzVCFK2qnolRi0rcSNYvrWhV4/zej+NrE7pHpX3sH/iZ2DbVx1K/trt4sCk
 oY+qr4BwzBVx7M0SpACF/9PglsL8rUUtZt8amrflzFponix3FEhAa9dWoqZ/+eobe535
 Qebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SUh/HgM+ua4NwVRYsXhIRglonIVZJrlor5QZYC9gpY4=;
 b=Epn7KfWGerWKDfXQ9Xtk4HSRLxLEb6Jx6aP9/GLb1BhTKlrs5bkRtLvZLrNcU1rpsz
 V+MyDZtyKwu/DUMSKHHyghdN2h4ORxfjE36ZFUqTULrvrA9hBWzRn6A2bRsgGVU0u1V8
 eULb/2U0ilTeiXokyN4BXVcYfQ7K8YAy/IYs4ufACwa33WZva1o7BlXp8F17HqEhUONa
 E5VJUImwDbmploIs95du/3AZ+hn3S1kXPTCghfF8sx8+1/HfcVPAZsPz+9Sy7Hfdcp3I
 D6PpL1F1Uh6+Pi5g8I6Y4qRWPCJp7ZANnm0J9lN3X8FF7dVjFauO5FxzB3DK4GYq49nx
 AXqA==
X-Gm-Message-State: AOAM531Zg/nAH7bE4cDdjYHAlpa4ZVK/dFUociqtFEV+JdfGy4+SzJvx
 jeWv/HtNiFwQp6VJZ3zrNUSccbIk6lSQT5w865DJzg==
X-Google-Smtp-Source: ABdhPJy0EL3UjDDNNuZAniLHen9U7rto6vYZuH3dFUFv/RgLwXnsa/7SzTYVK7flT9RIxnMIfo0tzicZLcvmsBWzegA=
X-Received: by 2002:adf:80cb:: with SMTP id 69mr2124137wrl.325.1603183199773; 
 Tue, 20 Oct 2020 01:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201020081532.2377-1-greentime.hu@sifive.com>
In-Reply-To: <20201020081532.2377-1-greentime.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Oct 2020 14:09:48 +0530
Message-ID: <CAAhSdy0kQBHvOirK1haPajEXS5X4e6KGE1kx2YwtoK2k+aVsLg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Fix broken irq_set_affinity()
 callback
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_044001_235154_B9FC7703 
X-CRM114-Status: GOOD (  18.55  )
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

On Tue, Oct 20, 2020 at 1:45 PM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> It will always enable the interrupt after calling plic_set_affinity()
> however it should set to it previous setting. Staying disabled or enabled.
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
>  drivers/irqchip/irq-sifive-plic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index eaa3e9fe54e9..4048657ece0a 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -151,7 +151,7 @@ static int plic_set_affinity(struct irq_data *d,
>                 return -EINVAL;
>
>         plic_irq_toggle(&priv->lmask, d, 0);
> -       plic_irq_toggle(cpumask_of(cpu), d, 1);
> +       plic_irq_toggle(cpumask_of(cpu), d, !irqd_irq_masked(d));
>
>         irq_data_update_effective_affinity(d, cpumask_of(cpu));
>
> --
> 2.28.0
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
