Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF776C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/63Ua+8CkZjE1qyX3sBWkMccx5OHLqnxoUWwNziJ71I=; b=fy5oxTwGHk1VW5
	xNyDa4MYPe6UW24hhLdnECYsulwfwWyEKLOWBEaz3Lw3KSwAG5xlcDBOxUR6vYndkqlZVCzzMHlNs
	KQAtuTdlHQNwGF9XxpCHBCUjs7jxFCBlG5H/6lUidSPSuSW6GY/zigqFv3FA56golDWsiuxYLIURU
	oe4z1AfQPYU501GlqhdJeY/lETrHWciNjGB1ZR15pkVXegZ2ay6eCRjkpNi4n1gm6gMnocdNCDENo
	lxPENPqt/HJrk6P+G5cO+GRu2kfw1ULNP6mFo3dxhX4d1gi6js4AA96dkApQu+tDfiiErQXd+9pbN
	5NjkkueIK43HfaA1/Npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrWY-0000000ByV3-2LhE;
	Thu, 10 Jul 2025 13:41:18 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqHL-0000000BkiI-0eBN
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 12:21:32 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so99243685a.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752150090; x=1752754890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykmA4VtBEf4m3I9yh9SrcV1DzXur6jCxtcYH7LJI2a0=;
        b=f/gSFWX9egnS9DjIqB+r6T5yF5A80S3fFjguyzN4ZFzztV2HyE3bcVKuIjrPCmpV9q
         p5P3Ml0ThUv5tyR8+IyeosklW0yd2LEmINx/Fh7UfIVAfrsZnBoXIBXtopVtiZbXemrx
         U2nNT1yM+mnyr54CMA7z6ZC2y1r2M8iF7LiHg49qIq1uf8k56GskEOzWUx/CiP8JnC+3
         K3Inry/IlPSX+hoWkfCx2WRzdaU54jJI4xEROHQyeVD8sH4/xwMy3vn0jZ1Ai/auVl19
         ZkGAq087eEY/TvsHCtiIzZ9bBqukXitEQHitu26lhMwjMbn7FCC4L9CpGUMxAf0HEruQ
         2nUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150090; x=1752754890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykmA4VtBEf4m3I9yh9SrcV1DzXur6jCxtcYH7LJI2a0=;
        b=PXVjWDK5hUQvLmAd5Db1sBVaS4v1pssvFMCgcp+ovOPKYYzaUejmcGRTIXmEe4jSIa
         qkrhrraVIyMYVYX3qKFOdbAnz87TgYfnrx1Hs8LecxKpbcuPiKMcwgKWMDd4z6u1OUP8
         7BMDUQPMFOORtGD7GQJyT5U5W2p7vMJ15wtxLXYhZnQ4H3WkKxV7txgtb005kdjXadaI
         4fiH8MwKFgg3921/DojnIZzubO66citjQg3b+wdy6n8a59SfEnQbspH4UQnyBfyCvpUO
         otGyNPLCZa27aAb1a9IQOQ3eaU8NwtUk0LRgc9jUOS3dyIXrmSOYehMNpBTqk+6BZaIV
         KKqA==
X-Forwarded-Encrypted: i=1; AJvYcCVP7tbxCCXalKyCrdQgw8zOnDSsaZ7GoipdDdxmPt7bapUdtQ0V4NxwCVS6H03NZGNStFJAfu5d2zDptg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxemvJshz/qC8HfGGRxE1uBZXaS0ofsp/Kct2yrvjuz3J8p7O+B
	+qXPUgodKjz7bnUfl/euDu6z0S+yzJv86FqdZOfVvmqVr2zq/mFJBlaKLG6Y1kMVUow=
X-Gm-Gg: ASbGnctJkmlD55/2pPABceCXtKsrSAAaSPBN0+2+KxG1w02bTSMKsCOlGP1GPlj68aa
	u6VIZB2ySMjpT6w1xMFxojVALNVAGOb8dyF8mL6KWL7vXaqWPqFnVgj2tcTvTZ1FHbGEkJVbfBm
	Rt445U5jBrjQylE/kySysQ/D/x0+QKsO1sTvp600Ti506AcF2s+gEXlJVTZpzKKLzTWoezNP9wr
	80vJVI8ieUICLAVjMYcqX28YgemhUBMm/6tKHc4FqgCeTLPRccch0ubJP+wA/H/b5uko2Msf674
	lpF0Jxt6Nu2Fs9f62cvi72I4Y7YSTuAUn/JJfrCgskfwZedN35RH/6xnsFZoCCw2OlLl4TOD+Ev
	hgYvR2mVyKHfSAoVUbz8ZSXDVkw==
