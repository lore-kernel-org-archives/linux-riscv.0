Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9E0C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 13:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDXebzRSz9U/aHNwJQ7ME8QRch+bMyFZ7jvRNCwmPsg=; b=TfANzcInAkQ3Uj
	Si7iIYdOnnF2rkbJYe/Tkuz9CMIjaop/GOyJ6Q6ZPRDIE0qGp1QzTPpyNU8S3iRIuadSM6APs2Ffd
	7p93HXo+B/q04lLoMG7W5qavBFnAZ94c5qWZUjAGSvwESmcN7M+yhDh2DZZP+VczaymvrrBl56X0Y
	Or4khiM+ehptZwbIPULqdUMlsJIevkdQ7OubaIRrdSkd7uT5SMefqxxACd4kH0zBre4rHSkKQIU56
	iyJAIyLpanFl3plq8hROZwc8iWiHKS8ZVBF8R54a8owZPhdM34jejWUaYZoXvcxyPmCZKZ0Xgexet
	+rMo9ShVWj5X+y3pvKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzjx-0000000AG1Q-2wge;
	Wed, 03 Jul 2024 13:09:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzjv-0000000AG1E-2eXg;
	Wed, 03 Jul 2024 13:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v8pKda6v4grLYFqGS8IG6AZ+2OQhTuE7Uf++csqhVjE=; b=eoHqInORZVLDmjJc4lRCS2sp90
	ipoixNdrHCZc5MA2Ew7jgAWPlAS4sjgbk2vTIlOcaxIiv/KsVIlNIjGJufeuwm8Ct2xENfKVycQO8
	j3eqOjqpQda1e/VJxi+MDN3KaQVAuywp8JMbiqwLkjGml7mzExHTvJVH5ec8t+R1td75lB71FHZHq
	8HsQZpaalVHADiPjgSqeP/RbtflP149byLZAc7chVKZPZa8izCsYwC2PfbJNTqfFkUexDcepJfF9K
	KgLc4DtehzMEZThW6bUtjMWRSM9kn/7tpmjIdjdkbDTL/bYhTwrUBG0NpT33WRfMx3Ky/Un090Ctd
	Lx41vrxQ==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzjr-00000009zY1-1NG4;
	Wed, 03 Jul 2024 13:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720012176; x=1751548176;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W8KnSELxoOeLFO4Bkg8ypBzvhOg9ofBU1heW/xaRe4k=;
  b=G8G35Ts8eHgr6d8NcUmVn72JmV1lBtXp2sDeBmOpVoAAIkng8DlIcX6K
   89qE8k0dG4LD0DgLKcBAfHhUx7L0Ji5SvBI0iV2z10aynNv4RcOn6wLrn
   EsjPteBawGq5qnNH7HhtFSg8gRdcxeObm2LhY2ou/lfqGFn1tXwBsOu9g
   rj/+0Xyx+b1PAtGp6zFG+ZKPzLTOUDNtRcHadlw9L+OoH4+tyoXhpp4LR
   jB8UieSdhQrtv9uCjqh0LZ4b9RBz9GGMgzahVlNGFkmk6YKvDXzZhfU+S
   lhVAOwDW14e48oeM1i0Pnz41XZBLXS48bM6raNrPdVurdOV/X9e3oH1yh
   A==;
X-CSE-ConnectionGUID: EqW5S7eWRE2aTexdHZiS+A==
X-CSE-MsgGUID: NasQoXC7S5Kaxo5UL3Vsag==
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="28777735"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2024 06:09:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jul 2024 06:09:03 -0700
Received: from [10.180.116.202] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Jul 2024 06:08:46 -0700
Message-ID: <a8cc31a9-d58f-4a4e-98fb-a7ba47bc744e@microchip.com>
Date: Wed, 3 Jul 2024 15:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] irqchip/atmel-aic: convert to
 of_property_for_each_u32_new()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Miguel Ojeda
	<ojeda@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>,
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan
 Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Richard
 Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Damien Le Moal <dlemoal@kernel.org>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <llvm@lists.linux.dev>,
	<linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
	<linux-sound@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-11-42c1fc0b82aa@bootlin.com>
Content-Language: en-US, fr-FR
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240703-of_property_for_each_u32-v1-11-42c1fc0b82aa@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_140936_358755_250B5B40 
X-CRM114-Status: GOOD (  16.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03/07/2024 at 12:36, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/irqchip/irq-atmel-aic-common.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
> index 072bd227b6c6..543ea249df53 100644
> --- a/drivers/irqchip/irq-atmel-aic-common.c
> +++ b/drivers/irqchip/irq-atmel-aic-common.c
> @@ -111,8 +111,6 @@ static void __init aic_common_ext_irq_of_init(struct irq_domain *domain)
>          struct device_node *node = irq_domain_get_of_node(domain);
>          struct irq_chip_generic *gc;
>          struct aic_chip_data *aic;
> -       struct property *prop;
> -       const __be32 *p;
>          u32 hwirq;
> 
>          gc = irq_get_domain_generic_chip(domain, 0);
> @@ -120,7 +118,7 @@ static void __init aic_common_ext_irq_of_init(struct irq_domain *domain)
>          aic = gc->private;
>          aic->ext_irqs |= 1;
> 
> -       of_property_for_each_u32(node, "atmel,external-irqs", prop, p, hwirq) {
> +       of_property_for_each_u32_new(node, "atmel,external-irqs", hwirq) {
>                  gc = irq_get_domain_generic_chip(domain, hwirq);
>                  if (!gc) {
>                          pr_warn("AIC: external irq %d >= %d skip it\n",
> 
> --
> 2.34.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
