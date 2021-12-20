Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9218C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ObowT8GiywN5qdRA6u7f6Hol6Pjx+3EUs6I/N6e5IM=; b=oyJFMqY+AGnTFS
	EI54ray584AUXrLfapasDM9b40940dHdA0l+SLPgEQYy5y8SvA0xcePB3iZ/wrrMJVD2OT1+2OOZZ
	Un2RELF22i1bKxJWvBDmQk3BAl07DrV4djXGmmek9dGpfLbIKZYsro0d0+8TIafNauI7NSLpljTIy
	ePy69pkPu95APQ/Je+8rjahpaUjIAQ3R+UP7HgHIVEO/rabRxcTwp7EhQpGiQDwUNLKjAP38hLHjk
	8HVUuggOgmn3i2jdyiRPmlw8spRZOHUhYkg8O4DZ1MURkH/s4hwfyBMvNO2Nu7sfDTeuYXpczCnJc
	eNDahPvWRBp9C6/uy+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzJnE-002qLX-1b; Mon, 20 Dec 2021 14:37:36 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzJnA-002qJe-TX
 for linux-riscv@lists.infradead.org; Mon, 20 Dec 2021 14:37:34 +0000
Received: by mail-oi1-f173.google.com with SMTP id p4so16028520oia.9
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 06:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MX2xD6NxZlK32RqDAc9k/pbvJlT/hpUSltlaWuBfZyY=;
 b=W2yOD0gpDunGBewP4k0uMU3O7Eb7M2BDOLonjR8b8Hu3ie9xBzozc3+3UttyZcL5qS
 r6gJuHhvWRpzwVsEp3eUk1R2wsBH0Cl4Z9StpsK/sj490AzVuBcQz6qxG35W3zFgwjdK
 i1oE4puJatHulxZkDLDlaD45ZyAEPfM+5W/D6Ae/gKse+HIzf1KpGt5kgmu5K36WismN
 MmQ1IdE4X1An8ahknGRiMnm/kuVzXiFotzu7pvBBuyzZOAnLycZvnAeLjFrK4chteQu8
 KsOTU8jtqtklqGx4/s7+WR+5q7I99kgrl+axrfuGuAuu13tDT3WAjW7i4615UU0je/2j
 i16Q==
X-Gm-Message-State: AOAM531aKU4f78AdSNtmv0vwjOUODcYLcs0QERIN+TjVt93Yz6+yvrTS
 TfffNL8QFNW4jr1eMo4FYQ==
X-Google-Smtp-Source: ABdhPJwb8Epp66kgn5FAQJGNGoQLiIht6dxhdac9TXEyh6nIWNGhfonlF1xdobHH+VltWNqopZLZIQ==
X-Received: by 2002:a05:6808:11:: with SMTP id
 u17mr1043535oic.88.1640011051574; 
 Mon, 20 Dec 2021 06:37:31 -0800 (PST)
Received: from robh.at.kernel.org ([12.252.7.226])
 by smtp.gmail.com with ESMTPSA id ay40sm3423367oib.1.2021.12.20.06.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 06:37:30 -0800 (PST)
Received: (nullmailer pid 3403888 invoked by uid 1000);
 Mon, 20 Dec 2021 14:37:28 -0000
Date: Mon, 20 Dec 2021 08:37:28 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 broonie@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 07/17] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <YcCVKFm+7aEG2FYH@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-8-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-8-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_063732_985700_6C46A492 
X-CRM114-Status: GOOD (  17.66  )
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

On Fri, Dec 17, 2021 at 09:33:15AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..d57460cbe5e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,63 @@
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
> +  - $ref: rtc.yaml#
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
> +    maxItems: 2

Need to define what each one is.

> +
> +  microchip,prescaler:
> +    description: |
> +      The prescaler divides the input frequency to create a time-based strobe (typically 1 Hz) for
> +      the calendar counter. The Alarm and Compare Registers, in conjunction with the calendar
> +      counter, facilitate time-matched events. To properly operate in Calendar or Binary mode,
> +      the 26-bit prescaler must be programmed to generate a strobe to the RTC.
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32
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
> +    rtc@20124000 {
> +        compatible = "microchip,mpfs-rtc";
> +        reg = <0x20124000 0x1000>;
> +        clocks = <&clkcfg CLK_RTC>;
> +        clock-names = "rtc";
> +        interrupts = <80>, <81>;
> +    };
> +...
> -- 
> 2.33.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
