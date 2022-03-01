Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 04:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dV3jpzzptWT80s++2T927a90fF/5HJSTU3D5LIm3U4=; b=ixR0D3A8gGCvt6
	L0DdsRJ/dnPmcoq64VH3hd/9ltA4HWTdh9EQGvTRnUEiRhSwVY4fUx/td2xKe4Uxoe3AWiiDhCmGX
	c3depm3rYrw+zRrJ6t3k3VFwmAlhlRJ49J/Fzl3oAFuaJD35xjBsgjDdDbcdBeWHD4vagsaYIYmk7
	kGz4j+CpaWbDIN8FQnn+7xsTscNbj53xucd1fruqnEK/whvPEkZohSnHnlmXuLKCB6TQBlXrA7kVj
	k9aRSfyL406rIg/Xwh07isA7O0JX/6dEaFslzcfR7j/27u6pHYyEwrw0Exq2Y4S17QDlbpchWi/Fk
	R/YteNx1rtPG+cHoRtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOtyB-00Eqy3-LW; Tue, 01 Mar 2022 04:18:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOty8-00EqxD-HE
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 04:18:38 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u1so18417471wrg.11
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 20:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9vX5ZcP9jBJ7C3TKE9APx102nB2zywnrMGmFn4Nlac0=;
 b=6/lPo6lsLIEcJWKlh8IH14JySCSehZGweDR90Vjd7o8haVIc7Pu3ZAqgV4c2IUMSUh
 51P9UrftNTCUQs42EmV905gouv+K4V7J8yAtERzbuuYlpYUQoFGKKb+cQ5wk0FG+VkMT
 KmMIU79dH2Cd7DGN/9MdMt2kC/XobD4/hyvvu+vLwfcTgmKJmnCLmZ/rga8tdfPq3Frc
 qO3BkRLN9/vXQhOhhfLdYT0/ECfSx8SJNp1fE3stNhOG5Zg3vbl/zGshRcEPltJudBkE
 +G7P5scaL2X5jMROQ+oIyYj9wQIVlsE+HMZIYIIsNtt1+m3Dk/7fCbhq35lm7lt/Nvhu
 cvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9vX5ZcP9jBJ7C3TKE9APx102nB2zywnrMGmFn4Nlac0=;
 b=QlMsp4yviwxgQoX3GC8zXIV8KLFWyBMq9+6APGy/YdRG+3IvgX/WRvhLLRK8G43ZhE
 4VuYs9IB80493YO0o+QEk4VhFpPYkAzw9HChU7ysytGLUnKGiCwTUhWqlUhVHiQZxrTx
 aKIcbLAc0KAfSQ2VwuXmauMhqJp0TY/3t7bFpxAZzi9YoKE15ctYl4jEcqZaOABKs5AJ
 gomeqA/yF/UlPASBFdCadSrZgInoNPUb0+vO54jzzBnxYitVmDZYClRZxYu3Eve8+ubz
 F+6a/ovUvryT5Nf26KsadqjyQLG5JinKYfOloXvnXRkhz2KgRPZNykyn0Huo8exBQz7P
 GQsg==
X-Gm-Message-State: AOAM53264IyiieatVGi/yo0ODv9VMPgJRMAAO5lW7uuT0RQMeEuVKFvg
 5UwDD4I10hva95F8vU0or0CbT7crU9xVOy9FXjSk0w==
X-Google-Smtp-Source: ABdhPJzBaY2HSLgH93hTzSLO5lvTbsUJvoQx6f61GezoyCiqORxNHmKQ1bl08l3vU0GKt7RbDsn2ag8QnIoUE3ry1dE=
X-Received: by 2002:adf:e406:0:b0:1ef:7cd9:e245 with SMTP id
 g6-20020adfe406000000b001ef7cd9e245mr12269843wrm.86.1646108312064; Mon, 28
 Feb 2022 20:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
 <20220301005142.3038702-3-Niklas.Cassel@wdc.com>
In-Reply-To: <20220301005142.3038702-3-Niklas.Cassel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Mar 2022 09:48:20 +0530
Message-ID: <CAAhSdy0c4Sn=44mwpghpj54jmdHPePXynWQqQDtGM4p0XLj19w@mail.gmail.com>
Subject: Re: [PATCH 2/2] irqchip/sifive-plic: Disable S-mode IRQs if running
 in M-mode
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_201836_599354_908D32F8 
X-CRM114-Status: GOOD (  26.64  )
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

On Tue, Mar 1, 2022 at 6:22 AM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
>
> From: Niklas Cassel <niklas.cassel@wdc.com>
>
> When detecting a hart context for a privilege mode different from the
> current running privilege mode, we simply skip to the next hart context
> register.
>
> This means that we never clear the S-mode enable bits when running in
> M-mode.
>
> On canaan k210, a bunch of S-mode interrupts are enabled by the bootrom.
> These S-mode specific interrupts should never trigger, since we never set
> the mie.SEIE bit in the parent interrupt controller (riscv-intc).
>
> However, we will be able to see the mip.SEIE bit set as pending.
>
> This doesn't seem like a good default when CONFIG_RISCV_M_MODE is set,
> since in that case we will never enter lower privilege mode (e.g. S-mode).
>
> Let's clear the S-mode enable bits when running the kernel in M-mode, such
> that we won't have a interrupt pending bit set, which we will never clear.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 211bcb10aa93..46caeb11a114 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -326,8 +326,19 @@ static int __init plic_init(struct device_node *node,
>                  * Skip contexts other than external interrupts for our
>                  * privilege level.
>                  */
> -               if (parent.args[0] != RV_IRQ_EXT)
> +               if (parent.args[0] != RV_IRQ_EXT) {
> +                       /* Disable S-mode enable bits if running in M-mode. */
> +                       if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
> +                               struct plic_handler tmp_handler = {};
> +
> +                               raw_spin_lock_init(&tmp_handler.enable_lock);

Creating a dummy plic_handler over here is a strange work-around.

Please define and use
"void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)"
over here and in the plic_toggle() function.

Regards,
Anup

> +                               tmp_handler.enable_base = priv->regs +
> +                                       ENABLE_BASE + i * ENABLE_PER_HART_CTX;
> +                               for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> +                                       plic_toggle(&tmp_handler, hwirq, 0);
> +                       }
>                         continue;
> +               }
>
>                 hartid = riscv_of_parent_hartid(parent.np);
>                 if (hartid < 0) {
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
