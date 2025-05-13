Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB4EC3ABCC
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCIp3bAG+4hDXYHgaY5oJG9BVvZ0FzOWeBTNLRtaBm8=; b=QAs8TGPZb3JZTm
	mIERX9TSsp+2b2Er9UsGv1EpNQatC4BC8ZXpfLxYkYxpKxbwDK/BV2j42I4anWBsNAgJGgynZleFI
	+XThfVa5xS63+QPP8V1Z5VgjEIJ4ZIJksGAfS0BEWYPHrdp+cdTCcgWJ/tPVaIT0MwXUlgxfZ4k8V
	RwIwMoCJxC5Z98PuPgsc6ixPUibRGwMH1C5bqyYAuA4C5UqHdBjnMo3gg4zI1aMwM2Y1fICx18b/O
	2BXGpMJ/nyIZED3kxiI0EjpGjBvhBPDx3ljMqH/Vf2aiDQxlcjtIEEpcT8UOBWVqXfqN0SeBdo4Vc
	c96LmsI/zO4dRjvHaFhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEogi-0000000CLiq-1lym;
	Tue, 13 May 2025 12:24:48 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEogg-0000000CLiK-21wv
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 12:24:48 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-861d7a09c88so95094739f.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747139085; x=1747743885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUukzgPxDimVlAEltPxV3Oz6fjf8xuwBqI/ZvbSdWbk=;
        b=s1RK/YpGK61ZHGdXfTZ7GxxxOMDuhJI8x21CDzkOcVfAx2M3yIqlB9/sRS9YMdyGPR
         ifHL9qOAsWCkbfkXQShDLn6xg2F25OASaTle6Fd0tyued842CdN0q/hUunUUdSl03afq
         kZ8cQ9Fq4ji/wF3M8hlUi1YLEGZ8Tw+6niYXFBAcAQWsB6fXaNonYw+k89w43R+yWFWr
         m/BvL35mtfwDR0LiR+Bo4UzXW8ZMINBuTBXsdx3kGVMoP5a53FSclVy4E5EZgJhoIt8X
         j56RCprmT30KzE41kTZkzMMl6avWGWjXC3U7mtHw8U/Yga7hAZlIbh19L7UXNloie7gr
         CE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747139085; x=1747743885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUukzgPxDimVlAEltPxV3Oz6fjf8xuwBqI/ZvbSdWbk=;
        b=QTNTMWlKAsWNGHs3qYPe1FGnyoxIGtprSIc3TchvdOvYLXIOweL+jDfYAtnSZcdVGw
         yeRDLSI/KQeWcDkLeEz+zuU1NW1+wcmOeeSvyJR9djN2/HKzpkMCOLD3Ax/daKxyuBTM
         S85sAMeZdaA/NJrBwEt8z5sLXoXY4CZWnQtRhCHADt0I/P9Cwa68PYpc88LWC7V/4VFA
         kYrBcxJR6fn++ZV27Wi/1TtKduAsYDhAASiFJ+LG+KRmXJqWKCrBsqf8moHqHSXzlB2a
         t8ypCu6XlVMHMOx4SO0iSJ6X56s7z9zuxFEVCr7Ido68ITbzw471rA/FvBnd4Z07uExz
         UqwA==
X-Forwarded-Encrypted: i=1; AJvYcCW2O8KEUz/lt4SdkRPOdhr3zRjV4LY/m6HGK/VhiC2P68kL4VHUiHo5/8ES+XU8Y4b91U5pTD+jSLRiHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAzacqFrwoCI2DzLl+mDVSa5YEpmdCR/OO6DhSPDf6Hm+JFeAD
	xuPqwjBosR60zb1zsczRChOBpvtOPJxQripDmad/LriaJjYdpyprT7e46n5Irpc=
