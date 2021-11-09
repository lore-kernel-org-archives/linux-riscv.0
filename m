Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B59C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 13:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E53761105
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 13:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E53761105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk8ege0aHUs61juyFm1xx7HcSr+Rc3/bcbRj3EjnW4E=; b=B24lchQZr+nuEx
	kiVdR5p23vbp6o+RLAPjeldtMsr+LaqWtkwOrGNMgBC4bddbPz+eqGiQ/W5KLMDOicmFthH563Y9x
	FBsQ+Jpj3KzuY7wK3yJi6lADZXU7SDSCwNXBmCBj78P0YCHa+yLwhfQWG0qUr+iwr4J/1nftEpadH
	H/tQ8k/4F1T05Z9T9Xpd/iARfxo60UL4StqJ5OSbY17FnT0uJFPNi9GA0mo2WE9oSJ+CHcDuxettb
	G3aDNU/hADQcVf7GBXULmou8kuQtsa9qkflX3ji/YXs7bfctBZ1qraOP56SJenU5642azMXMyYsVW
	jqHQFT6DCv0SygYqvCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQrd-002GEE-Bt; Tue, 09 Nov 2021 13:08:37 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQna-002DmF-87
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 13:04:27 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B5E1E407A6
 for <linux-riscv@lists.infradead.org>; Tue,  9 Nov 2021 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636463064;
 bh=2z2NwvSe6pbSG5kNNw29eMx53Iup6V00jrvNyErV2mE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=oQzMfY1O2Uz/81RkOpqyzvDEI9byM73TqP12Ol+u+emwUpLNmcSAOjdgz+muVyCUQ
 S1w8NbeXoHkFg7TLaYs0PkmCEiiyaNzCEsi9R0+fJeB+3yW18Lai8xUPXMcHSlrbEb
 w6mn0VvXHTIleMptnJFZjYQc8nPa/YLcGdhyUKX1mq5bxanYe3l/v0UvaclXMqkIgG
 SKuaM9omNc5ZOmNS4IViIZEMCgRJER5sCqLka76mmXnEZdIuQ+6XX7/LXzU/tew/2M
 1gY6olEBjrxmL4bKAVW+4yYKQbjLU094xtZzkjYOQ6hKxJ64ttmMsg5sIqAWj7Hact
 V+G9KuIgWjNoQ==
Received: by mail-lf1-f71.google.com with SMTP id
 f20-20020a0565123b1400b004035ad15d6eso5111873lfv.13
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 05:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2z2NwvSe6pbSG5kNNw29eMx53Iup6V00jrvNyErV2mE=;
 b=JiJesWFYBWwuDJ+DfOuPcymB61POoE+xW9D3J1yOFeA0rwxGPseMQrO2enqTstyUS/
 NrWozp4giAEzRH6wwrpyTwxvulGRYLbb42oz01HvCm+O8y/RnlI9NUc9FS2t6+SYFZGG
 Pb7VC2sgWS7h7L6jEez5Pwk+73zKi0ImT5lXTdLQTWiL+lZJGwITES6Iuf1pkpsTq4fL
 /p6IWBeFf3SRuPG4j/D38CXPNjB2hN7QgQel6LEcG/rZqo8r2adUq1AGIcrgr6JFrLd7
 Ee7AmEwOQ5EVQEYkwhkYqpCZoaWErmzbYrgdIXe3JAZl4gy1wdl27m0GIASyzLPCNKeW
 UjHQ==
X-Gm-Message-State: AOAM533K171uqVq0UQQ59b9bbSg6owvVSX6mEYy1EYLmftqlxjQeurzP
 7lzPO4hSkZ5L2zSFa58FTA+zqDprpaUM41ZNk+Mi9084CppR0usAij4tFoYPa9+aVnMHP0DWJe4
 zZ7ryAewPWJ0KM+uxz7xwY2GDjdKdA9KcAncLDd5DE/w7Pw==
X-Received: by 2002:a19:f10a:: with SMTP id p10mr6630544lfh.487.1636463063952; 
 Tue, 09 Nov 2021 05:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGfpAHgwdqfMj0s/66s42howwCx2sXSklpMlY9GdmuaJ26SPoUGcHRWzMdDHEWP4UUsor7zg==
X-Received: by 2002:a19:f10a:: with SMTP id p10mr6630507lfh.487.1636463063757; 
 Tue, 09 Nov 2021 05:04:23 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 bq3sm2139606lfb.173.2021.11.09.05.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 05:04:15 -0800 (PST)
Message-ID: <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
Date: Tue, 9 Nov 2021 14:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Content-Language: en-US
To: Conor.Dooley@microchip.com, robh@kernel.org
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, 
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, linux-usb@vger.kernel.org,
 Daire.McNamara@microchip.com, linux-spi@vger.kernel.org,
 geert@linux-m68k.org, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
 bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
 linux-crypto@vger.kernel.org, Ivan.Griffin@microchip.com,
 atish.patra@wdc.com, Lewis.Hanly@microchip.com, bin.meng@windriver.com,
 alexandre.belloni@bootlin.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, a.zummo@towertech.it
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
 <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
 <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_050426_538935_FA1D2889 
X-CRM114-Status: GOOD (  20.73  )
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

On 09/11/2021 13:58, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 12:53, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
>>> On 09/11/2021 04:06, Rob Herring wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> Add device tree bindings for the {q,}spi controller on
>>>>> the Microchip PolarFire SoC.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> ---
>>>>>    .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>>>    1 file changed, 72 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>>>
>>>>
>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>
>>>> yamllint warnings/errors:
>>>>
>>>> dtschema/dtc warnings/errors:
>>>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>>>      19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
>>> Rob,
>>> Should I drop the header from the example or is there a way for me
>>> specify the dependent patch to pass this check?
>>
>> The error has to be fixed, although not necessarily by dropping the
>> header, but by posting it. How this can pass on your system? There is no
>> such file added in this patchset.
> I linked the patch adding the clock as a dependency in the cover letter 
> [1], which is why I was wondering if there was a better way to do so 
> that would get picked up by the checker bot.

It's not only about the bot, but dependency when applied. If you did not
warn clk maintainer that clock bindings should go via Rob's tree or
should be provided as a tag, the patches here cannot be applied in this
cycle.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
