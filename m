Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07BDC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPFmbhUtRCjPU1KUTnsAZ5LNzNZj41RD9DS3UrmUjis=; b=jZZZ2e37lIVUin
	tS9oWdaSZrlVhNsrxfVcQm2wtmBEWoNe5MAYOhYzsNLKkSNtk5HKt1oT/EPkGNArpUbavmnK0RwN4
	4uXnw4SkXSxrlQdUy+GzSuzuqHMkOPwry8zUfEabFJen7aqVXxeOOvzriSFvskRsbDy8ChLs3GtQM
	RS234t2qLut8Xx0lUzzmLyXT5vs/gM7WFF/r17RcFr7mYD2AP9DiPplp8SAMJmGk0LsiHQqsRKTTh
	GI3pmT2wj02a5nc4EbhPzCPEGlxLn+hOFa33wNtsisXGsn8uj3fn2cF9XOp5NhSoaYq/R9SK3xJjc
	n8TfbOQle9MyCmE4aLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0243-009Vjd-94; Tue, 29 Nov 2022 14:58:27 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0240-009Vfo-1i
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:58:25 +0000
Received: by mail-lj1-x230.google.com with SMTP id d3so17593463ljl.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rMzROJizPl93HGtOKCLbNrY7oFQ4h6JFqbBwgiPoQw=;
        b=HK7NNJ+m0uo/8YiZigjIrMXrWT37vfCzE7ov3f7OWCf7ekUevZr/VqIA7JEZ2GKayk
         NRRVL9YSxbesfRYHWDaQuOX+C3/nCgmBSaPtE/344PBJuxVwlIrdUXUU++oqaf9G2qN6
         EA8zpZKOLeRklTG1AROPnVm+qvCAS9JQm2XG84OxkYA82ZH5d8ay6/OjOEuYmXuV6/vz
         84cqiQLfQ4fTOoVC4lrGW2dGf5ibfzL4uUZa2bN+ONpzydOi4ONItIRz0XxcdjnC1bAY
         zWgzwbqm9dmm+XOY5N6W4/zjzXOqa8JoaxQgtz3O6T4BmE72V9m4x+j+wawmEgu7P+9j
         WNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rMzROJizPl93HGtOKCLbNrY7oFQ4h6JFqbBwgiPoQw=;
        b=XvhjQWdm4E8Ah/Sn9bjyqTlFVKeNtaeiaSu0hL+O02nkQj3AXlwvaJ4LO/7SOmuCzf
         JT34KdGdyz4TVUafPs9HB6EwK+XRDJqNPi4FuUWFnWLTa7VW66+7yQe8dAa6QEeRaCdL
         tLabgEDUzuonRmHlxTDBIBnFyUSq/zChhJMf1b7NHxmMaWppBQiYgsYyI8lPInrN2Uqd
         Q1LT4ztdDGYZ25p1PP2ZsXpM4VXsl/YF04KBpW8ZRwGb2VjxMPc0gkV2gzScBa48qe0q
         uxCGagI5IJIRHbxuR6cXmzqpIjYzCrGNwUFFzOKwraR9JrcGsNEBhU7PlxOvIC4pZdFh
         2Bjg==
X-Gm-Message-State: ANoB5plU8bktaOZYYcvhOmHLM+Au838tky2dpjcHZ4gzMRXzziY1i/AV
	ZRltWMnXWybXGh1Lr7UZjGAtdw==
X-Google-Smtp-Source: AA0mqf6H7HysSViJIaGj4Ohg+efF0OL6qEvNKbtfijn0aiuYjc56hcFvmqwVVrFHWxq9fJmbcsxrdQ==
X-Received: by 2002:a2e:800e:0:b0:279:8e27:b42f with SMTP id j14-20020a2e800e000000b002798e27b42fmr6914373ljg.106.1669733894163;
        Tue, 29 Nov 2022 06:58:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 13-20020ac2484d000000b004aac23e0dd6sm2232708lfy.29.2022.11.29.06.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 06:58:13 -0800 (PST)
