Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4845EC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 23:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJMQPdHjh3vzby40P0kqDcMSg6nIxiizRUEy8GCvE1Y=; b=tnBU7YHx4ybRbu
	ymopCmtkArL4hqMnrq3ZihPnHs24t+tkSgEvHhzVsSSD7OFawlE9YLtMtdRfFmgnLYzOEyrN8c6vv
	Tw1SY1ffoHk4liM80JwpCVrH68yl2Sh+pM+zCVS8GFlIN4gvjx2NUyGDxpDaUqJepABxj/6IVHUuP
	aHA79tlt0QnqQ9oJ+qymGcjba+h9Ov7ZuIgUK9DvfbjAkbbvs62uzSPrqmTrkgLtemPEUlpc4yBgQ
	4sq/W2Cc/dYS0hwoqVxufnQHgocG1muTsYkyxRE309stOKO/aiw3nJqHXIKlrr1DvlWcth/x+GxqE
	vyuEhrHi/CrOavXYqAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKnKO-0000000Aq6t-31cX;
	Fri, 21 Jun 2024 23:05:56 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKnKL-0000000Aq6A-0aht
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 23:05:54 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso1940722a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719011149; x=1719615949; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ULW/3eHHrWRT2nZLXN9A0n8RcowWVnXbz9YggVn00YE=;
        b=UtkM8QOCg4NtUZvEhozdnP/Zjxw4thYGE0Gm5+TGtPnwc7iuLP3/mQzQSooi2n0kMO
         tc+l7+wxpvnywLmIa1dkvA7Ac1+aP9wVoppLxEzq6+BZyMKXK/0BMS2/xKsjaligbAnC
         P+Gjub0XAkCeub2DllOYmtes27BF4Cx0Bru9r7NsN9JW7uBOvNSPIodGJGVxq8uMMsc0
         dgcis23nNFKUu0IHbK6h7oTQ96Og8+UMnF07m8nYeihM2Z/VSlTJF0mg0KYQxi1q3sC4
         bPXIBQCY57MQ6lS7BsDfjmrP4a7DJaZKp6Zg8ll3A2mpfqGfxU/G61gfFxdy5Rxxzra3
         1zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719011149; x=1719615949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULW/3eHHrWRT2nZLXN9A0n8RcowWVnXbz9YggVn00YE=;
        b=LZmy+5uViyL3I+9IsuNiK7xUjMd7IFmBPDLIpcNH2TNUh4hLWAMZu+8wXwChLKMbcK
         SUksYWe377lduxO+vNELiRnFeeOVJR5RXmiZIAhNkGQGQaKQlNPshTEnjwtQq8wmx8ZZ
         ImT1/XYf+7NKUSLniFxRUvske3HA+B0O1K9VOGEQX6hC9mhrdM/enAPbqtujJDKYnJzg
         rQBJP1FhT97bFlkwlmij1QjILv8tQj0NS4BdYbNG1BV4hYI2+vE1UKoSvi7x94aaQmq5
         uTv/fKY93sF8tJgrGsIXs/ozJpAmul6BH0gcCxvEzFBb/rLQjmgwPTyE+VYSav4mNdxt
         o2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyI7UuezbShywKA0lwks84ZJGu0ZGWAV3dFD9tNd9BY/+ogJ7DOLA6wOSg++jjOaiUiWuBnNVwiriQBRER4WxuVlOjlX6gAzfpSPvSeVgy
X-Gm-Message-State: AOJu0Yws1kR03Q7BIBZ2RueSmRVIUhnLK5BncAVu29sl/9c4HxbRVCJ4
	d3TJmNbAM1YiUe0HK0vV1T2A8Wh2EAbcVny5Bagr1gqGlfam3sPH
X-Google-Smtp-Source: AGHT+IGRmNtTdBJIu8yWAnaYB4XCVFvTkMTLWdi/tIzELf9g92QIGKSPxYfWyFK6zd/wIg0g6mkLUw==
X-Received: by 2002:a17:903:250:b0:1f7:167d:e291 with SMTP id d9443c01a7336-1f9aa4632d5mr112903685ad.47.1719011149269;
        Fri, 21 Jun 2024 16:05:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c608fsm19348585ad.157.2024.06.21.16.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 16:05:48 -0700 (PDT)
Message-ID: <52d97ca1-b9a3-4a50-8a74-6d56984791c8@roeck-us.net>
Date: Fri, 21 Jun 2024 16:05:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <PH7PR20MB4962C6D8FD6989BC79F9483FBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <PH7PR20MB49622B0A6E9169B04211C7AFBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <df0f11cb-3b44-4869-bfd6-6e5d01e6debd@roeck-us.net>
 <IA1PR20MB495341CA5F2148902B198EA2BBC92@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <IA1PR20MB495341CA5F2148902B198EA2BBC92@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_160553_226211_61A5D742 
X-CRM114-Status: GOOD (  18.74  )
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

On 6/21/24 15:45, Inochi Amaoto wrote:
> On Fri, Jun 21, 2024 at 08:19:10AM GMT, Guenter Roeck wrote:
>> On Sun, May 05, 2024 at 09:18:53AM +0800, Inochi Amaoto wrote:
>>> SG2042 use an external MCU to provide basic hardware information
>>> and thermal sensors.
>>>
>>> Add driver support for the onboard MCU of SG2042.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> ---
>>>   drivers/hwmon/Kconfig            |  11 +
>>>   drivers/hwmon/Makefile           |   1 +
>>>   drivers/hwmon/sg2042-hwmon-mcu.c | 531 +++++++++++++++++++++++++++++++
>>
>> Documentation missing.
>>
>>> +config SENSORS_SG2042_HWMON_MCU
>>
>> "SENSORS" and "HWMON" is redundant. Yes, I know, others do it
>> as well, but that doesn't make it less redundant.
>>
> 
> OK, I will short it.
> 
>>> +static DEVICE_ATTR_RO(board_type);
>>> +static DEVICE_ATTR_RO(firmware_version);
>>> +static DEVICE_ATTR_RO(pcb_version);
>>> +static DEVICE_ATTR_RO(reset_count);
>>> +static DEVICE_ATTR_RO(uptime);
>>> +static DEVICE_ATTR_RO(reset_reason);
>>> +static DEVICE_ATTR_RO(mcu_type);
>>> +static DEVICE_ATTR_RW(critical_action);
>>
>> None of the above are hardware monitoring attributes. They are not
>> acceptable as sysfs attributes. Some of them might be acceptable
>> as debugfs attributes.
>>
> 
> It are reasonable, I will move the hardware info to debugfs.
> 
>>> +static DEVICE_ATTR_RW(repower_temp);
>>> +
>>
>> For this one, I don't know what it is. If it is a temperature
>> limit, it should be implemented as one (for example as _emergency
>> limit).
>>
>> Guenter
> 
> "repower_temp" is the highest temperature for SG2042 to perform
> repower operation. It is not the emergency limit, but a recovery
> limit when the emergency limit is reached.
> 
> For example, when emergency temperature is set to 95 and repower
> temperature is set to 80. The board is off-power when it reachs
> 95 degree, and it will power on when the temperature is lower
> than 80 degree.
> 

That would then be the matching _hyst temperature. There is no need
to invent a non-standard attribute for it.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
