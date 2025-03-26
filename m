Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F310CC3600C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 09:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5YA82pYQuWv6Jm38BaxD0BlTc6V2GUzCv5APKrbvm8o=; b=jBrL/x7j0GaD3FNfJaNkuyeRoH
	w6Laob2txcFtQDNd/n2JWRsxJpQE0QdaCfVA4TjR4PKFy5qfP3EqlWtVb+F3q5kQ9HsDzQsKyb9eQ
	GkEtoVHnFIlLJaPkWU9idGQjNTrMV2I3hyvSkTE4YJWju3UmCIrWrsysDZ78m+bleYk6t40dTs5dM
	RgLnjO1Vat//FoKRYh8zeLsTx/lYF+u/K7HFaFd1BcVLeVQQZxHzeWN4+kGJSPfkKmAYzJQu4z1/H
	iF7UtOX7JnzVr02qybNUDIUQK2UtcSte8w81NrN/JJr+qtorDzpnlCWDXdhYBoA0kngATtUki738O
	OokufLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNXm-000000085yw-2zFV;
	Wed, 26 Mar 2025 09:59:30 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNWR-000000085qf-00HS
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 09:58:08 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 324233FE2E
	for <linux-riscv@lists.infradead.org>; Wed, 26 Mar 2025 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742983083;
	bh=YmqDnJYd3sHMeIErDl7QaGhRZ3q+ZmYDEpXuE0o+U+M=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=itxMEH9C00Fmbc6YYe39dKMSvOJ/MpFtHhfA/9kn9I200Jo43M1G3QMg/1Yy8OhNq
	 scYxuwA+09/YVLXvaH4v40WTC46dJgKZNaDSILYRFxdqs4rKQb2HFItKJ1yYAgo8rX
	 Az8dMmcakdBQ87dUsf9gPlYAi7u1JaOJP9xrl+csFx3jDAkdBEb7Dao2E3fuYRtAjU
	 x/YLpesqQtOjDFKiIhz/yzy1XS4jYcE5ApNnkLR6Jie+pP7QpWTrV3eu24von9LECR
	 SQdhHSXABcZqn/QsJIUk4IKOkstAXg1NCnSZgnsAEhTayoFqF5EXmiNzwU99Wh+oQw
	 f0hHTkH54fzSw==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2a8e3905c56so2853035fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Mar 2025 02:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742983080; x=1743587880;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmqDnJYd3sHMeIErDl7QaGhRZ3q+ZmYDEpXuE0o+U+M=;
        b=VBKouqDzqSRsRaw8IG0X5bViTMS/lSjxMRJl86Ogu8OPlYFJuOn3xxVaA/SQ+UWg8h
         ezuL5NUVDeIiHVo8DSXN4N4qLiZZJiNBUjTBjy7DGJfRPgh/prKdUBuPCJgD9iBqha27
         8kneK+BQ3M5nh20vH0Gw8ekHrS/4zPHIaQFF5Z7sAirYj35OmIH6ZjEsdJbT85TTKhVV
         W2E9UtJuw1VOIhF9XLxGPk2NH0YeX9SRwZ5jQID1TosyS1orBqBhvQkC7KtBcCvgTZWe
         tUuAErU0TXnvJUY80QHCd2pnQo81jiC1WYWIg1g79YuDRKyqS/qldyrg+Cs2FdxwIDZs
         ER8g==
X-Forwarded-Encrypted: i=1; AJvYcCWEJp5th/bZIqJDw1AK8dQom1pa6dQDlKRQ0q+Jc8WlB1nhlDg/Gc0qW2ETJqew05Dleud8mPMDvG2Ljw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHSvTZ+qgYB02kA0CfxfFyEtCKdQTAtS+bkm6mxdj8MsU5nj0j
	q3e3sVmc3b359xktcYUtzuZi11eSP7lpSfrlfLBd7e3QR7NdJcinQSHjkaClmjHe38JsY3OGNYR
	Z8Ygc1VajRV4Rl3gWhDMVJoBewBvHybWq28PPBqRnYsL89NtwiAj1QBBwmWQe+zx5/tPIJCr5TQ
	AJSL9rBoJiMXxD9tPTpcs0XZ1e+a0Oqv6nhFZSNTmFMlbZSd3a9iGpm5qn
