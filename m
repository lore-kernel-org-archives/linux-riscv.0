Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13764C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlWJfclqhbrm4Wno4sTuVS5qYLALYiRD3KoSA9tIFes=; b=Pbv3xTLXG7REb8
	7ZbzxMZGHbEUTR1eHQbTD6sCxIxIHZs5K5KVJpvSCyMJ/inc1103/pwaX087aKES1gW+Va82tlUor
	R7uBr8NKh+wMN4FzSRdQ2gWDuh3hhUayA/6sF7VZZcVbjbxuHMeXmxAYc03RbJslOvkiH7iFpsM3e
	bhwM9UfXvBlSfoct6b8df8wImpoRrlQFNlNrq9dtrp5YI2BMCPJmQxRqAcVDSQ0tDOZNXDz0dPvro
	rbAb+h4SbmgvcYmrr1cuM9o8dXnA1QOYhn2MN3hTuEZKpBsckJ939A58/rPMbTzkrNhH+yITWyEGO
	zC3ZwtEwabzROp7b6IBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDjxW-007Re3-L7; Fri, 06 Jan 2023 10:28:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDjxL-007RWg-IX; Fri, 06 Jan 2023 10:28:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFDEB11FB;
	Fri,  6 Jan 2023 02:28:50 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DCF83F23F;
	Fri,  6 Jan 2023 02:28:07 -0800 (PST)
Date: Fri, 6 Jan 2023 10:28:03 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/4] dt-bindings: arm: sunxi: document MangoPi MQ-R
 board name
Message-ID: <20230106102803.3e905d1c@donnerap.cambridge.arm.com>
In-Reply-To: <4d6aec55-c53e-0aba-1168-8a9a80a3b598@linaro.org>
References: <20230106010155.26868-1-andre.przywara@arm.com>
	<20230106010155.26868-4-andre.przywara@arm.com>
	<4d6aec55-c53e-0aba-1168-8a9a80a3b598@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_022811_694848_1F699486 
X-CRM114-Status: GOOD (  16.07  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?= <szemzo.andras@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 6 Jan 2023 10:21:04 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 06/01/2023 02:01, Andre Przywara wrote:
> > The MangoPi MQ-R board is a close relative to its Allwinner D1/D1s
> > siblings, but features two Arm Cortex-A7 cores instead of a RISC-V core.
> > 
> > Add the board/SoC compatible string pair to the list of known boards.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > index 3ad1cd50e3fe0..ce445c5ed81c8 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -843,6 +843,11 @@ properties:
> >            - const: wexler,tab7200
> >            - const: allwinner,sun7i-a20
> >  
> > +      - description: MangoPi MQ-R board
> > +        items:
> > +          - const: widora,mangopi-mq-r  
> 
> Not documented vendor prefix.

Yes, after sending I realised that I forgot to mention that this
series relies on Samuel's D1/D1s DT series[1], which adds the basic .dtsi
this builds on, but also adds this vendor string[2].
Functionality-wise this also relies on the R528/T113-s clock series[3].

Cheers,
Andre

[1]
https://lore.kernel.org/linux-arm-kernel/20221231233851.24923-1-samuel@sholland.org/
[2]
https://lore.kernel.org/linux-arm-kernel/20221231233851.24923-3-samuel@sholland.org/
[3]
https://lore.kernel.org/linux-arm-kernel/20221231231429.18357-1-samuel@sholland.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
