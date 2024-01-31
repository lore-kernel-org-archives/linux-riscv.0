Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03866C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuSii/Z8UE8HHq9fsYegf7vnQsA+AWJ5iH+BApLAwLk=; b=rXLoDLy1uCqb0d
	xl2zm3e4uvCO4+5c1eDrEOlGkEB6t049JE1dsmI5ArICsrJVG3sNL7w1u1BoTOmfgJw1R2FussCPc
	s7YidK1AudYK+Lu2vxZt+D2MyeCyn99gDbQpvKYWPddxMuo3V7YbiH9Emmtj7oMaG6p8yR5K0Z4zG
	Szr8vSxgWy96CVHZOOJ0ieSf9ieVecEME6eJ/80N1ZRgqvxyt/sTmqWuLm5hf7tc63N9xOx3FWjOd
	uoteDR2DhX86H7p9Nyc1b7LHe04TghcteQF6DrznWaY+xdvUC25fBcUDu45TEeVYeoC+/mKaS0hwY
	80iIXvon7+IqfoE3vRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBxP-000000041b3-23T7;
	Wed, 31 Jan 2024 14:52:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBxL-000000041Z0-3tG2;
	Wed, 31 Jan 2024 14:52:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF49EDA7;
	Wed, 31 Jan 2024 06:53:33 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89FDA3F762;
	Wed, 31 Jan 2024 06:52:47 -0800 (PST)
Date: Wed, 31 Jan 2024 14:52:44 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20240131145244.4f534bac@donnerap.manchester.arm.com>
In-Reply-To: <20240131125920.2879433-2-privatesub2@gmail.com>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
	<20240131125920.2879433-2-privatesub2@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_065252_101063_40B7131C 
X-CRM114-Status: GOOD (  24.68  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 31 Jan 2024 15:59:14 +0300
Aleksandr Shubin <privatesub2@gmail.com> wrote:

Hi,

> Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> controller witch is different from the previous pwm-sun4i.
> 
> The D1 and T113 are identical in terms of peripherals,
> they differ only in the architecture of the CPU core, and
> even share the majority of their DT. Because of that,
> using the same compatible makes sense.
> The R329 is a different SoC though, and should have
> a different compatible string added, especially as there
> is a difference in the number of channels.
> 
> D1 and T113s SoCs have one PWM controller with 8 channels.
> R329 SoC has two PWM controllers in both power domains, one of
> them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> 
> Add a device tree binding for them.
> 
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> new file mode 100644
> index 000000000000..716f75776006
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner D1, T113-S3 and R329 PWM
> +
> +maintainers:
> +  - Aleksandr Shubin <privatesub2@gmail.com>
> +  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun20i-d1-pwm
> +      - items:
> +          - const: allwinner,sun20i-r329-pwm
> +          - const: allwinner,sun20i-d1-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: 24 MHz oscillator
> +      - description: APB0 clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: hosc
> +      - const: apb0
> +
> +  resets:
> +    maxItems: 1
> +
> +  allwinner,pwm-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of PWM channels configured for this instance
> +    enum: [6, 9]
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun20i-r329-pwm
> +
> +    then:
> +      required:
> +        - allwinner,pwm-channels
> +
> +    else:
> +      properties:
> +        allwinner,pwm-channels: false

Do we really need to be that strict?
If something compatible to D1 pops up in the future, just with a different
number of channels, we would need a new compatible string.
If we would leave this else branch out, we could just specify some
number differing from the default, and be good.
The number of channels really looks like a parameter to the IP, it's
modelled like this in the manual (PCR: 0x0100 + 0x0000 + N * 0x0020).

Cheers,
Andre

> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#pwm-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sun20i-d1-ccu.h>
> +    #include <dt-bindings/reset/sun20i-d1-ccu.h>
> +
> +    pwm: pwm@2000c00 {
> +      compatible = "allwinner,sun20i-d1-pwm";
> +      reg = <0x02000c00 0x400>;
> +      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
> +      clock-names = "bus", "hosc", "apb0";
> +      resets = <&ccu RST_BUS_PWM>;
> +      #pwm-cells = <0x3>;
> +    };
> +
> +...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