X-Gm-Gg: ASbGncsBPLgKiRw56/rD8rr2jZNJy1i997BVwO6kq6mtoVNDKVmvlB8Y+Axf+FKlM3v
	StlTyD5fkmJAMJZWlZJfxRdWhzJ89OMz2T03GbU2GdbhaQbiTZAQMQwQtM23e8UeWs0rXFhdC4U
	0LapmIQ77cHRngXUKu6qxbSHs=
X-Received: by 2002:a05:6870:c0d0:b0:2c2:4d76:f1ad with SMTP id 586e51a60fabf-2c7802fc7f4mr11949990fac.16.1742983079700;
        Wed, 26 Mar 2025 02:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGusUKpLdTuUy3QkZj5OSCHZAzUQifzrm4ATjVXeFFaB5uxz8Mol5J1QaqA22HHkXCckElEM60R81g5exSGuLQ=
X-Received: by 2002:a05:6870:c0d0:b0:2c2:4d76:f1ad with SMTP id
 586e51a60fabf-2c7802fc7f4mr11949984fac.16.1742983079188; Wed, 26 Mar 2025
 02:57:59 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Mar 2025 02:57:57 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Mar 2025 02:57:57 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250326-owl-of-algebraic-wealth-61aeda@krzk-bin>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
 <20250325141311.758787-2-emil.renner.berthing@canonical.com> <20250326-owl-of-algebraic-wealth-61aeda@krzk-bin>
Mime-Version: 1.0
Date: Wed, 26 Mar 2025 02:57:57 -0700
X-Gm-Features: AQ5f1JoPkONs1cP6b2bcNZ0PAFZ-pHAaJXVnYD4E0Nk0jWsjQfMiZsd9uQXxdiM
Message-ID: <CAJM55Z9+dpbqt-c=55WXUXsw=Dhk6m6Q1_Js3s-T+8W7dtrURQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: pinctrl: Add eswin,eic7700-pinctrl binding
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Min Lin <linmin@eswincomputing.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_025807_361700_CF0E94C7 
X-CRM114-Status: GOOD (  14.60  )
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

