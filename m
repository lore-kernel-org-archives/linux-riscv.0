Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235D5F36B97
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 23:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJV46UlgRXWyunmoFyy2Hc5qM59IRDUoNahpKt9xws8=; b=OQbKggxsOjGzq/
	b8Fj/IR/o0+slSAeTc4J1E35FJmZIc9xfnHwzSU18qIkVBFRchDJvucJBgeiIx/RW8tSpdfO7eXvM
	ZJ+cr/eOyIyGOJl+Z0VGMdV+ah6u5qU1APbaCJATGaI5OV5XE8gv6/i7SC9hdyNmi/vawYEh7z66x
	dcRkWNPjZltQnqcTqX01DaTNwE7GEV0pDS2IWx2NYmiWw5R90vbhpP0PdYe15jxp7lEM9gSSJUFnD
	dmdatg93wiXvfvqlhWtkYz4iUdzZg0mKbk8JMP+Z2CntP/ZbdLcGn4gfq72Pz9RCTELEOozcGfbW4
	uU1qPNZ5bl1I4AfBA7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAz2S-0000000BKpx-1yfp;
	Thu, 09 Apr 2026 23:43:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAz2Q-0000000BKow-2qHr
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 23:43:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF7D643A70;
	Thu,  9 Apr 2026 23:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58292C2BC87;
	Thu,  9 Apr 2026 23:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775778233;
	bh=gAUOUKeQWfXMQS+gwzMyPSCdGvq7t2FyRZ1piCNyVsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAmDpI6p5H0OzeaMLCTzHNoflFqzKwKYdloMNxBi+6kGcMaa4S6XHSQ9wg5Wd2jcP
	 hy+C8CQSJihzNs6WDtWiTnma3TI+IKBcM0eVxqMxPrDOo3PevseGl26/51rvAA4YIG
	 VG3oYhF9d4HAYX/lDdTcrD3jxGWifNabJHPFhl1M/iMjcjiukfx35yyorXaozrTqqP
	 Ox7EUsiNQ8S0sKwtrnMmgH39FKcQqDMQq4v2N+q45JKihxhiEwJVX5k7FpKxDFyUnD
	 IsMTRDGdVcTP0ERDCfC0o8yblXIhHFBYzaJRswWrryilqniMO23nc0rMuc1s83Bjog
	 09JY03oEqpviA==
Date: Fri, 10 Apr 2026 07:43:51 +0800
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K3
 PWM support
Message-ID: <20260409234351-GKA1160389@kernel.org>
References: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
 <20260409-03-k3-pwm-drv-v1-1-1307a06fba38@kernel.org>
 <20260409-laboring-announcer-4a0f9ca152a1@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409-laboring-announcer-4a0f9ca152a1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_164354_758148_48312C2B 
X-CRM114-Status: GOOD (  17.11  )
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

Hi Conor, 

On 16:41 Thu 09 Apr     , Conor Dooley wrote:
> On Thu, Apr 09, 2026 at 12:45:11AM +0000, Yixun Lan wrote:
> > The PWM controller in SpacemiT K3 SoC reuse the same IP as previous K1
> > generation, while the difference is that one additional bus clock is
> > added.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml   | 53 ++++++++++++++++++++--
> >  1 file changed, 50 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > index 8df327e52810..3427c8ef3945 100644
> > --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > @@ -15,7 +15,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: spacemit,k1-pwm
> > +            enum:
> > +              - spacemit,k1-pwm
> > +              - spacemit,k3-pwm
> >      then:
> >        properties:
> >          "#pwm-cells":
> > @@ -26,6 +28,38 @@ allOf:
> >            const: 1
> >            description: |
> >              Used for specifying the period length in nanoseconds.
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - spacemit,k3-pwm
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          items:
> > +            - const: func
> > +            - const: bus
> 
> This condition here doesn't appear to do anything? It just repeats
> what's already done unconditonally below?
> 
You right, I should merge clock-names with below..

> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - spacemit,k3-pwm
> > +    then:
> > +      required:
> > +        - clock-names
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +        clock-names:
> > +          minItems: 2
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 1
> > +        clock-names:
> > +          maxItems: 1
> >  
> >  properties:
> >    compatible:
> > @@ -36,7 +70,9 @@ properties:
> >            - marvell,pxa168-pwm
> >            - marvell,pxa910-pwm
> >        - items:
> > -          - const: spacemit,k1-pwm
> > +          - enum:
> > +              - spacemit,k1-pwm
> > +              - spacemit,k3-pwm
> >            - const: marvell,pxa910-pwm
> >  
> >    reg:
> > @@ -47,7 +83,18 @@ properties:
> >      description: Number of cells in a pwm specifier.
> >  
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: The function clock
> > +      - description: An optional bus clock
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    oneOf:
> > +      - items:
> > +          - const: func
> > +          - const: bus
> >  
> >    resets:
> >      maxItems: 1
> > 
> > -- 
> > 2.53.0
> > 



-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
