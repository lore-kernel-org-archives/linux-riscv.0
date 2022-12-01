Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0D7C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6HdSSTOdISKzGejW4BUW7k2BvKt/a2HuMOb6N/y07U=; b=4gNFTT2uG9IMj+
	aYGEmgbgvGe4lRAyJJPv/X3E2J3JxyjiDAhrkvLmqJST/WOLmFiuXmf7wFHekhcxrKp63GTI3bUAp
	8KsSt0mkXpXA4P7LALq4EYq7QfU6eU5ufCo/GxPFP436YzbsX8yTGgynHEapHfpYr7TT1ew41ZaiK
	QmjxYy63rcd/HnbePH4efEo2WW+X6cu/63SoPXVxrCt+QWkuODwdbaKPkFWWs1aQ+5VdF1hm8DNqt
	LCCtpEzvbgCXHm1X672wMtZDWhNS4ikK1HYT6IJ4r54x7afIEnYLRHWoKpIXxMpfV0dgiJKqhzAZG
	BNh0DBsVBK58r0LIh4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nTX-0093jc-IO; Thu, 01 Dec 2022 17:35:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nTU-0093fL-Gg
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:35:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D205EB81FBF;
	Thu,  1 Dec 2022 17:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C493C433D6;
	Thu,  1 Dec 2022 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669916143;
	bh=N41KtYO2yiNFGuVtHGyIzgY5vlpL+NViLtcBnbs2M+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0Is98dJX/lEgrNKidWd4r3R/aj903gZv/tXDECOvOQ/Ds9yKmdrWjovT+No78TD+
	 1PW+hXNH/unwb/zQOZLQ69XKTJ5z7n15ji1SiaFT0jdBWPrEf5+0rCDyWKF++/Bym3
	 44jDukzrqEsw2FCSw0r1N26vzQh9cfMQ8tuEG0bAvkkNiJMR6siOcOSyRLNvB+yGFe
	 E58qh8XwHnv2eAZRslaPjzfYyHhTz+NSrJ5bDEOg1ZXutsfpWNbP4oU4dDJQgScVli
	 AkvVNHZ+aGf+mPFBmaY7MTc1FWMmBLyHKue5SEq5/s6dAIymImJ0ZZkHCCMa4BBcc0
	 nIOPBZXf/HENQ==
Date: Thu, 1 Dec 2022 17:35:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yanhong Wang <yanhong.wang@starfivetech.com>,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
Message-ID: <Y4jl6awCMFgZsQGC@spud>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-4-yanhong.wang@starfivetech.com>
 <36565cc1-3c48-0fa8-f98b-414a7ac8f5bf@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36565cc1-3c48-0fa8-f98b-414a7ac8f5bf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_093552_778382_224D033A 
X-CRM114-Status: GOOD (  13.32  )
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

On Thu, Dec 01, 2022 at 05:21:04PM +0100, Krzysztof Kozlowski wrote:
> On 01/12/2022 10:02, Yanhong Wang wrote:
> > Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.
> 
> Subject: drop second, redundant "bindings".
> 
> > 
> > Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > +properties:
> > +  compatible:
> > +    oneOf:
> 
> Drop oneOf. You do not have more cases here.
> 
> > +      - items:
> > +          - enum:
> > +               - starfive,dwmac
> 
> Wrong indentation.... kind of expected since you did not test the bindings.
> 
> > +          - const: snps,dwmac-5.20

Disclaimer: no familiarity with the version info with DW stuff

Is it a bit foolish to call this binding "starfive,dwmac"? Could there
not be another StarFive SoC in the future that uses another DW mac IP
version & this would be better off as "starfive,jh7110-dwmac" or similar?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
