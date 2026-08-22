Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA48BC5DF97
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52huVtdoN2dtKSKuRO7t4E3FlEqsRz/SX+gPrmk3ltA=; b=DcH7+BwchbCu4T
	Gjc4koevrMB4SMOfzuB48ARp6Kr7S4DnE6afFsAw4NSv0o4q7q3ceX4mJbwNkxvJ9LFC+ZU94N+wn
	VxJSp3JK6Bx0PDC+q9/06PNo/Knz+vIkRJLRFv6EmJX47sUVXg6LJwV9JF9KWhuFEQURIvDMuVQqL
	ErLk6B9tDgsI7leg43NilL7nPV5xtLCaC0mYU3A8z7qLORNMnDbObt3018DJ0xWbJAAvJ0/aam4/g
	JIsmyAZs6NMXNYv1QLTuuaPhHArwNesKqJ8myW4Bivz0e10R4iVCIISAAGFanqlXXm/xSrEXBou07
	X3T35vksaXyEGz2iNYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiAn-0000000EQkw-0HVL;
	Sat, 22 Aug 2026 09:37:57 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiAl-0000000EQkZ-0TMZ
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 09:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=PXtr0FjCl+UhNS+rb/fTOHoXrNWxlpBFn/+u2wMK3T0=; b=ktaxalRVTUSReGk9GXhu9N5bs+
	Z/iyvukyhoi3gYd4ynDR5LcIzftPg8Gnax2P1H6nqk2pK8uH5tsa+ZT80pQc/0n4xzO6ifdgg5HcE
	F3SkISlhWF9uXzlCyqXahWS2/nQv+swdR/NhjW4lcE16p9O9zWAPneoEhktBRt2h2DIEsWYHDnylT
	aMunADRl+UOBHZoHPbqFjc8wH3LdfPuRocd1UUlDrCmNgCO5aTIC5JcJ9rRvBLVyQ3Cn35zH+Ae84
	FB5e+/O72Te6YiiK05lbnzYSk6Le6/x0a6JPtYXwxn4IQBP6KvjDLb0/YFpfRuTP6LKcFYOE3lJqr
	VaxJpSpA==;
Received: from aurel32 by hall.aurel32.net with local  (Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wxiAa-0000000GhRJ-31Jx;
	Sat, 22 Aug 2026 11:37:44 +0200
Date: Sat, 22 Aug 2026 11:37:44 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <aolt6CaL9b6p8A8V@aurel32.net>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
 <20260819162115.2252812-2-aurelien@aurel32.net>
 <aokGbT7XTCbxUQzl@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aokGbT7XTCbxUQzl@inochi.infowork>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_023755_184160_B176C70E 
X-CRM114-Status: GOOD (  23.40  )
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

On 2026-08-22 10:17, Inochi Amaoto wrote:
> On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> > On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> > either be used for PCIe or USB3, depending on its configuration
> > (spacemit,apmu). This configuration is defined at the board level, and
> > assigning a phy line to a USB3 controller while it is configured as PCIe
> > results in an "Invalid PHY mode" error.
> > 
> > Move the USB3 phy at the board level, the as it is done for the
> > submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> > there is one phy per USB controller.
> > 
> > [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> > 
> > Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> > Cc: Inochi Amaoto <inochiama@gmail.com>
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b084a35aa00e..171bd2f40aa6 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -328,5 +328,8 @@ &usb3d_u2phy {
> >  };
> >  
> >  &usb3d {
> > +	phys = <&usb3d_u2phy>,
> > +	       <&combophy 4 PHY_TYPE_USB3>;
> > +	phy-names = "usb2-phy", "usb3-phy";
> >  	status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index c3f2dce0969c..3e24054d2084 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
> >  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> >  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> >  			reset-names = "ahb", "vcc", "phy";
> 
> > -			phys = <&usb3d_u2phy>,
> > -			       <&combophy 4 PHY_TYPE_USB3>;
> > -			phy-names = "usb2-phy", "usb3-phy";
> > +			phys = <&usb3d_u2phy>;
> > +			phy-names = "usb2-phy";
> 
> I suggest removing this completely as we can not determine the
> phy we used. I think it is suitable for setting this in board
> file only

Yes, moving all the phy definition to the board level is an option. I 
decided to keep the USB2 phy at the SoC level, because contrary to the 
USB3 phys, there is a one to one mapping between the controller and the 
phy. Do you think it is a wrong assumption?

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
