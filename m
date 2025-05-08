Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87611C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cj6HgmSKC4fixG4Cx64Sk9A/TVxUPVJSbwhBju6p9o=; b=LrB4BGcZn4LcxW
	ii2diyyoBDWPLbSAHjZ0wx2K57VGO4uDqT9HYp9XOJJOBCP6anJXhlKRMW09IDaEV/qrc8OZVgNzp
	59ukh8eIkI7Mo95DvkaKrtR9JNDX8ZPkj5e2gPNznUvkdG07iA2VvFJ+dR/CC0Qdu83LQsITQnNC2
	3oBYUfHBWlG5k52hyZpk74u5Szx4c2g9FiZO+5yZrRVQAG/OWeUF0ZnUN1hgmFvqXvtwuHAHuP55/
	ZI9nhLihe3tV1Zaw+0KvDenYVkDKEPr0Jy9eO1TmJekLqIBMM2QzNBerkWd+8rKv5uaNbpikCRab9
	ZBoqLToSsjrXWHaTm/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Lb-00000000kwx-3zji;
	Thu, 08 May 2025 13:31:35 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0No-00000000cBP-2qKW
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:29:49 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-861525e9b0aso81032639f.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746707388; x=1747312188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EchSTz2ixLAWYTB96sLu87zXRfh/aWLsrM0Vf/7G5Gc=;
        b=zYR2jHClzEM9mjD7GMmcuMzgAfR/wYU20n80KewwRu5Zm8v5diDvR46yqcDXgJafaY
         7gg7aYi704ansb92VASxnLnSMLMLem394yPU9mXuR/1xhr5NZVuZkjh1nFUV5ceKMfZ6
         /E0F3o85NBaiXyHo8S9ircXed9yAGJ7ldr0kEophw2uxW0wtT20PzVsTrQ9Gbq9Yz0zA
         3aZe5N/K8v+F87hVnS/mbvyliElm0LLwQAPjUpH9+XqSFhNcQvSFlgf6q3F3RjHP0KGv
         EDKKkEPsOGSB8CJUnES3lwD1JRJA9zQRTWuBHqzovMMjPL6En+6u1V/ddYw1o3iXoXLl
         iYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707388; x=1747312188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EchSTz2ixLAWYTB96sLu87zXRfh/aWLsrM0Vf/7G5Gc=;
        b=QKP7nkHqS5uSvto0fWLIf/FLFZVHkpYFMqYD4CryRJeG5VDnNDjPYLl1tHos7t/XKn
         fNAcDCcYgxy4d4n3+u0YAR5CFYVQkjysATt7u9p2EONOGltpbxh49OcfPbFPtmanZFvD
         F+0Rz5G9kSUxfuz4B1wZEFh82hM4KlWXFZQkgdhKs8ByDuDyVKNHXeP8AkW0cs3heeUn
         cIPDsx64HBGUoT6NmKy2VEYJL7lb62+J0hqSlkSsN3CHhBm4yrCnKokwyDwBxS1nRxsd
         2EoemewH5XPk0FXuIzqbw+KiVjG9hpZ4LfIxenoPu7J6/CMGHj/g29rpSi/XvCUMANL3
         Bvpw==
X-Forwarded-Encrypted: i=1; AJvYcCUwhD1a9CeLdO/s1zYDZrB223/t1yptm1FhdfEleBl01FZ/LDbEGHcE8MgsZa7UTW0dFtwZDjtqRoHsrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ku8pwqSOOh7su61MSka5pKjK68lvv4Y3OIV4Mtqi6HVv7EM/
	wTY2sdKVxwmPgZ9by5V9WsAHWW4xpOpJoo00ccvH39W4PWG0egKU0tv5OOrmGSQ=
