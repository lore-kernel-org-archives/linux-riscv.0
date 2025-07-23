Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6EBC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 00:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvHGCCION1LxYuWFz4vqJhLbY5aYqHzP1UuDWb6suvo=; b=yCPMrdRa8hw6WE
	lQ8x9ngh88m2IAuQg0D/PcuDSwWsbUAq9FUsKi3J6HQjo1af3/1v/nZ5WtukYKDbB1HQFGH0cP9DE
	aAbIiry14cWWIoH9AYOInbmeYVnv2Y15P+XSBuC29mzXzEvY1htOydW/sfDOqeRmiTZB1LGLyMi3e
	GeyXO/TnsP/aaNgycGMTrdghFI5tqoS9+lg7uirIbnug0QK5NRUp2bqzmdBOLcR6lPzU0KfY7g26H
	rvuC20XpsxWJGdgEoNmMrkopBAz/M8xdA6ZwAOTa/DesHyio/kDdip+PhEPmQUo9ZNfYt8HCLmilk
	9b574LLH60vgAxsYcEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejSV-00000006Ckc-0CL9;
	Thu, 24 Jul 2025 00:05:15 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uej1D-00000006AEg-3k6l
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 23:37:05 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-87c11fd5364so17507939f.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 16:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753313823; x=1753918623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DbymwJT8wdKqXZ17BAMdeDqv5d1KXToHThDYCoTXr1s=;
        b=2ZgOmlD9NzRy0SzkcKIiEcGzFS2+6Sy/8PA6qurXcmmsEpBY4cwlwgx4mIiKbKeNGm
         AAIxC/tQ3nY9mccgjCsOM/umgNgF6qPgtaFWv3zaXGLNVYJaUBYK4eYftwAFXcMFO2Ks
         IGfGghdfYDbXIstEcEmFzy/Z/CtjNdehQAa5Bn1Z+Adz4eHgnR93B/zQghEGNscSjlno
         ACAhkvbzNMsH1NY8XshxFtr8OvWZm6s21oV0XwakkrGIFW47VgWigk5uU5PeAb9ZwOaH
         U5aP/CNMVKWveKAGram+EKA1qLkrXSpEWJgAJ2/a/koB5hLY/BF3o3VAlFdUEWm6lusW
         4CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313823; x=1753918623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbymwJT8wdKqXZ17BAMdeDqv5d1KXToHThDYCoTXr1s=;
        b=p/AaVQj1tY0OXyV3NelaM7wDvotJnqmVH1c2cWGOxhOh2FTxK7T16Sb/eSHn9C8GQX
         PtiHpOJZ2E0K6yJqCgPA66cLiTpV/0cOO9jtIyZtgYqsXXPp2ddZcJnsiWgwUWy782qh
         57CPYmTbxHkEAWfLPllf98EGMJAbf0RKosyHGWtEI5Vgj54znixaBjKEHb6g4LO41yTf
         jfrENbYXGJ/kAJ6MxvF9eaSNhfwZZhO7RRxn2A7QG5mSyi9pxB3TjQDJypZSCGRMBCgd
         6njeQs9JUyBqBJIQ+MqBbVmH9KuHO5qUcEWF4T41qqVNnuQ87tFu2VGceCU9DJHgZkfV
         Jbog==
X-Forwarded-Encrypted: i=1; AJvYcCVM69btOR37c1rqJfZHvYaynKcVErnTEd5Plg8F9S7LKgVbyZSWgCiSHBujEYv+dVwSAIMTZuGffiFfUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwanPmYtEkl7UvoMT/2/rJUNyJqrZN/f56vQm4g2EOolJdDIhuV
	ry5Pzyr3GimcRbfTbyVtXrMrDONEiuYQAQcm24aXkIbBf3QJVnFqasLDsSIahg7hF38=
X-Gm-Gg: ASbGncuRVXUjXM2yWh+SAkeg3a/8N+j9n04Pt0dw1qQomSSS+PLzu7IRv93riFMUGrH
	cHUJU/E4EmRAaoS+gUk4/LaZecXsmFdi1Q6Eynzv9r8qvIGdaKUsgkz3zjApa//jpu673rnzsD4
	QjbVwuR+on6rqCoUhVjWcbWOX47j4IzmU4dGWACsxsUl9y8E4lMulnAxqdcWLUOjXi/RCUa099R
	S2ZwzSWYA9o/jVlRM5zts4+byFdUYh9RtNSTj9GeL5DIj/iRgb8WpDploGLLRmewCS8iI33qA49
	UoHFJNeD51rfwOGRLG1RCercFIFhuDZUtKCThE4/UBs3sHa5NZsDCH0vt0HEoTjyCj+OxOKskyQ
	oPv0MroUT59if10eQNbHqPVpeqU9D0XIwqA==
X-Google-Smtp-Source: AGHT+IHNF5SD1Use82nEBRXm82QeoUFWLLGUU4rIloi5Cn7oMv86TpUYK3QDrbLvOOiD/JUxKOqJog==
X-Received: by 2002:a05:6602:6403:b0:873:1a0e:a496 with SMTP id ca18e2360f4ac-87c6505de5dmr798601539f.10.1753313822955;
        Wed, 23 Jul 2025 16:37:02 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508aea8da22sm65011173.38.2025.07.23.16.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 16:37:02 -0700 (PDT)
Message-ID: <6df61594-9a0c-4c18-8754-43fdff8474ca@riscstar.com>
Date: Wed, 23 Jul 2025 18:37:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] rtc: spacemit: support the SpacemiT P1 RTC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-6-elder@riscstar.com>
 <20250723213956570da462@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250723213956570da462@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163704_181029_825B82F1 
X-CRM114-Status: GOOD (  16.27  )
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

On 7/23/25 4:39 PM, Alexandre Belloni wrote:
> On 10/07/2025 12:51:03-0500, Alex Elder wrote:
>> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	struct regmap *regmap = p1->regmap;
>> +	u32 count = RTC_READ_TRIES;
>> +	u8 seconds;
>> +	u8 time[6];
>> +	int ret;
>> +
>> +	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
>> +		return -ENODEV;		/* RTC is disabled */
> 
> That should be -EINVAL, as all the other drivers have standardized this.
> 
> With this fixed,
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

OK thank you.  I'll plan to send v9 with this change included.

					-Alex

> 
> 
>> +
>> +	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
>> +	if (ret)
>> +		return ret;
>> +
>> +	do {
>> +		seconds = time[0];
>> +		ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
>> +		if (ret)
>> +			return ret;
>> +	} while (time[0] != seconds && --count);
>> +
>> +	if (!count)
>> +		return -EIO;		/* Unable to get a consistent result */
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
>> +	ret = regmap_clear_bits(regmap, RTC_CTRL, RTC_EN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* If something goes wrong, leave the RTC disabled */
>> +	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_set_bits(regmap, RTC_CTRL, RTC_EN);
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
