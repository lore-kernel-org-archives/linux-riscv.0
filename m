Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCB9CDD54D
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+VMyvRITolvZndnILAIFx67YQECE7sk7XgXVchUFrzM=; b=yd2NAsFozL8mxT
	JOrF1je2pwY+cuE6Zgpp3ZIU8PFHo9i6gCqDh1oatBf6oHlfO3zLhCRpvfZAEAdqFKiwcwftJlpyV
	J3mMu8zqm+fu8npqE7eGyUn7C2azfcqjbvqpVyvf672fSxVWN0nU0EhH7rduJMcp5EGgno1GnFER7
	thNScxOs7er7pgmxow4hFaYqXfYzA4bhQT8+cu674gdfd1hU+WWav8Ubx2mNgyM3SHRBMYzAVwkn9
	geu0Pa8XHWtQEep3yBNWTDb5xw6GvGMVtGyoiXrEcUwyVP/ac7CvYmWgxgV+IJquxIzlUO2yMNSmg
	2nEhAE5wg8LiHXSva8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqyF5-00000008i4f-3Tr1;
	Wed, 18 Sep 2024 17:13:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqyF1-00000008i2f-2gRX
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 17:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6B2F5C580E;
	Wed, 18 Sep 2024 17:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0C8C4CEC2;
	Wed, 18 Sep 2024 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726679602;
	bh=yyW1aV2ISB/2jXwyRhIGQv2ctjIENPHzxX5fbLQh6Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LD2wiXrOT1fVjKP9Kl4zDZR5EECAKIiF2L1PY+skVHOdcuCmODCQObmn4L5jZcgSA
	 vso49Zb9NWPmLu/vCcRwqdTeswf9EOgquaMEvuTglSCFFCxfHLmrX3/pLDVz4joQQR
	 Ht9MosMe3afnHJIPaQqaPw+KL58kScX3XFvmHosKpr5NO3u322i8t+qJTjlstJ0xMN
	 kbr4qrzhK2U7y+hk33DLNx19so5j0LqXID6syc0ROE+5OFPuRef3EaAuChHchkidkm
	 +VBqjwGcZyK0+9ThngWZCpC5Le1HrUO5b+acav/7h6tb6JWpOKSkOUQZRXOBWTmJk5
	 BdWKjENaWXOdQ==
Date: Wed, 18 Sep 2024 12:13:20 -0500
From: Rob Herring <robh@kernel.org>
To: Ze Huang <18771902331@163.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND PATCH 1/3] dt-bindings: pinctrl: Add support for
 canaan,k230 SoC
Message-ID: <20240918171320.GA1810164-robh@kernel.org>
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064225.316863-1-18771902331@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240916064225.316863-1-18771902331@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_101323_795051_11ABA097 
X-CRM114-Status: GOOD (  22.25  )
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

On Mon, Sep 16, 2024 at 02:42:23PM +0800, Ze Huang wrote:
> Add device tree binding details for Canaan K230 pinctrl device.
> 
> Signed-off-by: Ze Huang <18771902331@163.com>
> ---
>  .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> new file mode 100644
> index 000000000000..979c5bd71e3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/canaan,k230-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Pin Controller
> +
> +maintainers:
> +  - Ze Huang <18771902331@163.com>
> +
> +description:
> +  The Canaan Kendryte K230 platform includes 64 IO pins, each capable of
> +  multiplexing up to 5 different functions. Pin function configuration is
> +  performed on a per-pin basis.
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +    description:
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    patternProperties:
> +      '-cfg$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +        additionalProperties: false
> +        description:
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias, input
> +          enable/disable, input schmitt trigger, slew-rate enable/disable,
> +          slew-rate, drive strength.
> +
> +        properties:
> +          pinmux:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array

Drop. You need to add a $ref to pinmux-node.yaml (alongside 
pincfg-node.yaml).

> +            description:
> +              The list of GPIOs and their mux settings that properties in
> +              the node apply to. This should be set with the macro
> +              'K230_PINMUX(pin, mode)'
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            minimum: 0
> +            maximum: 15
> +
> +          input-enable: true
> +
> +          output-enable: true
> +
> +          input-schmitt-enable: true
> +
> +          slew-rate:
> +            $ref: /schemas/types.yaml#/definitions/uint32

Drop. Already has a defined type.

> +            description: |
> +              slew rate control enable
> +              0: disable
> +              1: enable
> +
> +            enum: [0, 1]
> +
> +          power-source:
> +            $ref: /schemas/types.yaml#/definitions/uint32

Drop. Already has a defined type.

> +            description: |
> +              Specifies the power source voltage for the IO bank that the
> +              pin belongs to. Each bank of IO pins operate at a specific,
> +              fixed voltage levels. Incorrect voltage configuration can
> +              damage the chip. The defined constants represent the
> +              possible voltage configurations:
> +
> +              - K230_MSC_3V3 (value 0): 3.3V power supply
> +              - K230_MSC_1V8 (value 1): 1.8V power supply
> +
> +              The following banks have the corresponding voltage
> +              configurations:
> +
> +              - bank IO0 to IO1: Fixed at 1.8V
> +              - bank IO2 to IO13: Fixed at 1.8V
> +              - bank IO14 to IO25: Fixed at 1.8V
> +              - bank IO26 to IO37: Fixed at 1.8V
> +              - bank IO38 to IO49: Fixed at 1.8V
> +              - bank IO50 to IO61: Fixed at 3.3V
> +              - bank IO62 to IO63: Fixed at 1.8V
> +
> +            enum: [0, 1]
> +
> +        required:
> +          - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl: pinctrl@91105000 {

Drop unused labels.

> +        compatible = "canaan,k230-pinctrl";
> +        reg = <0x91105000 0x100>;
> +
> +        uart2_pins: uart2-pins {
> +            uart2-pins-cfg {
> +                pinmux = <0x503>, /* uart2 txd */
> +                         <0x603>; /* uart2 rxd */
> +                slew-rate = <0>;
> +                drive-strength = <4>;
> +                power-source = <1>;
> +                input-enable;
> +                output-enable;
> +                bias-disable;
> +            };
> +        };
> +    };
> -- 
> 2.46.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
