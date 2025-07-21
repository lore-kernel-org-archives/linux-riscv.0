Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47003C83F25
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcsLdlOMawmYn7mU5ZRl+Vxy+ioFCy37jXUmhyAgOQ0=; b=PR+yogvdCiNls3
	km1feqExDmJqeACd0rQqXS02N1uZS0m99041HDetOoyHzDc5+a9fbXANPAOwvz4L2LP7fUR6OALmL
	8YC8grZzgSWDpII+KvrqusPfd3MmU9JReKlTvtVwiKZAJTtJW/7gnBfNMIyi2mio/3EaZ47s5WMeP
	Yd+I02eKmcbwj86XIZZp88DgMmIXQoIxCeEGYcwTnodgM1nDP6OlUQENxwmsUVzGLBkv0DijvaN4r
	X02cd5zv5lXUtz6DSUE05asuim5qpBgjGDURqvYdxRk0lWTFiIxwtLfjN7T+33DeV6BN/TRUGO0xx
	LuGcpyMvPriUPhuYM4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqVw-0000000HNei-2tUw;
	Mon, 21 Jul 2025 13:25:08 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udp9j-0000000HCNg-2ceO
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 11:58:09 +0000
Date: Mon, 21 Jul 2025 19:57:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753099082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bfrHdHadKeOGrxubHlclT+KsEtO7bFXUMTU/oDEY5dQ=;
	b=p36aVARw7D43XfPT4ZZedi3YcLfN/KR5oUPoLSSqFTzIk6/rRnSzX8rESovL+8J02HVpqK
	U992BQVKcaz3RmNJ5lrzf3drMvWTqoYIvY1gWUbhXWMl26WB00iJSqa3Ka9D1Z70ZXJrx7
	02rJ8Oad5yjpUM8tTyLq8oiqLFz/Pgw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Philipp Zabel <p.zabel@pengutronix.de>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aH4rRKPHzB0kd7Ek@monica.localdomain>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
 <20250712-dwc3_generic-v6-1-cc87737cc936@linux.dev>
 <468961ac17fb5dd4365943a24206040575b0e982.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <468961ac17fb5dd4365943a24206040575b0e982.camel@pengutronix.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_045808_076969_C95B4F3D 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, Jul 21, 2025 at 01:02:54PM +0200, Philipp Zabel wrote:
> On Sa, 2025-07-12 at 15:49 +0800, Ze Huang wrote:
> > Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> > in the SpacemiT K1 SoC. The controller is based on the Synopsys
> > DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> > DRD mode.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> >  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 +++++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c967ad6aae50199127a4f8a17d53fc34e8d9480b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Ze Huang <huang.ze@linux.dev>
> > +
> > +description: |
> > +  The SpacemiT K1 embeds a DWC3 USB IP Core which supports Host functions
> > +  for USB 3.0 and DRD for USB 2.0.
> > +
> > +  Key features:
> > +  - USB3.0 SuperSpeed and USB2.0 High/Full/Low-Speed support
> > +  - Supports low-power modes (USB2.0 suspend, USB3.0 U1/U2/U3)
> > +  - Internal DMA controller and flexible endpoint FIFO sizing
> > +
> > +  Communication Interface:
> > +  - Use of PIPE3 (125MHz) interface for USB3.0 PHY
> > +  - Use of UTMI+ (30/60MHz) interface for USB2.0 PHY
> > +
> > +allOf:
> > +  - $ref: snps,dwc3-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-dwc3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: usbdrd30
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    items:
> > +      - description: phandle to USB2/HS PHY
> > +      - description: phandle to USB3/SS PHY
> > +
> > +  phy-names:
> > +    items:
> > +      - const: usb2-phy
> > +      - const: usb3-phy
> > +
> > +  resets:
> > +    items:
> > +      - description: USB3.0 AHB reset line
> > +      - description: USB3.0 VCC reset line
> > +      - description: USB3.0 PHY reset line
> 
> Are we sure all resets will only ever need to be triggered together?
>
> Otherwise it might be safer to add a reset-names property.
>

Yeah, that's helpful. Will add reset-names property in next version.

> 
> regards
> Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