Message-ID: <f52e31a5-a12a-b95e-b99c-1af8f8b41c3b@linaro.org>
Date: Tue, 29 Nov 2022 15:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: Add StarFive JH7110 pinctrl
 definitions
Content-Language: en-US
To: Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-2-hal.feng@starfivetech.com>
 <eb3974a3-f715-f5b0-cac7-551af26bd17b@linaro.org>
 <08db0f3b-5222-9460-26ba-0e6380d16583@linaro.org>
 <0ceba170-f844-e733-a49e-e67746f9f836@starfivetech.com>
 <093ea507-4c42-1af9-4896-64c1a918432e@linaro.org>
 <30c21787-0c48-ff50-1d63-8e69bdcdbe30@starfivetech.com>
 <339be655-aee7-e1a4-51be-28ea20de6792@linaro.org>
 <3db802d6-114f-097a-6c69-e7b40e4d2764@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3db802d6-114f-097a-6c69-e7b40e4d2764@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_065824_162992_4109A675 
X-CRM114-Status: GOOD (  20.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 29/11/2022 15:46, Jianlong Huang wrote:
> On Tue, 29 Nov 2022 08:49:49 +0100, Krzysztof Kozlowski wrote:
>> On 29/11/2022 02:47, Jianlong Huang wrote:
>>> On Mon, 28 Nov 2022 09:32:45 +0100, Krzysztof Kozlowski wrote:
>>>> On 28/11/2022 01:48, Jianlong Huang wrote:
>>>>
>>>>>>>> +/* aon_iomux doen */
>>>>>>>> +#define GPOEN_AON_PTC0_OE_N_4			2
>>>>>>>> +#define GPOEN_AON_PTC0_OE_N_5			3
>>>>>>>> +#define GPOEN_AON_PTC0_OE_N_6			4
>>>>>>>> +#define GPOEN_AON_PTC0_OE_N_7			5
>>>>>>>> +
>>>>>>>
>>>>>>> It looks like you add register constants to the bindings. Why? The
>>>>>>> bindings are not the place to represent hardware programming model. Not
>>>>>>> mentioning that there is no benefit in this.
>>>>>>
>>>>>> Also: this entire file should be dropped, but if it stays, you have to
>>>>>> name it matching bindings or compatible (vendor,device.h).
>>>>>
>>>>> Thanks your comments.
>>>>> These macros are used to configure pinctrl in dts, so the file should stay,
>>>>
>>>> Why they should stay? What's the reason? If it is not a constant used by
>>>> driver, then register values should not be placed in the bindings, so
>>>> drop it.
>>>>
>>>
>>> Thanks.
>>>
>>> These macros in binding header(example, DOUT, DOEN etc) will be used in DTS,
>>> and driver will parse the DT for pinctrl configuration.
>>>
>>> Example in dts:
>>> uart0_pins: uart0-0 {
>>> 	tx-pins {
>>> 		pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX, GPOEN_ENABLE, GPI_NONE)>;
>>
>> This is usage in DTS and is not an argument to store register
>> addresses/offsets as bindings. What is the usage (of define, not value)
>> in the driver?
>>
> 
> The existing implementation reuse the macros for DTS and driver.

Where in the driver? Grep gives zero results.

> Do you mean we need to separate the macros, one for DTS and one for driver usage?

No, if driver uses them it is fine. The problem is I cannot find it
anywhere.

> Or you have any better suggestion?
> 
> These macros are the value of register, not register addresses/offsets,
> except for with prefix of GPI.

Still, values are not usually part of bindings.

> 
> Drivers rarely reference macros directly, mostly parsing dts and writing them to registers.

So drivers do not use macros? Then there is no reason to store them in
bindings? What do you "bind" if there is no usage (and we do not talk
about DTS...)?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
