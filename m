Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF624C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+A+I5QjpH5CoQ00m4rRgvjAjYH1SkA5e81z1pqBhZA=; b=NxXyp9Xx8kTSPa
	AubLaXcHc57HC4OaH+/CxzJ/zHUC9uzjVsmyWalViFflO5EMC9r9WMu5MVEW9cakzAoQD2Le+ddCW
	5E5CHZegWE8KNFTIMyigXVpmkik+vJfhFAoGNz1y9zDkyOG0y30dELhOfpTH7k7EASNgk8lzAkDFu
	2DaOWaQxBr0KkS4ggrjb3OF5nstba2egbM+9Sr7hCVqR4PgK10UbGvWfl9ucnlmOtwDrCLEcOORj6
	bAz/2Ur/4iY5QzNUc7NoCsET4HZUR0r3N5LMN1Z/lmUP/Gaojrh8aVnGOKlgd0+QdhKb6h30uUHzf
	kGr0r/takJGbKj6RgDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQN7-007jwb-O9; Tue, 22 Nov 2022 10:19:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQKj-007inR-B1
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 10:16:57 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 37BC624DE73;
	Tue, 22 Nov 2022 18:16:22 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 18:16:22 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 18:16:21 +0800
Message-ID: <b57bdf1c-19f4-3d70-7618-16817669abc5@starfivetech.com>
Date: Tue, 22 Nov 2022 18:16:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Conor Dooley <conor@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-5-hal.feng@starfivetech.com> <Y3duiJguYE6VrVLP@spud>
 <Y3dvCPP1g0LzzHFO@spud>
 <a5193e23-efe1-fa65-15de-d53b80b87d63@starfivetech.com>
 <Y3yRTuo69JUsfLqk@wendy>
 <0f9e423e-37c0-a838-bf25-f9b6784a31d0@starfivetech.com>
 <Y3yd+tfFl4yvXOx6@wendy>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y3yd+tfFl4yvXOx6@wendy>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_021653_724276_6A6329A2 
X-CRM114-Status: GOOD (  24.05  )
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

On Tue, 22 Nov 2022 10:01:30 +0000, Conor Dooley wrote:
> On Tue, Nov 22, 2022 at 05:55:57PM +0800, Hal Feng wrote:
> > On Tue, 22 Nov 2022 09:07:26 +0000, Conor Dooley wrote:
> > > On Tue, Nov 22, 2022 at 04:40:23PM +0800, Hal Feng wrote:
> > > > On Fri, 18 Nov 2022 19:39:52 +0800, Conor Dooley wrote:
> > > > > On Fri, Nov 18, 2022 at 11:37:50AM +0000, Conor Dooley wrote:
> > > > > > On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
> > > > > > > From: Emil Renner Berthing <kernel@esmil.dk>
> > > > > > > 
> > > > > > > This cache controller is also used on the StarFive JH7110 SoC.
> > > > > > 
> > > > > > "... and configured identically to that of the FU740"?
> > > > > > Anyways,
> > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > 
> > > > > Actually, after looking at the next patch - why can you not fall back to
> > > > > the fu740 one since you appear to have the same configuration as it?
> > > > 
> > > > Right, I will drop this patch and use "sifive,fu740-c000-ccache" as
> > > > compatible in dts.
> > > 
> > > Uh, that's not quite what I was suggesting. Rather than using that one
> > > in isolation, you can do the following in your dt:
> > > "starfive,jh7110-ccache", "sifive,fu740-c000-ccache"
> > > 
> > > And then in the driver we need to make no changes - unless down the line
> > > we find some sort of issue that requires special handling etc. There's
> > > no harm in having a "starfive,jh7110-ccache" IMO.
> > 
> > Just like what microchip did as blow?

below

> > 
> > Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml:
> > properties:
> >   compatible:
> >     oneOf:
> >       - items:
> >           - enum:
> >               - sifive,ccache0
> >               - sifive,fu540-c000-ccache
> >               - sifive,fu740-c000-ccache
> >               - starfive,jh7110-ccache
> >           - const: cache
> >       - items:
> >           - const: microchip,mpfs-ccache
> >           - const: sifive,fu540-c000-ccache
> >           - const: cache
> 
> No, I don't think this is correct either. You'd do something like:
> 
> >       - items:
> >           - const: starfive,jh7110-ccache
> >           - const: sifive,fu740-c000-ccache
> >           - const: cache

Yeah, this is what I mean. Thanks.

Best regards,
Hal

> 
> And then the driver needs no changes.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
