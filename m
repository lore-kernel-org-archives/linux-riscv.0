Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D1AC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UaxEE2Fb1KUpSTwYjmaUrifRS+G0GKAILE6fXJykDY=; b=AixXErN7HPNuy8
	oqR4NiFGS69FMuItFxwV2lPULosU2JvW88QTFQtOruucFPqc+JO/S7SShUobuQUgQKblU9VQOBBqC
	gnroACSdL6HiChhr/vLsDQ68trNC189EvOy6gx1rZfOPFMJcScU1ME9/Au4DcBYPpQh2vxgDbDRpt
	3g6V1oK44e2xTb9XtzJ0Yfn9LMpUujh3I+6Zf9dvE1935tKtyoxMdT7UorjopQA4nu7ZU6PUlHMof
	m9HBehmD+ckQE/xL9GPTT6ZmOeoFVkMxtIP5AyZjtgrDOfuVlDa3osaHSR6ova5bAYN9X1BhA53Ji
	rZLlANImJmOszXvT/sWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzj1-003jxw-J0; Fri, 18 Nov 2022 11:40:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzix-003jvv-NY
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 11:40:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1802C62480;
	Fri, 18 Nov 2022 11:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE23EC433C1;
	Fri, 18 Nov 2022 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668771598;
	bh=UyIeX4juBfKya0K1/HX+JueHL5NQPp5TQEvklryvzNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJ4tDZoV5W9JF8PAOclsTT5ToNGkLexs/PwJkqmZreR0EdACw7YVGMVOyCnnb4VVz
	 TcKQEvM3E7lLx8t3TMP5LqFERmYh1ATjVPsYsYUCsiTq6NEL/UrlPGPsvaRlEmdfY8
	 a6yPjVm8ivWZWZ+4crk39YrZTUZk8i+UbH78Q1B04Ua6HVKJLwjD5X9Sia95tafMnY
	 LC+PC27gbYrIZhUbPWKJTTPxOXzoIsdMsV/527ys1K2yODCwhZLumIRn36bsg/C8AS
	 9BYtKLaxyGyhc0oms5RPDgutUJP8SsdICdZuUDrRYBUeTYV/wTjLnqz9phuzmE5z/e
	 5sz9kMlYWeFMA==
Date: Fri, 18 Nov 2022 11:39:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
Message-ID: <Y3dvCPP1g0LzzHFO@spud>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-5-hal.feng@starfivetech.com>
 <Y3duiJguYE6VrVLP@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3duiJguYE6VrVLP@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033959_879603_8FF5C877 
X-CRM114-Status: GOOD (  21.71  )
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

On Fri, Nov 18, 2022 at 11:37:50AM +0000, Conor Dooley wrote:
> On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > This cache controller is also used on the StarFive JH7110 SoC.
> 
> "... and configured identically to that of the FU740"?
> Anyways,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Actually, after looking at the next patch - why can you not fall back to
the fu740 one since you appear to have the same configuration as it?

> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../devicetree/bindings/riscv/sifive,ccache0.yaml          | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > index bf3f07421f7e..262d1d49ce25 100644
> > --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > @@ -25,6 +25,7 @@ select:
> >            - sifive,ccache0
> >            - sifive,fu540-c000-ccache
> >            - sifive,fu740-c000-ccache
> > +          - starfive,jh7110-ccache
> >  
> >    required:
> >      - compatible
> > @@ -37,6 +38,7 @@ properties:
> >                - sifive,ccache0
> >                - sifive,fu540-c000-ccache
> >                - sifive,fu740-c000-ccache
> > +              - starfive,jh7110-ccache
> >            - const: cache
> >        - items:
> >            - const: microchip,mpfs-ccache
> > @@ -86,6 +88,7 @@ allOf:
> >              enum:
> >                - sifive,fu740-c000-ccache
> >                - microchip,mpfs-ccache
> > +              - starfive,jh7110-ccache
> >  
> >      then:
> >        properties:
> > @@ -105,7 +108,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: sifive,fu740-c000-ccache
> > +            enum:
> > +              - sifive,fu740-c000-ccache
> > +              - starfive,jh7110-ccache
> >  
> >      then:
> >        properties:
> > -- 
> > 2.38.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
