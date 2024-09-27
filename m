Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD06CEBF8A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8Q1SIVBr65eL/gePuP2QA1/4iNc3wYtjShLyTCDcxA=; b=Eu07aPhFs2WkVl
	uDqgPJJGhM8lYneMXiLKVIxi0Y0h+N0rBnNWlf4VjhnrM0pXEMlvVwyRf3zNT4pA+cn8Y4nmn5nKI
	hPkQmInoXWfAXQ/eNGDAB8Y/6ETCoJiSxveqSlYrweZGhpPgFCodha9Mn4N6LWoDDMS7yAwSc4Suw
	cuAlKUgAehgpArMJ5uLah5zyunoMk+bMP43LVkVBiktGEmrdFqdeF96EtNTAVm5Xp+unnC3f8PscT
	/2Ti0+GEerFx4BdjazKyMdEIpaws+HGZceZKqbFWb3Xt65YmWyOsvbQ8+j6uU3I+1jdjXygJ6fXii
	WsN+IMI6BoU9XZa8A7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su7OT-0000000Afpl-3oLo;
	Fri, 27 Sep 2024 09:36:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su7NE-0000000Afbh-2XnQ;
	Fri, 27 Sep 2024 09:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35152A4546E;
	Fri, 27 Sep 2024 09:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48821C4CECD;
	Fri, 27 Sep 2024 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727429691;
	bh=GxG+tu+21lu0yCzU+ifnIiJI9JUvz1/XTvqf4gwANmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lw1IV33snqufyRIefxyv34fx/122R7wwnm+AFm4YXxXC8ZzrLikLv3M5h5GOl4Nru
	 22dmIY+6IjYvQk1aWxzWRqSvlr68B0W10pufCpST8OJzbksS1m9bsH/BtxTsFg3Xpo
	 lJpExPQlaTE5gnCqW9Mi+ugyS9DPY+efipl/qCnBzpeS4dNYxdfFBLTjAVWBmkb3aA
	 8G6I9gsPQP1/yqLRrdEwqaHFrrQ+d4uCeT0Qve8GCqsXgT11TyV3D4iezPLTTnN1oV
	 qRUIkuxf7H3fghviSq7Aih0hdU+QXNadtj5nDEaKEqCTBhNwRcmHRy3CbkDuIU0si4
	 lawvIy42bdk0Q==
Date: Fri, 27 Sep 2024 11:34:48 +0200
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
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: Add T-HEAD dwmac support
Message-ID: <4pxpku3btckw7chyxlqw56entdb2s3gqeas4w3owbu5egmq3nf@5v76h4cczv4z>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-1-f34f28ad1dc9@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926-th1520-dwmac-v2-1-f34f28ad1dc9@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_023452_800326_9E5DC49A 
X-CRM114-Status: GOOD (  21.30  )
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

On Thu, Sep 26, 2024 at 11:15:50AM -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add documentation to describe T-HEAD dwmac.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: change apb registers from syscon to second reg of gmac node]
> [drew: rename compatible, add thead rx/tx internal delay properties]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml | 109 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  3 files changed, 111 insertions(+)
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
> index 000000000000..1070e891c025
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> @@ -0,0 +1,109 @@
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
> +
> +  thead,rx-internal-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      RGMII receive clock delay. The value is used for the delay_ctrl
> +      field in GMAC_RXCLK_DELAY_CTRL. Units are not specified.

What do you mean by "unspecified units"? They are always specified,
hardware does not work randomly, e.g. once uses clock cycles, but next
time you run it will use picoseconds.

You also miss default (property is not required) and some sort of constraints.

> +
> +  thead,tx-internal-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      RGMII transmit clock delay. The value is used for the delay_ctrl
> +      field in GMAC_TXCLK_DELAY_CTRL. Units are not specified.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
