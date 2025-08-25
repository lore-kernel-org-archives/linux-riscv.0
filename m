Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB4FCA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IphIosEtzmyozExFnaTLNuJWSkjVEgLXRMa6BVbCRk=; b=XGSec/78RlEZpI
	asZJNwJeGqlsPqNiUmKtA9FAjZ6/ucSRk1OmtINkTAJfdi9TZy4C5pesEuOgb+n7tMTTq89JR3+UO
	uLmeITWkgumdOGvMn5Ps23LvgzCVx3oBwz21tAEjGcMM069NuDjZeKBpCQ5hMZ45XAKQUsgBHjxzt
	1IQ0LvGUrLjhhlxws1OiPI1JoxrzF1IF8Oj0g8YS3xE1UwRB2AxMbQocPxhYaUeZ9N6wxmx3utplC
	VhmDrs+3kqlLZn8cvXLNbjIWMdLLe2DQzo1vifOhMmEs/3NBY2MBGb5ZH1A+KmfpbQnoTuOzSg2ji
	G1w+ceMDCx32Ouom/HLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYo-00000008kQd-38mA;
	Mon, 25 Aug 2025 17:00:46 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZkX-00000008cam-02HN
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 16:08:50 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-88432e6700dso71353039f.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756138127; x=1756742927; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0cjzzyWOyZks1nTu1rGjk9KV3egwe1aayyTboNLSe0=;
        b=oWRGr1z0GJf3n1VRbaeTpVgpyyN7Pndvhb8xRucdFYGTd1MPixhHwA/WyidaapNCsZ
         /YlXEspmo0us0m1/fX8ZBWtTsXd2bDVJd8znzyCAE3o+L04AsSCXyrU66uX4bujaFox6
         R7OrCx9m1vGQAxjLanIucQsakVftCnc2f8TYB12fCzB7pbqN03tSg4z1oJ5QvVcC+Q0R
         IF0hKSYkYy1hGZvKai3+dAkjy+erEJmuyVbpGzkkDRpIYIaERY8dw7Wje5lKaKHIjQUc
         8IJ67nzoviHIiEKEEGKNkoN+GARsCs86HQNRAjmf964VakhqKW0wGxwQ/SlkHEUC/p0A
         UjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756138127; x=1756742927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0cjzzyWOyZks1nTu1rGjk9KV3egwe1aayyTboNLSe0=;
        b=dklNJUDN7wrXlxfL/C2ZxR0XI0RdxsIIADuarq+6Une9+UwI4eekeJ+g3ls9a3GLn2
         +YUzjGlIOAp+Ogt07bLVmlkove2zdMVZedzoNvOb/DcScE03tdLdlUQ+76sLWs3EOYBu
         uZmb8C1FL17URPdyw2ZK5C6zvULHJ9ga63noGWUuxmPsxBX/Xpb3pvTpLxReHbSVcFdC
         k+OPfStMTHbdNLQ/zJdKjfJa6eFCEv4FOVvsTV+eC9lra87gN63I+Pg048wQmnk6A59N
         tRqXWJ6EJA/UaKQAi2gIiaX5PwwcZ68e+3XYSCp4Hm60a2jSRQe8V0farzcEURlDwoXp
         1vwg==
X-Forwarded-Encrypted: i=1; AJvYcCWNCZCxf8yiFmgJqcVLUmqZDJ6qGEquusKMtMQo3KKFch9G6rnHnbCbJc8xT62aRnlphw5BKAOfV0mu4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWsD4NyMGxdm9XgwkQ74bmemfOzCivGtWIpNHiX4EiCMZGCGMe
	/VTzBHtmsfK6RtLSJEy8aMysmEY9Xx4Jn2D/eXMuLGXtykw+AoReBZ/16JfB9CQoKDI=
X-Gm-Gg: ASbGncv5xpStCSp6sKDuiLBkLYo/WWFRT/8EAZZLQ42FcZVN1NpMirO4ZsuP3KB19gc
	MduxTEz6tp4HpprdzsgHKWUG3g2orzgScPdEAjj5wiFmTa0IJgWIww7qEmP8VIREN7HxNSGlWta
	Ec5HjQYVdHHzg7JaI2U/X6V3QRJ66F6aqv9RPmgNehRG7MmVo7V5JN0552IyysQYM40jAdzBYPw
	D6x+9+ZpWqDR1uyElh350AdBO5JvkjozBzujstY9XjqppAv7R744hQHcT3HVqh3LD+9s2ERd06P
	KJH6UqlmkSFHhgeM8V6YD4M4D5IfPUL2aDAd4Xoz7Ankrla9waEy69BTLnqIZAll9P9up8MeLaI
	X3svvV089F6451OvD33TzZ8zWDhumo88Ugr8XkrkoT1b6XXfc1h5csDOVlKRzPw==
