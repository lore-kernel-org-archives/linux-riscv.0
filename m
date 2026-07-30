Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20352C54FDF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/XGjf+jMEmTzhe1tkK23o5qzGt18lnFdulaBuiuul8=; b=YUmFEfgC0P3gpQ
	OyD3NPHup8en2Iacqs7YMmB6flXBqK6qOC+3Xh/kdXboxNwgHOqbzifCZWPmnO67/3Ki4woipsnVv
	HoLlSmnlooY4tu07ABa5iY1X/aN0N5oIdULypKDsGW7VTLemXyQlZFmtffm6JZ57GhKaFVQDBbSG0
	WGjdGXfrclkcj+iOQbLFT8J/mP/cOEXECROCkSvx444tEoSDJcpG3fI//9G7xGnkqKPYg6gc/FTwD
	WAUgKS0yqMTU3yBgba3GrwcDW85c4gODSFJXgskKJDn0KfpC+0YYfu+dJ7kvOPUouRKQ+h9A/+rfG
	NevzUH2B4b7mVigzwPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNsL-0000000AArS-2RAE;
	Thu, 30 Jul 2026 10:20:29 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNsI-0000000AAqh-2cUr
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 10:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=lqe6fn6xE+B9TzlhACzO3A+XqQ4Cb+nHYZWBZjRrgM0=; b=PRD9oYAiPvn8MnJFynejZC0mPM
	4X8LcLNZ8r+fNQxnCUfUnKjSbTqpPilc8my5exZ9QqpqzpjaZ/rQ6N7iGB3v/E2X6Dfoxf8O8Q83z
	5frEMatty3w+YdbmuiYFNQuYlGd0p0ma67ziujDgDbMaRYqPiMh2dz1oPtNzuXTAO/xYLNvEecAXC
	AS2hBPnC8E0zhu5gESIenxIQ7td40MY7OwoHdXR6Lxq2gwUpBSrgkmu7fnTONYA9p/dkDm3/fwRLW
	sDGB3kjcNm6tA+SC3xo9Xgg+RUvevNs6KIOHOG9vohXVPxerRGx1B56NvF7lvfbhlRMCRCFz29WD3
	anaRXvmA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wpNsF-000000040VI-3Jhh;
	Thu, 30 Jul 2026 12:20:23 +0200
Date: Thu, 30 Jul 2026 12:20:17 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k3: add USB3 B and C
 controllers for Pico-ITX board
Message-ID: <amslYcO2uXLKkHLw@aurel32.net>
Mail-Followup-To: sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260729172450.1660418-1-aurelien@aurel32.net>
 <20260729172450.1660418-4-aurelien@aurel32.net>
 <20260729173332.51D661F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729173332.51D661F000E9@smtp.kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032026_665086_FA6290B3 
X-CRM114-Status: GOOD (  14.40  )
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

On 2026-07-29 17:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Mismatch between the length of the `phys` and `phy-names` properties in the `usb3b` and `usb3c` device tree nodes.
> --
> 
> --- Patch [3]: [PATCH v2 3/4] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board ---
> commit 2aa9a6448bde1ee249cba54ddbed1021d4ace1cc
> Author: Aurelien Jarno <aurelien@aurel32.net>
> 
> riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
> 
> This commit adds the USB3 B and C controller nodes and their corresponding
> USB2 and USB3 PHY nodes to the SpacemiT K3 SoC device tree. It also enables
> them on the K3 Pico-ITX board in USB 2 mode.
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index 0eb24fac4733e..b786f119d4f95 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> [ ... ]
> > +		usb3b: usb@81400000 {
> > +			compatible = "spacemit,k3-dwc3";
> > +			reg = <0x0 0x81400000 0x0 0x10000>;
> [ ... ]
> > +			resets = <&syscon_apmu RESET_APMU_USB3_B_AHB>,
> > +				 <&syscon_apmu RESET_APMU_USB3_B_VCC>,
> > +				 <&syscon_apmu RESET_APMU_USB3_B_PHY>;
> > +			reset-names = "ahb", "vcc", "phy";
> > +			phys = <&usb3b_u2phy>,
> > +			       <&combophy 2 PHY_TYPE_USB3>;
> > +			phy-names = "usb2-phy";
> 
> [Severity: Medium]
> Does this mismatch between the array lengths of phys and phy-names cause
> dtbs_check schema validation to fail? The phys property defines two items,
> but phy-names only lists "usb2-phy", omitting "usb3-phy".
> 

This is correct, i'll fix that in v3.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
