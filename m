Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08F2C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFpcjqiEWDcQ50AniBjYNKhSt71ntvjMpJ9FnlXDfxc=; b=Zcsd0ub4eVPnpu
	kZbKfQB83rAOB/v5gTCWsf7vA0PMNIU+4TSvdwfgxwmPlXorHQwEAPfaCpZ1x1/hg8N5eJLA8LL3L
	V91LnCaCDqM38RHvF4j47znqYMZuO8PjFsSZR4GU3RyVA17RhRMSoy44+rkzxpY7sHnxW6IZQwfP5
	LS1J6/WdfdEM+gAGvr0+rm4Nwx3JemJiLBYc3iqz8lYK4oifyYjMdJwXPgL2D2gMA/ywOcOA8TU9K
	DP3iyOFchu7PJpi5ucApyqckkUM0YbCFKnITcOBriLSIZVk9CBrtoPhE9/aske5UQvhXMuwzXMVvh
	OpHaRgQAZiBOWHJritQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsCGE-00EwPt-4t; Fri, 20 May 2022 23:42:22 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsCGB-00EwP6-42
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 23:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653090137; x=1684626137;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cbxuNpr/zCC3fo3EPXew8NY8Z0HqAPgONnWiV+/hf/c=;
 b=B5EWxpCnEF8DlmOAvy36DvFuzE0KpfRW73zXWOj2+m1mk352LDSu/6Ak
 4SWXYfwZ3DVbl4NUeXS138FkOvezdP5LtahxhNL7PhPRHaMIupdOOTDyC
 I2QInRkQlDFoeCilh6DvateTwr75X1qPtDFSAVM8TstHrQkmXO4LEHNus
 YLM1JEoabz3toxeQ8jlDPaQId/KH+V5P++pr03B5cP2S8zZGyAHCW8yPU
 neMEAPfrkLRw3rfbXZwa3+5CQvdWppY2PEnqKK+WOI19gmFtdcKVo7+jy
 NI1QkK3+UrrU0KwD0zLq1d0Qeu7HBmE4D4ZIiNWHPNrcDJzXbgrbSJi8F g==;
X-IronPort-AV: E=Sophos;i="5.91,240,1647273600"; d="scan'208";a="205825611"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 May 2022 07:42:15 +0800
IronPort-SDR: bjb5yB78fFc6oZku7jvxS1p7GCXARnPpZrcpzlnJBlaEKsham1+IWcIRVfaE5DrmHl2rakERBC
 8Q+YJpIWzIOclPRS/ZlaZ9SSpKCe8HUfcF25t5dnpNOiE9AAh0Peejw6Y7SUOZAMHuL7CWze6C
 qG2VafwJ4kWnqKH+drl4EiFV6WUpN68pZonU330d8jpVMOM7G47cJ8WoxQq8JvSYulNCS46B8x
 oT9iu0LYDCQXjEoIKZLy5MdypDJ3MDFAvF4WKNavw1LTEsb+W+zAni6kSOOCgThEVB9WONX556
 lMRm/o89IusHxBOt/AKQ0Tyb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 16:05:00 -0700
