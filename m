Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A9BC43217
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CF7A61052
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CF7A61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRzew1ffPYhk8rY2fwC2K+iP4cXE1WNc2MKaWoTAlKs=; b=Aee5UAvW/cGyr/
	hOOc7K/Kxdi/5dCzllus2/e5TZMiNS6DtEBshZC00JBl8XVEs02zgGA+3aFdwtsbdWYATOUDiJ+8H
	J0Z48CuIOCxwMKnQJnF7xShgwSjT/Pau0fgq9nPMD0oq7aNboMXE1PhTSjYswHtRjH5Z2x1Nt38Rl
	YSueM5+rGpCXshCfGhnxu+mY8d9Xdd1AwGQ7oKAZv85Xy+H1Ja0MjLaM30cmOCDD6ctYYdxhP4Kr1
	Web/mM4gRtyPtmT/ed/zB5lmNnTYbjFSnHDbkcPO1tA+1RRk+PIMuvyVDcJ1jjaB4TEwmQ1r38uV4
	KH0febsQAQGwM56e1TGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkC3n-00HTHl-MI; Mon, 08 Nov 2021 21:20:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkC3k-00HTGl-FJ
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 21:20:10 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E6AB03F1F3
 for <linux-riscv@lists.infradead.org>; Mon,  8 Nov 2021 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636406406;
 bh=BBCz5m288/6B12v/4PrZDookC7OdH/YJwtMGpm+/mUI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Cb6k9uKiIZ4zUHiv22e0ILLsUjOU6nvoM4n11PVA1oyIfDHtYuESnr7aq7KMLI0Qu
 aOh7yxIajgwNb1Igszh77fq8hoAbolLBlFZJucoixvksUotw48LD6Hbz+8i7P4t6Ar
 h1Mxr9ZXuo2CEKtYWg8IlknkaL1GUz84rcSWMjH+EQxDJ5hMNVhcNGD/3J5YgG/zGP
 B9cWf79kJ29+t06SltR5nYnJZhjYbmvdMdnfXTSM/fiNo+wtX6cwaipI+0rkLrPlpG
 kuKH5Rd6YF43THnJqT8pXVoUKu3hZEg25MtGZ0bG8vmJvQMIxcXP86es8XFizmj4PQ
 fIqxJJ5WJ/PSg==
Received: by mail-lf1-f72.google.com with SMTP id
 i1-20020a056512318100b003ffd4e89eb9so6957835lfe.19
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 13:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BBCz5m288/6B12v/4PrZDookC7OdH/YJwtMGpm+/mUI=;
 b=Qvrf3XYqMr6AugKZenTPy5knahhlfnYbmYssPr3R+XdMS7wCMqelUdL1SWRvz1zA8b
 QAL2g/f5oat9vGx9ZnhQo7bTmkq6V3bWfolwwtydMhwmxyGSz+5/cTJ9yq7FR/te0qav
 4rqepELMFcYYsOBVRa/MOlv+9vcUk3JxxmaVyhwtYMWXWIs4Q9fo76lNEtp18DZckeGo
 VJqzoTKj2RW1sVWQeJYWooQqARgsxUBGA4Bvzu2R4JJ1imI6+SXhgReX4mqL4gkd/akW
 Vkj9Z49dmhhV+12BY/XcoN4s4ESUFjOjpLnUAfQDDZ2joCdKIAlIWDFHX9P52kwHJVqB
 6TPQ==
X-Gm-Message-State: AOAM533QFX5CCSC1NP7wNodOb8Kw1zJqR+a14Pij+BNeWOULp5Ym93iN
 vkUwY2kX4CmaQDR7R9A/gLXDq7XjGXGQqwV/FbOODdeBAPW1VgmZEVg3yNCDPgVdx/qhaKMEpw+
 NWttyZQh0LOi9EjlEfGJ/LXW2gX0Jh3G+dCue9Q/L9RJlDg==
X-Received: by 2002:ac2:5d28:: with SMTP id i8mr2128741lfb.238.1636406406072; 
 Mon, 08 Nov 2021 13:20:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu/B5eBEcFJARxr5eQlDulLCW/jLcGfsjKWhT8FzmI0lnwtMZI6RqmAm6JEjvloPtHRe6cxQ==
X-Received: by 2002:ac2:5d28:: with SMTP id i8mr2128702lfb.238.1636406405870; 
 Mon, 08 Nov 2021 13:20:05 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 z13sm1401476lfd.139.2021.11.08.13.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:20:05 -0800 (PST)
Message-ID: <43023c6f-ea1a-fcef-381d-a39f8799ec0b@canonical.com>
Date: Mon, 8 Nov 2021 22:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 07/13] dt-bindings: rtc: add bindings for microchip mpfs
 rtc
Content-Language: en-US
To: conor.dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, atish.patra@wdc.com,
 ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-8-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-8-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_132008_752388_F74885B3 
X-CRM114-Status: GOOD (  18.54  )
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

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..c82b3e7351e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
> +
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
> +
> +allOf:
> +  - $ref: "rtc.yaml#"

No need for quotes.

> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Lewis Hanly <lewis.hanly@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  prescaler:
> +    maxItems: 1

You need to describe the type and add description. This does not look
like standard property, so it needs vendor prefix.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: rtc
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Add a blank line before new node. The same in previous examples.

> +        rtc@20124000 {
> +            compatible = "microchip,mpfs-rtc";
> +            reg = <0 0x20124000 0 0x1000>;
> +            clocks = <&clkcfg CLK_RTC>;
> +            clock-names = "rtc";
> +            interrupts = <80>;
> +        };
> +    };
> +...
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
