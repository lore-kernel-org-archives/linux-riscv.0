Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A819C3ABC6
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8Ml7QSfY6+BqMScFOCrWUqjGX61j40np/zhAhr6pBw=; b=YQs9WEZynQYFsV
	ZVXpbJYE7Ta07Qcjb39xFB6hF/PaLD46hFnoaXjeDlxBuD5Wjy3Qpu7cthI21USBEUjNQUUJmTj1Y
	GIPXnNIIaFTJKs8/X4yhjNTTomyXdBE41VBWDCrHOBeZ0jXu4DbUIYLYdwDW4oVwMgDH5k0yiE/hr
	MVUWwUkxqN8ygYIkX5tziKIePW/dqFx4+Fj/gyBvTVLTlZm+pQxDkYIJMhjv6/eB7/XyXtHez+9do
	h2ZTz3LkA077RVqnWqJ7hRof0dZm0ZpLUZsYrFV4uV2rBEV01VyP963mz5h89ORKY6qH6b2ePFQPH
	n8xkGe9p+SMgeXKqFIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzrA-00000000XQ7-0zSI;
	Thu, 08 May 2025 11:56:04 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzqS-00000000XJe-16cO
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 11:55:21 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-86135af1045so96323339f.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746705319; x=1747310119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhDurVJcqA9s7Wksb9BxQ/qUoHZJHNjRKlauWc65nyw=;
        b=V7bdYwhGX3pLmFzjTWAz6C9Vq1boBWKNgR9TxL7djhYH/T5jMe3CXYFS8lgPML9M0K
         IL75zdsV2zvqWxBH3iz8QQT3QjDbVqd2CuZ1CN99E+MCsMC64KvbSj/YoF5/Xawz1oui
         Is0BDSxg8Dsz9RtegesdOaFD4wPeeZxW8229YCoiW54Bk6YLY52UICiUI5vjqiNX5Vmw
         IfocVh3Au+Bvw3KIn3JLNUA4zKEo+26ndcdyQZ9PtVUsBJmLuVhzK6BtArqvrZBV29Y5
         ASX5srjLewKTjZaahyd8PRRO7Z14d2a4GKdj2AAS4oSh284395z60vQ33qSgAfxSUeOj
         G+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746705319; x=1747310119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhDurVJcqA9s7Wksb9BxQ/qUoHZJHNjRKlauWc65nyw=;
        b=aDcx9168tZjawTz1oGom2AA9knYLV1vcHCBbNnFp528qO+QRrPUcWj6DeKrd2IeLLl
         qU1cj0KtUu8XOTQOiBfso6WjmDEG5PO/FZi6qnjjZFvuhmLfQ/gWuIcHs14Z7V+xyElW
         fniuWWtgYuJQC30xiMm4PCTRQTdH0XYCx2Wc3Y4DdXWSs64KXrAx54psybBzkc8Pu5Lu
         Keanwu+Tn83FF+7LNenlm/GK0cZWHoo+ThqTpaiMkkPg+4Qg8tI8bw7tuYT9y/rLuAMS
         lyG44oOA6+CMwL9BjXFKABKLkAh3E/X/BSupg4EuDJo8FgLwDNP5Gh30gH/ae55idNh2
         wevA==
X-Forwarded-Encrypted: i=1; AJvYcCXc8Idq4a1Ao8I3FORt5nTVEsdECrkx2zqwc2cjfQk9oAs3p1HR3PCr1d3hNDF7zk+xXuwLO+lW/eCm+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1i//n2LEnFQzCDAaVTExFB0cGRVjW4C/Ar7zA7jGQ1KgH3TV0
	SVkiiSrTtipXrjn29cRAdsg5sCGBz7dcvYkZsxDsMSLvP4WIT+Yb0wxO6EcQJmc=
X-Gm-Gg: ASbGncuHrR/yN15LC7kAsm2QbllAgM+DxGClKb28DJNPQagSHJtgQ+ck811jlcoQxVL
	0qqlrveB013co8HQ0Op32k7V0wL3pQQAxhgGXT+70jwJknV7iDRCNJkeAMpSF/7WCJhLD3TAMl+
	a3NBGyxujv9NwqEBBvQc7ExYtlX7YKMkocxcz6Wav45yL6Cgp6qLM8526k+hMuKhU286UJ1oyA+
	filVlNSmW3cauDR9Xk4LdzhPfgcDGCQNjYauzca46gYIUH1i2oxCgv0ziVJRrW4wjamAXh3Smkm
	7u3Txr/lqbW7mff/bQbHa46AZ2M92R0vl0pOnZsnqvTYeJ35AE+/t8s4yOtJCyGX7anOK2l3/XW
	SerQn
X-Google-Smtp-Source: AGHT+IEh2FhuFJwVM0F6B9wDjDp9naJK3ymVtjg5UbqAxVbspiUli3XlMFk+hC4tqNPEL0TAprtw2A==
X-Received: by 2002:a05:6602:140d:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-8675502ea2bmr392308139f.5.1746705319163;
        Thu, 08 May 2025 04:55:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a91464csm3168549173.31.2025.05.08.04.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:55:18 -0700 (PDT)
