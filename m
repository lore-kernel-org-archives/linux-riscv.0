Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F829C83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HIrWYRal5ABlUMOCluQ95B9Ss8SZB0nFUcizi8w45s=; b=mV5A2cTWH+PYMg
	ZrcBEUoAdmQ0AlOJvYAdR2fxPHB4N4jPIuvKqctW61ShJgoztZTR6UnNs7uZCqB/Bq8T8PHYcCxmc
	pinQeJf9/0nW/CL2nw7Dv7u5PWTsdSba9PM6Rr/EDZNlCKJRjI5KvfVt9VMLKgOsUvlwaLJK06pt+
	CGZ1zB/h0UAcWebuO9v9eqNHX2jABkiVYQWDLIuIa2oddrtQNoJs2cB7wJkHmdh/nVdmplwStTd6Z
	vUieZE0NdhVOqqhv6Ojqf2nKjUeGlNw+8hxNSuE6ys5tvNUSR61VS3iZPsUoJaW9STe90C2oOTPMu
	4PSmKIZq6V0hLxB1Yw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehC2-00000005zQQ-3GBT;
	Wed, 23 Jul 2025 21:40:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehBz-00000005zPd-1bax
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 21:40:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E98343369;
	Wed, 23 Jul 2025 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753306799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTDPZISTAtDJweAfErLxD5sezF7OlcREwST/Cpk6fh8=;
	b=ioPP6HYV9KFJEssOZLj06yxviLP+9b7qFDJxC8kvbVNfk3am45fuBDB6O9wn4yaeJUlI7u
	i8jDmTZ9BPZGx1dri2sLgKNrhIQPtni6wbjpbYAOg2h/gF1yjCZhkGqpc9VlAdTF7ZOTES
	1pcS6O+Y+8qLJfj6URFmNuw/MgL1TKIHjtUpXS2iLH1C14zrNgaRDOLtOK2VyXxhDahVkF
	fox+A7O5baQHuO/9EQFJkpNUAsDBkkKHn5FTOqdNN7ryQYJnN7bkOEQe+P8o2CR3424bTJ
	0E/BsoEjG8A8aTVkHaLVqrZG+QBno05WF+S1D+83Z+uhD9O6g59GeZu/PxNw3w==
Date: Wed, 23 Jul 2025 23:39:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/8] rtc: spacemit: support the SpacemiT P1 RTC
Message-ID: <20250723213956570da462@mail.local>
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-6-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710175107.1280221-6-elder@riscstar.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegvlhguvghrsehrihhstghsthgrrhdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlr
 dgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthdrjhhonhgtiiihkhesohdvrdhplh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_144003_557509_E44F6854 
X-CRM114-Status: GOOD (  18.08  )
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

On 10/07/2025 12:51:03-0500, Alex Elder wrote:
> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	struct regmap *regmap = p1->regmap;
> +	u32 count = RTC_READ_TRIES;
> +	u8 seconds;
> +	u8 time[6];
> +	int ret;
> +
> +	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
> +		return -ENODEV;		/* RTC is disabled */

That should be -EINVAL, as all the other drivers have standardized this.

With this fixed,
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


> +
> +	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
> +	if (ret)
> +		return ret;
> +
> +	do {
> +		seconds = time[0];
> +		ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
> +		if (ret)
> +			return ret;
> +	} while (time[0] != seconds && --count);
> +
> +	if (!count)
> +		return -EIO;		/* Unable to get a consistent result */
> +
> +	t->tm_sec = time[0] & GENMASK(5, 0);
> +	t->tm_min = time[1] & GENMASK(5, 0);
> +	t->tm_hour = time[2] & GENMASK(4, 0);
> +	t->tm_mday = (time[3] & GENMASK(4, 0)) + 1;
> +	t->tm_mon = time[4] & GENMASK(3, 0);
> +	t->tm_year = (time[5] & GENMASK(5, 0)) + 100;
> +
> +	return 0;
> +}
> +
> +/*
> + * The P1 hardware documentation states that values in the registers are
> + * latched so when written they represent a consistent time snapshot.
> + * Nevertheless, this is not guaranteed by the implementation, so we must
> + * disable the RTC while updating it.
> + */
> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	struct regmap *regmap = p1->regmap;
> +	u8 time[6];
> +	int ret;
> +
> +	time[0] = t->tm_sec;
> +	time[1] = t->tm_min;
> +	time[2] = t->tm_hour;
> +	time[3] = t->tm_mday - 1;
> +	time[4] = t->tm_mon;
> +	time[5] = t->tm_year - 100;
> +
> +	/* Disable the RTC to update; re-enable again when done */
> +	ret = regmap_clear_bits(regmap, RTC_CTRL, RTC_EN);
> +	if (ret)
> +		return ret;
> +
> +	/* If something goes wrong, leave the RTC disabled */
> +	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(regmap, RTC_CTRL, RTC_EN);
> +}
> +
> +static const struct rtc_class_ops p1_rtc_class_ops = {
> +	.read_time = p1_rtc_read_time,
> +	.set_time = p1_rtc_set_time,
> +};
> +
> +static int p1_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_device *rtc;
> +	struct p1_rtc *p1;
> +
> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
> +	if (!p1)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, p1);
> +
> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!p1->regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
> +
> +	rtc = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(rtc))
> +		return dev_err_probe(dev, PTR_ERR(rtc),
> +				     "error allocating device\n");
> +	p1->rtc = rtc;
> +
> +	rtc->ops = &p1_rtc_class_ops;
> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
> +
> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
> +
> +	return devm_rtc_register_device(rtc);
> +}
> +
> +static struct platform_driver p1_rtc_driver = {
> +	.probe = p1_rtc_probe,
> +	.driver = {
> +		.name = MOD_NAME,
> +	},
> +};
> +
> +module_platform_driver(p1_rtc_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" MOD_NAME);
> -- 
> 2.45.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
