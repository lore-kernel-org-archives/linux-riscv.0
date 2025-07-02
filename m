Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D961C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tl4jul0Ca/Yj2N/7owkRjY3hS27fMVHShbC/7PsPcGs=; b=Plf9ymBrFmT7t1
	ubzTdGZfrW5/tsjNA/JZjhBTsD+EUxzonGFexl9HEjneIg6yBaUPG54gXIX+1FMZiqD5NPvws0+QJ
	AR7q0HWN1EyuowkNYTomTj751JBKxWBrK5i84xgsr4P5iTZGqXve1dGjDglZW7mfiyjfK4s+2La4q
	+XxKxz7fIi+NQLZnl9s4zuhyvK69HB+5os9MhC1FMTIUU/7y7epkIQ5Au49UoGTAGyf3qt584akJw
	Pl4+CVWNPiY4GKxIdwz/fldKSK371vD/vffrYJFlX2FmtohW+CvxCi3ujW5bKIKJpLxkr5ebYxlwg
	LtpYtx7iFNARm2/GPMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VM-00000008zYg-2klx;
	Wed, 02 Jul 2025 16:40:16 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzUQ-00000008obQ-24ty
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 15:35:15 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e05bb6efe0so1216665ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751470513; x=1752075313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFYak3rqG4/IzwuHtJ+AVvA3da7cWc6pCiZ9Z7+J3C0=;
        b=yoyOTiZKJg7Ai+xYe8Nvx0We+b0gS2OKx8yyt+UzdcXY8ecVdDiLnGdqd9/R87n2Kd
         Qjg/IYZ1PZIGp82nuZiwz1pAVHNvNSifLHpKhGFXv95VkOo+XtCebMA4iFpxZ73xK1p+
         dRV3jtBqkzUrLOYKqz494h3VPmsHIZ/pYFRzAQs3R7aPTNMJYnslPpr8LVii83NE6WCc
         Ct2fHFvr0fNdkQIQe+sjifslCO+lRhhKhufPcz/aGWLpk7s31IgEzvDIKdzjqGUlyHXh
         9SpFxgNk40TEX2HDR7uh1SoTfABHwHgWH+WTz2WTzp5+MKhfRxj7NgTLFtZG83DoBWnc
         Ddxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470513; x=1752075313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFYak3rqG4/IzwuHtJ+AVvA3da7cWc6pCiZ9Z7+J3C0=;
        b=CtY2NJH5TmixeS5K9qd5gcYyiKI/tIZlgm+/5lb2ZCkJHyS320fFFqKkjUDDseY34H
         zCNpzuZofeMjLI7zQOVN0qN+moiXc6mGACOjSNjPiL/t9X5cV5hvqJD7YpNKG+ytUx18
         vGFX3OiLovVbI/qtNJCeheeLZ4YGhIeahK60jixwfNe1DtDPiVDTYZ5vkYXYLqRv2vee
         afjVenNRs13M5wMVBr+9yv8CXkh1unAs0RRSrd7q8W0mqtNLM8qruxqSRGZQGDIruhKa
         Fulu+c/KUwwlaKS2lzCMTBYiRL6mN4rUmiYUKwAGrgoIrJOqK8ng6Qa5kyikPIE3EQ6I
         ql/A==
X-Forwarded-Encrypted: i=1; AJvYcCVEPF0USmwqTaNy/T7/mfKojSwgWul0r1nYGxMudFtcAZ561Ri95VcgFQEj5T6THB6D16pZPg+ZK82Z7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1cmIje/UIZHwyBoyf6Hq1WiSEb+ulu+pjN4ESWUdiyE5ROFoM
	8jC9h1xsDcK1IoOXAXtzEsWu7d1AOccAxvo8LbktkmHQ9Fypdz6UyexnY2KBR6cPQjY=
X-Gm-Gg: ASbGncuVI3v8qQTAs3UhYF0RvW8XvwSAy1QeM6LEaFA6eCD8tsQjkOUJNlQYBm2CRjw
	gNa0mBwSBgcVrIyI0qpJUeJCoXevrgnBKYyuXy7SGsW8MR4s0/l78i6dPz9w/0vfSaEenOjDEjg
	IfA+5L1k8d1h9BKu2PC/AkKAAAjp+PFnBM9hxqtUrV5waxzz8elkfti7QHC19w/dhAGHT7L04y6
	kwrjVcspJ3vQ+T6GullLj3vmXEzCTUghNub3/cEjExUx62aykX4mTSDp8yl/V4HPeQWQzYaVOdc
	OpIwgUK0padrntaYvWVptVcVRJfXRtSI786MYVuAmpkXmqFym0ziRBn0dIagU5TcQiLRiLCzD/v
	+E2+pIYl9q2ukwQqgFrQYkEeM+g==
