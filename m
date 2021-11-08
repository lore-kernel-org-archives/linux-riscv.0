Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E9FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:17:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25EB3617E5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 21:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25EB3617E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bj+Xyhm1nCgLTtbjfJY1r0xl5TlYwre/CyWzVyLZ2sI=; b=2Pz7rFU8ggfkDl
	6gMG/AefSZZqHabWaAAc8e+HZF/bKwk7sZQHjdPtfqBeCGmIGuoVljEsImEJAa4eHYaVcoJCCZEvw
	a3JlvUbVGsjYjg6Va7V1sZ8ji2AoIQm07i8iVrOY5LFSZet0RyI5nULaG/ciNrbEViM9zsOgh7UAN
	4JEvoPV8phmphUSmzfIW1WKmYwTtY3V+XJyZ78uKOt0NUgix8Ee/5ReXHTWhaPPYA0wHvOlVaQbw/
	jxb5X9UXnK0jtEpuxfCQ5lsHi8TnwkCvuZ/W9O0CL5ztYuf9H1W5r/kKBy+9NslNZazsTEUqeVUIA
	TCuTugxeUxuM3Xy5e/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkC0h-00HSxB-C6; Mon, 08 Nov 2021 21:16:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkC0e-00HSwH-6t
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 21:16:57 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BBF363F1B0
 for <linux-riscv@lists.infradead.org>; Mon,  8 Nov 2021 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636406211;
 bh=Ktl81v/Bz9DUD2tGXyt3QEXrDSC6xACsZ55UZL0LQHo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=d1whGz9Urx9flAMPrcbWsZjcCAG7StsO3PGO6zzK+xhPQCEL0wxoGPNaJAES6hKEi
 8iq6GSgaFOn64IGSh02ebQizSdhK8k6rBnbn6MwsaHnv3vPV8Ms+SBimOjHncZNva1
 JydWxezTl7v8o/kPndWImxhi5emvU0Zv1BGkgF3aB/dD14akZhGNd3bxHAlOaQ67bZ
 RDFWwhA0IbvYm7PvBZqxf1x7Sb/A9Qfg/vGVVGdOR7Xr5kwkFZU3gvlhcbiicK2zNQ
 JtpzELyUDY0gymzFWZ1Ra+bhB4VzXoCrVjojWKMgPYUxcdevGwIz5wZRjz8avYx0FL
 7PmNVRDeMkLGg==
Received: by mail-lf1-f71.google.com with SMTP id
 j9-20020a05651231c900b004037efe9fddso446505lfe.18
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 13:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ktl81v/Bz9DUD2tGXyt3QEXrDSC6xACsZ55UZL0LQHo=;
 b=aOPh9iHelJv7kp0agDFzvQyClmwR7koxC/bgQfIHHU9hSuqYnoBiYok3dwMexAXS0Y
 xt50Vog3RY9+4VcwZH8QQ/rxjaHH5QUo/zekJri1EzkRBX6lAkIRNwJ0QTvEtAfVMn/p
 KMM5Oc62C8L1J/+dfLrEEO25FtCJWslPUSG/1uMZ6bn2112LRGLFbYcDIePJguSc9O/o
 wyzCs5SOfvr7ty9VJee5mlinaoAl4JaRDy2tQNRGlunZJNGM034L6OJ2xRgHiyZ3oCXW
 pjjeN2L1jUPbsrWlYLDKjL9GhKFzOq9qzX5SbBfhtMaQxG0USoxEWHfHGquhTz8FLJX1
 YnJQ==
X-Gm-Message-State: AOAM532U/kJ8TSk/TLtpCku3wcdgF2lrAVI4U7p9eXbxc3VHg0twEr8I
 /+Q8a2kbatB6VpuL71zwUh+OjLvViz846TDkBw3FZcgQ4QpSePWqwfFlSs2VS6TXiXQrGwJDGbM
 B1M4Zun041gDMDVxWdXJ0qC/v6uTq5OOS+Xx4/69xejaTvQ==
X-Received: by 2002:a05:6512:ac9:: with SMTP id
 n9mr2180452lfu.188.1636406211219; 
 Mon, 08 Nov 2021 13:16:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOHL/9FtziDi6gx/33uA/2HxKYlDj46e0NYgoc72BGcMAuHzBgPINWumBlRSVqAb6ZuLjwSw==
X-Received: by 2002:a05:6512:ac9:: with SMTP id
 n9mr2180441lfu.188.1636406211057; 
 Mon, 08 Nov 2021 13:16:51 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 u22sm1063187lff.118.2021.11.08.13.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:16:50 -0800 (PST)
Message-ID: <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
Date: Mon, 8 Nov 2021 22:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
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
 <20211108150554.4457-7-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-7-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_131656_421824_174B3068 
X-CRM114-Status: GOOD (  18.25  )
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
> Add device tree bindings for the hardware rng device accessed via
> the system services on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> new file mode 100644
> index 000000000000..e8ecb3538a86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS random number generator
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-rng
> +
> +  syscontroller:
> +    maxItems: 1
> +    description: name of the system controller device node

There are several issues with this:
1. You need to describe the type.
2. Description is not helpful (just copying the name of property) and
actually misleading because you do not put there the name of device node.
3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
please use existing syscon bindings.

> +
> +required:
> +  - compatible
> +  - "syscontroller"

No need for quotes.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwrandom: hwrandom {
> +        compatible = "microchip,polarfire-soc-rng";
> +        syscontroller = <&syscontroller>;
> +    };
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