IronPort-SDR: c4FnhomoPsKRS13FMm0tTX6N1k2IsE7oBgrOeLIP7f4bBV8GM2lbyTFxHsSsynTMNFTY6O+DDc
 WbiV54P14BjBFZABuCL5qJmsiNwe8SzL5/oc5NFRr8i1Ib03oLFYBU4DM+UIaZz38sr2W03Hud
 c3oJQjsSrdgt2jVjRBxzCHTd2Llmpaz4u3iTI1bVtUagQNLn2KVk9sbeUjlGxk/3c/67b6P9V0
 fbtncPLpLs7iMRuWlu3cPfJNEI9/s2DKR2+F+M9Rt1YsEzkdHWQf7raM2P4SVQhTblLdeufmC+
 L+k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 16:42:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L4jtw2SGrz1SHwl
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 16:42:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1653090135; x=1655682136; bh=cbxuNpr/zCC3fo3EPXew8NY8Z0HqAPgONnW
 iV+/hf/c=; b=hhU532P0mw79hDtuG/IXya1FxRnUWF3nulx+yr48s+IZCMrZpbe
 mAHA5aMH8CfCcja+OpNPK2zikLvf33jRnFrmQ9zL+dkR7N3v8q7ift1GuhIp0pn5
 BsBZce1jLuLMqIp/38pso6xa3oQj/BGZPv1HGlXw1freyFBm2QNaftMowLznUEPU
 H98dXiyt6Ne12DsH6nbTcgXUqt32c+DTuveN8NmT5af77Y/QppjZgx5Vd9zG2h+c
 WWLxIqEOgCfDSPUUQHAWu/cLqnI2LNMsdeVxt11Kx3W9lVi6uHb8nGoEH8DrPEKs
 YPSHHpDaOxlX0Z6JcvBm3z8h5C3yODLZUrg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id TOJ-GxGg7zZF for <linux-riscv@lists.infradead.org>;
 Fri, 20 May 2022 16:42:15 -0700 (PDT)
Received: from [10.225.163.51] (unknown [10.225.163.51])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L4jtt3qJFz1Rvlc;
 Fri, 20 May 2022 16:42:14 -0700 (PDT)
Message-ID: <8e516ec1-fb85-7878-3c68-61798de9fa6a@opensource.wdc.com>
Date: Sat, 21 May 2022 08:42:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] gpio: sifive: Make the irqchip immutable
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
References: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_164219_214473_60A946C5 
X-CRM114-Status: GOOD (  24.14  )
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

On 5/20/22 19:24, Geert Uytterhoeven wrote:
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the sifive driver:
> 
>     gpio gpiochip1: (38001000.gpio-controller): not an immutable chip, please consider fixing it!
> 
> Fix this by making the irqchip in the sifive driver immutable.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).
> 
> v2:
>   - Factor out hwirq using preferred helper.
> ---
>  drivers/gpio/gpio-sifive.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 03b8c4de2e91e3c4..238f3210970cfa0e 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -75,10 +75,12 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
> -	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	int offset = hwirq % SIFIVE_GPIO_MAX;
>  	u32 bit = BIT(offset);
>  	unsigned long flags;
>  
> +	gpiochip_enable_irq(gc, hwirq);
>  	irq_chip_enable_parent(d);
>  
>  	/* Switch to input */
> @@ -101,11 +103,13 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
> -	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	int offset = hwirq % SIFIVE_GPIO_MAX;
>  
>  	assign_bit(offset, &chip->irq_state, 0);
>  	sifive_gpio_set_ie(chip, offset);
>  	irq_chip_disable_parent(d);
> +	gpiochip_disable_irq(gc, hwirq);
>  }
>  
>  static void sifive_gpio_irq_eoi(struct irq_data *d)
> @@ -137,7 +141,7 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
>  	return -EINVAL;
>  }
>  
> -static struct irq_chip sifive_gpio_irqchip = {
> +static const struct irq_chip sifive_gpio_irqchip = {
>  	.name		= "sifive-gpio",
>  	.irq_set_type	= sifive_gpio_irq_set_type,
>  	.irq_mask	= irq_chip_mask_parent,
> @@ -146,6 +150,8 @@ static struct irq_chip sifive_gpio_irqchip = {
>  	.irq_disable	= sifive_gpio_irq_disable,
>  	.irq_eoi	= sifive_gpio_irq_eoi,
>  	.irq_set_affinity = sifive_gpio_irq_set_affinity,
> +	.flags		= IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>  
>  static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> @@ -242,7 +248,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  	chip->gc.parent = dev;
>  	chip->gc.owner = THIS_MODULE;
>  	girq = &chip->gc.irq;
> -	girq->chip = &sifive_gpio_irqchip;
> +	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
>  	girq->fwnode = of_node_to_fwnode(node);
>  	girq->parent_domain = parent;
>  	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