X-Google-Smtp-Source: AGHT+IHJuXwDnuIr4bYWYjj6GSVyHqNZGbb2KEkdO8qfJX0ywzKr09z0X9AaMr3NQzkZvnOS8IhlQQ==
X-Received: by 2002:a05:6e02:17c6:b0:3dd:920f:d28e with SMTP id e9e14a558f8ab-3e0549d82c5mr32653675ab.13.1751470513525;
        Wed, 02 Jul 2025 08:35:13 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5039f2f95a1sm161358173.85.2025.07.02.08.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:35:13 -0700 (PDT)
Message-ID: <0219b698-2f1b-4fcd-bce7-0ba6f6895b11@riscstar.com>
Date: Wed, 2 Jul 2025 10:35:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250627142309.1444135-1-elder@riscstar.com>
 <20250627142309.1444135-3-elder@riscstar.com>
 <20250702152618.GU10134@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250702152618.GU10134@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_083514_779012_C9261EB5 
X-CRM114-Status: GOOD (  24.57  )
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

On 7/2/25 10:26 AM, Lee Jones wrote:
> On Fri, 27 Jun 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register
>> 8-bit value regmap configuration.  There is an option available
>> for a device to specify a custome configuration, but no existing
>> device uses it.
>>
>> Lee Jones suggested modifying the simple MFD implementation to
>> remove the generality of the full regmap configuration and add a
>> max_register value to the simple_mfd_data structure.  This can
>> be used in the regmap configuration to limit the valid register
>> addresses if desired.  It's simpler, and covers all existing and
>> anticipated device types.
> 
> Woah, not like this.  I wanted to make the framework _more_ flexible.

OK, sorry I misunderstood.  I'll send another new version today
that does what you suggest.

Thanks a lot.

					-Alex

> Just this should do what you want:
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea0..f43be10c0e60 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -44,6 +44,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>          else
>                  regmap_config = simple_mfd_data->regmap_config;
>   
> +       if (simple_mfd_data->max_register)
> +               regmap_config->max_register = simple_mfd_data->max_register;
> +
>          regmap = devm_regmap_init_i2c(i2c, regmap_config);
>          if (IS_ERR(regmap))
>                  return PTR_ERR(regmap);
> 
> Plus the one line change in drivers/mfd/simple-mfd-i2c.h.
> 
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v6: - New patch, changing the simple MFD functionality
>>
>>   drivers/mfd/simple-mfd-i2c.c | 18 ++++++------------
>>   drivers/mfd/simple-mfd-i2c.h |  2 +-
>>   2 files changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 22159913bea03..c1dc315d44dcf 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -24,27 +24,21 @@
>>   
>>   #include "simple-mfd-i2c.h"
>>   
>> -static const struct regmap_config regmap_config_8r_8v = {
>> -	.reg_bits = 8,
>> -	.val_bits = 8,
>> -};
>> -
>>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct simple_mfd_data *simple_mfd_data;
>> -	const struct regmap_config *regmap_config;
>> +	struct regmap_config regmap_config = { };
>>   	struct regmap *regmap;
>>   	int ret;
>>   
>>   	simple_mfd_data = device_get_match_data(&i2c->dev);
>>   
>> -	/* If no regmap_config is specified, use the default 8reg and 8val bits */
>> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
>> -		regmap_config = &regmap_config_8r_8v;
>> -	else
>> -		regmap_config = simple_mfd_data->regmap_config;
>> +	regmap_config.reg_bits = 8;
>> +	regmap_config.val_bits = 8;
>> +	if (simple_mfd_data)
>> +		regmap_config.max_register = simple_mfd_data->max_register;
>>   
>> -	regmap = devm_regmap_init_i2c(i2c, regmap_config);
>> +	regmap = devm_regmap_init_i2c(i2c, &regmap_config);
>>   	if (IS_ERR(regmap))
>>   		return PTR_ERR(regmap);
>>   
>> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
>> index 7cb2bdd347d97..4121fe1bc1d70 100644
>> --- a/drivers/mfd/simple-mfd-i2c.h
>> +++ b/drivers/mfd/simple-mfd-i2c.h
>> @@ -24,9 +24,9 @@
>>   #include <linux/regmap.h>
>>   
>>   struct simple_mfd_data {
>> -	const struct regmap_config *regmap_config;
>>   	const struct mfd_cell *mfd_cell;
>>   	size_t mfd_cell_size;
>> +	unsigned int max_register;
>>   };
>>   
>>   #endif /* __MFD_SIMPLE_MFD_I2C_H */
>> -- 
>> 2.45.2
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
