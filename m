Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E03D2A53D
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 18:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xZHM9XXgF9r5Vm6pm2yHWK7Pfwn7rIbgEMVYonZEvA=; b=UWaZs75z/GbXmx
	k8OIJz/XSYXRmkYWcFMlgE7W0CdQ2WxJcMGvP4G8qAO7haYErmHH6hm4g+WVMdNUMAmVZNf9sYq9i
	PqpA40GVYN7zS5BKLMnS8WRRKsbd9j72IAORZyWGh7pF2a2I/pK8h693S1kXwYL5p5F4EGcZArQNP
	dALwUsDg8IaxgQLm8wcJXf4ebUE4bVJpTvUj2TC/t/RMFWCwZYPy7+oNFqLRb4+0WufYqO6qHQNyo
	cKAPCujV96h9whaYWPLVevEvKQ6hgxIkYddaTGmhpRdLdVIAGEq5NbFgm5jd1AqDhMwNCouzTwt3y
	BvW0TbaN7AgNuPHdnIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t192A-0000000CiZX-2ZuK;
	Wed, 16 Oct 2024 18:46:10 +0000
Received: from bout3.ijzerbout.nl ([2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1923-0000000CiWf-1Kku
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 18:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729104352; bh=cMZwR6cryvoRu0vR9qjUJvRH0BAagieaFPpUnTvBpWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hkxptrEyzThow4MEK0ZySGjZtMqcKvxTLk/eOxgTdvqA+T4AQUNgBqLLX/50SmRH2
	 16C8vOE+Wh3H5eOe3afeYSxpRrMN5+04+Fcu+fd8rDQqffxmFha/Zz5d7mHf8ueddw
	 I5zfpRzWBcIcthMI0Guj2hIqgWN7TfIQ9EYM95YGPzyQihsFE5rJRzdRGK7YU5WqtK
	 Ov7Lmr2XlSXZVYNNMeDGrIx8OlHUipxwzAqI0Flm5rUD0HeYD2lBgAWXJ3joTwCVZL
	 FgVEwbZGHik9eBBeG32niY8sPn9yBnn3HH429uFXoVBjLnAPv7sxqTlrplHzBYYmvK
	 ds4r6Ak+ysD+k8JWKPazWD+rjrWNZkOFTWmHhM9wk4rDPos5rqgz7FDhgpCz0aanZb
	 jdbwUd96OkImZDpsx92B75T/n7MtDZOu5yYMPe5L09ObGGz4rrz8Y5RezznEdmwH9s
	 Md9YFwiUUtpO94m0MUYzxCYJKK7HHQliQbzZN6MsOW5IYvLcKegDl8MlUQgs1Rgbcp
	 B5d6SwlG+TFFbFCqbI4kt2LflA7Dk+0Sy7DzGHGdw5zSVYztyMRWnu0rzTOA0JvuEK
	 hDpCbfeIv6RMGH+2SOCJkKen0oJtDmlqVP7fNwv0QtNDzGxeKNsY7M6+tGwJ0ltGU2
	 BdB3BzxBjYJih1wwDqcoGAqs=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id CABFC167DD7;
	Wed, 16 Oct 2024 20:45:51 +0200 (CEST)
Message-ID: <3a875620-513c-498a-ada2-c515de75de3b@ijzerbout.nl>
Date: Wed, 16 Oct 2024 20:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
 <20241011144826.381104-4-emil.renner.berthing@canonical.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241011144826.381104-4-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_114603_850425_C350F363 
X-CRM114-Status: GOOD (  16.03  )
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

Op 11-10-2024 om 16:48 schreef Emil Renner Berthing:
> Limit the casts to get the mux data and flags from the driver data
> pointer with each pin to two inline functions as requested by Andy
> during review.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>   drivers/pinctrl/pinctrl-th1520.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 8bd40cb2f013..7474d8da32f9 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -152,6 +152,16 @@ static enum th1520_muxtype th1520_muxtype_get(const char *str)
>   		(TH1520_MUX_##m0 <<  0) | (TH1520_MUX_##m1 <<  5) | (TH1520_MUX_##m2 << 10) | \
>   		(TH1520_MUX_##m3 << 15) | (TH1520_MUX_##m4 << 20) | (TH1520_MUX_##m5 << 25)) }
>   
> +static unsigned long th1520_pad_muxdata(void *drv_data)
> +{
> +	return (uintptr_t)drv_data & TH1520_PAD_MUXDATA;
> +}
> +
> +static bool th1520_pad_no_padcfg(void *drv_data)
> +{
> +	return (uintptr_t)drv_data & TH1520_PAD_NO_PADCFG;
> +}
> +
>   static const struct pinctrl_pin_desc th1520_group1_pins[] = {
>   	TH1520_PAD(0,  OSC_CLK_IN,    ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
>   	TH1520_PAD(1,  OSC_CLK_OUT,   ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
> @@ -590,7 +600,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
>   	u32 value;
>   	u32 arg;
>   
> -	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> +	if (th1520_pad_no_padcfg(desc->drv_data))
>   		return -ENOTSUPP;
>   
>   	value = readl_relaxed(th1520_padcfg(thp, pin));
> @@ -660,7 +670,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>   	unsigned int i;
>   	u16 mask, value;
>   
> -	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> +	if (th1520_pad_no_padcfg(desc->drv_data))
>   		return -ENOTSUPP;
>   
>   	mask = 0;
> @@ -793,12 +803,14 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   {
>   	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>   	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> +	enum th1520_muxtype muxtype = (uintptr_t)func->data;
You cannot use func before checking for NULL (see if statement below)
>   
>   	if (!func)
>   		return -EINVAL;
> +
>   	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
> -				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
> -				 (uintptr_t)func->data);
> +				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
> +				 muxtype);
>   }
>   
>   static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
> @@ -809,7 +821,7 @@ static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
>   	const struct pin_desc *desc = pin_desc_get(pctldev, offset);
>   
>   	return th1520_pinmux_set(thp, offset,
> -				 (uintptr_t)desc->drv_data & TH1520_PAD_MUXDATA,
> +				 th1520_pad_muxdata(desc->drv_data),
>   				 TH1520_MUX_GPIO);
>   }
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
