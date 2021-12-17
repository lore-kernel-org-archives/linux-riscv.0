Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8CBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ek6G3vDVgGMFGRJdIP5XvirhtWoYb36PylQsp/c2ybA=; b=xuBXLrDZPMlK0U
	BFUpxVJXIOD6ZE/f6EpIyVm6zp2tL1/OLBOsUBTYpj+3tZQ1RV9qOGLTEc4fcAQKep8tKfbb0+LeJ
	eeGE9HHFpUUq8xxCB3TI8zWeMMVNFtmgNkVgtwZXpHtgho4695rb7LctbIO/W7XwyYS81/hJ3tZPm
	aVNXXa8qFUhP5fI4k0of3tBP+P5CG9hBBuEGGVGqswx3OUo4B4oSSUOVE8cSIpRxzfXy76WKE/2Xh
	26QdfKkgAJZHQQxeNN8Hx9JTWqs8eRF2X2jKyRLdjPod0GYf5m70oaReLrz1SqXE9Cr9ikGJpSgHP
	zbgDvN54nW9j2A5ZzlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEq4-00AoEM-Vh; Fri, 17 Dec 2021 15:08:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myEq2-00AoCS-Cb
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 15:08:04 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B0B683FFD8
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639753680;
 bh=EscRM3zeuMe4QRAvQ51JRRs9n/Wn3urOySWDrMNRXHw=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
 In-Reply-To:Content-Type;
 b=nC1a72Ms5+ElnHuPdN2ha9ZL/KcHJN7abHUw5eGA9yHhJXSXeduX+uT0/LnauQMQR
 XRjaTBbUXi0Y/SJ23iOtKjrzxlC/ZP9G0scxhK80k3k+nL77IGB1z9u2rPvWqwySpT
 got5nni0oO8da/9WPPAx8sS+RvxtuTLOWTMkOvIw9O1sDE10XcXDBknV59gGWOLbdt
 2+EvuyxcaG2j16KeD/HVFGHOVdOQEZfwaY9PsjT/tF94MT2z3rIncHvEFY6a31+ihm
 2500XL0o8Lh/xcHBf0AcZU92hO8V5mpilE7Ql2BuRUVQHa1PHXc/WGl/4KSU+fAnVX
 AFhp8TjGMYrOw==
Received: by mail-lj1-f200.google.com with SMTP id
 83-20020a2e0556000000b00218db3260bdso779466ljf.9
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 07:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=EscRM3zeuMe4QRAvQ51JRRs9n/Wn3urOySWDrMNRXHw=;
 b=TwRmYZ3Z/FHKt4IlTgrsRf97g/YxwOD8gly7edlkKwPnJhfc9daQuZ+mF6COe8vPXw
 Y7UZXlyzt5/uRbtsxfNxFbo7WEgSzXGphsvbOcFBFWwu5ndK7zgZE/ImJybInzbSic8l
 6s8MY/CidhmWKwMJjyDaOICgy/XsX69WdRiM9tIdYRafdsXIe0xbmGZgFY1u9tpdMmYJ
 /WRPETAnXhjfL5Q2f8vMtYvejOFk7bzQ8g9KK5Kq7jid/IaURae6C15ZLRm0l3Q19yVh
 awIf1RzTcRD7+oomSa3a6c/LQADSEM00BNGG325aBAryLaFiu5IIEKohf4cFsLpIJOUp
 EN0A==
X-Gm-Message-State: AOAM532jbL9LW7DXH1OafvA0sjEQizgJ4pjNUFDsK76Qpway/2CMtOVt
 PfmruSOa27J9Kb8JnfOQTdAffo74PZatCCsAT9QjerYgXzoz7PyoysfBqkay7obKm8XBtrrEHDf
 oAJyRqyUAE2fhqWtBqTXa8aI4MWF/pRJafN3ksBlMO8hKrA==
X-Received: by 2002:a05:6512:368a:: with SMTP id
 d10mr3057520lfs.476.1639753678788; 
 Fri, 17 Dec 2021 07:07:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjit/KxYQojMyrYyqg3tppu8lupjtyMuTl3o4zZeCjXmcoayEWshoXqKAPpfREvzZOsoCa7Q==
X-Received: by 2002:a05:6512:368a:: with SMTP id
 d10mr3057453lfs.476.1639753678217; 
 Fri, 17 Dec 2021 07:07:58 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 18sm1764464ljr.17.2021.12.17.07.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 07:07:57 -0800 (PST)
Message-ID: <19cbe2ba-7df5-7c7c-289f-6dc419d9f477@canonical.com>
Date: Fri, 17 Dec 2021 16:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: conor.dooley@microchip.com, linus.walleij@linaro.org,
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
 lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-7-conor.dooley@microchip.com>
 <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
In-Reply-To: <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_070802_623167_323006E1 
X-CRM114-Status: GOOD (  16.73  )
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

On 17/12/2021 15:53, Krzysztof Kozlowski wrote:
> On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the hardware rng device accessed via
>> the system services on the Microchip PolarFire SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>> new file mode 100644
>> index 000000000000..32cbc37c9292
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>> @@ -0,0 +1,29 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Microchip MPFS random number generator
>> +
>> +maintainers:
>> +  - Conor Dooley <conor.dooley@microchip.com>
>> +
>> +description: |
>> +  The hardware random number generator on the Polarfire SoC is
>> +  accessed via the mailbox interface provided by the system controller
>> +
>> +properties:
>> +  compatible:
>> +    const: microchip,mpfs-rng
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    hwrandom: hwrandom {
> 
> Three topics:
> 1. Node name (as most of others are using): rng
> 2. skip the label, not helping in example.
> 3. This looks very simple, so I wonder if the bindings are complete. No
> IO space/address... How is it going to be instantiated?
> 

OK, now I saw the usage in DTS. I have doubts this makes sense as
separate bindings. It looks like integrated part of syscontroller, so
maybe make it part of that binding? Or at least add ref to syscontroller
bindings that such child is expected.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