Krzysztof Kozlowski wrote:
> On Tue, Mar 25, 2025 at 03:13:03PM +0100, Emil Renner Berthing wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - eswin,eic7700-pinctrl
>
> Blank line
>
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
>
> required: goes after patternProperties.
>
> > +  - compatible
> > +  - reg
> > +
> > +patternProperties:
> > +  '-[0-9]+$':
>
> Recommended is to have more meaningful prefix or suffix, e.g.
> -grp/-group. I also don't get why it has to end with number.
>
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        allOf:
> > +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> > +
> > +        additionalProperties: false
> > +
> > +        description:
> > +          A pinctrl node should contain at least one subnode describing one
> > +          or more pads and their associated pinmux and pinconf settings.
> > +
> > +        properties:
> > +          pins:
> > +            items:
> > +              enum: [ CHIP_MODE, MODE_SET0, MODE_SET1, MODE_SET2, MODE_SET3,
> > +                      XIN, RTC_XIN, RST_OUT_N, KEY_RESET_N, GPIO0, POR_SEL,
> > +                      JTAG0_TCK, JTAG0_TMS, JTAG0_TDI, JTAG0_TDO, GPIO5, SPI2_CS0_N,
> > +                      JTAG1_TCK, JTAG1_TMS, JTAG1_TDI, JTAG1_TDO, GPIO11, SPI2_CS1_N,
> > +                      PCIE_CLKREQ_N, PCIE_WAKE_N, PCIE_PERST_N, HDMI_SCL, HDMI_SDA,
> > +                      HDMI_CEC, JTAG2_TRST, RGMII0_CLK_125, RGMII0_TXEN,
> > +                      RGMII0_TXCLK, RGMII0_TXD0, RGMII0_TXD1, RGMII0_TXD2,
> > +                      RGMII0_TXD3, I2S0_BCLK, I2S0_WCLK, I2S0_SDI, I2S0_SDO,
> > +                      I2S_MCLK, RGMII0_RXCLK, RGMII0_RXDV, RGMII0_RXD0, RGMII0_RXD1,
> > +                      RGMII0_RXD2, RGMII0_RXD3, I2S2_BCLK, I2S2_WCLK, I2S2_SDI,
> > +                      I2S2_SDO, GPIO27, GPIO28, GPIO29, RGMII0_MDC, RGMII0_MDIO,
> > +                      RGMII0_INTB, RGMII1_CLK_125, RGMII1_TXEN, RGMII1_TXCLK,
> > +                      RGMII1_TXD0, RGMII1_TXD1, RGMII1_TXD2, RGMII1_TXD3, I2S1_BCLK,
> > +                      I2S1_WCLK, I2S1_SDI, I2S1_SDO, GPIO34, RGMII1_RXCLK,
> > +                      RGMII2_RXDV, RGMII2_RXD0, RGMII2_RXD1, RGMII2_RXD2,
> > +                      RGMII2_RXD3, SPI1_CS0_N, SPI1_CLK, SPI1_D0, SPI1_D1, SPI1_D2,
> > +                      SPI1_D3, SPI1_CS1_N, RGMII1_MDC, RGMII1_MDIO, RGMII1_INTB,
> > +                      USB0_PWREN, USB1_PWREN, I2C0_SCL, I2C0_SDA, I2C1_SCL, I2C1_SDA,
> > +                      I2C2_SCL, I2C2_SDA, I2C3_SCL, I2C3_SDA, I2C4_SCL, I2C4_SDA,
> > +                      I2C5_SCL, I2C5_SDA, UART0_TX, UART0_RX, UART1_TX, UART1_RX,
> > +                      UART1_CTS, UART1_RTS, UART2_TX, UART2_RX, JTAG2_TCK, JTAG2_TMS,
> > +                      JTAG2_TDI, JTAG2_TDO, FAN_PWM, FAN_TACH, MIPI_CSI0_XVS,
> > +                      MIPI_CSI0_XHS, MIPI_CSI0_MCLK, MIPI_CSI1_XVS, MIPI_CSI1_XHS,
> > +                      MIPI_CSI1_MCLK, MIPI_CSI2_XVS, MIPI_CSI2_XHS, MIPI_CSI2_MCLK,
> > +                      MIPI_CSI3_XVS, MIPI_CSI3_XHS, MIPI_CSI3_MCLK, MIPI_CSI4_XVS,
> > +                      MIPI_CSI4_XHS, MIPI_CSI4_MCLK, MIPI_CSI5_XVS, MIPI_CSI5_XHS,
> > +                      MIPI_CSI5_MCLK, SPI3_CS_N, SPI3_CLK, SPI3_DI, SPI3_DO, GPIO92,
> > +                      GPIO93, S_MODE, GPIO95, SPI0_CS_N, SPI0_CLK, SPI0_D0, SPI0_D1,
> > +                      SPI0_D2, SPI0_D3, I2C10_SCL, I2C10_SDA, I2C11_SCL, I2C11_SDA,
> > +                      GPIO106, BOOT_SEL0, BOOT_SEL1, BOOT_SEL2, BOOT_SEL3, GPIO111,
> > +                      LPDDR_REF_CLK ]
>
> All these should be lowercase.

Plenty of pinctrl drivers use uppercase names for the pins, intel, amd,
mediatek to name a few, and this is also what the EIC7700 documentation uses.
Do you still wan't Linux to call the pins something else?

>
> > +            description: List of pads that properties in the node apply to.
> > +
> > +          function:
> > +            enum: [ csi, debug, ddr, fan, gpio, hdmi, i2c, i2s, jtag, mipi,
> > +                    mode, oscillator, pci, pwm, rgmii, reset, sata, spi, sdio,
> > +                    uart, usb ]
> > +            description: The mux function to select for the given pins.
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up:
> > +            oneOf:
> > +              - type: boolean
> > +              - const: 25000
> > +            description: Enable internal 25kOhm pull-up
>
> Why bool and fixed value? Do they have different meaning? Description
> says they are the same.
>
> Anyway, don't repeat constraints in free form text.
>
> > +
> > +          bias-pull-down:
> > +            oneOf:
> > +              - type: boolean
> > +              - const: 22000
> > +            description: Enable internal 22kOhm pull-down
>
> Same questions
>
> > +
> > +          drive-strength-microamp:
> > +            enum: [ 3100, 6700, 9600, 12900, 18000, 20900, 23200, 25900 ]
> > +
> > +          input-enable: true
> > +
> > +          input-disable: true
> > +
> > +          input-schmitt-enable: true
> > +
> > +          input-schmitt-disable: true
> > +
> > +        required:
> > +          - pins
>
> Best regards,
> Krzysztof
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