X-Google-Smtp-Source: AGHT+IEL2QvsFMnDcZXTzmhm/4l1RIr9WfujVlwMQrzr/6F7bd2mjY4YQv7lvRHHyhZ+U5TJ7ij4Pw==
X-Received: by 2002:a05:6602:2b07:b0:886:c53c:9172 with SMTP id ca18e2360f4ac-886c53c932cmr1606713739f.18.1756138127315;
        Mon, 25 Aug 2025 09:08:47 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886c8f0a83esm502245639f.10.2025.08.25.09.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 09:08:46 -0700 (PDT)
Message-ID: <b387ebdd-ae5d-4711-9e10-c61cb06f4b5b@riscstar.com>
Date: Mon, 25 Aug 2025 11:08:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-3-elder@riscstar.com>
 <089D29348F246F2C+aJ6bPgJsp5GjhDs5@LT-Guozexi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <089D29348F246F2C+aJ6bPgJsp5GjhDs5@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_090849_293411_EEFBD1A3 
X-CRM114-Status: GOOD (  24.46  )
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

On 8/14/25 9:28 PM, Troy Mitchell wrote:
> Hi, Alex,
> 
> I did not find any accesses to the P1 shutdown or reboot registers here.
> Does this mean that the current series does not support reboot or shutdown?

Yes, that is correct.

> If so, do you have any plans to support this functionality?

At this time I personally don't have any plans to add this, but
it could be added later (by anyone).

I actually attempted to do this initially, but gave up.  The PMIC
is accessed via I2C, and I needed to implement a non-blocking
version of the I2C register write operation.  I tried that, but
then found that the shutdown or reboot still did not work reliably.
As it was, this was more than I originally planned to do, so I just
implemented the simple RTC operations instead.

					-Alex

> If I have misunderstood, please correct me.
> 
> Best regards,
> Troy
> 
> 
> On Tue, Aug 12, 2025 at 09:45:03PM -0500, Alex Elder wrote:
>> Enable support for the RTC and regulators found in the SpacemiT P1
>> PMIC.  Support is implemented by the simple I2C MFD driver.
>>
>> The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
>> PMIC provides 6 buck converters and 12 LDO regulators.  It also
>> implements a switch, watchdog timer, real-time clock, and more.
>> Initially its RTC and regulators are supported.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/mfd/Kconfig          | 11 +++++++++++
>>   drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 425c5fba6cb1e..4d6a5a3a27220 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1238,6 +1238,17 @@ config MFD_QCOM_RPM
>>   	  Say M here if you want to include support for the Qualcomm RPM as a
>>   	  module. This will build a module called "qcom_rpm".
>>   
>> +config MFD_SPACEMIT_P1
>> +	tristate "SpacemiT P1 PMIC"
>> +	depends on I2C
>> +	select MFD_SIMPLE_MFD_I2C
>> +	help
>> +	  This option supports the I2C-based SpacemiT P1 PMIC, which
>> +	  contains regulators, a power switch, GPIOs, an RTC, and more.
>> +	  This option is selected when any of the supported sub-devices
>> +	  is configured.  The basic functionality is implemented by the
>> +	  simple MFD I2C driver.
>> +
>>   config MFD_SPMI_PMIC
>>   	tristate "Qualcomm SPMI PMICs"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 22159913bea03..47ffaac035cae 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
>>   	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
>>   };
>>   
>> +
>> +static const struct regmap_config spacemit_p1_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +};
>> +
>> +static const struct mfd_cell spacemit_p1_cells[] = {
>> +	{ .name = "spacemit-p1-regulator", },
>> +	{ .name = "spacemit-p1-rtc", },
>> +};
>> +
>> +static const struct simple_mfd_data spacemit_p1 = {
>> +	.regmap_config = &spacemit_p1_regmap_config,
>> +	.mfd_cell = spacemit_p1_cells,
>> +	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
>> +};
>> +
>>   static const struct of_device_id simple_mfd_i2c_of_match[] = {
>>   	{ .compatible = "kontron,sl28cpld" },
>>   	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
>>   	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
>>   	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
>>   	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
>> +	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
>>   	{}
>>   };
>>   MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
>> -- 
>> 2.48.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
