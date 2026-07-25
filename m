Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E92C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 12:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AldTJWlJ7p2qEHQ3woKMv4SDFs/zc/06wKG3y567oHI=; b=RqChB6jGmuQMr8
	xDsl+KiX7MzcWGkwfB9USVBigE2yTla2lkxMCOsEAdU4fPOMRXUqpC62YI3mGjyaZgPlOp+TwQxSi
	OrKP0F++O6t0b+UeacB3FdDwceEywlB3pWVwBRzedDOG+fnoc1/BafgjMs8DvFy/2YXkQnHu5IRw/
	G3SPdb7FM72V3o9mLm28pGlgETaJE+4qkVWdlw4BlUA6ACU6aj6UTcL48TVbwV2Hc68cZmo5mjlmp
	d89D5r3JB8Z3rXg8q2ip0XiKJ3a8SE47Zat/skwDWV5Fjj5GJ0OZyvtGtIvivTNG+rNrGAqJjLBzu
	HAGRXb83sUhqARPCg3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnbrw-00000000M9s-09JG;
	Sat, 25 Jul 2026 12:52:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnbrv-00000000M9m-0LOv
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 12:52:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D517D600AA;
	Sat, 25 Jul 2026 12:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23841F000E9;
	Sat, 25 Jul 2026 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784983961;
	bh=gT38tjeb++jK/k2GuhtDfea7iMxOcK2Bu0owLvQjsQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E8ej9lUKixqo3RxPh//MNsA71v7PrPdyLkXDtAeGb3Yemsy9aEzLvk2K5oz84l5x3
	 +FzzucF/0rBESyA5JsMmGfCIvEIri2OV6fKCcYdjt3vBqejmaa86y0MHGDa0PMhkab
	 31usKxz6ndNOGZigUb0uEUvaa092ddmGqMXUG0PcRx7hnuG3v0kLW0SD98ABoO0TJd
	 hsKil2gkGtSzIIVg/fGfmFysDRP/80BIT40/O3WeYZ6UD4dhlv8seIhoFmFTJEvg68
	 mn0LqPLvrruEwBxA4b9dqIuzN/1+ZhLL+pS96jfw809ydAF7SV9jsEEvjDu2OS+d2O
	 rH2JfYXTWt0zQ==
Date: Sat, 25 Jul 2026 12:52:38 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Fix phy id check for the phy
 on pico-itx board
Message-ID: <20260725125238-GKC77545@kernel.org>
References: <20260725005804.373698-1-inochiama@gmail.com>
 <20260725005804.373698-2-inochiama@gmail.com>
 <9545227f-77ef-480d-bb55-6caf1124627c@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9545227f-77ef-480d-bb55-6caf1124627c@freeshell.de>
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

Hi E Shattow,

On 01:12 Sat 25 Jul     , E Shattow wrote:
> Hi Inochi,
> 
> On 7/24/26 17:58, Inochi Amaoto wrote:
> > Current phy framework can not reinit the phy correctly, as it will
> > assert the phy reset GPIO so the phy id can not be readed. Setting
> > the phy id of board pico-itx manually so the phy id dectection can
> > be skipped.
> > 
> > Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> > Reported-by: E Shattow <e@freeshell.de>
> > Reported-by: Inochi Amaoto <inochiama@gmail.com>
> > Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: E Shattow <e@freeshell.de>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b2a7d2d0d3a8..b9d2de878f38 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -196,7 +196,8 @@ &eth0 {
> >  
> >  	mdio {
> >  		phy0: phy@1 {
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> > +			compatible = "ethernet-phy-id001c.c916",
> > +				     "ethernet-phy-ieee802.3-c22";
> >  			reg = <1>;
> >  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> >  			reset-assert-us = <10000>;
> 
> Looks good to me, aside from commit message spelling and grammar nits
> ("re-initialize", "read", "detection"). Yixun may just fix in-flight, my
> R-by and T-by tags can stay.
> 
Yes, I will fix them while applying, no need to resend, thanks for review

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
