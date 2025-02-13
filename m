Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BEEC021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 23:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HP5pGj/MNog87aSoTy8D6+hWXwaZibtc4F7ve4GDr7o=; b=U/qFDKiTxRX7mU
	2d5CYJFCqzXHTNKlgmrRUlqHhiKN7w5l4n8FyqU8QzwC8N+iU/Ua+tkB4dn1BBjyqPgyLbvv60l0/
	7dg860qx99+buvvyVpu2c89lysOge4NwR/xVSmwXgrhAjLgEyzPk3ywha6SQXaCd3K3QBxu3zxhYa
	/Ib2faNtNyd69w0ojrLpxBTaPC2pnf4PB4Q7rbik0ETFIKGkTcDpHB7MskyBYx0BhynO/nxOpILr0
	BZAyNeM4AKzvVmY0KjFXBuVqsQgV/TKitBS+fRzmVFB4vJ//MsvHURcHVgpik3BAbC3VDWXykyJUr
	vdQwfNEpf8ND95O8EySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiC2-0000000Ctel-0DCo;
	Thu, 13 Feb 2025 23:00:26 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiBy-0000000Ctc0-3kni
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 23:00:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC5C31F764;
	Thu, 13 Feb 2025 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739487619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SMbFIP0hXOQDBlKRcsdm79YcouV95TghdG4+3UcuP1c=;
	b=Az83w22hwSpu+jWDQlxwg7RHVZLeWBu7AS+PA2fadSCbJgw5KY1KWHpslgnWrP3HiRoHPk
	CXU4GNZsewKrTXhfECA8omUnixYr60bQeUenYOPaSFb6J1Bl6xWZ1/OimRRASoDH7L7tYM
	JdHiywvV3RA6u9VU+JBT2wmVkxKFv6BFf/a/QRsVyHhnWZ37plwSkmivSr9ls6oKrh+752
	E/qXCvZ7cVTWgLlg0zJkjFbQyvyX6/hqf88zl3xAzmSxyjrlzklGfooGx1aQbFn3U8ek1c
	JPkRNRPlQNTCUYBBCdJs0ZV3g5bcUHsENTFbq53dh7cSjQ5qePTt+cjczuhQow==
Date: Fri, 14 Feb 2025 00:00:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 3/3] rtc: sophgo: cv18xx: Add restart handler
Message-ID: <20250213230017eaa89034@mail.local>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <20250213215655.2311793-4-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213215655.2311793-4-alexander.sverdlin@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegkedtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghilhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehinhhotghhihgrmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhiodgutheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_150023_695270_FBB7982C 
X-CRM114-Status: GOOD (  25.56  )
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

On 13/02/2025 22:56:47+0100, Alexander Sverdlin wrote:
> Currently provided ATF firmware for ARM64 Sophgo SoCs is binary-only.
> To make Linux independent from this binary firmware, provide restart
> handler triggering COLD or WARM reboot directly via RTC HW block as
> alternative to PSCI interface.
> 
> Handler priority SYS_OFF_PRIO_DEFAULT of 0 is desired, because if PSCI
> is indeed present, its priority of 129 will override the new one. On RiskV
> side the behaviour is unchanged as well because SBI SRST handler has higher
> priority as well (192).
> 
> Tested on SG2000 in ARM64 mode.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> v11:
> - patch introduced;
> 
>  drivers/rtc/rtc-cv1800.c | 51 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
> index 5c30f7388983..586d7195f1f4 100644
> --- a/drivers/rtc/rtc-cv1800.c
> +++ b/drivers/rtc/rtc-cv1800.c
> @@ -9,17 +9,23 @@
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/rtc.h>
>  
> +#define CTRL_UNLOCKKEY         0x0004
> +#define CTRL0                  0x0008
>  #define SEC_PULSE_GEN          0x1004
>  #define ALARM_TIME             0x1008
>  #define ALARM_ENABLE           0x100C
>  #define SET_SEC_CNTR_VAL       0x1010
>  #define SET_SEC_CNTR_TRIG      0x1014
>  #define SEC_CNTR_VAL           0x1018
> +#define EN_PWR_CYC_REQ         0x10C8
> +#define EN_WARM_RST_REQ        0x10CC
>  
>  /*
>   * When in VDDBKUP domain, this MACRO register
> @@ -28,6 +34,10 @@
>  #define MACRO_RO_T             0x14A8
>  #define MACRO_RG_SET_T         0x1498
>  
> +/* CTRL0 bits */
> +#define REQ_PWR_CYC            BIT(3)
> +#define REQ_WARM_RST           BIT(4)
> +
>  #define ALARM_ENABLE_MASK      BIT(0)
>  #define SEL_SEC_PULSE          BIT(31)
>  
> @@ -160,6 +170,29 @@ static const struct rtc_class_ops cv1800_rtc_ops = {
>  	.alarm_irq_enable = cv1800_rtc_alarm_irq_enable,
>  };
>  
> +static int cv1800_restart_handler(struct sys_off_data *data)
> +{
> +	struct cv1800_rtc_priv *info = data->cb_data;
> +	u32 reg_en = EN_WARM_RST_REQ;
> +	u32 request = 0xFFFF0800;
> +
> +	if (data->mode == REBOOT_COLD) {
> +		reg_en = EN_PWR_CYC_REQ;
> +		request |= REQ_PWR_CYC;
> +	} else {
> +		request |= REQ_WARM_RST;
> +	}
> +
> +	/* Enable reset request */
> +	regmap_write(info->rtc_map, reg_en, 1);
> +	/* Enable CTRL0 register access */
> +	regmap_write(info->rtc_map, CTRL_UNLOCKKEY, 0xAB18);
> +	/* Request reset */
> +	regmap_write(info->rtc_map, CTRL0, request);
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int cv1800_rtc_probe(struct platform_device *pdev)
>  {
>  	struct cv1800_rtc_priv *rtc;
> @@ -205,7 +238,23 @@ static int cv1800_rtc_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "cannot register interrupt handler\n");
>  
> -	return devm_rtc_register_device(rtc->rtc_dev);
> +	ret = devm_rtc_register_device(rtc->rtc_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "cannot register RTC\n");

This message is useless, there is no failure path without a message in
devm_rtc_register_device.

> +
> +	/*
> +	 * SYS_OFF_PRIO_DEFAULT of 0 is desired here because both RiscV SBI SRST
> +	 * (prio 192) and ARM PSCI (prio 129) will override this one; this
> +	 * handler shall serve as a fallback in cases where firmware is not
> +	 * present.
> +	 */
> +	ret = devm_register_restart_handler(&pdev->dev, cv1800_restart_handler,
> +					    rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "cannot register restart handler\n");


Probe must never fail after devm_rtc_register_device.

> +
> +	return 0;
>  }
>  
>  static const struct of_device_id cv1800_dt_ids[] = {
> -- 
> 2.48.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
