Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC68C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1REuUl+RpTFJQl+LL/JMeC+mYfKWJDOmqHpumdmJGQ=; b=f7HL7UJR75K6wE
	ow8D0Q1RfUPKWsYTUUwmtlobFPQQYVfOEtQCeIlnwBtJm2KSVVJUCQCxErBGHYl+l1bFyTFvznASz
	5CIdeSKmf4sxTxIzl6rwLc+DhL3gVjgb1nz9esBSe/mkY9c6wMOi/IpSvSPsfgKSVA3C4EOZLQYGI
	rbObq3NhmQzlcFpZ7ADrt6+ZtBJSVFTRLrfxO75JeQWJZe0v/1GMEjpOqM108YgU8QTIIvQi+v5V5
	hAFE+oUrTd+YGaBIRKiLHyIi+PKNWr56GqidmtoBcGaXx023FRE4twJdI294AAQE42iM5Cjb9A+c2
	flPhu27svgzI2MzYuwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fSS-00000005kiP-2X7S;
	Tue, 15 Apr 2025 12:32:08 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eXt-00000005Yxr-3bRY
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 11:33:43 +0000
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-861b1f04b99so25493939f.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744716820; x=1745321620; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEN8NSjUS40oEvDS4Uv025vPGmuL5XNuea1dSWlYY68=;
        b=0MMbK6pAT2NnhGEpjKAhlrtZCzlqkgA20jEcCQlgKDubNdrargCWKhvPRxwJuDvp+F
         SxR+t2X8O8PINDiIEwchIXT6KFHc4ahnSLMDx84eiMTO7h+fhPM+mBdVEMoGM/fMFcXG
         9GsYZfbHqyZpw8nzsypLDwBPeVtY54htEpVah7uWUBZNrdeYHmbiZia3bJvbKB3EoND3
         MK9VEoIRq5oQxQPqWC5BZe3lFbRKW/bSM6DsBvhxYl4IhK631YcLB7Fh7RhNVq5SFpm0
         08AdeoOUheHqtpaykQI3wk5H6F9v6xTI2SP5YnqpAirq86qKZxcEByLcTwGZMOJZH2Cv
         rSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716820; x=1745321620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEN8NSjUS40oEvDS4Uv025vPGmuL5XNuea1dSWlYY68=;
        b=qndReKrMFQXL4YHAqyoFcOv2QW+HKkaeMAlaJhvNmWM4dzqAOgiGX+tATTfwxSn9Zp
         ePAIvMHWQA904NcsM+BWJ5SFan3tAtR6K4R4X4etaxiesjpU16Kvkp+HxyAtXvXzUI5T
         PUygMNbP3vEGWbuPLtK9TdPjtvSJe8FGTcd8iUdZDP1/X7UoHkv0WxA1ZBwS0J9efwjC
         UxZxA1bDImIwu1/ka+2IBp16QIQf3iu/OkLWg6I6F4UnFhQgQhV/hkfhk+RlJLl0obDD
         p1KbbIF0zPOuFPy+6+dJSJqNvNAthbiu7RATpyqGBz5svPjHjufhhSppuiw8thNFQBE7
         D3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUU/EKCto++2MqntSnnGm2UvrhTRfpUEPbqL0RYLLLsWdehi9bc8+bKKVmjK9kwd7eHeFGnPVu73zK50Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFIf1cefIrdUqaAoEibiC/Wjrp5M4HvCfe7mz2NnRuz7+MyKU7
	n8iNcOVTOIobLo48AbllUMQLFdLkjcGfALU9TaBDbZF6Tr5JV0Ov/cwJXt7LpA4=
X-Gm-Gg: ASbGncuWZ/qxZ2ZpwCofp316AEJcQWpNDDwZKt0HdnwLMLMkhbkE66weVPhdz4PSiZy
	0sW81XF3PFJTZD8pNQuthTmAFnZt+n53WWZnBfk0GWLPXxW/Ra6ltT70ShpFp+PVn1V7/NUXPCL
	eRF8tskj1ixmym0aQ+O/z0JoSOsioSgHtC38F7Hs15KFZd8XzYovZOfFPKwrQGIqoPy8N8bOjd6
	qIisQ8Lw2OnahQ/nZIclV5zrJUf+6Kt/gRhXdH+tqUG6tmevvPrcevePD2UBUA2ncp2ZrrSVgmh
	l2ZWvVKGmfbxaMH6lyf5uIKqhBf5YuECbxPGvrQKyFTCrdnXYSma4MNbhivDp/JtEpWSL6L6kp5
	ETGx2
X-Google-Smtp-Source: AGHT+IFKkxJRsXzR7nky7WLvCENHLBsur2OzCblaH3VpEQ3uFHRRX61ZERpvrmJSp4XMt/JAkHbCEg==
X-Received: by 2002:a05:6602:3785:b0:85e:201e:3e35 with SMTP id ca18e2360f4ac-8617cb61445mr1651925539f.3.1744716820321;
        Tue, 15 Apr 2025 04:33:40 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861656e18b2sm251622939f.45.2025.04.15.04.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:33:39 -0700 (PDT)
