Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84246CEB2FE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4zT1lMtNDC7AwQd4NQrBgqZ+YOAW/e3UHEBdzLKsp4=; b=MmyjY6uRpw4692
	7WVKbHExnFimDDojZRCS+nCrMd2S1NLF7Kt8A0DuMkglwoZNmEXLlVw+PyFYHrM0+dK5CzSPgeSFT
	NrSDwj2VcbFjGtwbtmPTQ60scB0I7TdYBOva/EVuBUI+S7XLst52xhuB4uFf8MH0erFQZ2S2QiLSG
	ufQOcu4qQ7iqsV7kWBb1KI+Sjrl/HQ1zik5EK9ckdomN5rN2e9RA7UVqJAsDVS+V0kHpvX7rRmoba
	HDTeSq7M8CzRHe8S2K9CcJ3q67NRmSiEo3Mb9EToK346Ce1sqoAS92o3F6WzYmFssJosIWfix0Q7d
	7b/Ion6zIArnEdqLmPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWrV-00000001qCb-1kXy;
	Tue, 01 Oct 2024 06:59:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWqF-00000001pu4-2eic;
	Tue, 01 Oct 2024 06:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FB9A5C4B4F;
	Tue,  1 Oct 2024 06:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD7CC4CEC6;
	Tue,  1 Oct 2024 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727765918;
	bh=O5YTakodNDe1cIRujrnosQhMNdo3PJWvcNMncXtHV5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgv94+nBOTvDk85hEJE4nQhK9YttToSyPnz2hvThSEUArrnY/qEP72+oB6nmnIMQS
	 3vwqWcEvIVhDByq/Z/X45y33LSHPMiRya4nGpzvnS2vqw25iQjs9Q4ONLndw2U0mX0
	 1LLwlpcQvqrNTh07IR57+ksIj/4s52MesSzeYMNTgDtKEKeialcVja4ODnHKZelX/J
	 kzcxVN25K9KGngOBGsPnHBGaf/jXL5qVq1ORfku0CxXMouDPH08ROkKCadcKFDHzMz
	 YOGjVp98JyELCLJX4Tjy4kdv54kwUePbqNsYTAwgEJIYZ3co89lip2f7j2s7dKSXjx
	 De3TSuulx58/g==
Date: Tue, 1 Oct 2024 08:58:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: net: Add T-HEAD dwmac support
Message-ID: <wtknsih2yrbylqzanp6k753kklk4myf6iezjz6swnp4nsqr2hl@7mmm6lxhqemu>
References: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
 <20240930-th1520-dwmac-v3-1-ae3e03c225ab@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930-th1520-dwmac-v3-1-ae3e03c225ab@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_235839_788918_0A71D795 
X-CRM114-Status: GOOD (  19.35  )
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

On Mon, Sep 30, 2024 at 11:23:24PM -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add documentation to describe the DesginWare-based GMAC controllers in
> the T-HEAD TH1520 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: rename compatible, add apb registers as second reg of gmac node]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml | 97 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 99 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 4e2ba1bf788c..474ade185033 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -99,6 +99,7 @@ properties:
>          - snps,dwxgmac-2.10
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
> +        - thead,th1520-gmac
>  
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> new file mode 100644
> index 000000000000..fef1810b10c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD TH1520 GMAC Ethernet controller
> +
> +maintainers:
> +  - Drew Fustini <dfustini@tenstorrent.com>
> +
> +description: |
> +  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
> +  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
> +
> +  Features include
> +    - Compliant with IEEE802.3 Specification
> +    - IEEE 1588-2008 standard for precision networked clock synchronization
> +    - Supports 10/100/1000Mbps data transfer rate
> +    - Supports RGMII/MII interface
> +    - Preamble and start of frame data (SFD) insertion in Transmit path
> +    - Preamble and SFD deletion in the Receive path
> +    - Automatic CRC and pad generation options for receive frames
> +    - MDIO master interface for PHY device configuration and management
> +
> +  The GMAC Registers consists of two parts
> +    - APB registers are used to configure clock frequency/clock enable/clock
> +      direction/PHY interface type.
> +    - AHB registers are use to configure GMAC core (DesignWare Core part).
> +      GMAC core register consists of DMA registers and GMAC registers.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - thead,th1520-gmac
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - thead,th1520-gmac
> +      - const: snps,dwmac-3.70a
> +
> +  reg:
> +    items:
> +      - description: DesignWare GMAC IP core registers
> +      - description: GMAC APB registers
> +
> +  reg-names:
> +    items:
> +      - const: dwmac
> +      - const: apb

I don't get why none of snps,dwmac properties are restricted. How many
interrupts do you have here? How many clocks? resets?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts

Drop

> +  - interrupt-names

Drop

> +  - phy-mode
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
