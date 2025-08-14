Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD3DCA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 22:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnH6CqrW88bTGOHKboqa2ONrq56Tip9JMasNW4akl/s=; b=SYLyoeHyVkGx6i
	uW4TQo3GZy/23F3YMAEvh55ZKD7u1ajSVSYIK5RnepV/VAAeTvKEIezJ125VK4czTOOHD4B7NcYIP
	5Ucpvsij+/eNSTlBSU2hZDB8GkiBZ5bPDur1gkF9XknF0wv3x8L6vxHnPDg8uKreLRXp+VRRSufoY
	GC2zEd+E4H6F35Aykvb7LmXYrz7Z01tsEufEs7EKoHWbxRn5formquoFrLNHc7+LdmNw2U4tdSqpJ
	zZrcOyDQ3/u5PR85RwmFIbyqJYjero/0nR824xh4bcMeDOe/WyFoNMi5ZstlSxZ4k2tlGk1zq9zFo
	+u2ki5tncbQFcikQKH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umg42-00000000eXT-23TA;
	Thu, 14 Aug 2025 22:04:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umg3y-00000000eX1-1dzX
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 22:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5A985C5D0C;
	Thu, 14 Aug 2025 22:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BE0C4CEED;
	Thu, 14 Aug 2025 22:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755209085;
	bh=gHu78kUOor8hxYgQbCL2CU5u8RDiVxrUTQKMzNK+XDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8/5OuADXwVKBkCbfeV0TU4cs5i6vUp0l+zU4dWyEGqaVUQYAkqc9vSxTBvkEtCGD
	 XF2CEfdZ+q3dBPIabPAU0Kkn4zgUW/D9BmTKTj30iDL24MJX1T6XyoHfHW9tsvIJPD
	 CqyQ5qgTZ7q1Xk74I2jYRy8QpfoAPmAL6UTvXxsIZzF8KH4HuMzBCDbbq+e2/bujYh
	 l6qQ1FNqioSQkdZCxLYz6G8H68Fv9TMrrZ8EBdJpycyadg9st04G4Ygu2ShEo1xRF3
	 liSKFljiXhGhIzGljseTUa4YIePXyBzds3AUg8AWkd7OvxDY3XnFG6L7UWWzkFbPCx
	 Q1FgPeg3xihZw==
Date: Thu, 14 Aug 2025 17:04:44 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 2/8] dt-bindings: display: add versilicon,dc
Message-ID: <20250814220444.GA3988176-robh@kernel.org>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-3-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814164048.2336043-3-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_150446_510745_6A3F783C 
X-CRM114-Status: GOOD (  24.61  )
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

On Fri, Aug 15, 2025 at 12:40:42AM +0800, Icenowy Zheng wrote:
> Verisilicon has a series of display controllers prefixed with DC and
> with self-identification facility like their GC series GPUs.
> 
> Add a device tree binding for it.
> 
> Depends on the specific DC model, it can have either one or two display
> outputs, and each display output could be set to DPI signal or "DP"
> signal (which seems to be some plain parallel bus to HDMI controllers).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../bindings/display/verisilicon,dc.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> new file mode 100644
> index 0000000000000..2f71a811786aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Verisilicon DC-series display controllers
> +
> +maintainers:
> +  - Icenowy Zheng <uwu@icenowy.me>
> +
> +properties:
> +  $nodename:
> +    pattern: "^display@[0-9a-f]+$"
> +
> +  compatible:
> +    const: verisilicon,dc

If the clocks or resets varies by platform, then you need an SoC 
specific compatible still. If these clocks/resets are straight from the 
RTL and any other number of clocks/resets is wrong, then we can stick 
with just this compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DC Core clock
> +      - description: DMA AXI bus clock
> +      - description: Configuration AHB bus clock
> +      - description: Pixel clock of output 0
> +      - description: Pixel clock of output 1
> +    minItems: 4

Generally we put this before 'items'.

> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: axi
> +      - const: ahb
> +      - const: pix0
> +      - const: pix1
> +    minItems: 4
> +
> +  resets:
> +    items:
> +      - description: DC Core reset
> +      - description: DMA AXI bus reset
> +      - description: Configuration AHB bus reset
> +
> +  reset-names:
> +    items:
> +      - const: core
> +      - const: axi
> +      - const: ahb
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The first output channel, endpoint 0 should be
> +          used for DPI format output and endpoint 1 should be used
> +          for DP format output.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The second output channel if the DC variant
> +          supports and used. Follow the same endpoint addressing
> +          rule with the first port.
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +    #include <dt-bindings/reset/thead,th1520-reset.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      display@ffef600000 {
> +        compatible = "verisilicon,dc";
> +        reg = <0xff 0xef600000 0x0 0x100000>;
> +        interrupts = <93 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk_vo CLK_DPU_CCLK>,
> +           <&clk_vo CLK_DPU_ACLK>,
> +           <&clk_vo CLK_DPU_HCLK>,
> +           <&clk_vo CLK_DPU_PIXELCLK0>,
> +           <&clk_vo CLK_DPU_PIXELCLK1>;
> +        clock-names = "core", "axi", "ahb", "pix0", "pix1";
> +        resets = <&rst TH1520_RESET_ID_DPU_CORE>,
> +           <&rst TH1520_RESET_ID_DPU_AXI>,
> +           <&rst TH1520_RESET_ID_DPU_AHB>;
> +        reset-names = "core", "axi", "ahb";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          port@0 {
> +            reg = <0>;
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            dpu_out_dp1: endpoint@1 {
> +              reg = <1>;
> +              remote-endpoint = <&hdmi_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.50.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
