Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BFBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvnDGPPNx3rwqUgxhJLWQZbE6+HGyOLP7R9vHjy2XYo=; b=Pi4egQ3qmgx6O5
	Sn0voDxCwMhbG4gPJtEkchPkebYmD1Pg6KvsVKN1nZOer4DOyoUJ/+6DFt8asefRHK5ttD3C1rbNI
	JH8547PuKTaz03HgqOXyqF83BIjWfwuRJ64wvNkTPGbZPCz5OODjWAvQRTrndyh8IqYZWFIBGr6+D
	hINDqJYqyqSjuBGW54wylKK+YDezoNFK+OjfvLaePgUixWGWVkROf8Z1rQ3AQNiEioAEd2/oEjA3f
	7HGhJtyhR7RdIt904d9aVkUXl2f+mRR3cX0O8dS9EXRb/fJeMJwsPWujdpF3307cHWQRiJV5SpL6K
	RLb7hhA58/LxEpN/ubPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP6Ij-00042F-4V; Tue, 01 Mar 2022 17:28:41 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP6If-000419-B6
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 17:28:38 +0000
Received: by mail-lj1-x22b.google.com with SMTP id t14so22766607ljh.8
 for <linux-riscv@lists.infradead.org>; Tue, 01 Mar 2022 09:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6rJKFzG0mA/Y/OMzDnee9M1V5F+iSCSN1j1zlOuy/Q=;
 b=a1SSlv9Yxpi/Z4kJXvV+ATchd57NGzPtTPlC9Jx4BKUckh/3bCDih+Ub99F9tIAMcH
 pGQRFtG5NFO6U5sx6a3M/BRSyjJEogbEWKIkORBIVCe91kJjFHe7872YIaNkL+fJ3yUT
 D3n4hvPz52lOZsMih7qV5ug9YKsvcItPvNPbHIZfzN9SL35cs7bWukz+7gQk3wH/lPLv
 /ht2kyL6QU/JLF8mYERMFVEq0Sow2/RYv2PbL3jUt/bu2NBusrq1Fgild8+/uGxmjaDS
 yCkUYraW1QiqtQA47sKE63flOpY2D+DXHhn8T4HZ7k9JqELU35v9wVXUYXVEhgBmqFyY
 /WDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6rJKFzG0mA/Y/OMzDnee9M1V5F+iSCSN1j1zlOuy/Q=;
 b=YLncPq9EIIpn5VEATqJkfjdpH4s1p8BbKKufjDbYKhEddSj07WAUFVni2shF1/8jua
 qmNR09ukPFWtA+aMWfxaggvScm9IWujAf+SqJ1wHV4wghzblx/Z9iuOSMEriHi1hFmPQ
 k0Eume2P+saRnDrNM4B1Yu9K3R06JBHXd9QiH1dOxJEhUBgPqO2ylhIDKqTqu1wLc62b
 a9OU6HfsBtipuFHswOQqB5ZF/b8VZP5pgN65hmuExtej5kqDBNbVFjKcJiiWjsILfUUj
 CEGZwQee09YA6GOCCqLNd8skmx3FLSQTV9ZiujE2TxXnPsPJ41WohW5Y4Eqa5/lhN17W
 lm+w==
X-Gm-Message-State: AOAM532OB1NJLD2B8Awp7iTYGhlCtr4zOt41ovRSh5w9EFN6FYYOG56n
 ACCFUCaEhc2bYgHR6ElvfznH9jXz83TyVnGCErJkLA==
X-Google-Smtp-Source: ABdhPJwsH5yOGUhQRtUmQNJOVYLgPmB3lFN+8/Ewnii1O6iE1Dqt1fT79u9z4AxQGt/yj5QzA5zhG96wvlrbEOXi0S0=
X-Received: by 2002:a2e:9783:0:b0:244:dd26:c0f9 with SMTP id
 y3-20020a2e9783000000b00244dd26c0f9mr17782729lji.461.1646155715308; Tue, 01
 Mar 2022 09:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20220301171317.3109161-1-Niklas.Cassel@wdc.com>
 <20220301171317.3109161-2-Niklas.Cassel@wdc.com>
In-Reply-To: <20220301171317.3109161-2-Niklas.Cassel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Mar 2022 22:58:23 +0530
Message-ID: <CAAhSdy1r7-iWuKN2F50RjL9uBtFy=zv2d0_OJVqiLJwLQOK-pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_092837_477699_FC0F13E7 
X-CRM114-Status: GOOD (  24.40  )
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

On Tue, Mar 1, 2022 at 10:43 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
>
> From: Niklas Cassel <niklas.cassel@wdc.com>
>
> The PLIC supports a fixed number of contexts (15872).
> Each context has fixed register offsets in PLIC.
>
> The number of contexts that we need to initialize depends on the privilege
> modes supported by each hart. Therefore, this mapping between PLIC context
> registers to hart privilege modes is platform specific, and is currently
> supplied via device tree.
>
> For example, canaan,k210 has the following mapping:
> Context0: hart0 M-mode
> Context1: hart0 S-mode
> Context2: hart1 M-mode
> Context3: hart1 S-mode
>
> While sifive,fu540 has the following mapping:
> Context0: hart0 M-mode
> Context1: hart1 M-mode
> Context2: hart1 S-mode
>
> Because the number of contexts per hart is not fixed, the names
> ENABLE_PER_HART and CONTEXT_PER_HART for the register offsets are quite
> confusing and might mislead the reader to think that these are fixed
> register offsets per hart.
>
> Rename the offsets to more clearly highlight that these are per PLIC
> context and not per hart.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/irqchip/irq-sifive-plic.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 09cc98266d30..fc9da94eb816 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -44,8 +44,8 @@
>   * Each hart context has a vector of interrupt enable bits associated with it.
>   * There's one bit for each interrupt source.
>   */
> -#define ENABLE_BASE                    0x2000
> -#define     ENABLE_PER_HART            0x80
> +#define CONTEXT_ENABLE_BASE            0x2000
> +#define     CONTEXT_ENABLE_SIZE                0x80
>
>  /*
>   * Each hart context has a set of control registers associated with it.  Right
> @@ -53,7 +53,7 @@
>   * take an interrupt, and a register to claim interrupts.
>   */
>  #define CONTEXT_BASE                   0x200000
> -#define     CONTEXT_PER_HART           0x1000
> +#define     CONTEXT_SIZE               0x1000
>  #define     CONTEXT_THRESHOLD          0x00
>  #define     CONTEXT_CLAIM              0x04
>
> @@ -361,11 +361,11 @@ static int __init plic_init(struct device_node *node,
>
>                 cpumask_set_cpu(cpu, &priv->lmask);
>                 handler->present = true;
> -               handler->hart_base =
> -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> +               handler->hart_base = priv->regs + CONTEXT_BASE +
> +                       i * CONTEXT_SIZE;
>                 raw_spin_lock_init(&handler->enable_lock);
> -               handler->enable_base =
> -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> +               handler->enable_base = priv->regs + CONTEXT_ENABLE_BASE +
> +                       i * CONTEXT_ENABLE_SIZE;
>                 handler->priv = priv;
>  done:
>                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> --
> 2.35.1
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
