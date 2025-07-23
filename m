Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F64C83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZqsKAKQPDvKSN2IHpy+q96kqe4u/mak80hLD2T5saM=; b=o3iFTuND+Rbrbr
	7NUawl1DAXfCccYEzw6LIapOY3vC8GAXjyWFjGHP4mO1eTOaoa24gYnsfz1E8UEbJgrIeCobXAyya
	MYBkVZyLZB5gwD/HUfj3F2pSJVcv2REGWRYsM28+Zw0FjTBOflwyzPSC8yRw2KeO779mUb8yOyvxl
	ow8EE9Ks0H9rmekFEBKg2LanWyWAhoJPyiB+2y3A1KfvsTUdqq/+E6BPOWoxbfEnSFB5k8QD1m5Th
	s+yFPAUCE//DrotCDbEb49cwVxre9eqneRWVPhA5bPaYAeTgPQUF8wiTilA1elBKqflB2/vkonaKg
	lnlY5rV7FSXl7kdjQfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZDf-00000004zjz-1104;
	Wed, 23 Jul 2025 13:09:15 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYo5-00000004w2X-31uZ
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 12:42:51 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e057f2c8d8so50940425ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753274568; x=1753879368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0Ew/UlImyFN4HlGy+L8fhyDF3AVGX/UG84SYw3xHZQ=;
        b=eiXrVqeAIcAXqVn8dy9iTvZUy2wz7FBX87/C76V0pcFNB1lXgitSNX5dKTDWD1Irbf
         mDoLZlhHqFPsFcUWO/0YtoigN6E8sffCwSsBotXPxCOHMpjqkHyo+1x3j7tqh/YGyJXM
         eyg7vvhDf38SaGzeqaD04zMpXplScHM9Pz3tfLfRagtUnWp4UvG5LwWB4cneuYaHqnIJ
         dsCZeE3wXbe2XOC0QgXXx+xapFuTAwUG1TjMbdWW8SxV/Wvs5kb0ldhbXHp+cJHRs5UY
         qDqzWvyoOqO0cKtiSFPelrOCtqWLIw3Ma6fq5DAMCtIvId29e6lGZiUP/YmvCZI9Re8Y
         W54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274568; x=1753879368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0Ew/UlImyFN4HlGy+L8fhyDF3AVGX/UG84SYw3xHZQ=;
        b=FgUT6IBBhSHCtfqrQisms7jVnSWg3yVLCSfgL8Zqdvzc+h3yqlDZg/IgqxtI4fkhCc
         IwymcMkPw0gSGHaqI1P2CM385RaPTpkh7qwYrRrssDI7FpY3Rg/kbTskWTUViF6KV4p9
         GHIeZmXGTsLhuWuvyyxTEv63IE5ExmcyB4U9WMzLUTV/3W9KJwB3bptJorlfIIZaNBtP
         vXwGr0BKnduNwOBxbZZYqAN+QxFWh7m5B0c1mGW9s+Dnwcx1JAZx97kLpvr8M+/pWFz8
         TafxszXDscQZt2mNwSYPCUzZqlja6g304hf/+QxCvddgb2xHlSPWKrr0OBzuT7M+orhl
         yQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0PFp++2Ecg1UhmtElxzYStGeLV76K1YhV4fAcfNKz0WmOdgx5hf5JPV8u4jxhqDS3Ng1mXlOz7jWMCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQk+Wr8/7Csv2ZhwUoPdCCzuT6EJK2iHE3L6OMVPyztqnUSfyB
	ppNPpPxTYtgDHyAmxT5YKLPPZ9QFVlFcGhktwnTd/6DVrNsoyUXBgDCVcWYQE72/4Jo=
X-Gm-Gg: ASbGnctluBfprEZQUpEGXbKCj+cznQ7iN84sXq5XyPET4tCR7WmHSWwC8ecg3KJX4u+
	v+jZZsJBpCicCviLjf7KSVneIFMo1L01cuKwSd/YkYrXDfXasc+RdTzrzk2ZrqXsiBjbdKS+E7g
	Nvimw65YgYCQan1wpp6kzSzjW1teT2+iIJ+wEnFW3HjF0MX29TKPMbJ01e01igIDRAHIN9sjQpq
	eNv3aH8N6NAf1ZACOkqdiiOla5vAdPlY21AFFNFqQLvQy+J7IIda2PfY0qF8ydgIt6O+wDtnRUs
	FChaHjCwLDdsb3QAIhUlQZcc+3Ppr5823Ukps3d4ZBN9VqzeMRlhLzcOg/X6BuWG7P+kfPV+ShE
	+kOEN0do4TfzzvoOzk0s8xygrCIbSOIk57Q==
X-Google-Smtp-Source: AGHT+IEqaLJWveuGtuwL6xUVomxEyO/I/mq75BNTRkLodb+q0fudHO2/No8ZaCo9o8H/kGbU5GpHqw==
X-Received: by 2002:a05:6e02:1f82:b0:3df:3d1a:2e76 with SMTP id e9e14a558f8ab-3e32fc22705mr56940445ab.1.1753274568312;
        Wed, 23 Jul 2025 05:42:48 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e2982aff75sm38954785ab.54.2025.07.23.05.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:42:47 -0700 (PDT)
