Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E70C3600C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 00:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMV99Ou3pJ7NULguMi1QUlS6Hv4Y+kPCpLJMdwQ95Lw=; b=dPaZeQOOR+LiDh
	2KkLRAEWu1P1lpA4uZy2y8RawVzdaWpCozMGRwMn062qfdXDm0NdHgBpboZEWJOOC+Ghq1KLzzMjp
	CSlyFf0NmNVvRl3RbuMdYE8L4Tibxz112FigxJ5Ypvi3c8um4V8r2ZvpzhC8AEBbKZMJoTc7NQzKu
	224nIGmDiXGfotBVVpTcgh/X5cbtIs6mq0oMXqKMCYBvbnirZWKLt+uOLjE9Uj/tr7Aodfeg+vBch
	cwTkT4GFxoYfSv3sy1XARd5e7v2PXFsZoU2yz8dhjGNUPpuEcqkI0CeFbgDwpYNe26/NkVKjm6lBh
	Q+CLwMnnfzBhdLFyp1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txEsz-00000007JHI-2nIk;
	Wed, 26 Mar 2025 00:44:49 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txEsw-00000007JGw-3vFh
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 00:44:48 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C772C3431A4;
	Wed, 26 Mar 2025 00:44:44 +0000 (UTC)
Date: Wed, 26 Mar 2025 00:44:40 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 1/4] dt-bindings: pinctrl: Add eswin,eic7700-pinctrl
 binding
Message-ID: <20250326004440-GYA24249@gentoo>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
 <20250325141311.758787-2-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325141311.758787-2-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_174447_008630_F580DBE6 
X-CRM114-Status: GOOD (  16.10  )
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

Hi Emil Renner Berthing: 

