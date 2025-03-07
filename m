Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8547C282EC
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 00:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xE3a0h0fzPzzx5v3s7eTdANAvQHJWrs8LMygC7Nv8hs=; b=AKT0SXpK76ZWY6
	/zfxBqaJm9eNcA+cijxi6glmubd026FccwRijuOAHKj0DKANCC25ehUlLA0cNlwAshla1tX6HY9Bm
	jdCxEgp6PkAbQGpMeY/13iy+2dIof1Jua1Vy7V295PpFMSU++sLmpuptK0SBpXMkWtOTrNj/FDwSC
	TNmDqwf/ubSxwmEbQbDUiuhUHFkUvU0mxB4VjhgdsezG3ra+mPnTuUG9H5p4ghbcbVC8gp/weratz
	zixtIuiOrZ2Vjtvs9CGyT7lwQZYU9g7vs3Ak0LHYwurM5bHCZpXUNNrvX/Q3d7iWfDTyss2Znr5io
	94tWnFF5l4mtKj1hDA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLvt-0000000CgmV-158X;
	Fri, 07 Mar 2025 00:51:21 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLbB-0000000CdmE-1Z1j
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 00:29:58 +0000
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DF268342FF0;
	Fri, 07 Mar 2025 00:29:53 +0000 (UTC)
Date: Fri, 7 Mar 2025 00:29:43 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: clock: spacemit: Add spacemit,k1-pll
Message-ID: <20250307002943-GYA64516@gentoo>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-4-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306175750.22480-4-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162957_444545_1A201890 
X-CRM114-Status: GOOD (  16.81  )
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

Hi Haylen:

On 17:57 Thu 06 Mar     , Haylen Chu wrote:
> Add definition for the PLL found on Spacemit K1 SoC, which takes the
> external 24MHz oscillator as input and generates clocks in various
> frequencies for the system.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  .../bindings/clock/spacemit,k1-pll.yaml       | 50 +++++++++++++++++++
>  include/dt-bindings/clock/spacemit,k1-ccu.h   | 37 ++++++++++++++
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> new file mode 100644
> index 000000000000..23d7aa1bc573
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spacemit K1 PLL
> +
> +maintainers:
> +  - Haylen Chu <heylenay@4d2.org>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-pll
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: External 24MHz oscillator
> +
> +  spacemit,mpmu:
how about naming it as "spacemit,mpmu-syscon" explicitly?
to indicate this is a syscon phandle, it's more readable

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the "Main PMU (MPMU)" syscon. It is used to check PLL
> +      lock status.
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/spacemit,k1-ccu.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - spacemit,mpmu
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@d4090000 {
> +        compatible = "spacemit,k1-pll";
> +        reg = <0xd4090000 0x1000>;
> +        clocks = <&vctcxo_24m>;
> +        spacemit,mpmu = <&sysctl_mpmu>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/spacemit,k1-ccu.h b/include/dt-bindings/clock/spacemit,k1-ccu.h
> index 1f8b01db44ca..4a0c7163257e 100644
> --- a/include/dt-bindings/clock/spacemit,k1-ccu.h
> +++ b/include/dt-bindings/clock/spacemit,k1-ccu.h
> @@ -6,6 +6,43 @@
>  #ifndef _DT_BINDINGS_SPACEMIT_CCU_H_
>  #define _DT_BINDINGS_SPACEMIT_CCU_H_
>  
> +/*	APBS (PLL) clocks	*/
> +#define CLK_PLL1		0
> +#define CLK_PLL2		1
> +#define CLK_PLL3		2
> +#define CLK_PLL1_D2		3
> +#define CLK_PLL1_D3		4
> +#define CLK_PLL1_D4		5
> +#define CLK_PLL1_D5		6
> +#define CLK_PLL1_D6		7
> +#define CLK_PLL1_D7		8
> +#define CLK_PLL1_D8		9
> +#define CLK_PLL1_D11		10
> +#define CLK_PLL1_D13		11
> +#define CLK_PLL1_D23		12
> +#define CLK_PLL1_D64		13
> +#define CLK_PLL1_D10_AUD	14
> +#define CLK_PLL1_D100_AUD	15
> +#define CLK_PLL2_D1		16
> +#define CLK_PLL2_D2		17
> +#define CLK_PLL2_D3		18
> +#define CLK_PLL2_D4		19
> +#define CLK_PLL2_D5		20
> +#define CLK_PLL2_D6		21
> +#define CLK_PLL2_D7		22
> +#define CLK_PLL2_D8		23
> +#define CLK_PLL3_D1		24
> +#define CLK_PLL3_D2		25
> +#define CLK_PLL3_D3		26
> +#define CLK_PLL3_D4		27
> +#define CLK_PLL3_D5		28
> +#define CLK_PLL3_D6		29
> +#define CLK_PLL3_D7		30
> +#define CLK_PLL3_D8		31
> +#define CLK_PLL3_80		32
> +#define CLK_PLL3_40		33
> +#define CLK_PLL3_20		34
> +
>  /*	MPMU clocks	*/
>  #define CLK_PLL1_307P2		0
>  #define CLK_PLL1_76P8		1
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
