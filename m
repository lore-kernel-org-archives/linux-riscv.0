Return-Path: <SRS0=YRhX=PZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D62C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 18:07:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D8B660E8B
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 18:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D8B660E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1P90HsWixtgR6ignxB7ZYnAQBmxyiY+OHxERZlPKIc8=; b=mlbsGNXqo9nbtF
	S9c9ntEb3E7AaJTqHFx2LHFRAn3dY3Lwq/D2px8lQ4SQcR4VJcMVp6W9ukvHX6tAnCyy1RiWoy6eu
	wq6F2uauBgL0TeRm4G3KYUEsO/L7zs0jqzSp8vc8WRD16al5qccqa+a1toH0rtLuhUv5F4C3nN+Di
	PDbAMuhKkTI/WlWB/hjJJFmrD/1foIgDsZ9yxj2YqTofkyjDgIQfUKT3JznpQ5L3FbHOABgk5n2Lr
	mmrMI4tpRmh77g+DiYLt9TeJbhn/F7RF1aSDDnC/I8QRT1gsUn8jXqIIdSdT06igKx7S57oYfIz3C
	q9NfycSIGImgO3YkliKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjQ6H-00DU2Z-Ch; Sat, 06 Nov 2021 18:07:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjQ3h-00DTMP-Ok
 for linux-riscv@lists.infradead.org; Sat, 06 Nov 2021 18:04:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id bi35so25723858lfb.9
 for <linux-riscv@lists.infradead.org>; Sat, 06 Nov 2021 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f31WRtxRAaJ1ReHamccwuYw+KLj+c2LCAREJ/bMMV3c=;
 b=wVf6Mdvfbfy0yyKVtJHy/4iYqp5dIVOo2qoWCmcFQtgMiH/3/R11fcbR8fVyHf9ULK
 LFjkHWCwbH+UjVtZOB7ILZc7NSGCobw0HEnrp7pRXRpkoQYhSQ6bnNat6e5m1ZZUrBxM
 Fay/r9bYykJC/OpZGjwlX8XieYgZ2Jd2/8YDf8X3nT4r0Ht8HqQAGJwW+8AzrcqLtcNc
 7Efc7T9cO52SWaYRHpk9VoZKUVd+dTz2Xhx3XtLYKe9c9olJZd75ycov8kISJkaOy5Pd
 nEua5M0ov4f4KVG9S7P8N0LISg5CCt/YXD4ockptHfcDQaLjzPWS01MhpsPVHD01mD1A
 o6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f31WRtxRAaJ1ReHamccwuYw+KLj+c2LCAREJ/bMMV3c=;
 b=ZVjrP5jb9stJ1YIgaEIRjI0kBkxzS2Ruy3Ve6/9aRUb0wf6vBzSZr4rI/5+ETcQv/n
 xnKgVyg102/QtyujUdiPEzPI3VQe4xc+4719rCObLDCyL7F2D1Ak3yilE/vNXR5M6NEY
 AbjufX7dtHNo8H7MeU3sTmPW2mkdZ2KIx5oExLaF3gQv5pHPB548wVDTBBfDvYTV4BGS
 g6vMmca4Qgo4BIJMpw1CR9NMqoNQTBA3bX6wvqs7ACOiALCgsCjO7F0TXiiGrUtLYMhA
 huLWBpqSR8utn6OyVswUnEXuW8H/KFkvxhfjN8Fr2flZInuoXWb2p1j1aXIrPFtbEIWA
 7iaQ==
X-Gm-Message-State: AOAM53110q59LwTJxuoMF+LQUgLo7KfNsZTVfMen09dRl1SwaxUnqH71
 wWDGy4OO7eTEN6+VLjKwNBF+uIj3acUsgyKPVk4Uj8SJA/s=
X-Google-Smtp-Source: ABdhPJwj0bSJpCKsFAQNW7l21NJ6PZn1RoeYyJeAZJHt0df9t5osbpRnqm83k2dhkDYTZTvXrYYXbxl/6UtX2NUWa/k=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr36037840wrs.249.1636206336953; 
 Sat, 06 Nov 2021 06:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211105094748.3894453-1-guoren@kernel.org>
In-Reply-To: <20211105094748.3894453-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 6 Nov 2021 19:15:25 +0530
Message-ID: <CAAhSdy1vyCQdv_gNaNSzU79PC4giCAig6hzgD9JXSXs6+gfFPA@mail.gmail.com>
Subject: Re: [PATCH V7] irqchip/sifive-plic: Fixup EOI failed when masked
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_110453_910310_5FD4A266 
X-CRM114-Status: GOOD (  27.40  )
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

On Fri, Nov 5, 2021 at 3:18 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
> only the first interrupt could be handled, and continue irq is blocked by
> hw. Because the riscv plic couldn't complete masked irq source which has
> been disabled in enable register. The bug was firstly reported in [1].
>
> Here is the description of Interrupt Completion in PLIC spec [2]:
>
> The PLIC signals it has completed executing an interrupt handler by
> writing the interrupt ID it received from the claim to the claim/complete
> register. The PLIC does not check whether the completion ID is the same
> as the last claim ID for that target. If the completion ID does not match
> an interrupt source that is currently enabled for the target, the
>                          ^^ ^^^^^^^^^ ^^^^^^^
> completion is silently ignored.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
> [2] https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc
>
> Fixes: bb0fed1c60cc ("irqchip/sifive-plic: Switch to fasteoi flow")
> Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
> Tested-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> Cc: stable@vger.kernel.org
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Nikita Shubin <nikita.shubin@maquefel.me>
> Cc: incent Pelletier <plr.vincent@gmail.com>
>
> ---
>
> Changes since V7:
>  - Add Fixes tag
>  - Add Tested-by
>  - Add Cc stable
>
> Changes since V6:
>  - Propagate to plic_irq_eoi for all riscv,plic by Nikita Shubin
>  - Remove thead related codes
>
> Changes since V5:
>  - Move back to mask/unmask
>  - Fixup the problem in eoi callback
>  - Remove allwinner,sun20i-d1 IRQCHIP_DECLARE
>  - Rewrite comment log
>
> Changes since V4:
>  - Update comment by Anup
>
> Changes since V3:
>  - Rename "c9xx" to "c900"
>  - Add sifive_plic_chip and thead_plic_chip for difference
>
> Changes since V2:
>  - Add a separate compatible string "thead,c9xx-plic"
>  - set irq_mask/unmask of "plic_chip" to NULL and point
>    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
>  - Add a detailed comment block in plic_init() about the
>    differences in Claim/Completion process of RISC-V PLIC and C9xx
>    PLIC.
> ---
>  drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index cf74cfa82045..259065d271ef 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -163,7 +163,13 @@ static void plic_irq_eoi(struct irq_data *d)
>  {
>         struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
>
> -       writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +       if (irqd_irq_masked(d)) {
> +               plic_irq_unmask(d);
> +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +               plic_irq_mask(d);
> +       } else {
> +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +       }
>  }
>
>  static struct irq_chip plic_chip = {
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
