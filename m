Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB106CA0FF0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 19:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rKfWfbZ7M5QKoMvHjiSU9l+c3tRanvlyHWSG84QKu8=; b=2ptTYw2JB47Cxo
	BmeGTyIsuZZJDiOtArzViDtTzcJxD7VPskJ4tPOT1TjOJFzSRsXNw7RN+5Z1cn8vc0yQwHxi+yNL8
	+hMp3y2IYzOInDgjJ8a5bHotnoHlsqmPu10nl+OEz18ZQIVYY+3g+wpev7AUpoicymus+NzzbIQv9
	4LMZTc0088Wvk8xQK8lORtsRSFa2/mCux1ezS6I+x0ucQvxYJ2KEQ9LhXN8o01ocokVESE4JzS973
	PvBgM6yGpDUJmIkrQoNY2BUuhaX36J3KiTEYv3i6EghQ3nxgaRS+XDuOml6L5cpXkqWSsQrvBaNaE
	BlbmDEkF8FPToHS9KfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us548-00000006nhe-460M;
	Fri, 29 Aug 2025 19:47:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2iA-00000006VLD-2hAi
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 17:16:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18981601A9;
	Fri, 29 Aug 2025 17:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A922CC4CEF0;
	Fri, 29 Aug 2025 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756487785;
	bh=NkhK1p1B1g1OXGW0TTzXh6oyW/wktWgGjhNbONvL0ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twPkUgMzYYFnifeH0CQK/tHCLW6lk1U1XRUws/fir+jyChH6lqXpyktSXxOv9sxn8
	 CjYB6J6MZH3EsmaYoFoVW9htpqd19gu+ASZf5z50X5ijZmZRSTAdRhIVlx7RIp8tmN
	 o1ne/W8BHqaIt0iRW/N2SjxWN4cZWxG551XhcMEovc9Tq5uuSt4ffW1/Q2GJUutbdy
	 kmY/lSfnboTVWwYEPKKaW6mPhjEfdDcGSjpaqAGAubhdREneQAd7QE089bLIDEsT58
	 nQoA3lQrla9HclE+k2HS91G3KgnVnsNzB4IE6aMxuQUVKkk/YXJ+t5f9D2GT4iV0wB
	 zueFmj8PqFRNg==
Date: Fri, 29 Aug 2025 12:16:24 -0500
From: Rob Herring <robh@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
Message-ID: <20250829171624.GA1027608-robh@kernel.org>
References: <20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com>
 <20250828-k1-i2s-v2-1-09e7b40f002c@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250828-k1-i2s-v2-1-09e7b40f002c@linux.spacemit.com>
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

On Thu, Aug 28, 2025 at 11:37:32AM +0800, Troy Mitchell wrote:
> Add dt-binding for the i2s driver of SpacemiT's K1 SoC.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..042001c38ed8d434889183831e44289ea9c5aef2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/spacemit,k1-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: K1 I2S controller
> +
> +description:
> +  The I2S bus (Inter-IC sound bus) is a serial link for digital
> +  audio data transfer between devices in the system.
> +
> +maintainers:
> +  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for I2S sysclk
> +      - description: clock for I2S bclk
> +      - description: clock for I2S bus
> +      - description: clock for I2S controller
> +
> +  clock-names:
> +    items:
> +      - const: sysclk
> +      - const: bclk
> +      - const: bus
> +      - const: func
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    oneOf:
> +      - const: rx
> +      - items:
> +          - const: tx
> +          - const: rx

If tx is optional, wouldn't this be simpler:

minItems: 1
items:
  - const: rx
  - const: tx


> +
> +  resets:
> +    maxItems: 1
> +
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - resets
> +  - "#sound-dai-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +    i2s@d4026000 {
> +      compatible = "spacemit,k1-i2s";
> +      reg = <0xd4026000 0x30>;
> +      clocks = <&syscon_mpmu CLK_I2S_SYSCLK>,
> +               <&syscon_mpmu CLK_I2S_BCLK>,
> +               <&syscon_apbc CLK_SSPA0_BUS>,
> +               <&syscon_apbc CLK_SSPA0>;
> +      clock-names = "sysclk", "bclk", "bus", "func";
> +      dmas = <&pdma0 21>, <&pdma0 22>;
> +      dma-names = "tx", "rx";
> +      resets = <&syscon_apbc RESET_SSPA0>;
> +      #sound-dai-cells = <0>;
> +    };
> 
> -- 
> 2.50.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
