Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E4DC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNzhv7rF1TtfbjRWK7sC+OtF7dt1dhF9LaBi1gWEzZQ=; b=mw0WsXEk64xiTk
	vMpWaSr7ipH/0hcGp3suEGbIjOiJlvKeq7pxWsgtGUyLmEloZz83Na1m4X7QkJuoVealmLh9zKl7j
	Dy7NK1+viQ5rJu5pEnFUnndKkYy9T493L9NpJ73UzmRZ3ZrMya/i5WU3tWHD+m659Kf/qMNoirFFJ
	9++ta8RQxIFIeo65RttuyoCwFzz8hEagnhNqgfJkHy5+jCaXvtiPJJMsDhffksCJhNY4dZjXOl/fF
	QHqzq9P0ecvo7zBNayQ1U6qr8UevBxkv/I9CxT10eEgbZo9QtIei31afv/SQ+lgsmyYfd4QmFb1/9
	/0ld/dNsVfh34HKifgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03Vn-00A8VH-Qv; Tue, 29 Nov 2022 16:31:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03Vi-00A8Sq-D9
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 16:31:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB2A1B8167C;
	Tue, 29 Nov 2022 16:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B494CC433D7;
	Tue, 29 Nov 2022 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669739463;
	bh=4PyMQ5JlxAjpq7Km/9Uz5WOUe5WAq/COu0sUXNNBUDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gjit77NkwrwsiTYvSYSel27B2Z36ZY0hlwpWDSdzH0aDBrOr5AZyswD/eLYuu3Y6Z
	 QgyGrMGR/tT8/41pDfZ3NR639KMEthVg+dy9BNtOsAqcDF9bhYFAldq6DI4fX2VrvF
	 hGPWlmTz1LedI3bcBFV3D35eJytp2Z3bsx6wiyfrx+vI4ZOxO/NamVuc23JFkJaBSr
	 zJ4TRn8+yCk44kp/a8mxuPZ07DfIKc5Ap7CFms4X8SfUSOdiRLkkb3TTvS5LQxTFGk
	 qQvFSPNvE8ZAbanUCbadFMphLnFOnsnYj90JqeICDX9+KpI/bhWpK6z1OPo4PEoopQ
	 KQ/aXoeCIzN8Q==
Date: Tue, 29 Nov 2022 16:30:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] gpio: mpfs: Make the irqchip immutable
Message-ID: <Y4Yzw4Oq8lUEHdcC@spud>
References: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_083106_774593_00B60492 
X-CRM114-Status: GOOD (  23.97  )
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

Hey Geert,

On Tue, Nov 29, 2022 at 05:23:22PM +0100, Geert Uytterhoeven wrote:
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the gpio-mpfs driver:
> 
>     gpio gpiochip0: (20122000.gpio): not an immutable chip, please consider fixing it!
> 
> Fix this by making the irqchip in the gpio-mpfs driver immutable.
> 
> While at it, drop of the unneeded masking of the hwirq number, as it is
> always smaller than the number of GPIOs/interrupts handled by the
> controller.

Huh, I didn't think this was upstream yet?
Lewis should be working on an updated version of it at the moment, last
I heard he was looking into using regmap stuff as pointed out in a
review.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not tested with interrupts, as there are no inputs described in the
> Icicle DTS yet.
> ---
>  drivers/gpio/gpio-mpfs.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> index 168be0b90cf8c656..fd294b581ae77369 100644
> --- a/drivers/gpio/gpio-mpfs.c
> +++ b/drivers/gpio/gpio-mpfs.c
> @@ -168,8 +168,9 @@ static void mpfs_gpio_irq_unmask(struct irq_data *data)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>  	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> -	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> +	int gpio_index = irqd_to_hwirq(data);
>  
> +	gpiochip_enable_irq(gc, gpio_index);
>  	mpfs_gpio_direction_input(gc, gpio_index);
>  	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
>  	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
> @@ -180,11 +181,12 @@ static void mpfs_gpio_irq_mask(struct irq_data *data)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>  	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> -	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> +	int gpio_index = irqd_to_hwirq(data);
>  
>  	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
>  	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
>  			     MPFS_GPIO_EN_INT, 0);
> +	gpiochip_disable_irq(gc, gpio_index);
>  }
>  
>  static const struct irq_chip mpfs_gpio_irqchip = {
> @@ -192,7 +194,8 @@ static const struct irq_chip mpfs_gpio_irqchip = {
>  	.irq_set_type = mpfs_gpio_irq_set_type,
>  	.irq_mask	= mpfs_gpio_irq_mask,
>  	.irq_unmask	= mpfs_gpio_irq_unmask,
> -	.flags = IRQCHIP_MASK_ON_SUSPEND,
> +	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>  
>  static void mpfs_gpio_irq_handler(struct irq_desc *desc)
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
