Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06892E7C4E2
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOPgnFTpeL/dcUlMNCNLs2xBJyHYvJm2inJ+4yhyWpU=; b=LkiLVVpzP63yDQ
	bfuR3OnPc+60g8q1xee/MHp6qIun28JEoFkUVYvWUBBvKQWeZddZoUxFYLd0xxW96QOa4LJRjO3Sq
	zt/rV96V+15N1Kg45Wh99rpzxkctnPhGEJJjJ/l1d85YKES0mm9M/KwGWSzB8NHU4+6msrEglBES5
	PLqqU7ILwEf8uJGAM3dVLj5lJnUq+FI7dPidzcliGyYzXu7+c/FeNm7IN7YtMfUGNfYSNEAxTu2BP
	qb6YHYcJpcHhjv0FwPVuwE4c/JkUwvwkR3fnCVmpeItAMHT0CBSQOe7Woc1TvZ3lJuQVA4j2NBtMx
	RY6duYWdDR2B+NIQRiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4zC-000Vf5-16;
	Wed, 04 Oct 2023 16:44:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4z9-000VeL-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 16:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A8CE615E3;
	Wed,  4 Oct 2023 16:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC080C433C8;
	Wed,  4 Oct 2023 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696437870;
	bh=bJUdCu4n8Q616ruuLdWGE4yAQa292y0ym8neR1k201A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0goTKf7yenCuo1njZMrdo0wDTZQ5t1AC2tPHka97g2Tw8m49Gbju3yP3QFrztt7U
	 PN/0QG/WY1onVRnFunFTmiV9QhcIcASYT19N+va3cryvt4q6+Z/cxMIAidJ0kNOF6w
	 Wb6oOuXTJuD/I8RpVkWvMcI6ZlSMYBsAhNIz3SnnCzNfffbYTB2YrbsY0PUk90MCpe
	 2XKJDz2xfxe/JJuLwx14ZYyXc7RqfTlkL3KlVH/Bsg2k18iK1dSy93uImyHWmQyRvG
	 g5ANS9iQg3CvKRycbtbSuhZny1k3bnQKtZBxX2WwR2Ycjzan5KB/Tk8fCQBuv1mTh4
	 cNatltJeDS8HA==
Date: Thu, 5 Oct 2023 00:32:23 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add T-HEAD TH1520 USB controller
Message-ID: <ZR2Tl1rkRdIG+fQa@xhacker>
References: <20230927164222.3505-1-jszhang@kernel.org>
 <20230927164222.3505-2-jszhang@kernel.org>
 <cf68f6f1-e405-4c20-b4e1-da04189d0e2f@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf68f6f1-e405-4c20-b4e1-da04189d0e2f@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_094431_301687_AB812388 
X-CRM114-Status: GOOD (  23.42  )
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

On Wed, Sep 27, 2023 at 03:00:59PM -0500, Samuel Holland wrote:
> On 2023-09-27 11:42 AM, Jisheng Zhang wrote:
> > T-HEAD TH1520 platform's USB has a wrapper module around
> > the DesignWare USB3 DRD controller. Add binding information doc for
> > it.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../bindings/usb/thead,th1520-usb.yaml        | 73 +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > new file mode 100644
> > index 000000000000..afb618eb5013
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: T-HEAD TH1520 DWC3 USB Controller Glue
> > +
> > +maintainers:
> > +  - Jisheng Zhang <jszhang@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: thead,th1520-usb
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ref
> > +      - const: bus_early
> > +      - const: phy
> > +      - const: suspend
> 
> Except for "phy", these clocks are already documented in snps,dwc3.yaml. Are
> they necessary for the glue/PHY, or do they belong only in the controller node?

Hi Samuel,

Enabling ref, bus_early clks are necessary for the glue layer, because
we program the glue registers before calling of_platform_populate()

> They are not used by the driver in patch 2. Also, the PHY clock probably belongs
> with the PHY node.

Except enabling the phy clk, we don't need to touch the phy, so I'm not
sure how to handle this if we have a dedicated phy driver thus a phy node.
or use the usb-nop-xceiv?

Thanks
> 
> > +
> > +  ranges: true
> > +
> > +  '#address-cells':
> > +    enum: [ 1, 2 ]
> > +
> > +  '#size-cells':
> > +    enum: [ 1, 2 ]
> > +
> > +# Required child node:
> > +
> > +patternProperties:
> > +  "^usb@[0-9a-f]+$":
> > +    $ref: snps,dwc3.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - ranges
> > +
> > +additionalProperties: false
> 
> The driver in patch 2 uses the thead,misc-sysreg and vbus-supply properties,
> neither of which is documented here. Also, depending on the other bindings, the
> VBUS supply should be referenced from the USB PHY or connector node, not here.
> 
> Regards,
> Samuel
> 
> > +examples:
> > +  - |
> > +
> > +    usb {
> > +          compatible = "thead,th1520-usb";
> > +          reg = <0xec03f000 0x1000>;
> > +          clocks = <&clk 1>,
> > +                   <&clk 2>,
> > +                   <&clk 3>,
> > +                   <&clk 4>;
> > +          clock-names = "ref", "bus_early", "phy", "suspend";
> > +          ranges;
> > +          #address-cells = <1>;
> > +          #size-cells = <1>;
> > +
> > +          usb@e7040000 {
> > +                compatible = "snps,dwc3";
> > +                reg = <0xe7040000 0x10000>;
> > +                interrupts = <68>;
> > +                dr_mode = "host";
> > +          };
> > +    };
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
