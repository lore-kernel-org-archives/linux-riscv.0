Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045EDC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 15:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5KIjz5K5G9+LmDDe2NcTC95wsQ2ZfWT/oVp6EypRVo=; b=JWeNIE+OoMj7LA
	ExLITlApzKjLDNT32Sd2dPWC25bIE3pfWPV7gbOMIDBRQfFsuFedIaS0RhqwRv/M9+nccS77CdJ3T
	vHrQZEo23H7DjgeGgqNNpCkzlKtsMxkHtdjOuJJfRAwasOQqMhB6FqsEirz1Jg/n6n0/2VImPwPel
	ksVN3HrECIKbSnw9nHSiu0LTWCwvVhJXV5ii+aJRfsrZTlMFXuOOrXCc4lrv2dUPF98xV/K9sM5BW
	BBkVsiQc1RLUT3PbdZTwnKGvR0yPvCpDG4UIwn3Yv0GZL0AYM8KFUYh5sXp2NLsMDXBqs/Y0pTzN9
	NfWXtp19QfLBhIYTmJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFSf-00Axr3-OK; Fri, 17 Dec 2021 15:47:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFSa-00Axlk-4g
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 15:47:54 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0905C40710
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639756070;
 bh=hhDHhyLf8ciLV/pb2fq9VsORYOGJ7hjmmAlIVCJH7WY=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Uhst4fGnKyxopwoeoqlw5g5otWrvV9xYcQ3bFLerTWAGlhQSKJjJpTgdsu1MpNyMq
 32awdXE9MBirF2apioc54MEUBUYHL78zlFksAr9VA8/yG1wVy4gdIPAmcC2fzmF4/G
 ovAytnUAF6cipSUWJObx1jeq7nAuz111i75eMRYNTo0dyo/lu7es++dLi0kjRZeQG9
 emLaMN2wMEC3q6d+WpKKqd3W/8guhXVnQz7WDkng0sL+DiMrOGWDsfpkyniV7M7GrI
 KmbVzcN8acJoKfMS/aRYpOQmOJvjXoJXHMdFVpYBGoUokFcD6VZLqsMlOf+rcLaxUm
 DuKCvqnLkAb6Q==
Received: by mail-lf1-f71.google.com with SMTP id
 bi30-20020a0565120e9e00b00415d0e471e0so1035424lfb.19
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 07:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hhDHhyLf8ciLV/pb2fq9VsORYOGJ7hjmmAlIVCJH7WY=;
 b=8Nvyl8spUGTlptxx8bko77gxo8569AWekXINStfDO9F1ReP4u3FHqxEmqLB66CBag+
 HeTnwBaNx7P7y8AzcKwsFlPyCgSop4lH5dUQ6CIEhF+IiUnLz5U4L6gTRGkjdc0sb6y/
 hNmjrxLxxXXGSKJNdTPwlc9fPn7bSXq4SKhxaxX9twYqUOtYDmtN82pBKRmfBFUZrtto
 Dp5L/M10VesTIvq7/Hx/Nhd5lcuij5lOuXyftTsYuV8CMIBjyRIomb4/kimgPL5rWHbY
 Ltrg5v6mjBZWPGw6AJp+8ljJ/dNKdR+HtcoXCRSUrBFHkFMEaAQ+qftj3oeQG3l4574J
 iDHQ==
X-Gm-Message-State: AOAM530RftvYu1vUoShO9xYW1H3jTrqHduI6CsS2sKZms30Pki2Ua6sk
 923W+ZqR0QytdbVQyftXZR8W/ja+qfOgWm5tyCKcTkRuKffjgei1YguAp9JLUB357jANmRYnTkg
 KYs2s9CB95Km8pO0p9RwVz0f+BuZlf/iBOrAGbCz1TYe8Hg==
X-Received: by 2002:a05:6512:2150:: with SMTP id
 s16mr3408738lfr.519.1639756059690; 
 Fri, 17 Dec 2021 07:47:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt9tJHIq/B3JqqY9RpHltS5AsBubgidwCcIwxibp52U1LQxYs+vVjkCeSXk+SDsWN3QzhEUw==
X-Received: by 2002:a05:6512:2150:: with SMTP id
 s16mr3408731lfr.519.1639756059505; 
 Fri, 17 Dec 2021 07:47:39 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 w25sm356919lfl.33.2021.12.17.07.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 07:47:39 -0800 (PST)
Message-ID: <2e7588e5-9dc5-571f-d7e9-0ee5c89ab39e@canonical.com>
Date: Fri, 17 Dec 2021 16:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Content-Language: en-US
To: Conor.Dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
 Lewis.Hanly@microchip.com, Daire.McNamara@microchip.com,
 Ivan.Griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-7-conor.dooley@microchip.com>
 <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
 <19cbe2ba-7df5-7c7c-289f-6dc419d9f477@canonical.com>
 <422126ac-ce26-2940-5b4d-fe79a1fa89c5@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <422126ac-ce26-2940-5b4d-fe79a1fa89c5@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_074752_381697_BA7E7FC9 
X-CRM114-Status: GOOD (  16.49  )
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

On 17/12/2021 16:22, Conor.Dooley@microchip.com wrote:
> On 17/12/2021 15:07, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 17/12/2021 15:53, Krzysztof Kozlowski wrote:
>>> On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> Add device tree bindings for the hardware rng device accessed via
>>>> the system services on the Microchip PolarFire SoC.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>   .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
>>>>   1 file changed, 29 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>> new file mode 100644
>>>> index 000000000000..32cbc37c9292
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>> @@ -0,0 +1,29 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>>> +
>>>> +title: Microchip MPFS random number generator
>>>> +
>>>> +maintainers:
>>>> +  - Conor Dooley <conor.dooley@microchip.com>
>>>> +
>>>> +description: |
>>>> +  The hardware random number generator on the Polarfire SoC is
>>>> +  accessed via the mailbox interface provided by the system controller
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: microchip,mpfs-rng
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    hwrandom: hwrandom {
>>>
>>> Three topics:
>>> 1. Node name (as most of others are using): rng
>>> 2. skip the label, not helping in example.
>>> 3. This looks very simple, so I wonder if the bindings are complete. No
>>> IO space/address... How is it going to be instantiated?
>>>
>>
>> OK, now I saw the usage in DTS. I have doubts this makes sense as
>> separate bindings. It looks like integrated part of syscontroller, so
>> maybe make it part of that binding? Or at least add ref to syscontroller
>> bindings that such child is expected.
> Acking the rest of this, re: adding the ref: is what is being done in 
> patch 03/17 insufficient?

Ops, I missed the 03/17. Yeah, it looks it is sufficient and in such
case I think you do not need this patch. The compatible is documented in
03/17. The same for sysserv.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