On 15:13 Tue 25 Mar     , Emil Renner Berthing wrote:
> Add device tree binding for the pin controller on the ESWIN EIC7700
> RISC-V SoC.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  .../pinctrl/eswin,eic7700-pinctrl.yaml        | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> new file mode 100644
> index 000000000000..8ef966cebc5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/eswin,eic7700-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN EIC7700 SoC pin controller
> +
> +maintainers:
> +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> +
> +description: |
no need |
> +  Pinmux and pinconf controller in the ESWIN EIC7700 RISC-V SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - eswin,eic7700-pinctrl
why not const as single compatible here?
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +        additionalProperties: false
> +
> +        description:
> +          A pinctrl node should contain at least one subnode describing one
> +          or more pads and their associated pinmux and pinconf settings.
> +
> +        properties:
> +          pins:
> +            items:
> +              enum: [ CHIP_MODE, MODE_SET0, MODE_SET1, MODE_SET2, MODE_SET3,
> +                      XIN, RTC_XIN, RST_OUT_N, KEY_RESET_N, GPIO0, POR_SEL,
> +                      JTAG0_TCK, JTAG0_TMS, JTAG0_TDI, JTAG0_TDO, GPIO5, SPI2_CS0_N,
> +                      JTAG1_TCK, JTAG1_TMS, JTAG1_TDI, JTAG1_TDO, GPIO11, SPI2_CS1_N,
> +                      PCIE_CLKREQ_N, PCIE_WAKE_N, PCIE_PERST_N, HDMI_SCL, HDMI_SDA,
> +                      HDMI_CEC, JTAG2_TRST, RGMII0_CLK_125, RGMII0_TXEN,
> +                      RGMII0_TXCLK, RGMII0_TXD0, RGMII0_TXD1, RGMII0_TXD2,
> +                      RGMII0_TXD3, I2S0_BCLK, I2S0_WCLK, I2S0_SDI, I2S0_SDO,
> +                      I2S_MCLK, RGMII0_RXCLK, RGMII0_RXDV, RGMII0_RXD0, RGMII0_RXD1,
> +                      RGMII0_RXD2, RGMII0_RXD3, I2S2_BCLK, I2S2_WCLK, I2S2_SDI,
> +                      I2S2_SDO, GPIO27, GPIO28, GPIO29, RGMII0_MDC, RGMII0_MDIO,
> +                      RGMII0_INTB, RGMII1_CLK_125, RGMII1_TXEN, RGMII1_TXCLK,
> +                      RGMII1_TXD0, RGMII1_TXD1, RGMII1_TXD2, RGMII1_TXD3, I2S1_BCLK,
> +                      I2S1_WCLK, I2S1_SDI, I2S1_SDO, GPIO34, RGMII1_RXCLK,
> +                      RGMII2_RXDV, RGMII2_RXD0, RGMII2_RXD1, RGMII2_RXD2,
> +                      RGMII2_RXD3, SPI1_CS0_N, SPI1_CLK, SPI1_D0, SPI1_D1, SPI1_D2,
> +                      SPI1_D3, SPI1_CS1_N, RGMII1_MDC, RGMII1_MDIO, RGMII1_INTB,
> +                      USB0_PWREN, USB1_PWREN, I2C0_SCL, I2C0_SDA, I2C1_SCL, I2C1_SDA,
> +                      I2C2_SCL, I2C2_SDA, I2C3_SCL, I2C3_SDA, I2C4_SCL, I2C4_SDA,
> +                      I2C5_SCL, I2C5_SDA, UART0_TX, UART0_RX, UART1_TX, UART1_RX,
> +                      UART1_CTS, UART1_RTS, UART2_TX, UART2_RX, JTAG2_TCK, JTAG2_TMS,
> +                      JTAG2_TDI, JTAG2_TDO, FAN_PWM, FAN_TACH, MIPI_CSI0_XVS,
> +                      MIPI_CSI0_XHS, MIPI_CSI0_MCLK, MIPI_CSI1_XVS, MIPI_CSI1_XHS,
> +                      MIPI_CSI1_MCLK, MIPI_CSI2_XVS, MIPI_CSI2_XHS, MIPI_CSI2_MCLK,
> +                      MIPI_CSI3_XVS, MIPI_CSI3_XHS, MIPI_CSI3_MCLK, MIPI_CSI4_XVS,
> +                      MIPI_CSI4_XHS, MIPI_CSI4_MCLK, MIPI_CSI5_XVS, MIPI_CSI5_XHS,
> +                      MIPI_CSI5_MCLK, SPI3_CS_N, SPI3_CLK, SPI3_DI, SPI3_DO, GPIO92,
> +                      GPIO93, S_MODE, GPIO95, SPI0_CS_N, SPI0_CLK, SPI0_D0, SPI0_D1,
> +                      SPI0_D2, SPI0_D3, I2C10_SCL, I2C10_SDA, I2C11_SCL, I2C11_SDA,
> +                      GPIO106, BOOT_SEL0, BOOT_SEL1, BOOT_SEL2, BOOT_SEL3, GPIO111,
> +                      LPDDR_REF_CLK ]
> +            description: List of pads that properties in the node apply to.
> +
> +          function:
> +            enum: [ csi, debug, ddr, fan, gpio, hdmi, i2c, i2s, jtag, mipi,
> +                    mode, oscillator, pci, pwm, rgmii, reset, sata, spi, sdio,
> +                    uart, usb ]
> +            description: The mux function to select for the given pins.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - const: 25000
> +            description: Enable internal 25kOhm pull-up
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - const: 22000
> +            description: Enable internal 22kOhm pull-down
> +
> +          drive-strength-microamp:
> +            enum: [ 3100, 6700, 9600, 12900, 18000, 20900, 23200, 25900 ]
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +        required:
> +          - pins
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl: pinctrl@51600080 {
       ~~~~~~~ no need alias phandle in example..
> +        compatible = "eswin,eic7700-pinctrl";
> +        reg = <0x51600080 0xff80>;
> +
> +        uart0_pins: uart0-0 {
> +            tx-pins {
> +                pins = "UART0_TX";
> +                function = "uart";
> +                bias-disable;
> +                drive-strength-microamp = <6700>;
> +                input-disable;
> +                input-schmitt-disable;
> +            };
> +
> +            rx-pins {
> +                pins = "UART0_RX";
> +                function = "uart";
> +                bias-pull-up;
> +                drive-strength-microamp = <6700>;
> +                input-enable;
> +                input-schmitt-enable;
> +            };
> +        };
> +    };
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