X-Google-Smtp-Source: AGHT+IHAaGLj0dorD8TmmT+oXd6EpUTGrwAVYRSrLza6IYfI1rY0XCuwxUpREHQ/PIg/XOc23Vol9Q==
X-Received: by 2002:a05:620a:4408:b0:7d3:d8c8:1e32 with SMTP id af79cd13be357-7dc977d8fe3mr492098085a.3.1752150089600;
        Thu, 10 Jul 2025 05:21:29 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde8fd479sm90171685a.99.2025.07.10.05.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:21:29 -0700 (PDT)
Message-ID: <f68067fd-328d-496a-8b39-9d0cc6cd05d7@riscstar.com>
Date: Thu, 10 Jul 2025 07:21:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250702213658.545163-1-elder@riscstar.com>
 <20250702213658.545163-3-elder@riscstar.com>
 <20250710092448.GA1431498@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250710092448.GA1431498@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052131_307758_4F99C119 
X-CRM114-Status: GOOD (  25.82  )
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

On 7/10/25 4:24 AM, Lee Jones wrote:
> On Wed, 02 Jul 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register
>> 8-bit value regmap configuration.  There is an option available
>> for a device to specify a custom configuration, but no existing
>> device uses it.
>>
>> Rather than specify a "full" regmap configuration to use this
>> option, Lee Jones suggested allowing just the max_register value
>> to be specified in the simple_mfd_data structure.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v2: - Allow max_register *and* regmap_config to be supplied
>>
>>   drivers/mfd/simple-mfd-i2c.c | 15 ++++++++++++---
>>   drivers/mfd/simple-mfd-i2c.h |  1 +
>>   2 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 22159913bea03..3f959f4f98261 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -33,16 +33,25 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct simple_mfd_data *simple_mfd_data;
>>   	const struct regmap_config *regmap_config;
> 
>> +	struct regmap_config config;
> 
> Why do we need another regmap_config?
> 
> Can't we just remove the const and make use of the one above?

If we change the global one, it changes for all users.

In my next version I will modify the global one temporarily and
zero the max_register field again after the devm_regmap_init_i2c()
call.  That doesn't protect against concurrent probes but I don't
think that's a problem.

>>   	struct regmap *regmap;
>>   	int ret;
>>   
>>   	simple_mfd_data = device_get_match_data(&i2c->dev);
>>   
>>   	/* If no regmap_config is specified, use the default 8reg and 8val bits */
>> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
>> +	if (simple_mfd_data) {
>> +		if (simple_mfd_data->regmap_config)
>> +			config = *simple_mfd_data->regmap_config;
> 
> 			regmap_config = simple_mfd_data->regmap_config;
> 
>> +		else
>> +			config = regmap_config_8r_8v;
> 
> 			regmap_config = &regmap_config_8r_8v;
>> +
>> +		if (simple_mfd_data->max_register)
>> +			config.max_register = simple_mfd_data->max_register;
>> +		regmap_config = &config;
>> +	} else {
>>   		regmap_config = &regmap_config_8r_8v;
> 
> I suspect we don't need to have this line twice.
> 
> Either re-jig the if () above (I suspect this explains the existing
> complexity [multiple conditions]) or pre-set regmap_config to
> regmap_config_8r_8v and only over-write it if the conditions are met.

Sure, that would work, but it won't be needed if I just use
the (non-const) global config.

Thanks for the review.

					-Alex
		
> 
>> -	else -		regmap_config = simple_mfd_data->regmap_config;
>> +	}
>>   
>>   	regmap = devm_regmap_init_i2c(i2c, regmap_config); if
>>   	(IS_ERR(regmap)) diff --git a/drivers/mfd/simple-mfd-i2c.h
>>   	b/drivers/mfd/simple-mfd-i2c.h index
>>   	7cb2bdd347d97..706b6f53155ff 100644 ---
>>   	a/drivers/mfd/simple-mfd-i2c.h +++
>>   	b/drivers/mfd/simple-mfd-i2c.h @@ -27,6 +27,7 @@ struct
>>   	simple_mfd_data { const struct regmap_config *regmap_config;
>>   	const struct mfd_cell *mfd_cell; size_t mfd_cell_size; +
>>   	unsigned int max_register; };
>>   
>>   #endif /* __MFD_SIMPLE_MFD_I2C_H */ -- 2.45.2
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
