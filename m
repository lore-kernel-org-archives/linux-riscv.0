Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45763C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ql3KpkyL378O+eCHUCQs6LM4HZ1pltSohaUIRpGQwDc=; b=nKYc0VHub1xoHe
	R3kVH/SHEC/wVRgojY4ksEUjv8pSEfXPJOKYCb0tGf5RqFPyvlTXUJgY0dNpmN4ncgiww6Xwo46HM
	ZL8eDaMBSj5pTl7VQT/qJOJj1y8yGe3WlMMsMff0MNAYTsV/m2c7mNE/otTB/mr1TbZ/ssvws1BwD
	+XcaMkWxRJpQFbGGYDbFQQ9NihkyGCvb+5Gc6XEIMGE89Td1c382er2YZkMkSAb9qADoOVaUIWH2M
	dP+6f2C9tNFUoTWdhDaNafC1drQsfxuyxgZKmjYjttREOPWF5bgTd0cQscOqsqds5yQC9/KjkCX2S
	PZ8Zw6ZTmXN2ybqGNTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYw0-0000000A6gu-1ken;
	Wed, 25 Jun 2025 22:49:40 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYKc-0000000A2ca-3Pkb
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 22:11:05 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3df2f937370so1558215ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750889462; x=1751494262; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPg8khamQ0n3Un0f5D3NLY/jQXcOqvv2U1B/Sm+t1ps=;
        b=a2pcdS0UK8Fww20MlZqbrsUxELHSOTR5wdWbHj0TYg2P+M5hFpK/wVxcjlS0toocQ/
         YIJGHu14lIHup0eVz39L43vaQ4qHcpmfJE++OLekGx308OHByGoDkl+X53KIfW5xQG6e
         atVzAhF3iwoK6wbt6RNwg7wF10aP/RXUhYboiQYOJLR+zx4MNSbmvwdQ5em7vJF08Gq7
         EqQKYzJ2vnPnhdUGDuTE/uahVXSPGccmBMuaTnjCW1tgKjNuyBRWEs1jNzIwfO18dgI5
         cQItnZ153uPwkh7zxFa6NxDyxKWBHCl28I/yxMDfKjHYSYkcsegIkSWIPmSd2YAKOW0k
         f7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750889462; x=1751494262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPg8khamQ0n3Un0f5D3NLY/jQXcOqvv2U1B/Sm+t1ps=;
        b=NhnK5LuCXRo28a+97q2Jg8JkTbjhA0ECGrA9dlkGrR/8S3PPag03qOfbtYYxOC9/IJ
         wEfm99D+0OPDJk34dtWhALf+NHdfHJFU/apoYmUwNY40ZWWoqc51CjcQ+bctwVBENB6H
         Escpe8XKK7KaNiA3HX++ORpnbi8cqVu79AIyKM7OWOygnmAw65Ia2ZCVYpk86TZEPWG7
         OLOE+t4OuCSHs4ntnyWg9C79xlmO8OmqX7QDu7dRQb2hSRWe+OjMUONBGlGlkwz9OhIv
         AbGxr19zSrwRBxdzZp79d9stnitF/6mPpbwcYsQwNiBYFt6C5jNbUr6MHaMre04CJ/4t
         UDMA==
X-Forwarded-Encrypted: i=1; AJvYcCX/CQlr7LwiB6c8YRqptZ+unko9aNuU5a4CSybGlKGf/TFiLOdr75mv2oB5cQgkhYb5FPJa090s6tpjLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvWTzk+DvwVF8eisFc9LQnkdy7WrAq8M+W93XOx5uZql5k/nHk
	1qsTAfZp2cB6h+/BKE3wJVwVH55Vu0eb8rLO5azideydmHFK/BAECY646GZwPKz2U+0=
X-Gm-Gg: ASbGncv2XrsYc4N1bbupyafVQxlP0bB/Cj+Ncmn287eQ8973IZLQMgR0bDt/tnpn3HB
	1QhKxTa+/x5xLa3qU2fsJVxKIhEj17qQ9QuJd0gH2Vg5KaUZPUwskFSQ6xoD5VcTpj2DpoybiJ4
	OBWMairnp4IZShG+7xsHNbaGXqCSNPje97WYgWhacvNHmsRq4fDLfrpb23AZCx3Ugh5mj8VrjFh
	dAH+EDn43+I2Oatz0y5CL/ypFvqbYvLapCfE8qrL9Ls6xBSIgDTkzwXZbPFYEwKGdeQUXeJQ4EZ
	C8cgSWLaIWe63a8BEYBdxsBjWJwqSZOw6KwRyl+org3i6AX8mzlZzH0pfVc9FH2FPNqux9EWfu0
	dhtgxeUV42DhbPEYOZUFBYlr3QQ==
X-Google-Smtp-Source: AGHT+IE+u9IjJy5DnG3IQAouxiGs+RqUt0Ha90G1K5TW/7uCSs9nbBzWj+oWsSVfWQZ0oTWVcwd35w==
X-Received: by 2002:a05:6e02:16cb:b0:3df:3be7:59d1 with SMTP id e9e14a558f8ab-3df3be7658cmr35101075ab.11.1750889461833;
        Wed, 25 Jun 2025 15:11:01 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3df2d32d228sm13202125ab.41.2025.06.25.15.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 15:10:56 -0700 (PDT)