X-Gm-Gg: ASbGnctFkVLp2/N2z5scHkl/v2OACPG8FrJuf+/ztr6AZhSXUVHsHCJ1Z/pZVsB6QgO
	aXnOcEjPhAxALUz12K7V3eKXqdeo6zxyWGAHux3o41Kd/mv3MujBFCNodSvzWHgoLPcGsxUFr7u
	tmLdadL45nA0qjIOaEE7dsXbvSV2sZAbamtLtSn7Mz8xc8pcEMQlzDKrWrOpj0kB/OY8Ju8iHoo
	10u0YMnJB+u2GmZBC1GGMghdeoX5wbDC7QxzVdrHy2vJJOffEMh7eq/69fUMLgU54MADsGSj6j0
	fJbMkYtwsnHz24MDqq8FvrmVoSpLjulWsusUEZtMd/2aT3IKMLz73c1d40i/b7Y7NPmq3MRXJKI
	E/+BC
X-Google-Smtp-Source: AGHT+IF690lf3lW382YdkiJiBkYc8A/KfmHLjKI68D6s9G2Rm2ydeiV8IBPkiN5nxv5k+Txl9dCHlg==
X-Received: by 2002:a05:6602:3413:b0:867:17a6:9fd2 with SMTP id ca18e2360f4ac-8674737348bmr976931039f.9.1746707387766;
        Thu, 08 May 2025 05:29:47 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8cf769sm3129157173.2.2025.05.08.05.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:29:47 -0700 (PDT)
Message-ID: <65bc21e7-d936-492a-b095-4c1469932623@riscstar.com>
Date: Thu, 8 May 2025 07:29:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] reset: spacemit: define three more CCUs
To: Philipp Zabel <p.zabel@pengutronix.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-6-elder@riscstar.com>
 <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_052948_724311_34D985B9 
X-CRM114-Status: GOOD (  24.53  )
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

On 5/8/25 4:11 AM, Philipp Zabel wrote:
> On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
>> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
>> Define these resets so they can be used.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++
>>   drivers/reset/spacemit/k1.c   | 54 +++++++++++++++++++++++++++++++++++
>>   include/soc/spacemit/ccu_k1.h | 30 +++++++++++++++++++
>>   3 files changed, 108 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 6b1845e899e5f..bddc83aff23cd 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -939,6 +939,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
>>   	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>>   };
>>   
>> +static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
> 
> The /* No clocks in the RCPU CCU */ comment belongs here, instead of in
> the reset driver.
> 
> I wonder though, if these units have no clocks, why are they called
> CCUs? It doesn't make much sense to me to add their compatibles to the
> ccu-k1 driver only to load the reset aux driver. Why not just add a
> platform driver next to the aux driver in reset-spacemit.ko for these
> three?

In fact, the particular registers involved *do* have fields
to control some clocks, but there is currently no use for
them, so support for them isn't implemented.  The reset
controls in those registers are needed now, however.

I actually first implemented this as a small, separate reset
driver, only to learn late in the process that these other
clocks might be needed someday.

> 
>> +	.reset_name	= "rcpu-reset",
>> +};
>> +
>> +static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
>> +	.reset_name	= "rcpu2-reset",
>> +};
>> +
>> +static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
>> +	.reset_name	= "apbc2-reset",
>> +};
>> +
>>   static int spacemit_ccu_register(struct device *dev,
>>   				 struct regmap *regmap,
>>   				 struct regmap *lock_regmap,
>> @@ -1106,6 +1118,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
>> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
>> index 19a34f151b214..27434a1928261 100644
>> --- a/drivers/reset/spacemit/k1.c
>> +++ b/drivers/reset/spacemit/k1.c
>> @@ -137,6 +137,57 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
>>   	.count		= ARRAY_SIZE(apmu_resets),
>>   };
>>   
>> +static const struct ccu_reset_data rcpu_resets[] = {
>> +	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
>> +	/* No clocks in the RCPU CCU */
> 
> This information is not useful in the reset driver.

Yes, I think this was just copy-pasted from the previous code.
This won't be there in the next version.

					-Alex

> regards
> Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
