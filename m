Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D34ACA5FA1
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 21:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wprV2mkFBG5UpbhanZRIIMS7N5Hi7EB6x6Z8kBWsvs4=; b=E8VZnSiDVDeewZ
	d9oJUhfDoCgWknn3UQuxY/QrpwgP7Dec4XUD2U54K/7HeoKk6YJ1GYAq0pNeg4AG1CwgGcTqgjxwn
	5qBE5FKK419amL3Rx2A6T88HKDdU3vXR95leCyUgl8x+qyxpqSTI3MA1q8K8EF9+x9JWDidxcMdWC
	5YgV+jPAAE+s41NEcbDpVCBManLQXCr+Cv7fsl6N8p58uTeGO7SjEY+MRJ+XRKLcaSRg4wWD6P13o
	D21jxVJhPbJGnG2wEY/KCIyPLvSf1SWSOZRPp/CTI2Z7SdTcJtRmfG9ZHrrvte+KIOVqFllMTzAF2
	0qnwXkb/WsRtg0uJVKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIcc-00000001ela-0Wbf;
	Mon, 28 Sep 2026 21:10:50 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIcZ-00000001elC-2Lar
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 21:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=y4GOBYDPRlGhb6aBAB1LERdD58JntG//PZlojT1T0KM=; b=EWWljlk6qh/IxPjyxEZC0GGsyz
	Sg+exB4Gxe7dar/3NBuWkB3VQEVkqcsWFFDYBI7ovgZ0D46lzNQJgDrwALffQ+H/8dr9fY8yR1olE
	9xhA0MKRl1DfJsO4UpLh7G2C0knDIvg5QF0G/voGVvqJAUz5EErZw/bSD+PWIvVCrmlNniecS3Y5H
	DHUJgh6ZjcGE0WkkwPrLK3vmszum1UripnyUAslUFGUFNdEXKK6yBhIMCY2BK1XXWoGDgSuBj5GTv
	GA6ufkDkxnaE151FiNAWd7w/vVfjHa0yGq6IoMy3d7m/G9eVs8FI0blIE+fuFoaZNmtj5HN5jD000
	5wFPCxww==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIcW-0000000F959-2zh9;
	Mon, 28 Sep 2026 23:10:44 +0200
Date: Mon, 28 Sep 2026 23:10:44 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v5 2/5] riscv: dts: spacemit: k3: add USB3 B and C
 controllers for Pico-ITX board
Message-ID: <arrX1KoS-ghNhTve@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
 <20260928205012.3689405-3-aurelien@aurel32.net>
 <20260928210216.7DCB41F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928210216.7DCB41F000FF@smtp.kernel.org>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_141047_625767_750454CF 
X-CRM114-Status: GOOD (  16.72  )
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

Hi,

On 2026-09-28 21:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing required phys properties in usb3b and usb3c nodes
> --
> 
> commit 89b216baa5d6be0e4a7be800d568bba679087495
> Author: Aurelien Jarno <aurelien@aurel32.net>
> 
> riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
> 
> This commit adds the USB3 controller nodes (B and C) to the SpacemiT K3 SoC
> device tree. It also enables them and adds the corresponding USB2 PHY nodes
> for the Pico-ITX board.
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index 1af47b7f1c8af..cf1c8b572c86b 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> 
> [ ... ]
> 
> > @@ -441,6 +441,66 @@ soc: soc {
> >  		dma-noncoherent;
> >  		ranges;
> >  
> > +		usb3b: usb@81400000 {
> > +			compatible = "spacemit,k3-dwc3";
> > +			reg = <0x0 0x81400000 0x0 0x10000>;
> > +			interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
> 
> [Severity: Low]
> Does omitting the phys and phy-names properties here cause a devicetree
> validation regression?

No it doesn't, I checked that before the submitting the patch.

> The SoC devicetree fails dtbs_check validation against the binding schema
> (spacemit,k1-dwc3.yaml), which unconditionally requires the phys and
> phy-names properties.

No, as explained in patch 1, dtbs_check only check enabled nodes, so this is fine.

> Should this node define its hardwired connection to usb3b_u2phy via the
> phys and phy-names properties here, instead of omitting these SoC-internal
> hardwired connections from k3.dtsi and forcing downstream boards to
> redundantly define the SoC hardware topology?
> 
> > +			interrupt-parent = <&saplic>;
> > +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;

No, this has already been discussed as part of the v3 review:
https://lore.kernel.org/spacemit/aomWjQGk_p84pPD2@inochi.infowork/

> [ ... ]
> 
> > +		usb3c: usb@81700000 {
> > +			compatible = "spacemit,k3-dwc3";
> > +			reg = <0x0 0x81700000 0x0 0x10000>;
> > +			interrupts = <148 IRQ_TYPE_LEVEL_HIGH>;
> 
> [Severity: Low]
> Similarly, does this node also need to define its hardwired connection to
> usb3c_u2phy via the phys and phy-names properties to avoid the same schema
> validation regression?
> 
> > +			interrupt-parent = <&saplic>;
> > +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;

Ditto.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