Message-ID: <d2614363-1dab-4ea3-b79a-5d3c02c4bc17@riscstar.com>
Date: Thu, 8 May 2025 06:55:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-5-elder@riscstar.com> <aBxDQ1_2xJjGlwNf@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aBxDQ1_2xJjGlwNf@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_045520_309760_16A30912 
X-CRM114-Status: GOOD (  29.18  )
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

On 5/8/25 12:38 AM, Haylen Chu wrote:
> On Tue, May 06, 2025 at 04:06:35PM -0500, Alex Elder wrote:
>> Implement reset support for SpacemiT CCUs.  The code is structured to
>> handle SpacemiT resets generically, while defining the set of specific
>> reset controllers and their resets in an SoC-specific source file.  A
>> SpacemiT reset controller device is an auxiliary device associated with
>> a clock controller (CCU).
>>
>> This initial patch defines the reset controllers for the MPMU, APBC, and
>> MPMU CCUs, which already defined clock controllers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/reset/Kconfig           |   1 +
>>   drivers/reset/Makefile          |   1 +
>>   drivers/reset/spacemit/Kconfig  |  12 +++
>>   drivers/reset/spacemit/Makefile |   7 ++
>>   drivers/reset/spacemit/core.c   |  61 +++++++++++
>>   drivers/reset/spacemit/core.h   |  39 +++++++
>>   drivers/reset/spacemit/k1.c     | 177 ++++++++++++++++++++++++++++++++
>>   7 files changed, 298 insertions(+)
>>   create mode 100644 drivers/reset/spacemit/Kconfig
>>   create mode 100644 drivers/reset/spacemit/Makefile
>>   create mode 100644 drivers/reset/spacemit/core.c
>>   create mode 100644 drivers/reset/spacemit/core.h
>>   create mode 100644 drivers/reset/spacemit/k1.c
>>
> 
> ...
> 
>> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
>> new file mode 100644
>> index 0000000000000..4ff3487a99eff
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config RESET_SPACEMIT
>> +	bool
>> +
>> +config RESET_SPACEMIT_K1
>> +	tristate "SpacemiT K1 reset driver"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	select RESET_SPACEMIT
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  This enables the reset controller driver for the SpacemiT K1 SoC.
> 
> With auxiliary bus introduced, Kconfig entries for both the reset and
> clock should select AUXILIARY_BUS, or building defconfig will fail with
> undefined references,

Wow, I really should have made this v1 of a new series.  You point
out several problems that came out of this using the auxiliary
device framework, which I should have tested more thoroughly.

Yes I will update this to select that, and will test it before
my next version.

> 
>          riscv64-unknown-linux-musl-ld: drivers/clk/spacemit/ccu-k1.o: in function `k1_ccu_probe':
>          ccu-k1.c:(.text+0x19c): undefined reference to `auxiliary_device_init'
>          riscv64-unknown-linux-musl-ld: ccu-k1.c:(.text+0x226): undefined reference to `__auxiliary_device_add'
>          riscv64-unknown-linux-musl-ld: drivers/reset/spacemit/k1.o: in function `spacemit_k1_reset_driver_init':
>          k1.c:(.init.text+0x1a): undefined reference to `__auxiliary_driver_register'
>          riscv64-unknown-linux-musl-ld: drivers/reset/spacemit/k1.o: in function `spacemit_k1_reset_driver_exit':
>          k1.c:(.exit.text+0x10): undefined reference to `auxiliary_driver_unregister'
> 
>> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
>> new file mode 100644
>> index 0000000000000..3a064e9d5d6b4
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/Makefile
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_RESET_SPACEMIT)			+= reset_spacemit.o
> 
> As RESET_SPACEMIT is defined as bool, the reset driver will never be
> compiled as a module... so either the RESET_SPACEMIT_K1 should be
> limited to bool as well or you could take an approach similar to the
> clock driver.

I'm not sure I understand this statement, at least in this
context.  This pattern is used to define a single module
"reset_spacemit.o" out of several source files.

But I think you're saying that RESET_SPACEMIT and
RESET_SPACEMIT_K1 should both be bool, or both be
tristate.  I will resolve that question before I
send the next version.

>> +reset_spacemit-y				:= core.o
>> +
>> +reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+= k1.o
> 
> ...
> 
>> new file mode 100644
>> index 0000000000000..19a34f151b214
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/k1.c
> 
> ...
> 
>> +MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
>> +
>> +#undef K1_AUX_DEV_ID
>> +
>> +static struct auxiliary_driver spacemit_k1_reset_driver = {
>> +	.probe          = spacemit_k1_reset_probe,
>> +	.id_table       = spacemit_k1_reset_ids,
>> +};
>> +module_auxiliary_driver(spacemit_k1_reset_driver);
>> -- 
>> 2.45.2
> 
> If you're willing to make the reset driver buildable as a module, please
> add MODULE_{LICENSE,DESCRIPTION} statements and possibly also
> MODULE_AUTHOR(), or modpost will complain,

OK, thank you.

					-Alex

> 
> 	ERROR: modpost: missing MODULE_LICENSE() in drivers/reset/spacemit/reset_spacemit.o
> 	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/spacemit/reset_spacemit.o
> 
> Best regards,
> Haylen Chu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
