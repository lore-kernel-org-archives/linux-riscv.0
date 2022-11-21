Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EC1C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXBAa6zCaizuhK/6lzGc8x9YIIkJ80F3wC7VJSKyTxI=; b=4S4QGPk4xt7gGz
	1ZauF6pBqIUDU+1X2JNREuJI/RYpimxVVOIphzGgPDq7yS/1ORAGYM3syNU/BEldUZZgCNJLLkq7k
	1ejRq2CSslZlxRxtG3ta23B3lsPWs0oOayfOhvAzm/GaBmP87v35PC9xCULxms1dDmcOnCX2qx1pR
	ZX6Luu4GYn02xb5p/8tvxMxgNmcO3/ZXtXUwDaYqNN0W9s0vCE3uHG5+q9enJbDe0dyY/8i6/JqyU
	sDZiJYV/gIt4UhQXzxwHYrVw0FTJvH59B6d9Q12Atp6ILWU/pnVkm5A5ZAmogfs//1id90mwG/i5s
	hV1Ustkye1WHBdnUU/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2OT-00BRgg-51; Mon, 21 Nov 2022 08:43:09 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2OQ-00BRUI-6i
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:43:08 +0000
Received: by mail-lj1-x231.google.com with SMTP id u11so13704981ljk.6
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 00:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=992o7ZyvFpRlI/MF6cr/UyaXpDym3y7H1RX7ngpCPLI=;
        b=nhTtcjCbXaH6FwJ8fSZSYFzfHhfVKNeFZV9p5jk8J1PGmz/VYk1APhrICyxl6FlwYw
         0uJyEmZ4zoGOTeAmFbuloK+/V7fA8JR395r2Xika4E8/zvKCEXEzTFcPECANBq5/r7rO
         6kALMIWM/b6nVqI3iOSF98TpKF6WQb8DwgXsciOh/aXAPTMTrKyzq2ZzCX7kO5tbp/tO
         pqgNELvLgXp3sGT6R+I7mzC8ASD1sWw0TztQIH5Wf6dQGA+HAmYSvY5tNaZdHHjY+kPG
         5oTcNhAVnUFxLaV+x4GdQpk8aqxs3RkN3AD3p4wHYEyoe2Csp1bKZvf3ojHMTlJ3jBd8
         waVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=992o7ZyvFpRlI/MF6cr/UyaXpDym3y7H1RX7ngpCPLI=;
        b=fl1KoRLwzU0JOUOUeQbi6fJ1xS9HsAsgC369fpo6hjlv4/XFXGapfm4FK6Jypa60H4
         dPSPvRR5HKVranLN8J9pnsmb00HtjM8OBzjrbjBaM5bBnq+y/i5+utLy2cjDVGGDSiZ5
         zVIcquA2I90ujssYCUm1S7YIxczeTGgnB6Z4FJJBLwWIXizwTOv/z0fHv8OQpfAl62pp
         yYAoKEi26wI/OnUCZe5m6ueKBh6BVTq2KV/MxtWLfViOef//+0BvfxULb/UOSUKI8Hgg
         gQe3kYgCCP8uLeu9bzt6YFxl5K85N8YYHV9JZZvHrTN/fW+/HtpXmz3eJ/Wfes1k0rVp
         LGEw==
X-Gm-Message-State: ANoB5pnly6AH537Hsp2fVt/aMfD0dYBQxBYbKtFdRcKwvfS1ZVJvl5hF
	yNSg7oZsFoU3wIKjk0LUKz6VLg==
X-Google-Smtp-Source: AA0mqf4fsYpzjXBUeH29O+aYuZtfEo3mXw6HDaEoSaipNyJ7xrKyvXlpQ/A58px7negS99RsPrbSVQ==
X-Received: by 2002:a2e:7e0a:0:b0:277:6f0:5239 with SMTP id z10-20020a2e7e0a000000b0027706f05239mr1396681ljc.186.1669020183311;
        Mon, 21 Nov 2022 00:43:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b177293a8dsm1925061lfc.210.2022.11.21.00.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:43:02 -0800 (PST)
