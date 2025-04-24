Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6DBC369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwkqV3W8yneENEL54TFFMqgymOoKeiIxjv4qyZm99Ew=; b=Bt935o0uwxqqHj
	NxZsAQT8BazsNDXzVqiyMYIJKkTTafr0OWdBPcNbVcGxQZtes4t2dr/+862xcfj0o8V6wZqGAb1pO
	He3Q1H0PjkA3EiK0ZcoPfOnewKftDxOFyKVvHcoE/Pc5XizT7Mf28jZm32VV4IECFjkYoV9LRL6MU
	bOjm/ZuIvlnHUw+5gcpdLTGzvN74NCNZMed/4wa+Z7dH2NaC8nVEHMo6dLusr4XzqFaqyDQyttBCP
	wxsa2vw9Zx4g+MdAmQCli9QCe87cKuQoXysNy0JrIFLincuWn2SGIkGnmoJ903/e+UZ0PxhwobPrn
	nJTr8GtbzBPu3+6thVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rUs-0000000DGi7-1cXa;
	Thu, 24 Apr 2025 07:59:50 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rSf-0000000DGRS-2ixJ
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:57:35 +0000
Received: from [192.168.2.35] (unknown [98.97.25.173])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8EB50B4C1596;
	Thu, 24 Apr 2025 09:57:28 +0200 (CEST)
Message-ID: <0ce7dff4-a6cf-4e5b-a5b1-3c58926ef9ab@freeshell.de>
Date: Thu, 24 Apr 2025 00:57:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] pinctrl: starfive: jh7110: add support for
 PAD_INTERNAL_* for GPI
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-3-uwu@icenowy.me>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250424062017.652969-3-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_005733_862678_5157DDC2 
X-CRM114-Status: GOOD (  20.24  )
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

On 4/23/25 23:20, Icenowy Zheng wrote:
> The JH7110 SoC's both pin controller support routing GPI signals to
> internal fixed low/high level.
> 
> As we allocated two special "pin" numbers for these situations
> (PAD_INTERNAL_{LOW,HIGH}), add special handling code for these "pins".
> The DOEn/DOUT/FUNCTION fields are ignored and the internal input signal
> specified by the DIN field is routed to fixed low/high level.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../starfive/pinctrl-starfive-jh7110.c        | 41 +++++++++++++++----
>  1 file changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 1d0d6c224c104..fb18c7974ec86 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -291,6 +291,24 @@ void jh7110_set_gpiomux(struct jh7110_pinctrl *sfp, unsigned int pin,
>  }
>  EXPORT_SYMBOL_GPL(jh7110_set_gpiomux);
>  

> +static void jh7110_set_gpi(struct jh7110_pinctrl *sfp, u32 gpi, u32 val)
> +{
> +	u32 offset, shift;
> +	u32 reg_val;
> +	const struct jh7110_pinctrl_soc_info *info = sfp->info;
> +
> +	offset = 4 * (gpi / 4);
> +	shift  = 8 * (gpi % 4);
> +
> +	reg_val = readl_relaxed(sfp->base +
> +				info->gpi_reg_base + offset);
> +	reg_val &= info->gpi_mask << shift;
> +	reg_val |= (val & info->gpi_mask) << shift;
> +
> +	writel_relaxed(reg_val, sfp->base +
> +				info->gpi_reg_base + offset);
> +}
> +

Are there some bit ops masking macros common to Linux that should be
used here?

>  static int jh7110_set_mux(struct pinctrl_dev *pctldev,
>  			  unsigned int fsel, unsigned int gsel)
>  {
> @@ -307,14 +325,23 @@ static int jh7110_set_mux(struct pinctrl_dev *pctldev,
>  	pinmux = group->data;
>  	for (i = 0; i < group->grp.npins; i++) {
>  		u32 v = pinmux[i];
> +		u32 pin = jh7110_pinmux_pin(v);
>  
> -		if (info->jh7110_set_one_pin_mux)
> -			info->jh7110_set_one_pin_mux(sfp,
> -					jh7110_pinmux_pin(v),
> -					jh7110_pinmux_din(v),
> -					jh7110_pinmux_dout(v),
> -					jh7110_pinmux_doen(v),
> -					jh7110_pinmux_function(v));

I cannot think of any reason why you would need to do it this way:

> +		switch (pin) {
> +		case PAD_INTERNAL_LOW:
> +		case PAD_INTERNAL_HIGH:
> +			jh7110_set_gpi(sfp, jh7110_pinmux_din(v),
> +				       pin == PAD_INTERNAL_HIGH);
> +			break;

Please, just more readable and let compiler do its job to optimize:

		switch (pin) {
		case PAD_INTERNAL_LOW:
			jh7110_set_gpi(sfp, jh7110_pinmux_din(v), 0);
			break;

		case PAD_INTERNAL_HIGH:
			jh7110_set_gpi(sfp, jh7110_pinmux_din(v), 1);
			break;

> +		default:
> +			if (info->jh7110_set_one_pin_mux)
> +				info->jh7110_set_one_pin_mux(sfp,
> +						jh7110_pinmux_pin(v),
> +						jh7110_pinmux_din(v),
> +						jh7110_pinmux_dout(v),
> +						jh7110_pinmux_doen(v),
> +						jh7110_pinmux_function(v));
> +		}
>  	}
>  
>  	return 0;

Thank you for your work on this series!  -E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
