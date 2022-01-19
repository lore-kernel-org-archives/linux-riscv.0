Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82751C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 03:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSxIlakpsJgvbE8oyqN2Kve6h6CqXZ1Flbo2C47L5hw=; b=Enr14gOVIH9QlD
	6X3X2mf5jp3f5+9RAvwkV5zQu2/ZzVcmmpcIiq/soluuxMbLmZUgIeGnZyg9pfrE/0dOtij0Gco4y
	AsboCTBJxHE+437AksAj8qxOnMHV15UTgGCLgfs3+p8o3J/fqRyY6NFfV6U30FBCLzUqqNkYv/qOS
	5OWRoZE7JofN52h7lLjbIHRh/LphA1o3YSUyS6vja/EHGYYnYXW7tBxdOICTttsxE+qjYVbQO0o5v
	OQVlHhcyoi21wGELGH8GfIRXyT+z8gM1cjOLa9/VXjFBAc73L9u4QnfTliP8Gn/TniENYw4kSjQuZ
	U4DzrEs2hgasRREcr/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA1OK-003ei7-6Z; Wed, 19 Jan 2022 03:12:08 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA1OG-003ehO-Su
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 03:12:06 +0000
Received: by mail-oi1-f177.google.com with SMTP id r138so2063020oie.3
 for <linux-riscv@lists.infradead.org>; Tue, 18 Jan 2022 19:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T36W0/c7/6WIDFnkmNkEe3QMM5goPpA7FhofYZ+w+jk=;
 b=I1Es6hL1oPpbGORAMQ1cRQ265G0KH7fsOm3sMWwu1TOvOUbdrwqjn7yCi0UrGC4mMQ
 8YAqGyiXZ9u9sicUuvwIOMWxcIHXURBM7ZmkbpWSbUM0CrNN9tvbnm0JP6ePohsF89XW
 DgzwAiJncSBkF1wHmWmf8c3754R0Q6acv9pg3UNmNckeneN/Paf1hpQMiN8MIgQiWmBI
 yUrEQxvg3Xjz4ZGsxPLofxJuYC97p7OMhQL6KFRI8B4H10SqB6DS+0fk4gWAETAVFTLl
 EXkmq9sK2ahGADjvC/TEUTWT0WLe+68O6hiT9sgXJGYCS0M6Ipoc3p3KjTBlf2gbZfYU
 muww==
X-Gm-Message-State: AOAM533rsjE+GYVx1VOPAwTsIdOJ9g2hW26DuFWEd18+29ws8MxRK6Dd
 +QRKiyrHY8i3lT3aIouUeQ==
X-Google-Smtp-Source: ABdhPJyL1nK+Jx2KMKjJGywrd4KL+pehx8SA0WoJWt7xG3ZOIBX6D3HE8l5X2mEadPj9VmguflQRgw==
X-Received: by 2002:a05:6808:ecc:: with SMTP id
 q12mr1344969oiv.122.1642561923892; 
 Tue, 18 Jan 2022 19:12:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bf18sm5098726oib.5.2022.01.18.19.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 19:12:03 -0800 (PST)
Received: (nullmailer pid 2565710 invoked by uid 1000);
 Wed, 19 Jan 2022 03:12:01 -0000
Date: Tue, 18 Jan 2022 21:12:01 -0600
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
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH v4 04/14] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <YeeBgQMOg49CXigi@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-5-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-5-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_191204_962531_AE901991 
X-CRM114-Status: GOOD (  18.66  )
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

On Mon, Jan 17, 2022 at 11:07:45AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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

Can't you calculate this based on the clock input freq?

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
> 2.32.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
