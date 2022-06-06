Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BCAC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:Subject
	:In-Reply-To:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbYPS85+Kmn7fQxLfxOiScDfgcmjzn76OQcBBTeMtrI=; b=qM4hnzQnYDrObk
	nymCm1a/x8k+ppnk+vacU8x50bfb3ZxCijmColgjFzv+VwfaifiTbUlsF/vITZhqb9qs+yQ44KwMl
	KQEPhd/NEI6oDKcLlPV3xZVG6VxFgkFV2xTY3UwTTxhbZJotZFd1LaH/ntCNGCayLv0i6uaQ8vTDt
	T5b4/mkX2LeuNQqUkK2TOC0SIZP8gmTkPjU4mit43B+r8jeCo3OS+gnY72lSyXZYyWJvWkjLPs2Zt
	G0BH0O4c1UmPvV9NTY6AobtHM78zi9IXhtBSetZFQapami5mrsK1dsAqtNKsLShgUlMX7uSlyrbdF
	GgesbX2n4SywIJoU9tjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyHlU-002Lop-BI; Mon, 06 Jun 2022 18:47:48 +0000
Received: from 80-61-163-207.fixed.kpn.net ([80.61.163.207] helo=sibelius.xs4all.nl)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyHlP-002Ln5-7g
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 18:47:46 +0000
Received: from localhost (bloch.sibelius.xs4all.nl [local])
	by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 68ea6680;
	Mon, 6 Jun 2022 20:47:35 +0200 (CEST)
Date: Mon, 6 Jun 2022 20:47:35 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: <Conor.Dooley@microchip.com>
Cc: kettenis@openbsd.org, kernel@esmil.dk, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
In-Reply-To: <6acff7ab-6f97-b17a-ce9a-a526aac81181@microchip.com>
	(Conor.Dooley@microchip.com)
Subject: Re: [PATCH] riscv: dts: startfive: currect number of external
 interrupts
References: <20220606162924.71418-1-kettenis@openbsd.org> <6acff7ab-6f97-b17a-ce9a-a526aac81181@microchip.com>
Message-ID: <d3cdaa88f562dcda@bloch.sibelius.xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_114743_614431_ACD71992 
X-CRM114-Status: GOOD (  20.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> From: <Conor.Dooley@microchip.com>
> Date: Mon, 6 Jun 2022 16:45:44 +0000
> 
> On 06/06/2022 17:29, Mark Kettenis wrote:
> > [PATCH] riscv: dts: startfive: currect number of external interrupts
> 
> Just as a nit: s/startfive/starfive

I keep making that typo...

> > The PLIC integrated on the Vic_U7_Core integrated on the StarFive
> > JH7100 SoC actually supports 133 external interrupts.  127 of these
> > are exposed to the outside world; the remainder are used by other
> > devices that are part of the core-complex such as the L2 cache
> > controller.  But all 133 interrupts are external interrupts as far
> > as the PLIC is concerned.  Fixing the property that specifies the
> > number of external interrupts allows the driver to manage these
> > additional interrupts, whch is important since the interrupts for
> > the L2 cache controller are enabled by default.
> 
> This sentence is a little hard to follow, maybe:
> Fix the property so that the driver can manage these additional
> external interrupts, which is important...

Thanks, yes, that is better.

> Also, I suppose:
> Fixes: ec85362fb121 ("RISC-V: Add initial StarFive JH7100 device tree")

Sure.

I'll send out a V2 with a fixed commit message in a week or so.

> > ---
> >  arch/riscv/boot/dts/starfive/jh7100.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> > index 69f22f9aad9d..f48e232a72a7 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> > @@ -118,7 +118,7 @@ plic: interrupt-controller@c000000 {
> >                         interrupt-controller;
> >                         #address-cells = <0>;
> >                         #interrupt-cells = <1>;
> > -                       riscv,ndev = <127>;
> > +                       riscv,ndev = <133>;
> >                 };
> > 
> >                 clkgen: clock-controller@11800000 {
> > --
> > 2.36.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
