Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35B3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 05:04:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4076160E96
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 05:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4076160E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQ15NKWX/Emu++cB2WNTxMrfajAcoSvA955b/GLuPHk=; b=3hc0A/H8TJnxEc
	XMemiumlTMlZgq6fL41WwpIFxMC44AiR7Wlk2cfHrDgax1oTSdDxiexEDXQA2Y54YsJGILOI8Silb
	VzRpV7ElZ2aJWFG6hrKloZWXStS/u+i4ppF+S3FHAW2OwoPX2JaBAcd5mxt4LQYus5Dst+Ftrye1E
	rzFsk9hvMgSimI7JcBu7oMp+RIpbvIv4jlLX7hDGMjsVOWru6+pJgpbot7n28DOshQYZSSNe0gpgu
	lixOgCi1nuo16b+ljZ1FBY2aF2PVo+zVSiVhnOsfvo+fgQlJN0inJRSYHwQbtc9t1MwrLDq5eQ5LL
	kyqpckjI0/HS9KRd3SsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWRE-00Erjf-2Y; Wed, 13 Oct 2021 05:04:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maWRB-00EriQ-7C
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 05:04:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e12so3996259wra.4
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 22:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tBWAKhyjvL0DEIOxax/tiNNCYCLY9aiBB6SJS4PnDRo=;
 b=ag4QfPXXGxacJzvKw8Y2T4uuWtNUx5P6CNkb7xbBaNJg8/RjPmPhanvsVdao3X2p5s
 cGwKpdkVDNefBg7vhGdk8uCYuHO5IIoiCdTcKUSVGAqBjqv+KOEJi5AiVdEV0MYMZW5I
 dQB3C/fG+DOmhaVZtwx75UDgvulS5SL+Br88dbYHINh2HXxfQSIrSiPfjDdpaPAXLydr
 sFy0UKGImkVrv6I828/w+MLrX7unXr/I3YX1C4e/IC9RVfyMIVkkzCffkZBlAZ+8b00D
 2PnGmGq8mvb5XezBBEcc34920t4Wmy9YL9ILed3T5Rl340/x7BrUEZ3Bpc46GklMY/Zl
 UXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBWAKhyjvL0DEIOxax/tiNNCYCLY9aiBB6SJS4PnDRo=;
 b=x+K60LJ4eOuktaW2RWi5AR6iuZqm9WxHNYbhVItgoFKq8rm0J10eELL+IS6ftf/n3V
 pxLrwgO9L6ZpZxdqLsmZcnmD2MRZve1FYrekvgvkctJqmN4i/LN1uC56wfxw8YffGbim
 pT9FGYeBFqEHTvpBbzMmlvO7Q+Rs9mNX3E/K0s7RN9+Izcfhld1olPoHQ1NO/5emp4wr
 YFh6wfofU4fwWRHN25N13C9qebCkAplxjnzHVp3SxysANUzHjFonTQrzjK8nn7YwLzxg
 kItmw0jAIC+G3ITaWorNn7xnL7FP/wbCoJDkkvXXQXQJ4tv9P9pTq810PpjPRSWpC+9D
 QWtQ==
X-Gm-Message-State: AOAM532/m3gDF8jLkXF/o2p6RgHDFYqJJO7bSzAVPjde40zBUwihl6Oi
 fCM8GmOnkYKxq4SvEre3a0HWmzbUuQET7rvT9+t9NgxuweKjbA==
X-Google-Smtp-Source: ABdhPJzoICAIfHQG/AMcUnPkuklmPbpFHoKeQzDPmSw+5K/ti0ZQraiP5gYUezuN6UrX/zQfcdgw56g4g3vTI5xmD9I=
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr10372804wmj.176.1634101459118; 
 Tue, 12 Oct 2021 22:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
 <20211013012149.2834212-2-guoren@kernel.org>
In-Reply-To: <20211013012149.2834212-2-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Oct 2021 10:34:07 +0530
Message-ID: <CAAhSdy3B9AtbeBrNoQJOBkmAcOR56s1WExGNPMXsSsF+38y8DA@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] irqchip/sifive-plic: Add thead,c900-plic support
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_220421_336086_A1659229 
X-CRM114-Status: GOOD (  30.49  )
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

On Wed, Oct 13, 2021 at 6:52 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> thead,c900-plic would mask IRQ with readl(claim), so it needn't
> mask/unmask which needed in RISC-V PLIC.
>
> When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED path, unnecessary mask
> operation would cause a blocking irq bug in thead,c900-plic. Because
> when IRQ is disabled in c900, writel(hwirq, claim) would be invalid.

This is a totally incorrect description.

Instead of this, the commit description should say the following:

1) The irq_mask/unmask() is used by handle_fasteoi_irq() is mostly
for ONESHOT irqs and there is no limitation in the RISC-V PLIC driver
due to use of irq_mask/unmask() callbacks. In fact, a lot of irqchip
drivers using handle_fasteoi_irq() also implement irq_mask/unmask().

2) The C9xx PLIC does not comply with the interrupt claim/completion
process defined by the RISC-V PLIC specification because C9xx PLIC
will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim) and
the IRQ will be unmasked upon completion by PLIC driver (i.e. writel(claim).
This behaviour breaks the handling of IRQS_ONESHOT by the generic
handle_fasteoi_irq() used in the PLIC driver.

3) This patch adds an errata fix for IRQS_ONESHOT handling on
C9xx PLIC by using irq_enable/disable() callbacks instead of
irq_mask/unmask().

In general, non-compliance of the C9xx PLIC should be treated as
an errata so please don't project it as a feature.

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Atish Patra <atish.patra@wdc.com>
>
> ---
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
>  drivers/irqchip/irq-sifive-plic.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index cf74cfa82045..5b806d823df7 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -166,7 +166,7 @@ static void plic_irq_eoi(struct irq_data *d)
>         writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
>  }
>
> -static struct irq_chip plic_chip = {
> +static struct irq_chip sifive_plic_chip = {
>         .name           = "SiFive PLIC",
>         .irq_mask       = plic_irq_mask,
>         .irq_unmask     = plic_irq_unmask,
> @@ -176,12 +176,24 @@ static struct irq_chip plic_chip = {
>  #endif
>  };
>

Please add a detailed comment block as described by point#2
above.

> +static struct irq_chip thead_plic_chip = {
> +       .name           = "T-Head PLIC",
> +       .irq_disable    = plic_irq_mask,
> +       .irq_enable     = plic_irq_unmask,
> +       .irq_eoi        = plic_irq_eoi,
> +#ifdef CONFIG_SMP
> +       .irq_set_affinity = plic_set_affinity,
> +#endif
> +};
> +
> +static struct irq_chip *def_plic_chip = &sifive_plic_chip;
> +
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>                               irq_hw_number_t hwirq)
>  {
>         struct plic_priv *priv = d->host_data;
>
> -       irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> +       irq_domain_set_info(d, irq, hwirq, def_plic_chip, d->host_data,
>                             handle_fasteoi_irq, NULL, NULL);
>         irq_set_noprobe(irq);
>         irq_set_affinity(irq, &priv->lmask);
> @@ -390,5 +402,14 @@ static int __init plic_init(struct device_node *node,
>         return error;
>  }
>
> +static int __init thead_c900_plic_init(struct device_node *node,
> +               struct device_node *parent)
> +{
> +       def_plic_chip = &thead_plic_chip;
> +
> +       return plic_init(node, parent);
> +}
> +
>  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
>  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
> +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
> --
> 2.25.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
