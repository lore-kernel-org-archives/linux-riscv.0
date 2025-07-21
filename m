Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B343DC87FC5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+fqhDwtFkJdQkcBV+IXEBmozfCQRoRFSBuIrHdk8Jw=; b=ZvkMoW9C2ktfhL
	Uk9rHigQ7sFHpRUO6/Aqgin/j6IEz4jeHuYkXPdQ7+fq4p3Y99I9TnHa8Y5dPDcWyS4it7P7R+H9p
	85kBYAK83HRkkctBXb/5slcgsE1eFByCFTZNceLSO5tb6xr3g3knRsp/58+vnfqqwQxysDDHGR1Ek
	JtTBbQybstoTx+NePxhz0sAyQABEgRyokYhKemDhq0uXDbSygs9jB6YDZr0mXkNt2mV0x1UlP47bV
	f+U/Iep5mRlO4yM/v90w8c9a2efhFw8TtSfSAp5QUfTo4JpSS6r2kzNmepo+kYyspn4bNq5+rKp5m
	1ySluDhsiYOj5PA3qxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udosd-0000000H91H-2Rvx;
	Mon, 21 Jul 2025 11:40:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoIb-0000000H1wd-3BET
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 11:03:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoIJ-00073c-OP; Mon, 21 Jul 2025 13:02:55 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoII-009Xfy-35;
	Mon, 21 Jul 2025 13:02:54 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1udoII-000Ebv-2o;
	Mon, 21 Jul 2025 13:02:54 +0200
Message-ID: <468961ac17fb5dd4365943a24206040575b0e982.camel@pengutronix.de>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ze Huang <huang.ze@linux.dev>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun
 Lan <dlan@gentoo.org>,  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Mon, 21 Jul 2025 13:02:54 +0200
In-Reply-To: <20250712-dwc3_generic-v6-1-cc87737cc936@linux.dev>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
	 <20250712-dwc3_generic-v6-1-cc87737cc936@linux.dev>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_040313_795064_5E4C7B59 
X-CRM114-Status: GOOD (  15.62  )
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

On Sa, 2025-07-12 at 15:49 +0800, Ze Huang wrote:
> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> in the SpacemiT K1 SoC. The controller is based on the Synopsys
> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> DRD mode.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c967ad6aae50199127a4f8a17d53fc34e8d9480b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
> +
> +maintainers:
> +  - Ze Huang <huang.ze@linux.dev>
> +
> +description: |
> +  The SpacemiT K1 embeds a DWC3 USB IP Core which supports Host functions
> +  for USB 3.0 and DRD for USB 2.0.
> +
> +  Key features:
> +  - USB3.0 SuperSpeed and USB2.0 High/Full/Low-Speed support
> +  - Supports low-power modes (USB2.0 suspend, USB3.0 U1/U2/U3)
> +  - Internal DMA controller and flexible endpoint FIFO sizing
> +
> +  Communication Interface:
> +  - Use of PIPE3 (125MHz) interface for USB3.0 PHY
> +  - Use of UTMI+ (30/60MHz) interface for USB2.0 PHY
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: usbdrd30
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    items:
> +      - description: phandle to USB2/HS PHY
> +      - description: phandle to USB3/SS PHY
> +
> +  phy-names:
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  resets:
> +    items:
> +      - description: USB3.0 AHB reset line
> +      - description: USB3.0 VCC reset line
> +      - description: USB3.0 PHY reset line

Are we sure all resets will only ever need to be triggered together?
Otherwise it might be safer to add a reset-names property.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
