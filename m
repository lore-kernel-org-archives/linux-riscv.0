Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77BCD1AD4F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooFx1zL55ShoAz65dx9PRqcuImj/fb0gYQGJyEG+zD0=; b=olmmqdthFSjoj+
	Go9J106PiwFgIhFjNdNJPE2Rdjgi/YYBiq1qZ2584XNFlwnmYmqPMp9+MPUiXsN9POuxnMmP07xhd
	PRtMbcsPI1yclN2RNFv4fpCGJlwqGOs55GjDVOrzbqWPrBKToOu+55HucGt8Jt18K51rD0UiAk4+1
	hF+ktBZ0R9jjeGCC/XxktKaMm7cz80K6R8Tpuuz7gR2S5GV3Wgf5nAQgDMKGo3xRX9Bi8C1YVQnWt
	usnjRRh9ImCQriBtBVl1u74HUrRG1gFCUEsygd05kwJnoZtuQQcyALXyZ5sYPCGA6Q/FlnRKk2U4w
	iIdgiCfboAj8C7Ll9T4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12s1-0000000Bgv7-3lSZ;
	Wed, 16 Oct 2024 12:11:17 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12ry-0000000BguR-1asF
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 12:11:15 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 8DD8E122FE21;
	Wed, 16 Oct 2024 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1729080672; bh=5au/Y6lHx9RILAX4XAzjvna8Dcwx0ccjy4QV4i4w1h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqEFLH55uaSOX/NeuD3TfOJu5iWZLazr0D5+gLMdSSMHupSAZ79soHUA7Q84COpdh
	 KAWJQVaT3W5sgPWnB09fC8D/kREVaiYmeOyhfgvhVWFMKE5Z2nEs3KpOM+aa8oIgy9
	 6GejQQrBkj+qxjIY88l8pLXZHXlMRjE5wj4UCu0890+9CJimxROb4oQg33ANIGTjGk
	 iOzimKfk3CiUPPrOo1/6fTkG1Ef4dzaPO4BOM0WBGCcZ7v/8loT7aTDoUe8V2n+Hhr
	 S+CivcllVybAe6i/EoYV4XfxPN86E4qzNzxvInADvgNMmjRLTL04WQtGqWEmTOuwcI
	 /0bvTdkgF+/XA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfPDK2MCEsy1; Wed, 16 Oct 2024 05:11:05 -0700 (PDT)
Received: from ketchup (unknown [110.52.220.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 573C5122FE1A;
	Wed, 16 Oct 2024 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1729080665; bh=5au/Y6lHx9RILAX4XAzjvna8Dcwx0ccjy4QV4i4w1h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLjWDXVydOzI2+TjesEQT1OGRb+Fga4ioSMX4+jV+dPMTUhYGL1SHxeJgp7V1+Csj
	 AoTEKw7+GVe6YQfmQgiGklKuc11pgcE1Jwpu8RPhfVtis/zUiGDqo3ZpTySTmZrAKh
	 RhNV5dK2gg9oloym95LE6a/QH3/wllbdrfI7Wl8a30riesx5HxwnFZtc6BEGsHU7E+
	 eYGn62p/W2lJc9lyel7pXUiKKxst/QmIV97gCKs6GdzH8PcZK962cpQ1JxyvFUoOSs
	 J4ewNTnXZmRz5maFWo6kNx0L0CAjTgOLE/8kCoYl2EGsMxupBHxjbQVPGWAfCQTcuz
	 BI+Afi1mVbqAQ==
Date: Wed, 16 Oct 2024 12:10:52 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
Message-ID: <Zw-tTEViagJFPFtv@ketchup>
References: <SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221BDC11EE244C7D70C229DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <zsayhliz4a4fauzmvkimd4uzucuunt6gmkypjlqh4omle4uqx4@cbknudobc57g>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <zsayhliz4a4fauzmvkimd4uzucuunt6gmkypjlqh4omle4uqx4@cbknudobc57g>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_051114_593888_2441D654 
X-CRM114-Status: GOOD (  24.72  )
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

On Tue, Sep 17, 2024 at 08:39:37AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Sep 16, 2024 at 10:23:09PM +0000, Haylen Chu wrote:
> > Add definition for the clock controllers of Spacemit K1 SoC. The clock
> > tree is managed by several SoC parts, thus different compatible strings
> > are added for each.
> > 
> > spacemit,k1-syscon.yaml is updated as well to allow clock controller
> > being its subnode.
> > 
> > Signed-off-by: Haylen Chu <heylenay@outlook.com>
> 
> Please order patches correctly. First this, then the parent so you will
> not submit incomplete binding.
>
> You still must test it, though :(

Thanks for the tip.

> > ---
> >  .../bindings/clock/spacemit,k1-ccu.yaml       |  71 +++++++
> >  .../soc/spacemit/spacemit,k1-syscon.yaml      |   4 +
> >  include/dt-bindings/clock/spacemit,k1-ccu.h   | 198 ++++++++++++++++++
> >  3 files changed, 273 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
> >  create mode 100644 include/dt-bindings/clock/spacemit,k1-ccu.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
> > new file mode 100644
> > index 000000000000..0186722cfd87
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/spacemit,k1-ccu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Spacemit K1 SoC Clock Controller
> > +
> > +maintainers:
> > +  - Haylen Chu <heylenay@outlook.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - spacemit,k1-ccu-apbs
> > +      - spacemit,k1-ccu-mpmu
> > +      - spacemit,k1-ccu-apbc
> > +      - spacemit,k1-ccu-apmu
> > +
> > +  clocks:
> > +    minItems: 4
> 
> Drop
> 
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: clk_32k
> > +      - const: vctcxo_1
> > +      - const: vctcxo_24
> > +      - const: vctcxo_3
> > +
> > +  spacemit,mpmu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the syscon managing "Main PMU (MPMU)" registers. It is used to
> > +      check PLL lock status.
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +    description:
> > +      See <dt-bindings/clock/spacemit,k1-ccu.h> for valid indices.
> > +
> > +required:
> > +  - compatible
> > +  - "#clock-cells"
> > +
> > +additionalProperties: false
> 
> Move it after allOf block
> 
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: spacemit,k1-ccu-apbs
> > +    then:
> > +      required:
> > +        - compatible
> > +        - "#clock-cells"
> 
> Drop both, redundant
> 
> 
> > +        - spacemit,mpmu
> > +
> > +examples:
> > +  - |
> > +    syscon_apbs: system-control@d4090000 {
> 
> Only one example, keep it in parent node.

Should I drop the example block in this binding completely and move it
to its parent's binding (the syscon) or just drop the parent here?

> > +        compatible = "spacemit,k1-apbs-syscon", "syscon", "simple-mfd";
> > +        reg = <0x0 0xd4090000 0x0 0x1000>;
> > +
> > +        clk_apbs: clock-controller {
> > +            compatible = "spacemit,k1-ccu-apbs";
> > +            #clock-cells = <1>;
> > +            spacemit,mpmu = <&syscon_mpmu>;
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > index 4e3a72b48aff..08efda207101 100644
> > --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > @@ -27,6 +27,10 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  clock-controller:
> > +    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
> > +    type: object
> > +
> 
> This MUST be part of other patch.
> 
> Best regards,
> Krzysztof
>

I will adapt all the comments in next version.

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
