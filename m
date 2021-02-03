Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C837C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 00:01:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC45E64F55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 00:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC45E64F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mvmFYH+xV7/Gb8KnTltkZr+tDS4d6Se9u77GtixPc+s=; b=ziGNR1qHvKf1gqmIBH5alOZKF
	vHMt8YCqMfh6jnwJGu/0K2ThczbLyMBXbK1Wh7JukjJ/8a3I77UcIeOSMhaJMkUjVPU5YiHXlb6op
	ZRFkLl56vyo4xfVjkYWx9I2gE0Zn1hRFQy61+EqAxhtWPjBp1gA+pq/fDyegvgSYXN408A5nz9lh5
	SdAZPKkN8DZyPZ6LxiVBQVssjSu6HasXwAvfpwApXEeGp3YaYasI6kQj6uJmGNlyMo5uc8QJdKtFY
	KY3hlfRqyYAv88ZdbmuXsUy48eSuXnzc8QkoHI9f6EpbdMSqyi3DCU7bBseC6y8M4ri9qn6/264HP
	4HGrCjeHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l75c1-0005rj-Ph; Wed, 03 Feb 2021 00:01:37 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l75bz-0005rB-45
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 00:01:36 +0000
Received: by mail-qk1-x734.google.com with SMTP id v126so21725739qkd.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 16:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KWrgLgvPSeSqktiYSiGArNaUaJGPgSmru6EUJ4fc25w=;
 b=cp3I13nxA2/k7MXvOcYp9Gef6QHcInoYqEwf4PTFMHMvLgTChlfL+I3yqIrahHjJP5
 1Nj9bk0qQ+miJ57wX0yK5zg+nJqR2sK/ZA2Eas9JYrUAZFpl7oYMFLOrdN3eScjHpF2z
 eqcI/hxyUlNLKICGhnvIhdNIYHqeDflS7tM/sUwcGnMUx4X8GIuz/mySIn2gDegURGnk
 +Z7BHDVDPhzeQL7DAacHOLTIrRd58gl9amndxcn1ofjbRgvLOJNCRrx1yeyul4Do6Wbc
 ZKkSVv04ayQCfCDiCH30Vo923Iq+3U+WgSAjH3CW3u3MPUeg98LV/YUYxIIrwmZ+WgF5
 tubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KWrgLgvPSeSqktiYSiGArNaUaJGPgSmru6EUJ4fc25w=;
 b=W5UDrW3EaceYdoRNe5ZAUuRiVym0NEt/kxV0NDb2Pr9pk6tqyuPCqte8daJ7Vez8fK
 l4FOigN2y4X55U8kmmQnlaBnNVl2E0UP7cqw8DAMVYa45JbmS1jxF21MuORFMB1R116T
 Hf1jb2x9x4NSR9jw0V1+n+SGfUrwpBnbTlnJpRbql+d4LcwcLE1w1HHsrXBeJTOCklAo
 OxIqmTdSmBWb3qyO5bwf9Y7wpFpzvkxTORPKlXIV1FUQ5uI2gJ9OfgcG1tGBXdplfsIL
 xBja2J06LRClEZmEVQJdbygVWQay1v/KNMC6bsfMACJMGAtxPcK1ZUXV8NvX3ybInkhz
 9RaQ==
X-Gm-Message-State: AOAM533AZV1q4NUSkRY8nmkp99IqiZxQ9uWMYTItnXUgWSAgo6IvkTEY
 AskeNnnBKbODDQQhN6wOi74=
X-Google-Smtp-Source: ABdhPJwd++c8dxDLCkBm7EnB/V48iIYc1gZAR4YM11rl08zYJstR7i99PlgF484jqsk0EBQDrFtc+w==
X-Received: by 2002:a37:6897:: with SMTP id d145mr238876qkc.168.1612310493418; 
 Tue, 02 Feb 2021 16:01:33 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id c17sm421985qkb.13.2021.02.02.16.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 16:01:32 -0800 (PST)
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Rob Herring <robh@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <700da807-a5c8-a552-3d50-948b3ff6a734@gmail.com>
Date: Tue, 2 Feb 2021 19:01:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_190135_245731_1E451BFE 
X-CRM114-Status: GOOD (  25.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/2/21 2:02 PM, Rob Herring wrote:
> On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>>
>> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
>> interrupts property description and maxItems. Also add the standard
>> ngpios property to describe the number of GPIOs available on the
>> implementation.
>>
>> Also add the "canaan,k210-gpiohs" compatible string to indicate the use
>> of this gpio controller in the Canaan Kendryte K210 SoC. If this
>> compatible string is used, do not define the clocks property as
>> required as the K210 SoC does not have a software controllable clock
>> for the Sifive gpio IP block.
>>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>   .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>> index ab22056f8b44..2cef18ca737c 100644
>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>> @@ -16,6 +16,7 @@ properties:
>>         - enum:
>>             - sifive,fu540-c000-gpio
>>             - sifive,fu740-c000-gpio
>> +          - canaan,k210-gpiohs
>>         - const: sifive,gpio0
>>
>>     reg:
>> @@ -23,9 +24,9 @@ properties:
>>
>>     interrupts:
>>       description:
>> -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
>> +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
>>       minItems: 1
>> -    maxItems: 16
>> +    maxItems: 32
>>
>>     interrupt-controller: true
>>
>> @@ -38,6 +39,10 @@ properties:
>>     "#gpio-cells":
>>       const: 2
>>
>> +  ngpios:
>> +    minimum: 1
>> +    maximum: 32
> 
> What's the default as obviously drivers already assume something.

The driver currently assumes 16. However, as noted in reply to Atish,
the number of GPIOs is configurable.

> Does a driver actually need to know this? For example, does the
> register stride change or something?

No. I believe that the number of GPIOs sets which bits in the control
registers are valid. So the maximum number of GPIOs is the word width of
the bus.

> Please don't add it if the only purpose is error check your DT (IOW,
> if it just checks the max cell value in gpios phandles).

Why not? This seems like exactly the situation this property was
designed for.

> Optionally, a GPIO controller may have a "ngpios" property. This property
> indicates the number of in-use slots of available slots for GPIOs. The
> typical example is something like this: the hardware register is 32 bits
> wide, but only 18 of the bits have a physical counterpart. The driver is
> generally written so that all 32 bits can be used, but the IP block is reused
> in a lot of designs, some using all 32 bits, some using 18 and some using
> 12. In this case, setting "ngpios = <18>;" informs the driver that only the
> first 18 GPIOs, at local offset 0 .. 17, are in use.

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
