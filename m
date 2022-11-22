Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E31C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZT6OhIOlu1FDjChggdy6QybEgysipao1ruP0O57D78=; b=fTajY8FttSlQfN
	Vssws9omwPVvOuBtutMeS7j6wTWpc6D6OafKXkXUUT+mt6soaOS6GUiWAw52o9Vz/aG8jZHmjT0Xv
	Rw9KAKkezp7N11P15JhekaGlrRuUjndSRnhhtMSUbLkZglKSxdATck+dE7mFOkziJ8OLLASxMC8Tc
	wrsTE1n/nvC0k3U+lsToGruIFYg7YthjxSelr9Tqg5+cTYCz2eNr1hDJa2hfL9AnlXBInH5AJSDUt
	8MCz5AX7HvUmkhRsuS7mTTU/0mfo/idD65NrGCYaq7nuKox3nDUWHhAT2z1soWjDMwEhtqUnYKMiC
	82P099+Odc54sEB+A+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQ6S-007YDo-TX; Tue, 22 Nov 2022 10:02:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQ6J-007Y5g-Rg
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 10:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669111319; x=1700647319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nI5iY1nxbWlYz33Yi+nw014DiITr3L9p7axhfuv7szo=;
  b=yjBCly8nJGzYG4mr5Ii3Y/ZqRNhG8aglTibpv7+PP6dXYWXaSKSjtW3p
   9k3HDi5Wo/ooBOqZBhkzLFVIDoF4hzQzH0dXCLDLtPlITAfoJ8qdZHdFD
   FhUKdJnPcpLpqcwQj38CAge8GKRzNSXAB+3pQu934aSsV/sJOW/K3RrB8
   PVByvThPO3Z9kTw7OgKOMm+KXW4zb1E61MyQ+VL0w/T6DFFgQ04v/GbrM
   T9CR8Vf2uyYh3qNHwd+8Y7kUeZdxbEqsgOT+u1CBpsm1rqtM1zuvKc3X1
   Vt7BobwxVaQcGCbvFSB11In0VGlQRSbAO9dfQrAdGG98xrDet23i7SRFY
   w==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="184644758"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 03:01:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 03:01:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 03:01:48 -0700
Date: Tue, 22 Nov 2022 10:01:30 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
Message-ID: <Y3yd+tfFl4yvXOx6@wendy>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-5-hal.feng@starfivetech.com>
 <Y3duiJguYE6VrVLP@spud>
 <Y3dvCPP1g0LzzHFO@spud>
 <a5193e23-efe1-fa65-15de-d53b80b87d63@starfivetech.com>
 <Y3yRTuo69JUsfLqk@wendy>
 <0f9e423e-37c0-a838-bf25-f9b6784a31d0@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f9e423e-37c0-a838-bf25-f9b6784a31d0@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_020201_627220_5B384330 
X-CRM114-Status: GOOD (  24.01  )
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

On Tue, Nov 22, 2022 at 05:55:57PM +0800, Hal Feng wrote:
> On Tue, 22 Nov 2022 09:07:26 +0000, Conor Dooley wrote:
> > On Tue, Nov 22, 2022 at 04:40:23PM +0800, Hal Feng wrote:
> > > On Fri, 18 Nov 2022 19:39:52 +0800, Conor Dooley wrote:
> > > > On Fri, Nov 18, 2022 at 11:37:50AM +0000, Conor Dooley wrote:
> > > > > On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
> > > > > > From: Emil Renner Berthing <kernel@esmil.dk>
> > > > > > 
> > > > > > This cache controller is also used on the StarFive JH7110 SoC.
> > > > > 
> > > > > "... and configured identically to that of the FU740"?
> > > > > Anyways,
> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > 
> > > > Actually, after looking at the next patch - why can you not fall back to
> > > > the fu740 one since you appear to have the same configuration as it?
> > > 
> > > Right, I will drop this patch and use "sifive,fu740-c000-ccache" as
> > > compatible in dts.
> > 
> > Uh, that's not quite what I was suggesting. Rather than using that one
> > in isolation, you can do the following in your dt:
> > "starfive,jh7110-ccache", "sifive,fu740-c000-ccache"
> > 
> > And then in the driver we need to make no changes - unless down the line
> > we find some sort of issue that requires special handling etc. There's
> > no harm in having a "starfive,jh7110-ccache" IMO.
> 
> Just like what microchip did as blow?
> 
> Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml:
> properties:
>   compatible:
>     oneOf:
>       - items:
>           - enum:
>               - sifive,ccache0
>               - sifive,fu540-c000-ccache
>               - sifive,fu740-c000-ccache
>               - starfive,jh7110-ccache
>           - const: cache
>       - items:
>           - const: microchip,mpfs-ccache
>           - const: sifive,fu540-c000-ccache
>           - const: cache

No, I don't think this is correct either. You'd do something like:

>       - items:
>           - const: starfive,jh7110-ccache
>           - const: sifive,fu740-c000-ccache
>           - const: cache

And then the driver needs no changes.
Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
