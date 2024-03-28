Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15CBCD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 20:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNBIC8HJ6/7U4qWynXljX/HGhQ5C/Wn8nVYxaQnYSC0=; b=A3pZ5aWr6g8FuU
	oqiDrb7NJ/QLfl+kNw2+WPZvN/mNHd+oAwXTjJs2lY6P9qEUbeS52atZxDKPVfFUJ9zXY4eYdHbvn
	ZlBwVzNSHy35QIT9XqKfGw+enrau5jChJb2wFSA/E5HgsUyQhZPMd/o6aWPqiSOEnapDDrZbuZ2PV
	ScUi3zTjiPu3sb2iWbnUhD1t0g3SdCtdeeO1xdDkj29yRE3hQvIF4HgRBZ0EAFzPweXvBi+ZbgctL
	06s6T1gZQd/bnLbqpBm6FaaZOYt4INAHNGzn5AVJytFISqAXbJEM1D15WxkPVRsUYhgAxat4scf88
	kb5MIaisMv2lY3NhlUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpwZh-0000000Fdb5-1qi5;
	Thu, 28 Mar 2024 20:42:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpwZc-0000000FdXp-1H03;
	Thu, 28 Mar 2024 20:42:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5068ACE2CE2;
	Thu, 28 Mar 2024 20:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529E7C433F1;
	Thu, 28 Mar 2024 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711658524;
	bh=rM8n3YOTnCn+b3NkFrXziIWASxMBnWFMCbr5eWXy4fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCKfMmIyqhMxnN9hRe0xLCa/LyjUmNY2MvusUKazaWaaOAtQttZ2yJQppDwWNeWSY
	 8/9Ls0Cj8Vifsj0NXSNo3xnwcOutw9Hagr8f/fc5U7nulSiBYAIe/NQBWgbyaA95oW
	 HKVIQYpFXkB2emfilRKSPMLl5o+83DX8oI+Mtc1L1gglh25Q54dQDWr1tn6wB9YOoc
	 6EKhNwVL49ZanIg67nYxH/hPGKlRctXBAr81YlKk03TsOQyzSNJvRFTRCBkP5zsxox
	 w0WwuqDPSrXGdp1SYh1Oe4wYrRl7IsrX/R/x8N0IjC5ewjbCh7WHMAIJ8d5W8PB9uY
	 bhjFQ8EACrNwA==
Date: Thu, 28 Mar 2024 15:42:02 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tan Chun Hau <chunhau.tan@starfivetech.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jee Heng Sia <jeeheng.sia@starfivetech.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/1] dt-bindings: net: starfive,jh7110-dwmac: Add
 StarFive JH8100 support
Message-ID: <20240328204202.GA308290-robh@kernel.org>
References: <20240327015750.226349-1-chunhau.tan@starfivetech.com>
 <20240327015750.226349-2-chunhau.tan@starfivetech.com>
 <31ac366d-bfa6-4c99-a04d-ab9fb029da7e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31ac366d-bfa6-4c99-a04d-ab9fb029da7e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_134208_744553_0F2E2A77 
X-CRM114-Status: GOOD (  20.24  )
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

On Wed, Mar 27, 2024 at 08:54:30AM +0100, Krzysztof Kozlowski wrote:
> On 27/03/2024 02:57, Tan Chun Hau wrote:
> > Add StarFive JH8100 dwmac support.
> > The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> > and has only one reset signal.
> > 
> > Please refer to below:
> > 
> >   JH8100: reset-names = "stmmaceth";
> >   JH7110: reset-names = "stmmaceth", "ahb";
> >   JH7100: reset-names = "ahb";
> > 
> > Example usage of JH8100 in the device tree:
> > 
> > gmac0: ethernet@16030000 {
> >         compatible = "starfive,jh8100-dwmac",
> >                      "starfive,jh7110-dwmac",
> >                      "snps,dwmac-5.20";
> >         ...
> > };
> > 
> > Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
> >  .../bindings/net/starfive,jh7110-dwmac.yaml   | 29 +++++++++++++++----
> >  2 files changed, 25 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 6b0341a8e0ea..a6d596b7dcf4 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -97,6 +97,7 @@ properties:
> >          - snps,dwxgmac-2.10
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> > +        - starfive,jh8100-dwmac
> 
> I think that's not needed. You have there already your fallback.
> 
> >  
> >    reg:
> >      minItems: 1
> > diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > index 0d1962980f57..5805a58c55d1 100644
> > --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > @@ -18,6 +18,7 @@ select:
> >          enum:
> >            - starfive,jh7100-dwmac
> >            - starfive,jh7110-dwmac
> > +          - starfive,jh8100-dwmac
> 
> Same here, even more obvious.

Agreed.

> 
> >    required:
> >      - compatible
> >  
> > @@ -30,6 +31,10 @@ properties:
> >        - items:
> >            - const: starfive,jh7110-dwmac
> >            - const: snps,dwmac-5.20
> > +      - items:
> > +          - const: starfive,jh8100-dwmac
> > +          - const: starfive,jh7110-dwmac
> > +          - const: snps,dwmac-5.20
> >  
> >    reg:
> >      maxItems: 1
> > @@ -116,11 +121,25 @@ allOf:
> >            minItems: 3
> >            maxItems: 3
> >  
> > -        resets:
> > -          minItems: 2
> > -
> > -        reset-names:
> > -          minItems: 2
> > +      if:
> 
> I would personally avoid nesting if within if. It gets unreadable.
> Although Rob did not comment on this one, so I guess it is fine.

I normally agree, but here I suggested it as it looked to be the 
simplest option.

With the 2 other comments addressed,

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
