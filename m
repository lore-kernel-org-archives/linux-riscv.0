Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54B5C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 23:54:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8335264F59
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 23:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8335264F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eUVEbXoL3/fcfe1lVDn1xtcAVGBqglbjPZDtQVePGXQ=; b=23efCRvyouz3esxEzpxz14w3q
	RfJzpRJ7SWKf8jz/B7vzvMryn6SeShVO8ggSKpNtr8uq6YWx6CVOZbDAvBaEESj1k0gFrnTlc4Lui
	4ti4XjBJG4sX1ZEKWTv6tBtNx/wQuFwrxz9V1v1Mx2tKUEvGVHpdo+dWpfXfq5xjYfG5n881YH+fS
	1YaqjkKTt/XNAOe2coEGdGGK71p7abpzcyMfvCVSP3sJB2mzrDxxoGUCiJDAbytthIgRDtWr96jPi
	PMsVyMGA+a+orP69vXnzmH6B/u6kU1wODWlaWUmVCOKrOgwdXmgPSCjz1LpT1Q6U4AAIQAc+pxZnc
	5Md54sg5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l75Us-0005Wi-Ay; Tue, 02 Feb 2021 23:54:14 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l75Uq-0005Vi-0D
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 23:54:13 +0000
Received: by mail-qk1-x729.google.com with SMTP id r77so21709953qka.12
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 15:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=owa7yspMu7oxtY/40pJhJawCs1eLW8zh4phVTlhRQGA=;
 b=BOWvLBJ0dKIZx1ByJ56uFwT9ud1ZJnZHsF7ytLpr4i0CFNa6udW4Tps2e2syypWelZ
 gk7kBxiPSAk4L4g6YiSfk6uxwWGfl873Blxi2//W5UN+ZbNSpnHlX7bEwNRegjW859hY
 BM1vd+vffJ5tq4uH82eTSVY41HJiGySOoxQ6KIdewGi9Q1hsr0yoLqaOrYW2mV8KtoN8
 3DSOCWC5xtYAW43ID7NSXfQOEIlkFnK7npZchnIiK/OCy8rgMjwPhwBMfr4kFyHLCQyU
 5LpSzn3fmgYslRMXssdzCZ9GsIM8m2Sia2UjwZS+KawchIM1WzP3+N8Unt3fGchIzrH1
 e+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=owa7yspMu7oxtY/40pJhJawCs1eLW8zh4phVTlhRQGA=;
 b=C8YrxqS21JPkB0Yor4y9cpzhdO3V8PXDKMlYe1Jzbw6M6UuPKC5sZuExwi9RUbO+/l
 aK2V1dPXkvR/bjNsqbRR0qwRCJfe9uLKrwBk0/BvMUpRbQIpc86pUIqYaLfNeK1ndNwd
 AI79/hqnfnvzu2Eh5OKcmGFNjoi2cNlI2PbTX3jJlH3VNjGMKGLabMCztpJzZJxanM9j
 lBzXL8wnHio2FhSlUoVP4WYThhK13jcp/uYJYHiZ2nXi57NlzndHI9SQ2XtSss6hIF6x
 4NkQlaeo0II2VlNmP1CsQo20pCp8khinnIziWg+RiMb4BJuuY6ipgzTkyEa6usTF3+Rf
 vnZw==
X-Gm-Message-State: AOAM532K3jSEgNJsbtZcxsRmxoXt2nddIUBocOVypmy9wMOsAwEtle8H
 sVrt/LKGjq5yk/41gNjptAM=
X-Google-Smtp-Source: ABdhPJxW3GU5vDb2kFDZKMKepKJOoPG54JDdAI7VY/1e98WRrqu4W+TDTU+vuyaj3PmYsFXmEfD/Fw==
X-Received: by 2002:a05:620a:531:: with SMTP id
 h17mr194998qkh.93.1612310048591; 
 Tue, 02 Feb 2021 15:54:08 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id q25sm404003qkq.32.2021.02.02.15.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 15:54:08 -0800 (PST)
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAOnJCUKQ+yFJN9+biMMQW6Wvf=eckfcfMHVpDB74TmxWVNoEkQ@mail.gmail.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <5d565fe4-f624-ea28-177b-2fe01a678260@gmail.com>
Date: Tue, 2 Feb 2021 18:54:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUKQ+yFJN9+biMMQW6Wvf=eckfcfMHVpDB74TmxWVNoEkQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_185412_084804_BA4E6921 
X-CRM114-Status: GOOD (  20.88  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/2/21 1:45 PM, Atish Patra wrote:
> On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>>
>> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
> 
> The spec here says 16 GPIOs
> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> 
> Is there a updated spec available ?

This GPIO device is (AFAICT) from [1]. While the version instantiated on
SiFive's cores has 16 GPIOs, the actual number of GPIOs is configurable. In
Canaan's version, there are 32 GPIOs. Unfortunately, I am not aware of any
non-implementation-specific documentation for this device.

--Sean

[1] https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/gpio

> 
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
>> +
>>     gpio-controller: true
>>
>>   required:
>> @@ -46,10 +51,20 @@ required:
>>     - interrupts
>>     - interrupt-controller
>>     - "#interrupt-cells"
>> -  - clocks
>>     - "#gpio-cells"
>>     - gpio-controller
>>
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - sifive,fu540-c000-gpio
>> +          - sifive,fu740-c000-gpio
>> +then:
>> +  required:
>> +    - clocks
>> +
>>   additionalProperties: false
>>
>>   examples:
>> --
>> 2.29.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