Message-ID: <fa4ae3d7-7683-4205-a36b-3bda3ac177c9@riscstar.com>
Date: Tue, 15 Apr 2025 06:33:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clk: spacemit: define new syscons with only resets
To: Philipp Zabel <p.zabel@pengutronix.de>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250414191715.2264758-1-elder@riscstar.com>
 <20250414191715.2264758-7-elder@riscstar.com>
 <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_043342_164393_F4A532BA 
X-CRM114-Status: GOOD (  16.48  )
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

On 4/15/25 3:22 AM, Philipp Zabel wrote:
> On Mo, 2025-04-14 at 14:17 -0500, Alex Elder wrote:
>> Enable support for three additional syscon CCUs which support reset
>> controls but no clocks:  ARCPU, RCPU2, and APBC2.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>

You are correct that those reset-only CCUs could have
their spacemit_ccu_data be const.

I'm going to give this series a little more time for
review but I'll gladly submit v5 with the added const
qualifier in those places.

Thanks.

					-Alex

>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 7494c97c3c7ec..cd1a0668bd203 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -130,6 +130,36 @@
>>   #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>>   #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>>   
>> +/* RCPU register offsets */
>> +#define RCPU_SSP0_CLK_RST		0x0028
>> +#define RCPU_I2C0_CLK_RST		0x0030
>> +#define RCPU_UART1_CLK_RST		0x003c
>> +#define RCPU_CAN_CLK_RST		0x0048
>> +#define RCPU_IR_CLK_RST			0x004c
>> +#define RCPU_UART0_CLK_RST		0x00d8
>> +#define AUDIO_HDMI_CLK_CTRL		0x2044
>> +
>> +/* RCPU2 register offsets */
>> +#define RCPU2_PWM0_CLK_RST		0x0000
>> +#define RCPU2_PWM1_CLK_RST		0x0004
>> +#define RCPU2_PWM2_CLK_RST		0x0008
>> +#define RCPU2_PWM3_CLK_RST		0x000c
>> +#define RCPU2_PWM4_CLK_RST		0x0010
>> +#define RCPU2_PWM5_CLK_RST		0x0014
>> +#define RCPU2_PWM6_CLK_RST		0x0018
>> +#define RCPU2_PWM7_CLK_RST		0x001c
>> +#define RCPU2_PWM8_CLK_RST		0x0020
>> +#define RCPU2_PWM9_CLK_RST		0x0024
>> +
>> +/* APBC2 register offsets */
>> +#define APBC2_UART1_CLK_RST		0x0000
>> +#define APBC2_SSP2_CLK_RST		0x0004
>> +#define APBC2_TWSI3_CLK_RST		0x0008
>> +#define APBC2_RTC_CLK_RST		0x000c
>> +#define APBC2_TIMERS0_CLK_RST		0x0010
>> +#define APBC2_KPC_CLK_RST		0x0014
>> +#define APBC2_GPIO_CLK_RST		0x001c
>> +
>>   struct ccu_reset_data {
>>   	u32 offset;
>>   	u32 assert_mask;
>> @@ -1177,6 +1207,57 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
>>   	.reset_num	= ARRAY_SIZE(apmu_reset_data),
>>   };
>>   
>> +static const struct ccu_reset_data rcpu_reset_data[] = {
>> +	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
>> +};
>> +
>> +static struct spacemit_ccu_data k1_ccu_rcpu_data = {
> 
> Could be const.
> 
>> +	/* No clocks in the RCPU CCU */
>> +	.reset_data	= rcpu_reset_data,
>> +	.reset_num	= ARRAY_SIZE(rcpu_reset_data),
>> +};
>> +
>> +static const struct ccu_reset_data rcpu2_reset_data[] = {
>> +	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>> +};
>> +
>> +static struct spacemit_ccu_data k1_ccu_rcpu2_data = {
> 
> const
> 
>> +	/* No clocks in the RCPU2 CCU */
>> +	.reset_data	= rcpu2_reset_data,
>> +	.reset_num	= ARRAY_SIZE(rcpu2_reset_data),
>> +};
>> +
>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>> +	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),
> 
> Superfluous parentheses.
> 
>> +};
>> +
>> +static struct spacemit_ccu_data k1_ccu_apbc2_data = {
> 
> const
> 
>> +	/* No clocks in the APBC2 CCU */
>> +	.reset_data	= apbc2_reset_data,
>> +	.reset_num	= ARRAY_SIZE(apbc2_reset_data),
>> +};
>> +
>>   static int spacemit_reset_update(struct reset_controller_dev *rcdev,
>>   				 unsigned long id, bool assert)
>>   {
>> @@ -1351,6 +1432,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
>>   		.compatible	= "spacemit,k1-syscon-apmu",
>>   		.data		= &k1_ccu_apmu_data,
>>   	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu",
>> +		.data		= &k1_ccu_rcpu_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu2",
>> +		.data		= &k1_ccu_rcpu2_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-apbc2",
>> +		.data		= &k1_ccu_apbc2_data,
>> +	},
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
> 
> regards
> Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
