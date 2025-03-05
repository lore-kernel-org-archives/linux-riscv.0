Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA630C282D3
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/ziXNc8u0iuUmQZsGWE/FADUrpGLmBGBS01Pt7gOzo=; b=01nhiXCteNZxqU
	kSG3CmGYSqIz5fEYZ1A9CRbNXyhJLaetVFJYy4q9TMBzw2H49psnrdEAfsIa3rkkMI9U0+SZzgbd+
	t94SMCySPZWm0w4CLmpcQ/k3Ql7Sz2BM417rbI1QQpIK7QycnFEVlJ12jUf8N90JTqr7zsREhsIyw
	SCdDV2MqRFht/qhZ6uyWvKloWy/v/HlJhZ1fRVMEv/1OXeZ7XzBEj5LFT+6VrczS6iQ6vkGT/JBTx
	j9S5ti4Jn5YL4TyMJ37n6PaoyEM6/KKJG0s9PTMXVXidBvOc7O/qLZjKW4P3/e6d215YWMLAOZOg8
	3+GWfco1qCnW4OGR4QGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpf52-00000006rH7-1QJv;
	Wed, 05 Mar 2025 03:05:56 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpf4z-00000006rG6-29IT
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 03:05:54 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B94D7342FDB;
	Wed, 05 Mar 2025 03:05:50 +0000 (UTC)
Date: Wed, 5 Mar 2025 03:05:40 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support
 for K1 SoC
Message-ID: <20250305030540-GYA62563@gentoo>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
 <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_190553_577964_11D48DE1 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Samuel Holland:

On 20:11 Tue 04 Mar     , Samuel Holland wrote:
> Hi Troy,
> 
> On 2025-03-03 3:35 AM, Yixun Lan wrote:
> > On 13:30 Mon 03 Mar     , Troy Mitchell wrote:
> >> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> >> and supports FIFO transmission.
> >>
> >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> >> ---
> >>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 59 ++++++++++++++++++++++
> >>  1 file changed, 59 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..db49f1f473e6f166f534b276c86b3951d86341c3
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> >> @@ -0,0 +1,59 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: I2C controller embedded in SpacemiT's K1 SoC
> >> +
> >> +maintainers:
> >> +  - Troy Mitchell <troymitchell988@gmail.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: spacemit,k1-i2c
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> > ..
> >> +  clocks:
> >> +    minItems: 2
> >> +    maxItems: 2
> >> +
> >> +  clock-names:
> >> +    minItems: 2
> >> +    maxItems: 2
> > I'd suggest to give a brief description and explicit clock name here,
> > you can consult marvell,mv64xxx-i2c.yaml for example
> > 
> >> +
> >> +  clock-frequency:
> >> +    description: |
> >> +      K1 support three different modes which running different frequencies
> >> +      standard speed mode: up to 100000 (100Hz)
> >> +      fast speed mode    : up to 400000 (400Hz)
> >> +      high speed mode    : up to 3300000 (3.3Mhz)
> >> +    default: 400000
> >> +    maximum: 3300000
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +
> >> +unevaluatedProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    i2c@d4010800 {
> >> +        compatible = "spacemit,k1-i2c";
> >> +        reg = <0xd4010800 0x38>;
> >> +        interrupt-parent = <&plic>;
> >> +        interrupts = <36>;
> >> +        clocks = <&ccu 176>, <&ccu 90>;
> >> +        clock-names = "apb", "twsi";
> > 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
> > https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
> > from above docs, there are two clocks 
> > bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
> > bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
> > 
> > I'd suggest to name it according to the functionality, thus 'func', 'bus'
> > clock, not its source.. which would make it more system wide consistent
> 
> Also in that same register is:
> 
> 2	RST	RW	0x1	TWSI0 Reset Generation
> This field resets both the APB and functional domain.
> - 0: No Reset
> - 1: Reset
> 
> Which means you need a 'resets' property in the binding as well.
> 
right, there is reset needed

I'd suggest to add it as an incremental patch later, when we
implement real reset driver, and also complete the calling reset
consumer API in i2c driver

but, let me know if this is not the right way to go

> Regards,
> Samuel
> 
> >> +        clock-frequency = <100000>;
> >> +    };
> >> +
> >> +...
> >>
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
