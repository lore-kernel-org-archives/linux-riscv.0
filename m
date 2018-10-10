Return-Path: <SRS0=k7QB=MW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568A8C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15EEB2087A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J6uBwj+v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15EEB2087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad1yeOIIdeCaj9lUZn34VGGTNCSedt7rbUiGzL3LDMM=; b=J6uBwj+vzdmBO0
	mVfFgj/8sDgmp7lPpsfQmEQNsOvglUFon2ZWZD46F7/aP+naFft1bP3UN//k6MFwukE0aGs8wchPk
	+Q87p1VxJRa2YYC0BxEJRHC+2zpWwMEz/G3JCfDkgNyl9K4OusbfQROmCaOtIyw2e/KvJiRLRQXxz
	FSqmn1KknFdVyGDLNaOTGoyWeC88a7aLNRGNRStnKOSEdVe+xwW2Q2psIem0dcq/goNSkasyPE/l9
	i7AziiapVuZX2N0HqpFZ6E8uAQ8HwazNPi2uTjdBQkqrrETRRzeO7a52G49ySjQgZeGFG2+QGzVs6
	BBwLHOl3cpzUbQpqkA5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAEGw-0001oa-5j; Wed, 10 Oct 2018 13:11:30 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gAEGv-0001o7-6S; Wed, 10 Oct 2018 13:11:29 +0000
Date: Wed, 10 Oct 2018 06:11:29 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 2/4] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20181010131128.GA29142@infradead.org>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-3-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1539111085-25502-3-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181010131129.g2IK9JE76KXnySGg8Byh-rVfXXjvxvUle4L55JmYYx4@z>

Thanks for getting these drivers submitted upstream!

I don't really know anything about PWM, so just some random nitpicking
below..

> +	iowrite32(frac, pwm->regs + REG_PWMCMP0 + (dev->hwpwm * SIZE_PWMCMP));

* already has a higher precedence than +, so no need for the inner
braces.

> +	duty = ioread32(pwm->regs + REG_PWMCMP0 + (dev->hwpwm * SIZE_PWMCMP));

Same here.

> +	/* (1 << (16+scale)) * 10^9/rate = real_period */
	unsigned long scalePow = (pwm->approx_period * (u64)rate) / 1000000000;

no camcel case, please.

> +	int scale = ilog2(scalePow) - 16;
> +
> +	scale = clamp(scale, 0, 0xf);

Why not:

	int scale = clamp(ilog2(scale_pow) - 16, 0, 0xf);

> +static int sifive_pwm_clock_notifier(struct notifier_block *nb,
> +				     unsigned long event, void *data)
> +{
> +	struct clk_notifier_data *ndata = data;
> +	struct sifive_pwm_device *pwm = container_of(nb,
> +						     struct sifive_pwm_device,
> +						     notifier);

I don't think there are any guidlines, but I always prefer to just move
the whole container_of onto a new line:

	struct sifive_pwm_device *pwm =
		container_of(nb, struct sifive_pwm_device, notifier);

> +static struct platform_driver sifive_pwm_driver = {
> +	.probe = sifive_pwm_probe,
> +	.remove = sifive_pwm_remove,
> +	.driver = {
> +		.name = "pwm-sifivem",
> +		.of_match_table = of_match_ptr(sifive_pwm_of_match),
> +	},
> +};

What about using tabs to align this a little more nicely?

static struct platform_driver sifive_pwm_driver = {
	.probe			= sifive_pwm_probe,
	.remove			= sifive_pwm_remove,
	.driver = {
		.name		= "pwm-sifivem",
		.of_match_table	= of_match_ptr(sifive_pwm_of_match),
	},
};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