Message-ID: <468b06ea-e314-ce51-7fe5-12b83032a382@linaro.org>
Date: Mon, 21 Nov 2022 09:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/5] dt-bindings: pinctrl: Add StarFive JH7110 sys
 pinctrl
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-kernel@vger.kernel.org
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-3-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118011108.70715-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_004306_291439_03A9811F 
X-CRM114-Status: GOOD (  24.00  )
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

On 18/11/2022 02:11, Hal Feng wrote:
> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> 
> Add pinctrl bindings for StarFive JH7110 SoC sys pinctrl controller.
> 
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
> new file mode 100644
> index 000000000000..79623f884a9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Sys Pin Controller
> +
> +description: |
> +  Bindings for the JH7110 RISC-V SoC from StarFive Technology Ltd.
> +
> +  Out of the SoC's many pins only the ones named PAD_GPIO0 to PAD_GPIO63
> +  can be multiplexed and have configurable bias, drive strength,
> +  schmitt trigger etc.
> +  Some peripherals have their I/O go through the 64 "GPIOs". This also
> +  includes a number of other UARTs, I2Cs, SPIs, PWMs etc.
> +  All these peripherals are connected to all 64 GPIOs such that
> +  any GPIO can be set up to be controlled by any of the peripherals.
> +
> +maintainers:
> +  - Jianlong Huang <jianlong.huang@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-sys-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: control

Why reg-names for one entry? Perhaps just drop it.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +    description: The GPIO parent interrupt.

Drop description, it's obvious.

> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +patternProperties:
> +  '-[0-9]+$':

Keep consistent quotes, either ' or "

How do you differentiate hogs? The pattern is a bit unspecific.

> +    type: object
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to
> +          muxer configuration, system signal configuration, pin groups for
> +          vin/vout module, pin voltage, mux functions for output, mux functions
> +          for output enable, mux functions for input.
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the GPIOMUX macro.
> +            $ref: "/schemas/pinctrl/pinmux-node.yaml#/properties/pinmux"

Drop quotes.

> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength:
> +            enum: [ 2, 4, 8, 12 ]
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            maximum: 1
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive-jh7110.h>
> +    #include <dt-bindings/reset/starfive-jh7110.h>
> +    #include <dt-bindings/pinctrl/pinctrl-starfive-jh7110.h>
> +
> +        soc {

Use 4 spaces for example indentation.

> +                #address-cells = <2>;
> +                #size-cells = <2>;
> +
> +                gpio: gpio@13040000 {
> +                        compatible = "starfive,jh7110-sys-pinctrl";
> +                        reg = <0x0 0x13040000 0x0 0x10000>;
> +                        reg-names = "control";
> +                        clocks = <&syscrg_clk JH7110_SYSCLK_IOMUX>;
> +                        resets = <&syscrg_rst JH7110_SYSRST_IOMUX>;
> +                        interrupts = <86>;
> +                        interrupt-controller;
> +                        #interrupt-cells = <2>;
> +                        #gpio-cells = <2>;
> +                        gpio-controller;
> +                        status = "okay";

No status in examples.

> +
> +                        uart0_pins: uart0-0 {
> +                                tx-pins {
> +                                        pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX, GPOEN_ENABLE, GPI_NONE)>;
> +                                        bias-disable;
> +                                        drive-strength = <12>;
> +                                        input-disable;
> +                                        input-schmitt-disable;
> +                                        slew-rate = <0>;
> +                                };
> +
> +                                rx-pins {
> +                                        pinmux = <GPIOMUX(6, GPOUT_LOW, GPOEN_DISABLE, GPI_SYS_UART0_RX)>;
> +                                        bias-pull-up;
> +                                        drive-strength = <2>;
> +                                        input-enable;
> +                                        input-schmitt-enable;
> +                                        slew-rate = <0>;
> +                                };
> +                        };
> +                };
> +
> +                uart0 {
> +                        pinctrl-names = "default";
> +                        pinctrl-0 = <&uart0_pins>;
> +                        status = "okay";

Drop this node, useless.

> +                };
> +        };
> +
> +...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
