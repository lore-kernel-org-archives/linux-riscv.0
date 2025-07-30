Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B955AC87FC9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 02:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otZb4U/TSjnGIeIF3lQ23pN8zAC9gsT8/apFO+OSjOw=; b=g0cJ3D5GQLfqQs
	yrgKkKtM9ZAekgah8AmYyQIZJFjyMndgIo8fIM4gnfnTeKa98w4OYM7C42d9Z11zcbDBiQ9GwjnkD
	tzca6F/Cmgj9k3TaVF90AGhHN5c+JuLocWIXcjX55MjrPErZCuAukY5edugYERvW42zcaLK1XDl1R
	+HldobnTrqXM9M0Ft/t+PUNVCW+hLUYF4VYnERB72/D8NhIwReqdp5jX0VnIbjDtCovGbQzUp9IiA
	wLReFB0QBwLG2sM42LTfwArkONFiooXPGKuMiVZor7fzFxpIPFGxtd9dnakBcHJcItSINPclzD+OZ
	2evmHkt9ogYoiq686j3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugwhB-00000000Yn5-0V9G;
	Wed, 30 Jul 2025 02:37:33 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugwh7-00000000YmH-22Nv
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 02:37:31 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 079EC20F9E;
	Wed, 30 Jul 2025 04:37:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jRGBdc8Sp0M; Wed, 30 Jul 2025 04:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753843045; bh=r6EJUgnKNkBU/gY2vKM1Kph1PWJOeN4y03H/SRXg+vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AgwMK+2xLh/uRypIC/UB7RAXvQhhzpfFuUw3sFrlic/janHA/4c574mpUHzuP2h+r
	 GNL2CupOEq6B5gdiZV45oHIDI15qtrPbsHYqpwM+J7ZmXSRWqNxJGO71PZTccZ32gv
	 f9t8yDb2AjhhPWT1+2Edh/9S4pP4zsJ9FmYGq/WgRPGHSR/Cr4mlHMxgoOGaM65pSL
	 4SJ7xThP+4fULiS0c/geMdiST2UWrUW5oJXk/kIwZL3f7tZtQApxwNbspRarsfTCT3
	 Sbgzjq328tWP01hPwQEwMF4PU96Rc4IqwCcCbOt9qEoBmyfu/21MlpHaCTnDYEwpF4
	 EfrzKAF4mIMiw==
Date: Wed, 30 Jul 2025 02:37:09 +0000
From: Yao Zi <ziyao@disroot.org>
To: Conor Dooley <conor@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/3] dt-bindings: net: thead,th1520-gmac: Describe
 APB interface clock
Message-ID: <aImFVW1Pl_QHijWx@pie>
References: <20250729093734.40132-1-ziyao@disroot.org>
 <20250729093734.40132-2-ziyao@disroot.org>
 <20250729-canal-stimuli-492b4550108c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729-canal-stimuli-492b4550108c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_193730_035569_CDAA0546 
X-CRM114-Status: GOOD (  18.56  )
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

On Tue, Jul 29, 2025 at 06:43:42PM +0100, Conor Dooley wrote:
> On Tue, Jul 29, 2025 at 09:37:32AM +0000, Yao Zi wrote:
> > Besides ones for GMAC core and peripheral registers, the TH1520 GMAC
> > requires one more clock for configuring APB glue registers. Describe
> > it in the binding.
> > 
> > Though the clock is essential for operation, it's not marked as required
> > for now to avoid introducing new dt-binding warnings to existing dts.
> 
> Nah, introduce the warnings. If the clock is required for operation, it
> should be marked as such. You've made it optional in the driver, which
> is the important part (backwards compatible) and you've got the dts
> patch in the series.

Thanks for the confirmation, will remove minItems in v2.

Regards,
Yao Zi

> > 
> > Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../devicetree/bindings/net/thead,th1520-gmac.yaml        | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> > index 6d9de3303762..fea9fbc1d006 100644
> > --- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> > @@ -59,14 +59,18 @@ properties:
> >        - const: apb
> >  
> >    clocks:
> > +    minItems: 2
> >      items:
> >        - description: GMAC main clock
> >        - description: Peripheral registers interface clock
> > +      - description: APB glue registers interface clock
> >  
> >    clock-names:
> > +    minItems: 2
> >      items:
> >        - const: stmmaceth
> >        - const: pclk
> > +      - const: apb
> >  
> >    interrupts:
> >      items:
> > @@ -88,8 +92,8 @@ examples:
> >          compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> >          reg = <0xe7070000 0x2000>, <0xec003000 0x1000>;
> >          reg-names = "dwmac", "apb";
> > -        clocks = <&clk 1>, <&clk 2>;
> > -        clock-names = "stmmaceth", "pclk";
> > +        clocks = <&clk 1>, <&clk 2>, <&clk 3>;
> > +        clock-names = "stmmaceth", "pclk", "apb";
> >          interrupts = <66>;
> >          interrupt-names = "macirq";
> >          phy-mode = "rgmii-id";
> > -- 
> > 2.50.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