Message-ID: <877dcf99-107e-4d96-8790-6608976d13ca@riscstar.com>
Date: Wed, 23 Jul 2025 07:42:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250710175107.1280221-1-elder@riscstar.com>
 <20250710175107.1280221-3-elder@riscstar.com>
 <20250723095125.GR11056@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250723095125.GR11056@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_054249_855019_11F7DCD0 
X-CRM114-Status: GOOD (  24.41  )
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

On 7/23/25 4:51 AM, Lee Jones wrote:
> On Thu, 10 Jul 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register 8-bit
>> value regmap configuration.  There is an option available for a device
>> to specify a custom configuration, but no existing device uses it.
>>
>> Rather than specify a "full" regmap configuration to change only
>> the max_register value, Lee Jones suggested allowing max_register
>> to be specified in the simple_mfd_data structure.  If regmap_config
>> and max_register are both supplied, the max_register field is ignored.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v8: - Use regmap_config_8r_8v, modifying it if max_register supplied
>>
>>   drivers/mfd/simple-mfd-i2c.c | 8 ++++++--
>>   drivers/mfd/simple-mfd-i2c.h | 3 ++-
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 22159913bea03..5138aa72140b5 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -24,15 +24,16 @@
>>   
>>   #include "simple-mfd-i2c.h"
>>   
>> -static const struct regmap_config regmap_config_8r_8v = {
>> +static struct regmap_config regmap_config_8r_8v = {
>>   	.reg_bits = 8,
>>   	.val_bits = 8,
>> +	/* .max_register can be specified in simple_mfd_data */
> 
> Drop this comment please.
> 
>>   };
>>   
>>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct simple_mfd_data *simple_mfd_data;
>> -	const struct regmap_config *regmap_config;
>> +	struct regmap_config *regmap_config;
>>   	struct regmap *regmap;
>>   	int ret;
>>   
>> @@ -43,8 +44,11 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   		regmap_config = &regmap_config_8r_8v;
>>   	else
>>   		regmap_config = simple_mfd_data->regmap_config;
>> +	if (simple_mfd_data && !simple_mfd_data->regmap_config)
>> +		regmap_config->max_register = simple_mfd_data->max_register;
> 
> If max_register is set in simple_mfd_data, it should take precedence.

I don't really agree with that.  If simple_mfd_data->regmap_config
is provided, why not use the max_register field already available
there?

This is why I said above that I think this feature doesn't add
much value.  It provides a second way to specify something, but
in the end it complicates the code more than it's worth.

The only time this new simple_mfd_data->max_register field seems
to make sense is if it were the only thing provided (without
simple_mfd_data->regmap_config being supplied).  In that case,
I see the benefit--a null simple_mfd_data->regmap_config means
use regmap_config_8r_8v, and overlay it with the max_register
value.  The new max_register field avoids defining another huge
but mostly empty regmap_config structure.

Anyway, back to your original point:  I said in v7 "If both
are specified, the max_register value is ignored" and I think
that's the simplest.  Specify one or the other--if you want
to define things in regmap_config, then that's where you add
your max_register.  If you like regmap_config_8r_8v but want
to define a max_register value, just provide max_register.

If you insist, I'll do what you say but before I sent another
version I wanted to explain my reasoning.


> if (simple_mfd_data && simple_mfd_data->max_register)
> 	regmap_config->max_register = simple_mfd_data->max_register;
> 
>>   	regmap = devm_regmap_init_i2c(i2c, regmap_config);
>> +	regmap_config->max_register = 0;
> 
> Does max_register definitely have persistence over subsequent calls?

It is a global variable.  Isn't that how they work?  When
it was read-only there was no concern about that, nor about
any possible concurrent access (though I don't think multiple
probes can be using this code at once).

We could allocate a new one each time instead.

I think what I offered in v5 was acceptable.  If you're
willing to accept that I will be happy to keep discussing
(and implementing) the max_register feature.

					-Alex

> 
>>   	if (IS_ERR(regmap))
>>   		return PTR_ERR(regmap);
>>   
>> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
>> index 7cb2bdd347d97..ea2a96af8bce4 100644
>> --- a/drivers/mfd/simple-mfd-i2c.h
>> +++ b/drivers/mfd/simple-mfd-i2c.h
>> @@ -24,7 +24,8 @@
>>   #include <linux/regmap.h>
>>   
>>   struct simple_mfd_data {
>> -	const struct regmap_config *regmap_config;
>> +	struct regmap_config *regmap_config;
>> +	unsigned int max_register;	/* Ignored if regmap_config supplied */
>>   	const struct mfd_cell *mfd_cell;
>>   	size_t mfd_cell_size;
>>   };
>> -- 
>> 2.45.2
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
