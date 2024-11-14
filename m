Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867DBD65C52
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwUvAs2pzc3Gl+kE6OtU+/jRx2g6C/AiHIHINrH34Jc=; b=4PdxGAa6iSL3rt
	HC/O4495jUDF9jjh3p+7wK7LgfOXs8MJVzaDMm2xoqXHcU4lo05CWXNjCXjiAjd6VgoH4L1UqmBFr
	fmMjS09pdLjSmJaUzSL4RLDlRQgRTeLD3CWpCfhRt+pbmnl0e42VIsV2nuT0fPEVBZSL9b/hJ2EWT
	FulijmiXQMhJZbCh5IoFWBIgBONPg+UmIK+rcOWG69U3mYVz49ahx00ZuBqLkbl4R87ou7mUdA9zD
	MgzUI49EnLEfnzx8bETXafFk9pf5BzhHljhECn9bBkDc2ltNcQHGMYL9XzA9oKq6FRarLJJ5U80g8
	BvhEFiu7GJbRh2Q82DLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBU2B-000000093e9-1ka4;
	Thu, 14 Nov 2024 07:12:55 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBTvb-0000000927E-1nKD
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 07:06:09 +0000
Date: Thu, 14 Nov 2024 15:06:01 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <20241114070601-GYA1001363@gentoo>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
 <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
 <20241112-aged-trailing-cffda6af0944@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241112-aged-trailing-cffda6af0944@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_230607_525339_7D65D2A2 
X-CRM114-Status: GOOD (  17.37  )
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

On 18:03 Tue 12 Nov     , Conor Dooley wrote:
> On Tue, Nov 12, 2024 at 11:07:39AM +0800, Troy Mitchell wrote:
> > From: Troy Mitchell <troymitchell988@gmail.com>
> > 
> > The I2C of K1 supports fast-speed-mode and high-speed-mode,
> > and supports FIFO transmission.
> > 
> > Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> > ---
> >  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 52 ++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > new file mode 100644
> > index 000000000000..e8cce360bf03
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: I2C controller embedded in SpacemiT's K1 SoC
> > +
> > +maintainers:
> > +  - Troy Mitchell <troymitchell988@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-i2c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description:
> > +      Desired I2C bus clock frequency in Hz.
> > +      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
while we are here, I'd suggest rephrase the sentence above to align it better with the doc

K1 support three different modes which running different frequencies
standard speed mode: up to 100000 (100Hz)
fast speed mode    : up to 400000 (400Hz)
high speed mode    : up to 3300000 (3.3Mhz)

> > +    default: 100000
> > +    minimum: 1
> > +    maximum: 3300000
> 
> It's sufficient to define just default and max btw, the min is set in
> i2c-controller.yaml (in dt-schema itself). Don't respin for that alone.
+1, the minimum settings isn't really useful, clearly not apply in the practical case

> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c@d4010800 {
> > +        compatible = "spacemit,k1-i2c";
> > +        reg = <0xd4010800 0x38>;
> > +        interrupt-parent = <&plic>;
> > +        interrupts = <36>;
> > +        clocks = <&ccu 90>;
> > +        clock-frequency = <100000>;
> > +    };
> > +
> > +...
> > 
> > -- 
> > 2.34.1
> > 



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
