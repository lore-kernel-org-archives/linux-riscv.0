Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7317DC2A062
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYr+F7TTSBx3foPTot5KBp3SqG2Tu0o0ryzsIT/L6Lg=; b=mxH/Uhw/dH83Vu
	Y9CsHbUM0rRvvg/uiXzyaajmpacKrdfUTMIOJSdlES8oyEE5m/8u+tCta3JBaw5L5ft0Qqa7eL3yZ
	BaHb6ObOGtHGw65H0kyyHpItEoHg91RVyD++QkDgBFK7fPywMCFnoA0BzgSdOFQkqMVX+yJd1Sg3T
	5vPFyZw143Ja/fSHVGptDnl7hTjJlkb7SEhCaRXqrrp2gZbGWyGtBdLfqyK4N/InxSPD942w931M9
	Q1jyLBpSAvEiZtrvwYaKRcX/8Jhoodn2z4FTS2r92BIDNa1sKW6zRPOz+fjqieNy7RXsK3zpIod0P
	JFO82bev5sdX5oA4LfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfJx-0000000AvkG-2rAS;
	Mon, 05 Jan 2026 07:48:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfJu-0000000AvjO-2H0Z
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 07:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB65143F34;
	Mon,  5 Jan 2026 07:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F95C116D0;
	Mon,  5 Jan 2026 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767599285;
	bh=jFItEYqWycbML0uRZa5QIsNaPt2k0e3e4B23aor7VOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU6sJ1fe+5obkbuOqQlJARDdHeheBUzVuURdhizbD8Wq16wnRvc5kr8MhL7rjGyGQ
	 4zo0ZBi+qr2Ur/02GZ/gQs7tWiDC/klyvi3Sfc9BbiGgzg6M5DOrYuUk+USeTwz0ZN
	 Hl9kW3z0bSItcM1o6gG0ueMpRTz4QdDnHDWrUVAerH+C9dqiKKoGBMJLKBz/+pqFjc
	 IjMF5yxiiBCTNNUNJ/rVOOucgb5cQlYJelNgnY2s+XBuuUT+2ZcwzQAS5CnR0vjmjY
	 1s6yT1c7I+LzjYOxvbIRSfLYqxWN/lZtz0iOQhVenpTjtzoFR1ZM3YHZP3jhNjcnbL
	 nVvHfsASB5T1A==
Date: Mon, 5 Jan 2026 08:48:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: spacemit: k3: add clock support
Message-ID: <20260105-copper-warthog-of-mathematics-883f7c@quoll>
References: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
 <20260103-k3-clk-v4-1-4cccba2360f0@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260103-k3-clk-v4-1-4cccba2360f0@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_234806_641629_072DC809 
X-CRM114-Status: GOOD (  15.65  )
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

On Sat, Jan 03, 2026 at 03:44:16PM +0800, Yixun Lan wrote:
> Add compatible strings for clock drivers to support Spacemit K3 SoC,
> also includes all the defined clock IDs.
> 
> The SpacemiT K3 SoC clock IP is scattered over several different blocks,
> which are APBC, APBS, APMU, DCIU, MPMU, all of them are capable of
> generating clock and reset signals. APMU and MPMU have additional Power
> Domain management functionality.
> 
> Following is a brief list that shows devices managed in each block:
> 
> APBC: UART, GPIO, PWM, SPI, TIMER, I2S, IR, DR, TSEN, IPC, CAN
> APBS: various PPL clocks control
> APMU: CCI, CPU, CSI, ISP, LCD, USB, QSPI, DMA, VPU, GPU, DSI, PCIe, EMAC..
> DCID: SRAM, DMA, TCM
> MPMU: various PLL1 derived clocks, UART, WATCHDOG, I2S
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/clock/spacemit,k1-pll.yaml |   8 +-
>  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  13 +-
>  include/dt-bindings/clock/spacemit,k3-clocks.h     | 390 +++++++++++++++++++++
>  3 files changed, 406 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> index 06bafd68c00a..66e109474824 100644
> --- a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> @@ -4,14 +4,16 @@
>  $id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SpacemiT K1 PLL
> +title: SpacemiT K1/K3 PLL
>  
>  maintainers:
>    - Haylen Chu <heylenay@4d2.org>
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pll
> +    enum:
> +      - spacemit,k1-pll
> +      - spacemit,k3-pll
>  
>    reg:
>      maxItems: 1
> @@ -28,7 +30,7 @@ properties:
>    "#clock-cells":
>      const: 1
>      description:
> -      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> +      See corresponding file under <dt-bindings/clock/> for valid indices.

List two paths, better. Generic path to clock directory is obvious and
not helping.

>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> index 133a391ee68c..66e6683a3ccb 100644
> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SpacemiT K1 SoC System Controller
> +title: SpacemiT K1/K3 SoC System Controller
>  
>  maintainers:
>    - Haylen Chu <heylenay@4d2.org>
> @@ -22,6 +22,10 @@ properties:
>        - spacemit,k1-syscon-rcpu
>        - spacemit,k1-syscon-rcpu2
>        - spacemit,k1-syscon-apbc2
> +      - spacemit,k3-syscon-apbc
> +      - spacemit,k3-syscon-apmu
> +      - spacemit,k3-syscon-dciu
> +      - spacemit,k3-syscon-mpmu
>  
>    reg:
>      maxItems: 1
> @@ -39,7 +43,7 @@ properties:
>    "#clock-cells":
>      const: 1
>      description:
> -      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> +      See corresponding file under <dt-bindings/clock/> for valid indices.

Same problem here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
