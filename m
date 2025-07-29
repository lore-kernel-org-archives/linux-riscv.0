Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675B3C87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOX5HMZyNWssirW6VImOJ4IHSngN2GS4MaiNd2YlN2I=; b=qQYH/zo+i30xaV
	kTv/dpa52PzGWOifMtZ2WJ3R9h8jO4OomRnJEuNum+TmfBZQH1vLuuGmdzNRbq2qpD2+hRooe+rjf
	QrY1/cLUbZCABfFugVPxWj3/ObLhbbzRPLLIg/GCvvIWne0DPT7RrWqO7pngg+UPV6Y4oOOGpitfm
	iSCnpnpGLPfIvhSCPUMDo2ltSDxA4vFo85RrLY6U8CDX3r59pEtcmAuVLrdFNsKxvQ9NcEPTbp0vN
	cvQ/qGAzGY5JDmfqO5X+OGZpUoQ5RjO2uQ2GW0dnkizelqv6UsK9aYNbYWYVjmqwduaVsSucEhrg2
	2zL+n0tnueC1XG2jvIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoZF-0000000HP6z-0aFB;
	Tue, 29 Jul 2025 17:56:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoWl-0000000HOto-3tK6
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 17:54:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F10C7A549F5;
	Tue, 29 Jul 2025 17:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585CDC4CEF4;
	Tue, 29 Jul 2025 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753811654;
	bh=J6y7muyFDzOpaWbidr++rX+I7mcOedEEEF1hRm5TL9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4iKMO1R9RObKxmf2UyIzWWqHARsbZ+po8iimkSzRynrxyAPla44caaU0nbDr4YvS
	 MlBR3YcpjA14F/lXXIZnm09ursqrw1Il9rsl32RoTvFMtPwGNwMtSKg8oPakc1b3Cr
	 k4ZXntCF81Q50cKGaVued3T+Zrg4B5PuXkt0nb+QHTErPx2qadZCcbsce1YhR2ElSg
	 ubzceejBv/ihLj49353LlJMO9lIEtmHQvuPbDkPKODBRVHmC5fDwbmO0cxk63K/4g9
	 ZAf0z0wL6S7tnCrnwMhi61F5/rpdUe2u3vxxRmPDAOETpoIowlKEkAFOA7TMpaT0QF
	 QYBJmSUzyjBcw==
Date: Tue, 29 Jul 2025 10:54:12 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <aIkKxM3zfVjaa1we@x1>
References: <20250729093734.40132-1-ziyao@disroot.org>
 <20250729093734.40132-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729093734.40132-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_105416_095538_4A5180F8 
X-CRM114-Status: GOOD (  19.85  )
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

On Tue, Jul 29, 2025 at 09:37:32AM +0000, Yao Zi wrote:
> Besides ones for GMAC core and peripheral registers, the TH1520 GMAC
> requires one more clock for configuring APB glue registers. Describe
> it in the binding.
> 
> Though the clock is essential for operation, it's not marked as required
> for now to avoid introducing new dt-binding warnings to existing dts.
> 
> Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml        | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> index 6d9de3303762..fea9fbc1d006 100644
> --- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> @@ -59,14 +59,18 @@ properties:
>        - const: apb
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: GMAC main clock
>        - description: Peripheral registers interface clock
> +      - description: APB glue registers interface clock
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: stmmaceth
>        - const: pclk
> +      - const: apb
>  
>    interrupts:
>      items:
> @@ -88,8 +92,8 @@ examples:
>          compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
>          reg = <0xe7070000 0x2000>, <0xec003000 0x1000>;
>          reg-names = "dwmac", "apb";
> -        clocks = <&clk 1>, <&clk 2>;
> -        clock-names = "stmmaceth", "pclk";
> +        clocks = <&clk 1>, <&clk 2>, <&clk 3>;
> +        clock-names = "stmmaceth", "pclk", "apb";
>          interrupts = <66>;
>          interrupt-names = "macirq";
>          phy-mode = "rgmii-id";
> -- 
> 2.50.1
> 

Thanks for figuring out that this clock is needed for the APB glue
registers. The schema passes W=1 dt_binding_check with no warnings.

Regarding minItems, I think it would be okay to change to 3 as the APB
clock should have been there from the start but I missed it. We can fix
the in-tree dts at the same time so that seems okay to me. But let's see
what the dt bindings maintainers think.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
