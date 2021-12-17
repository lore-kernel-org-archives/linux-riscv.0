Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4174C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REwthwaHDeWSyMaKbJ5thxvOeAmBmq99oLzcvNn5E+8=; b=ToPAqH6A6fHAqh
	Zt5lGiYChgEm9wDExO/gbDmMyf8KhSwXOTGipl7b0spAuA7am2+lUvwDUv/T1Ysa7YK091iF7FU4t
	4VwwZjMRoOftm7CBVTNe+ZSRNNGJBWKj4gbdB/UU5C3+GHB7VH8ox+QiCFUExIkh4UbKip7t/etDh
	gRrI92TK15fFMTmnxW8erh1id2zgcbIPZ6f45gUmiCp+Qto2ATzJrcfgBEWhr4BwEGdv3wR/dO/Ks
	yKCMcvWJGi1gsFdSwvpFiKHG+EifcYm+o6DXXZ5Bis2EZeKok70N/+ollFTU5qYnUTpHg1aY4FEdj
	oBrTXfAQWf+EnRsyY5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEcO-00AkrL-OS; Fri, 17 Dec 2021 14:53:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myEcL-00AkqK-Hu
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:53:55 +0000
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0C0953F1B3
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639752827;
 bh=GqzX2VxzFw4eQfFWT0YAjK60guUkBXetROhM4dzVpro=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=KLPLLgBW60YBEviAdw/IUsGAqq7VS7v9iN136JUYF99xIijuRr3TOTpG5YSXlKhTl
 eQ+UpdHZDzON5bkFvzpbjoWW69kT3+da6KnzSzvSgB8np6Nd5qwYSooKvwfOsZpATt
 THyWaio5vBduQ5wDjFnB7pYvh2gqbF41BYd4zsBr70FzwRKKQ6AUJ+EfK8oh1z0bme
 JnveN0ASKX2NB34mnZFf1X+/6aMjbNs86DGFl16Y/ekSSve+yNc2Hg38Zff8ZVqgl2
 lBpenj5jdXK46dOx6bcHAEi0mn2G/eo3BJLp/Lsd/55F9Wg4tBN1vImZDcgux1KKrQ
 qcN1VKB9sBdkw==
Received: by mail-lj1-f198.google.com with SMTP id
 n6-20020a2e82c6000000b00221698ffa68so764755ljh.17
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GqzX2VxzFw4eQfFWT0YAjK60guUkBXetROhM4dzVpro=;
 b=li9jMiblOx0E0pyT664BUBc6stRjjqTnwD6LWjk/CgTLMYAqK9uDLkJdSs8o6Uneo+
 lTVDse2FtSl11hiHkoacAngv7ArqP4Hhb9WLa7IZcQKpC7wgNNGq4IuKh1Q7hbv5siQ4
 ZC8xVfd0lxuGdH+Y2Ut6MwQbCOmuRjQl0PgQMyoSxPX5+R7o0bXYbuzbhGEccrT3kuLa
 ZMkk/FSjbPvD8xR0QQZuuwbXQzNIXXEqQSTBbgdVoNoPuLOT/VaHh0arjg1trRTJNjLD
 /VXmpp7SJtNgawBq6dN9UrKi0l8zV18gs8LswTZA7ZRvUio7V7b2PXIwDKxPo/+jtQbE
 YAtw==
X-Gm-Message-State: AOAM532KDizgJFs1nI1bQHJ1tADn9BfrJ1o/Pp5SjGgAyJ7QSmsI85vd
 uZYqH+JdQ4Mx5PtNBoMu2Hmo4J9WuuWl5k0Ay3rCJKhFA6dmT/vbqmclGAfVmfaF2OvZhCo0siF
 KxfwynaOwF7szHvzj2odpd6FfRCJqWmHZCAsVjxgMxmVPKA==
X-Received: by 2002:a05:6512:2250:: with SMTP id
 i16mr361832lfu.24.1639752826427; 
 Fri, 17 Dec 2021 06:53:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWZAhKPzpNiuI3jFYeXfUrK3lYJtF2bSZiJkAI3tx170rbCKWelfdxX/kRZ9W0bjHvtpmAig==
X-Received: by 2002:a05:6512:2250:: with SMTP id
 i16mr361809lfu.24.1639752826232; 
 Fri, 17 Dec 2021 06:53:46 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 76sm1687531ljj.69.2021.12.17.06.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 06:53:45 -0800 (PST)
Message-ID: <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
Date: Fri, 17 Dec 2021 15:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Content-Language: en-US
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-7-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_065353_782999_60D6BEFD 
X-CRM114-Status: GOOD (  17.07  )
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

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the hardware rng device accessed via
> the system services on the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rng/microchip,mpfs-rng.yaml      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> new file mode 100644
> index 000000000000..32cbc37c9292
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> @@ -0,0 +1,29 @@
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
> +description: |
> +  The hardware random number generator on the Polarfire SoC is
> +  accessed via the mailbox interface provided by the system controller
> +
> +properties:
> +  compatible:
> +    const: microchip,mpfs-rng
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwrandom: hwrandom {

Three topics:
1. Node name (as most of others are using): rng
2. skip the label, not helping in example.
3. This looks very simple, so I wonder if the bindings are complete. No
IO space/address... How is it going to be instantiated?

> +        compatible = "microchip,mpfs-rng";
> +    };
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
