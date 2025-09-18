Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89D9CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DIsp1vLD3JXdHmrs2SdvjeoiKPkxQZWFjUdLLm3XPY=; b=jJJDM2/B+c+Ab8
	IEUNgzGu4jedq+tPo4H+evGB5By8OfJy0QSTrffSRHrmZ6paLxla60fHDdSygjQuTwVFjcrzOdedI
	mxwwXE2Gy9JJb7xuX9nVobJUeWlJ0bgHXs845/B6dgVgogInrMdeQBvE0dOof7/RKuNHg+PGJDf2Y
	L50w2nfk20rKavU4ktViJVTNUNYKtJsheORMGVkfFRqxXwanwcPGW1mtcnYDcwX6VhwZq9e+aRhdX
	Hz+e+oLl8Eb18eiKuDkB8dKdsy2UWBdSiG4yYNPhZN7qjO6t5ES1USWwWpDPKDGh3Kk8DYgL1qBdb
	eHnFGAyusKFqNqUp1eMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDJ4-0000000HJaG-1kuN;
	Thu, 18 Sep 2025 12:00:10 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDJ2-0000000HJZB-1CO7
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 12:00:09 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-42455d1f89aso2260825ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758196807; x=1758801607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qhRL1lPN/JJ3TtUo+Jx4GT/xOTZw7lSfANOvM3eSdY=;
        b=HzFSbycTK8aEImWndLDTP1DDeLgvTuLxa/FiDyThSZwWpG2s0yvVAxEnCj2llWwNlg
         9OZYfDbaxxC9AfyIJrxQHozeIgM8dXt3txuDLpU47/wC3ntQuB9030h89qCd5vbdemLz
         5ZN61+42cWaw4EQ5Y9fwWg4Wlisaf3AnoPhPc+FUpPP/pNlpgTCEGTE8FNd86HfGuNjZ
         ZI+XQnx/y9NHHUJNaEeUWXh/S90pdc08+HVNxc4kneP5feHz/tIpRD1iwWK+TsD8AOZc
         59Afg3v61vwgixSMZJCMHVf/6U+lSZ7BX5vHYtKIPME7s8S9uS7drpdEeGqviqVsUzmN
         qKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758196807; x=1758801607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qhRL1lPN/JJ3TtUo+Jx4GT/xOTZw7lSfANOvM3eSdY=;
        b=Pfdzg4M4ddRHu7nhq9sy4N1fwttvXWI7VqAxQ9VlCr73Pfn69pV4N3ePNynMqy+8jq
         7kd2VK/yYSaMEM1UlXBhAYbSvf87f2LbZvVIhhZi3b2H8mZ/rJSsLJk6j0g3igtcHpxW
         NALTb66wLrdaFYk0xDi4MmJIortpLCfXuzHMD6Jd5ZA2YMjpTuZ9yMkxPO5BZjWXoAVM
         sa1JEHfXkyXYCO/IoYrnFNm8TtMkOGBg9YjOKjMVH2WYECKmGRm9qi0TCHxsDQqL23Az
         0dvX3U0xQJrEg4oDLpdpMQlXXqVO7btShnvqo5OFH7m1VLrh1Gg3UYLJbr713uKv1Kmr
         E0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWOW4Se0vmRzHt3HAdyEmUlgsirQdkqhzjykhD2GEWsiBxpYSCqnvkGxt9AemoBKYNq8lAoWjeT5ALilQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyInkOI6bZYDtBR+F/HkUYcd4fndLlSFi9VS4ZzLkd9kV35Hjw
	6M7xyZN7HdogFyzwpbIldAanJODJDrDEJIeBM9E7tewiHfhGWL/wSOKrGhipq6HB7E4=
X-Gm-Gg: ASbGncukcoLol1RUYKFHoWTbPy4vQFOz4HlbI1lr9Zf3ZBowP6eqPn/9jf6a1KYOZDD
	tcEs0S1HuIPSHVsOIw38o6s3XKEQT4zAZ9iH3vjjJXv6K4YWGhhGQfCXLhV3DibZHezKDmAyIes
	HPJdVvLY+83yShdmaPM2X+STZ0ZP8J3LcgOFAkhCHMu208FdE0KYkeNtKDAIP//d1VOCfLprfwR
	9aBbLCYPPsx/ITVmMCOaparwITOrjvAXfda0MAW6K6TV1UT/WpR9AEHNnRv6j+x7WqJLgOdF6z2
	a06zRk1IvTpRn/C2JsjK4K3ydIYpaYOdzyCRHPxqVoaEi7l8mVbN6tHwXDCcvoMiPCNllP8W1q+
	esqHm3hk2YKhJ06pSTjSHSk884dq/s3oggEtT2Us0jnP2xHOSfsjTLUEtWHqqoPuxF5g1ZgRv6V
	Bf9FVLUw==
X-Google-Smtp-Source: AGHT+IFQAoOoSgU3pp/rBPSgXlJVaHY1FXv4zqmRznbRq1wJRwagCo1+JA2yZnbtsBf93bWGJ+FcbA==
X-Received: by 2002:a92:c265:0:b0:424:bec:49f5 with SMTP id e9e14a558f8ab-4241a52891amr66059875ab.15.1758196807090;
        Thu, 18 Sep 2025 05:00:07 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa5dc6sm876180173.47.2025.09.18.05.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 05:00:06 -0700 (PDT)
Message-ID: <95d9b310-7edc-47b1-ba9c-81390e9a8532@riscstar.com>
Date: Thu, 18 Sep 2025 07:00:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <4C1E339412373423+aMu5I4jmngaN0rOy@LT-Guozexi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <4C1E339412373423+aMu5I4jmngaN0rOy@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_050008_333598_6FC66938 
X-CRM114-Status: GOOD (  15.03  )
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

On 9/18/25 2:47 AM, Troy Mitchell wrote:
> On Wed, Sep 17, 2025 at 05:07:22PM -0500, Alex Elder wrote:
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/Kconfig           |   8 +
>>   drivers/spi/Makefile          |   1 +
>>   drivers/spi/spi-spacemit-k1.c | 985 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 994 insertions(+)
>>   create mode 100644 drivers/spi/spi-spacemit-k1.c
>>
>> +static void k1_spi_remove(struct platform_device *pdev)
>> +{
>> +	struct k1_spi_driver_data *drv_data = platform_get_drvdata(pdev);
>> +
>> +	k1_spi_register_reset(drv_data, false);
>> +}
>> +
>> +static struct platform_driver k1_spi_driver = {
>> +	.driver = {
>> +		.name	= "k1x-spi",

Oh wow I missed that one!  Yes it will be "k1-spi".

Thanks.

					-Alex

> k1x? iis it from vendor driver? please keep k1-spi
> 
>                  - Troy
> 
>> +		.of_match_table = k1_spi_dt_ids,
>> +	},
>> +	.probe = k1_spi_probe,
>> +	.remove = k1_spi_remove,
>> +};
>> +
>> +module_platform_driver(k1_spi_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT K1 SPI controller driver");
>> +MODULE_LICENSE("GPL");
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
