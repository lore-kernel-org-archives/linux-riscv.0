Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC20C2BD09
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9xja5VU3KJi7RmIQ4Ek1OOOAQlQEGqakkCEMkOO940=; b=ttGCnMEI1n5leT
	MoEJlOOxa/FU22JKUf2P7S1PGFHKM3G+gxh192wEtg07uqmA7wVJBin5tSkGLU7pNHmB0xS7cWjgn
	zMwg9ShZTriBngwVTPHVVWc68ZqXjLFeOKBkPzacFfTIMGCXHbzL1y7Qk9+C23ZdkLoRggOkPWChJ
	Ez3E+HdCFwKYPIWJ/bSUqNRzDeDrYOytegs0yrmgz4NHniongDeMmS4ZqZYh3WabrO+bl/o2k9qIf
	Ik22om7b6EwGP5u+ykurrkOlff5sHeJuVWXl9uZDbQiu7QS7ZXILR38VArxfWwo44eBs7P3Atj5om
	Pa4xSUjIrkUeDvax+ajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQGZN-00000001ClP-1dvH;
	Sun, 07 Jul 2024 01:20:01 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQGZK-00000001Ckw-1Ac1
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 01:19:59 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7fa6f6e45a7so18623939f.1
        for <linux-riscv@lists.infradead.org>; Sat, 06 Jul 2024 18:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720315197; x=1720919997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=19gER6V+PqCJdOhe6PBnQmpdkeHIDtXlX82EoX9sdBE=;
        b=TIzfcB32UIOheRIQjzNOaJjUIFFbUbhJPxD62gYM/Tr/MvsTeMmH4KDRf4l/trngxW
         7IrGxaBim1XFSlZ2eeZh/XwXeHNfTTwPFS50j2s4Bb2vdQ9cErxheYtb2OiB8o8pb11z
         8MXMDRJeXbdMr8wWFzRCtNd9w9fEHngnpaMgSJ6Gb0SgOC3GKSXeS2x/PcjnJ6Ssonuj
         n022tVPGGcuoA6mWW7o5vaXlozZPuHx3XVRraFjQY5op0eV0xtu054o05uQqLkbb/hEt
         RBFKXhyL6K6ZjH2s6/KqqRLvUVugzv8OR2W0kQApIL072FlF524iNOlSNVvwUlx2O3U5
         EzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720315197; x=1720919997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19gER6V+PqCJdOhe6PBnQmpdkeHIDtXlX82EoX9sdBE=;
        b=BvWCYppsNKVVBbX9OC6GlFVWXngy+Np85rFg6bPhM+RF0d47W2CuAWGbXz/s4cIc1v
         hjJhNG8ROmQc+O99MhaOobe/gSam2a81fMjXOiVmxlTaFoAQeNr8omDwUz0tfLXZ3dKf
         EI9sYcfw6hxlxF/VlGJ99Bqt3wP55RKr8X2vIZTH2Ib5dIIby0IroaDQmWt2WAP18s/W
         4j2WgJ4zojY6eDAB4WxeLXKt80HxhpaMRwhPkzv1M330vEOb8KBp94roo14QIO9fpJjZ
         /eS86/pMmix0V6oISB5V5W0XB4xhonDl5XME3pfJWp/KqWY7oCfF1Iwf05yNSIFAdC5I
         urmg==
X-Forwarded-Encrypted: i=1; AJvYcCWB0EqepevNqH0Ul0Wn5wOyg60ngEUPHAg3Y6j66vP9nJjxuZE7yNkKF/KvDoLoDQ5K0+D2pJAecamvFt/7JGyRP6AET4gqoZ392LAaMCtY
X-Gm-Message-State: AOJu0Yzm1Jg91uYqrXZIvJrtFdnQ18qm535u1W3PscBIbepp9P0lwq79
	+49gsMCQXiQ4fzaNVkv+OVHHv/OspJGQcHDTajnJTCHJ7eEg6MUNlBz6jQ==
X-Google-Smtp-Source: AGHT+IFdPMX5bNItqfSSiKUjXNcAyssN26A7ZPrBymkFLpbUN7wyo0MScBAdZlc4nQfMuhr5NQXW2w==
X-Received: by 2002:a05:6e02:1c27:b0:376:4aa0:1a99 with SMTP id e9e14a558f8ab-383991c0096mr111538605ab.8.1720315197166;
        Sat, 06 Jul 2024 18:19:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb7794f91bsm9512465ad.191.2024.07.06.18.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 18:19:56 -0700 (PDT)
Message-ID: <7747c4f1-7ef1-407c-a155-99fa0b77de50@roeck-us.net>
Date: Sat, 6 Jul 2024 18:19:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <IA1PR20MB4953967EA6AF3A6EFAE6AB10BBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953EC4C486B8D4B186BB848BBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <d2ecc9fd-93cf-4175-8074-b44c06b58313@roeck-us.net>
 <IA1PR20MB4953A4C47F52EBB2F200C50DBBD92@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <IA1PR20MB4953A4C47F52EBB2F200C50DBBD92@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_181958_439842_A66CF859 
X-CRM114-Status: GOOD (  11.22  )
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

On 7/6/24 17:31, Inochi Amaoto wrote:
> On Sat, Jul 06, 2024 at 07:52:47AM GMT, Guenter Roeck wrote:
>> On 7/2/24 19:30, Inochi Amaoto wrote:
>>> SG2042 use an external MCU to provide basic hardware information
>>> and thermal sensors.
>>>
>>> Add driver support for the onboard MCU of SG2042.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> ---
>>>    Documentation/hwmon/index.rst |   1 +
>>>    Documentation/hwmon/sgmcu.rst |  44 +++
>>>    drivers/hwmon/Kconfig         |  11 +
>>>    drivers/hwmon/Makefile        |   1 +
>>>    drivers/hwmon/sgmcu.c         | 585 ++++++++++++++++++++++++++++++++++
>>>    5 files changed, 642 insertions(+)
>>>    create mode 100644 Documentation/hwmon/sgmcu.rst
>>>    create mode 100644 drivers/hwmon/sgmcu.c
>>>
...
>>> +
>>> +static int sg2042_mcu_read_temp(struct device *dev,
>>> +				u32 attr, int channel,
>>> +				long *val)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
>>> +	long tmp;
>>
>> Why long ?
>>
> 
> just use to calculate the value.
> 

That is not a valid reason. There won't be any overflows, so int would
be good enough.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