Message-ID: <a99ad08a-99b2-4e39-a2d1-28302d312735@riscstar.com>
Date: Wed, 25 Jun 2025 17:10:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-5-elder@riscstar.com>
 <202506252201262779aa6c@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202506252201262779aa6c@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_151103_101603_638A53B0 
X-CRM114-Status: GOOD (  25.66  )
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

On 6/25/25 5:01 PM, Alexandre Belloni wrote:
> On 25/06/2025 11:41:15-0500, Alex Elder wrote:
>> +/*
>> + * The P1 hardware documentation states that the register values are
>> + * latched to ensure a consistent time snapshot within the registers,
>> + * but these are in fact unstable due to a bug in the hardware design.
>> + * So we loop until we get two identical readings.
>> + */
>> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	struct regmap *regmap = p1->regmap;
>> +	u32 count = RTC_READ_TRIES;
>> +	u8 times[2][6];
>> +	size_t size;
>> +	u32 i = 0;
>> +	u8 *time;
>> +	int ret;
>> +
>> +	size = sizeof(times[0]);
>> +	ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	do {
>> +		i = 1 - i;
>> +		ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
>> +		if (ret)
>> +			return ret;
>> +	} while (memcmp(times[i], times[1 - i], size) && --count);
> 
> Simply checking the seconds is enough, unless you expect regmap_bulk_read to ake
> more than a minute so you don't need a two dimension array.

I hadn't thought it through, but you're right.  I'll still
do bulk reads but will save only the seconds register and
compare it to the previous.

> 
>> +
>> +	if (!count)
>> +		return -EIO;
>> +
>> +	time = &times[0][0];
>> +
>> +	t->tm_sec = time[0] & GENMASK(5, 0);
>> +	t->tm_min = time[1] & GENMASK(5, 0);
>> +	t->tm_hour = time[2] & GENMASK(4, 0);
>> +	t->tm_mday = (time[3] & GENMASK(4, 0)) + 1;
>> +	t->tm_mon = time[4] & GENMASK(3, 0);
>> +	t->tm_year = (time[5] & GENMASK(5, 0)) + 100;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * The P1 hardware documentation states that values in the registers are
>> + * latched so when written they represent a consistent time snapshot.
>> + * Nevertheless, this is not guaranteed by the implementation, so we must
>> + * disable the RTC while updating it.
>> + */
>> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	struct regmap *regmap = p1->regmap;
>> +	u8 time[6];
>> +	int ret2;
>> +	int ret;
>> +
>> +	time[0] = t->tm_sec;
>> +	time[1] = t->tm_min;
>> +	time[2] = t->tm_hour;
>> +	time[3] = t->tm_mday - 1;
>> +	time[4] = t->tm_mon;
>> +	time[5] = t->tm_year - 100;
>> +
>> +	/* Disable the RTC to update; re-enable again when done */
>> +	ret = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
>> +
> Honnestly, I'd simply go for
> 
> 	if (ret)
> 		return ret;
> 
> Here, you are trying to set the time, I'm not sure it is worth trying to
> reenable the rtc while hoping the previous time has been kept.

OK.  I normally at least try to return to the original state
even when errors occur.

I don't know who updates the RTC, but I suppose if any error
occurs writing a value they should assume it's "not working".

> This also shows that p1_rtc_read_time should check that RTC_EN is set, else it
> knows the time has never been set and is invalid.

That's a good point.  I'll add a check.  And with that it should
be fine to return without re-enabling.

Thanks for your review.  I'll wait until tomorrow to send the
next version.

					-Alex

>> +	ret2 = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, RTC_EN);
>> +
>> +	return ret ? : ret2;		/* Return the first error */
> 
> 
>> +}
>> +
>> +static const struct rtc_class_ops p1_rtc_class_ops = {
>> +	.read_time = p1_rtc_read_time,
>> +	.set_time = p1_rtc_set_time,
>> +};
>> +
>> +static int p1_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_device *rtc;
>> +	struct p1_rtc *p1;
>> +
>> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
>> +	if (!p1)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(dev, p1);
>> +
>> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (!p1->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
>> +
>> +	rtc = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(rtc))
>> +		return dev_err_probe(dev, PTR_ERR(rtc),
>> +				     "error allocating device\n");
>> +	p1->rtc = rtc;
>> +
>> +	rtc->ops = &p1_rtc_class_ops;
>> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
>> +
>> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
>> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
>> +
>> +	return devm_rtc_register_device(rtc);
>> +}
>> +
>> +static struct platform_driver p1_rtc_driver = {
>> +	.probe = p1_rtc_probe,
>> +	.driver = {
>> +		.name = MOD_NAME,
>> +	},
>> +};
>> +
>> +module_platform_driver(p1_rtc_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" MOD_NAME);
>> -- 
>> 2.45.2
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
