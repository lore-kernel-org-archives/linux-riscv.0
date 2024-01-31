Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408B2C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zR5s+L4byAoaYpu1rGOX5uap7X0OlkMhY6uQ/M7ELeo=; b=azNcailqsrkUHe
	+mD30jI5TVdzeSHZIL1BMBsztJdHW9XSc4imUIuHHtP99oieS9UKt9K5PJtF5iWlXTH36fbPKGdDn
	Q58egoYC9lAZcKy7HHoE1YLmJk0DwyULU6KHqDRavwljyTSFqfSjxClqzowq2wVnxY5McHfhltCr5
	CkJLT4sGe3ZydmobOVArGsmlfk7hqSLhctZdrQv7OiEsHA3fXDKjMijPCUklu9/vfq+E27D7H+1QP
	MA6gIAEPHKksVJ4EemCkVwtm0VI8ewgyQ/4VMgYE5o2ESzqwfpRTNtIsk5685irJY1NJSszj8mbWr
	NVnK2Q8sxcmfbu3uUxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVArH-00000003gCQ-3RX0;
	Wed, 31 Jan 2024 13:42:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVArE-00000003gAv-3uYW
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:42:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rVAqb-0003wn-BI; Wed, 31 Jan 2024 14:41:49 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rVAqY-003e3x-Ln; Wed, 31 Jan 2024 14:41:46 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rVAqT-0008vC-1l;
	Wed, 31 Jan 2024 14:41:41 +0100
Message-ID: <8dd1fe2d040db3e79ef94a5b2c70c51108e56c39.camel@pengutronix.de>
Subject: Re: [PATCH v8 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org
Date: Wed, 31 Jan 2024 14:41:41 +0100
In-Reply-To: <20240131125920.2879433-3-privatesub2@gmail.com>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
	 <20240131125920.2879433-3-privatesub2@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_054228_979597_93F07D77 
X-CRM114-Status: GOOD (  19.53  )
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
Cc: linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Maksim Kiselev <bigunclemax@gmail.com>, Samuel Holland <samuel@sholland.org>, Brandon Cheo Fusi <fusibrandon13@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, John Watts <contact@jookia.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mi, 2024-01-31 at 15:59 +0300, Aleksandr Shubin wrote:
> Allwinner's D1, T113-S3 and R329 SoCs have a quite different PWM
> controllers with ones supported by pwm-sun4i driver.
> 
> This patch adds a PWM controller driver for Allwinner's D1,
> T113-S3 and R329 SoCs. The main difference between these SoCs
> is the number of channels defined by the DT property.
> 
> Co-developed-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> ---
>  drivers/pwm/Kconfig      |  10 ++
>  drivers/pwm/Makefile     |   1 +
>  drivers/pwm/pwm-sun20i.c | 380 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 391 insertions(+)
>  create mode 100644 drivers/pwm/pwm-sun20i.c
> 
[...]
> diff --git a/drivers/pwm/pwm-sun20i.c b/drivers/pwm/pwm-sun20i.c
> new file mode 100644
> index 000000000000..19bf3f495155
> --- /dev/null
> +++ b/drivers/pwm/pwm-sun20i.c
> @@ -0,0 +1,380 @@
[...]
> +static int sun20i_pwm_probe(struct platform_device *pdev)
> +{
[...]
> +	sun20i_chip->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(sun20i_chip->rst))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->rst),
> +				     "failed to get bus reset\n");
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "allwinner,pwm-channels",
> +				   &sun20i_chip->chip.npwm);
> +	if (ret)
> +		sun20i_chip->chip.npwm = 8;
> +
> +	if (sun20i_chip->chip.npwm > 16)
> +		sun20i_chip->chip.npwm = 16;
> +
> +	/* Deassert reset */
> +	ret = reset_control_deassert(sun20i_chip->rst);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to deassert reset\n");

Consider using devm_add_action_or_reset() to automatically assert the
reset control again on error or driver unbind ...

> +
> +	sun20i_chip->chip.dev = &pdev->dev;
> +	sun20i_chip->chip.ops = &sun20i_pwm_ops;
> +
> +	mutex_init(&sun20i_chip->mutex);
> +
> +	ret = pwmchip_add(&sun20i_chip->chip);

... and devm_pwmchip_add() here. Together, this would allow to drop
sun20i_pwm_remove().


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