X-Gm-Gg: ASbGncuwo01cosC75QWzalgO1QNsg/ZfrTQtyWtSnSUOnYtBY8IAwGbhNeAzDzFBxWk
	XBdOaEqs0vdEDykycHJxmRd+pJ5ZBhzIy8e8Wopbq55R8X8uSfdnF0uPUk7s8XEwEQw4Dd2zWcE
	U9RDK4PmbRzFTQrP59i5W4hTXhZhqO1UIqIBV0744I6LYt4HEwGfQGPY6FlqiTiYhDHjC3W185U
	BOjdljRl4262O29yfHY5vijd40lFBhJq5nwZmEdS4ubZJBhIchwnCLSe20jtkBfShJ1fuEscLJu
	8qmVQH2MEe1ZK+vTrb5PG5b18J8QLuziKzCLL5Jx1HVR1NYGvTSNQcUMM/AMWD02ayBGl77Lv4c
	LVdA1UFzcF7W2Eps=
X-Google-Smtp-Source: AGHT+IFa99yDPla8yOwa2Lb0IIWEjfvTvZm04RmCYhnJ6t18LZAeThH57cdW66O3OAMcaFau7kC0qQ==
X-Received: by 2002:a05:6e02:1a08:b0:3d9:644c:e3b0 with SMTP id e9e14a558f8ab-3da7e20dd8dmr165655765ab.14.1747139085428;
        Tue, 13 May 2025 05:24:45 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e158bfcsm26965915ab.58.2025.05.13.05.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 05:24:45 -0700 (PDT)
Message-ID: <560c33a8-4917-4c89-a8f3-ed7810fd675f@riscstar.com>
Date: Tue, 13 May 2025 07:24:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Philipp Zabel <p.zabel@pengutronix.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-5-elder@riscstar.com>
 <d25aa4b10e2ebefb36e0db03123b404044e71ec1.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <d25aa4b10e2ebefb36e0db03123b404044e71ec1.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_052446_726199_4971C929 
X-CRM114-Status: GOOD (  14.25  )
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

On 5/13/25 4:21 AM, Philipp Zabel wrote:
> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
>> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
>> device is an auxiliary device associated with a clock controller (CCU).
>>
>> This initial patch defines the reset controllers for the MPMU, APBC, and
>> MPMU CCUs, which already define clock controllers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/reset/Kconfig          |   9 ++
>>   drivers/reset/Makefile         |   1 +
>>   drivers/reset/reset-spacemit.c | 246 +++++++++++++++++++++++++++++++++
>>   3 files changed, 256 insertions(+)
>>   create mode 100644 drivers/reset/reset-spacemit.c
>>
> [...]
>> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
>> new file mode 100644
>> index 0000000000000..eff67bdc8adba
>> --- /dev/null
>> +++ b/drivers/reset/reset-spacemit.c
>> @@ -0,0 +1,246 @@
> [...]
>> +static int spacemit_reset_controller_register(struct device *dev,
>> +			       struct ccu_reset_controller *controller)
> 
> Align to open parenthesis, line length is fine.
> 
>> +{
>> +	struct reset_controller_dev *rcdev = &controller->rcdev;
>> +
>> +	rcdev->ops = &spacemit_reset_control_ops;
>> +	rcdev->owner = THIS_MODULE;
>> +	rcdev->of_node = dev->of_node;
>> +	rcdev->nr_resets = controller->data->count;
>> +
>> +	return devm_reset_controller_register(dev, &controller->rcdev);
>> +}
>> +
>> +static int spacemit_reset_probe(struct auxiliary_device *adev,
>> +				const struct auxiliary_device_id *id)
>> +{
>> +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
>> +	const void *data = (void *)id->driver_data;
> 
> Unnecessary (void *) detour. Just cast to (const struct
> ccu_reset_controller_data *) directly. Otherwise,
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thank you very much for your review.  I'll update to incorporate
your suggestions and will add your Reviewed-by.

					-Alex

> 
> regards
> Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
