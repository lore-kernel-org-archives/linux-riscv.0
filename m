Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454A7C44536
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOgfCzm3kQupCb12A2QofJMtGtG5A7Qsy85Sf1Tnteo=; b=c6Cfj7BNtpXMP4
	puuwg7bPbva9heODfamn5qzs2q3EkZUvy/8k3+Mh/guDKzUX2FVwrP2nIW2k+9RTGwuPpaK8+ZYsr
	HiNmc1gyPtBdnSgEaTD/VVFMsew5nBbBrZJQ6H/iPN9zF0gi5ztdL8ZweHzm7PRpv9KcuETBadcsW
	6ELqaDSrEagJwt9kxEzL14dchLHdP7hBd9u+ZWfnrqqvDvcvLs1r+ZZi7pFOzfdoc+R8YVnIt+AT5
	erJ/DVqsMSJvnkteVEcB4ZtNjvaUP2nCHo381Vil/gRHJZ8/T05rV752DJJZELOj1Z5EDK95ssDuB
	E9Wa3nhhb/TiOriepBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vib8R-00000005nsu-1huH;
	Wed, 21 Jan 2026 16:32:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vib8Q-00000005nsk-0MrR
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 16:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A5B36011E;
	Wed, 21 Jan 2026 16:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE1BC116D0;
	Wed, 21 Jan 2026 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769013134;
	bh=urBQxfp8acAC7apC0Egv7eKeUUoROllL5JyUeZCroCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbBHm4UMVre+ZO7KCmFmi5b9+J4MHIvgeTbx3TdI6bGKcVRIscDltGHlr9mry70FQ
	 /Uky3iWzvHbSRQp42h+g1ZJAEzSn34/5wkbMxIydgZsp4L/7ysk7xiYWsatMDPvZ0E
	 6LLzqvfH4dooLi/XbzR2Mo3NdprvZWVtH/mHOfR2ZTLkgdql11vFC/qx2EHbyR3bC3
	 jDJqPG8t+5ifjy7Ha0vhpo9P3iqwLCqaJrzCcT3txl92jp6FBHy8Zrw4ZOIBZAyxU4
	 4Kv5aqU8cWxIQWzPp27LT2v0wrstC63umKyz7yp5B5i2zHre23kGskE9rS2UFwVwV9
	 k4e2sk8Xg//zA==
Date: Wed, 21 Jan 2026 10:32:13 -0600
From: Rob Herring <robh@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <20260121163213.GA3413426-robh@kernel.org>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <20260115-cv1800b-i2s-driver-v1-1-e8b22b8578ab@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-1-e8b22b8578ab@gmail.com>
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

On Thu, Jan 15, 2026 at 11:17:38PM +0400, Anton D. Stavinskii wrote:
> Purpose: introduce DT schema for the CPU driver

Please write a better commit msg. Use complete sentences for starters.

> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> new file mode 100644
> index 000000000000..cf30880a62da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800B I2S/TDM controller
> +
> +maintainers:
> +  - Anton D. Stavinskii <stavinsky@gmail.com>
> +
> +description: |

Don't need '|' if no formatting.

> +  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: i2s
> +      - const: mclk
> +
> +  dmas:
> +    maxItems: 2

dma-names allows 1 entry, but this requires 2?

> +
> +  dma-names:
> +    description: |
> +      Names of DMA channels. May be omitted. If present, one entry
> +      selects a single direction, while two entries select RX and TX.

Drop the first 2 sentences.

> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [rx, tx]
> +

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

What are these for? You don't have any child nodes with addresses.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sophgo,cv1800.h>
> +
> +    i2s1: i2s@4110000 {

Drop unused label.

> +        compatible = "sophgo,cv1800b-i2s";
> +        reg = <0x04110000 0x10000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
> +        clock-names = "i2s", "mclk";
> +        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
> +        dma-names = "rx", "tx";
> +    };
> +...
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
