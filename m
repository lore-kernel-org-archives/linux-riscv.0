Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE84CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrPpxRDpQoVlOPIq2CSK1gFHYrhgsYBuBRlMo+i3MDg=; b=vVb3gTY96f6gWD
	wmrrLUibeLMh8xUEj37lXmE0Stdla2OLnN443Zcrbfw1DUAptXxwznHQZ/0TIV+IxToRpk//W/hhd
	Hir8a3zQqibYnZhqx488XxNuQsT6a9wh0mPv5/B3SPdgEe+Wh2Vfr9nFNZQdYJaOJ9xKdV+nySRQu
	EbLlAifly75mdCA1YdCdN2H/281rrsviN3ySXtLETUdOJe5CkHHqGO8/Og5zkcG6m+Y60AtLatg5h
	f16Tf2GK+T0SW9AKbECQrxYr1KGjlxbI+5JP8sFDa2NNXUtOxONO+QV4VOSWVrYbiB/dKvO8CmXIU
	TRVPROycree46ELa4psA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nfv-0000000BWXO-0l1f;
	Mon, 22 Sep 2025 21:02:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nfu-0000000BWXH-0rwM
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Sep 2025 21:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=asyNZP9neHNXj+Sf6k7sPwKgT9c0m2eBv/rMLNDCtys=; b=G8DpRtEUmCr7VCVwymfn/BKAdN
	AvwWNLxhjK0l2i0p5Bx/iQzn43ksLCPPN65wfRCH+lyf4NEXvf7A2TGYqt6SxRZfDMDuLWtmEMcYF
	iCW2nqj/UT+IRbDWPsw/JWIwqyLxWYDuDFgC7YEFG009Uc4SWSvOmc31QAlRcXtzR0GT97MnmgAH8
	UNVuRAPRQT4aaYqKChHFsdQ+lTZFJUY7b1eMqdP6Sgc2dnmZ12Owjw1t9rFiXLzfJJl1QViOijUsh
	Cft83Eyf8ool+2veE8175RfCuxDYsgzl96Anc8gQU09Yuw3dlneDSqU+1+qQvxctxb9k8vmPcb4FR
	6kP7tr6Q==;
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ne4-00000008O5R-1JbO
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 21:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=asyNZP9neHNXj+Sf6k7sPwKgT9c0m2eBv/rMLNDCtys=; b=tFnEbDmrs/NXUJ6T83/sGy/b1t
	Kz+6rhz0J1rz8uFgGchadwf5BXSxN4p/Pe4DS9blqRMtj98sPJC3c9Bd5Oiy2P3GfNnt+dVGzTvpA
	1bBafaJfnfCSnvIGffRmpqC8Lz426hpYMpk3oUetrXLlRQPKe9fMwTjXyATJCc89WKLXoNR8wOPLs
	VKEnHU5r55IwqRskbiZ9c4dFneKFhIMIvEMI8rQjf2h5mDdodOsL9dn5TgP5+vycrluTcxkqww0En
	mBvDRkte5i9AZdJLflXdVN6pxpuxZzmDG9arg932xgY6sWlzorOBvctN+zdstdd+oCNQqABjm8Hnt
	9TL4GIzA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0ndz-00AlmZ-0j;
	Mon, 22 Sep 2025 23:00:19 +0200
Date: Mon, 22 Sep 2025 23:00:18 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <aNG44sQf-RfRV9Of@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
 <20250922032158-GYA1291757@gentoo.org>
 <aNDVX9IrDbH2w7yJ@aurel32.net>
 <20250922080105-GYB1291757@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250922080105-GYB1291757@gentoo.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_220034_363729_D202F10E 
X-CRM114-Status: GOOD (  30.01  )
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

On 2025-09-22 16:01, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 06:49 Mon 22 Sep     , Aurelien Jarno wrote:
> > Hi,
> > 
> > On 2025-09-22 11:21, Yixun Lan wrote:
> > > Hi Aurelien,
> > > 
> > > On 23:01 Sun 21 Sep     , Aurelien Jarno wrote:
> > > > The BPI-F3 contains a 24c02 eeprom, that contains among other things the
> > > > MAC addresses of the two network interfaces. For this reason, mark it as
> > > > read-only.
> > > > 
> > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > > ---
> > > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > index 3b6e4f52e9aad..574d10fdf9b82 100644
> > > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > @@ -115,6 +115,15 @@ &i2c2 {
> > > >  	pinctrl-0 = <&i2c2_0_cfg>;
> > > >  	pinctrl-names = "default";
> > > >  	status = "okay";
> > > > +
> > > > +	eeprom@50 {
> > > > +		compatible = "atmel,24c02";
> > > > +		reg = <0x50>;
> > > > +		vcc-supply = <&vcc1v8_sys>;
> > > > +		pagesize = <16>;
> > > ..
> > > > +		read-only;
> > > so you're sure there is no demand to write data to eeprom?
> > > (update info at linux env)
> > 
> > It seems to only contains board infos (mac addresses), but if there are 
> > other use cases, that can indeed be dropped.
> > 
> On my second thought, I'm ok with it being "read-only", as we flash these
> infos during firmware burning stage, then never alter them later.
> 
> > > > +		size = <256>;
> > > > +	};
> > > >  };
> > > >  
> > > >  &i2c8 {
> > > > @@ -143,7 +152,7 @@ buck2 {
> > > >  				regulator-always-on;
> > > >  			};
> > > >  
> > > > -			buck3 {
> > > > +			vcc1v8_sys: buck3 {
> > > I'm not sure if adding an alias here is a good idea, it occurs buck3
> > > serve the suppy for many devices, besides, to me it's more proper to
> > > name it as eeprom_vcc1v8 for the eeprom according to schematics in
> > > this case..
> > 
> > We need to add a label to be able to reference it for the eeprom 
> > vcc-supply, but we'll have to also reference it for other devices (e.g.  
> > emmc, wifi, phys, etc... It tried to choose a common name, ie the right 
> > most one on the schematics. Another option could be to call it buck3, 
> > but other name suggestions are welcome.
> how about simply making it "buck3_1v8", then probably add a comment
> later in the eeprom node? to mapping to the shecmatics
> 	vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */

Thanks that sounds good. I'll send an updated patchset with that change.


-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
