Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F729C87FCA
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 18:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HX+/nRMIKktvixDMmYVslpQ1P2WRUkhaKhroQj+Dh54=; b=TSfR8g/oMQ2FQp
	cdFtoCdZfenaUW5a729ccch5zk7cDW3cB5zJRZqdkG8+vNEuJZdmjLZu9ns3o7TPq1r/PCxVomnAa
	ZbtY9EMPIrCk7Cg7NN6MjG7oqPCum/+9VMaW+XrX9rZUqsja/iuNYTWX0uw8bZKRav3UFurRgAe2Y
	jgqVmSe7x6SC9JM9kfQ8o/s0UczdJIZsoIcHv0gFG8LmOG5Iex7UH9xIOT5RF2C/w6XRR3L8FUGUI
	lsEQkg6os+2Qrvf2Na/e9em4R5HmLj5/H6uYOQ5lxaktG5XHKz6C5TeuqQR0kO1DmI7PfCR9ZemGx
	l1m6sq0QXEn2LOFJ4dNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uideK-00000008xnB-2KsD;
	Sun, 03 Aug 2025 18:41:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uideH-00000008xml-3ulp
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 18:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00C3044DC3;
	Sun,  3 Aug 2025 18:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE3DC4CEEB;
	Sun,  3 Aug 2025 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754246491;
	bh=pJSchiabA1YRkiP0bPpnxJ359/pK8eXxW74NJWXuqas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCIvEGXxXcaJO7lhp3U+LpgyENujnhMCxTpx6ocsZeW1drmbEMm4p4oYQIZTp8V/Q
	 85IpAkiJem8EkFX+fPMj66W0/8QFgLr8O7T3AYpal4jC2NgoTZZWQ+cG1zYxZqKFmN
	 KpJDKxFJdRtko9VgrbcjDVh8KaLrg3UDvTtyY9I8rxUPMQ6RXNZrTP+4i3OuOKL7Kh
	 v3qd7fjIMPxeN2oVQLbM89wIkipSg+PCzkM25wGrHxfhAlbpNtDeo7pjVIpTQ4t7Aq
	 0O7cxtRStpGSu26pbtUAgbuDEt4GPTvoqUnrI6+3ZJ/h5wCiexuxjNd/IyJ1gASew+
	 SkC8ae8zIAJMA==
Date: Sun, 3 Aug 2025 11:41:27 -0700
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
Subject: Re: [PATCH net v2 1/3] dt-bindings: net: thead,th1520-gmac: Describe
 APB interface clock
Message-ID: <aI-tV0qk6fGP7yJ-@gen8>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250801091240.46114-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_114133_997409_B21B7DD4 
X-CRM114-Status: GOOD (  14.80  )
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

On Fri, Aug 01, 2025 at 09:12:38AM +0000, Yao Zi wrote:
> Besides ones for GMAC core and peripheral registers, the TH1520 GMAC
> requires one more clock for configuring APB glue registers. Describe
> it in the binding.
> 
> Fixes: f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> ---
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml          | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> index 6d9de3303762..b3492a9aa4ef 100644
> --- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> @@ -62,11 +62,13 @@ properties:
>      items:
>        - description: GMAC main clock
>        - description: Peripheral registers interface clock
> +      - description: APB glue registers interface clock
>  
>    clock-names:
>      items:
>        - const: stmmaceth
>        - const: pclk
> +      - const: apb
>  
>    interrupts:
>      items:
> @@ -88,8 +90,8 @@ examples:
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

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thank you for making all 3 clocks required.

Drew



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
