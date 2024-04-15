Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB7EC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YWhgQHI1AF+dGPhywI3Y6UxrwGU+SIagKxyhYy6Q08=; b=Kj0tGQbhyJqhXP
	HddXEAox2hcLX+gqY0KUiEn/r9x7bvR92nbkI70zMgdVO+G78X6i6SEPBcsFUJC28ljT3fEwdn3Oc
	DD+a2Nio9IgfRrMAcbYGNdAC4OQ4hogzaCjEA7cKliOLQmBB3XJ/yNvx/L3d1m4bnBbjKUwxaLQxd
	4uUNHAJwM0/OF29ncg4BnsXgPKs8WhjpNjlg2va3B/nmyKklaiH7vaBslVst4DKMcSfSNFiLPhHT4
	9jKDQF40SwF8RzMdEnk3p3JSl/w1n+hYj2kHHJg73ZOp0DBn6akXcN2ST4N5Dox7sDiOFaXrSvKzb
	oD7xJ6z6mArrOgmwXl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwKpX-0000000858y-2Ch8;
	Mon, 15 Apr 2024 11:48:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwKpS-0000000858I-3x3g
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 11:48:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E09C8C0005;
	Mon, 15 Apr 2024 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713181729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHFzrlLFn4E1ExYOjEZ9nCG7yBy5rx/gtcDIhxkwf64=;
	b=hTWESPEzV9xVD9Q+wMDkau2rPvUPdmuiyZ6O3MBPlHaTgXpNpDJ4OA1hrr1XvjZ+ub5NkR
	49r8eQUbSd2w9nB4Xzlfe5kwmrWB6Jr6LVsuRel7mO3jJWreOBg7qh1PPMh0OgYgiCWVYE
	1ZgjoAGwgkM88blAik+YLtkNfZa92iaZnlIYlcMMlrbe1U0rMruQBAr636aj1wZTDbHZJB
	dITN890v6oSkUGEd5rkLayad6YXeX0SRS3xo6wHC3avpvA4+qbnqZQqRjkO9oucAANQsQH
	lvlumYo8Rlgeb6y/q7JnpBJGoqdVfsi8yoFKtjh2vEEfoIm4P6i80EjDDwiUWA==
Message-ID: <9f8a584c-03a7-437e-96a7-56484523b2e4@bootlin.com>
Date: Mon, 15 Apr 2024 13:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jszhang@kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, wefu@redhat.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231005130519.3864-3-jszhang@kernel.org>
Subject: Re: [PATCH v3 2/2] pwm: add T-HEAD PWM driver
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20231005130519.3864-3-jszhang@kernel.org>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_044855_439238_67F8A82C 
X-CRM114-Status: GOOD (  20.04  )
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

 > T-HEAD SoCs such as the TH1520 contain a PWM controller used
 > to control the LCD backlight, fan and so on. Add driver for it.
 >
 > Signed-off-by: Jisheng Zhang <jszhang@kernel.org > ---

Hello,
I've just tested your driver and it works flawlessly on the 
BeagleV-Ahead with the last mainline kernel. However, I had to modify 
some portion of the code to comply with the last kernel needs.

 > +static const struct pwm_ops thead_pwm_ops = {
 > +    .apply = thead_pwm_apply,
 > +    .get_state = thead_pwm_get_state,
 > +    .owner = THIS_MODULE,

Since commit 384461abcab6, the owner of a pwm_ops structure is implicit 
and so, you can (must) remove this last line now.

 > +};
 > ...
 > +static int thead_pwm_probe(struct platform_device *pdev)
 > +{
 > +    struct thead_pwm_chip *priv;
 > +    int ret, i;
 > +    u32 val;
 > +
 > +    priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 > +    if (!priv)
 > +        return -ENOMEM;
 > +
 > +    platform_set_drvdata(pdev, priv);
 > +
 > +    priv->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 > +    if (IS_ERR(priv->mmio_base))
 > +        return PTR_ERR(priv->mmio_base);
 > +
 > +    priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 > +    if (IS_ERR(priv->clk))
 > +        return PTR_ERR(priv->clk);
 > +
 > +    priv->chip.ops = &thead_pwm_ops;
 > +    priv->chip.dev = &pdev->dev;
 > +    priv->chip.npwm = THEAD_PWM_MAX_NUM;
 > +
 > +    /* check whether PWM is ever started or not */
 > +    for (i = 0; i < priv->chip.npwm; i++) {
 > +        val = readl(priv->mmio_base + THEAD_PWM_FP(i));
 > +        if (val)
 > +            priv->channel_ever_started |= 1 << i;

					     BIT(i) ?
If the bootloader starts a PWM channel for some reason, it will not be 
referenced by the PM usage counter, I added this line in the if 
statement to counter this problem :
		pm_runtime_get(&pdev->dev);

 > +    }
 > +
 > +    ret = devm_pwmchip_add(&pdev->dev, &priv->chip);
 > +    if (ret)
 > +        return ret;
 > +
 > +    devm_pm_runtime_enable(&pdev->dev);
 > +
 > +    return 0;
 > +}


Thank you for your work. With the above comments addressed:

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Do you plan to send out a new iteration of this patch soon ?

Best regards,
Thomas Bonnefille

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
