Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ADECAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 20:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnXHEH1smehCUGky6CTSzbsGeRJL1K6Hub1N4dYFPuo=; b=yh0BVa1+llNSQm
	gSRBNpXXjjPAj6yapZ5F6JnmYvl4pTx6CC/reBxJ/6R79qV3a6eJFXorR/ODhloZdOiu8PdyRSS2u
	5hytsZp581/n93agZSHoBp3T+jfrkVBiGX4IcTOMFWcc1qgU5jqY9VVtRSX4YaZ2PO9ewupuhnvH2
	AmvdfZpkzhUMPkq1h/9oSgEODgk6Be7otRjfAlIFHr8EXi3gMvRKiq4vHNs0CA41yJOangKWnza7U
	bSrqd/cwC/U9YyodtF0/eSjdtPNw6jESeZwYo5zh5AW55AypNKBl90mN/V5GqK+zl/IRgk95Zcwxq
	gZpQHCXBklAVH+7LxHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nO4-0000000BTYD-3nAP;
	Mon, 22 Sep 2025 20:43:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nO3-0000000BTXj-2n3o
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 20:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8837460241;
	Mon, 22 Sep 2025 20:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028A4C4CEF0;
	Mon, 22 Sep 2025 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758573830;
	bh=Vy80BelxmGUNpFFuDIVKX3KUuEZh7ay4ov/SQneHVHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lkxzgKHmfF3t4PNAyjogZDoIDiRVy71l18WPbvBAfNwv2BGc8deTkq4LNWRPiL8eW
	 zDazyR61jMG+X8+v9Lvh4Q2vvZ+e0ObpolgRM/HJuS0uRvelPoklqvfwD9yEzwdgfK
	 MHIwcokie9KF92Lo/ihQCLLtxpCi8Sez2G3uKpVQlA+6vTaUrw7Na3Dw3Y+0akxF4b
	 TUjgihjb/ux6nIDi0z5jpKTpCALwwFg6mVQcKpoMrKC0x7ToeivqKafLFVyrtFUKjZ
	 c9uz8OvOXOhQwrhGLNuxqueS879tNh9XZaavay/Khc45zV1JHczBFJzP+NPoLzQ8SS
	 RX64uAZLFGgvA==
Date: Mon, 22 Sep 2025 15:43:49 -0500
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
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
Message-ID: <20250922204349.GA1290045-robh@kernel.org>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-3-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250921083446.790374-3-uwu@icenowy.me>
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

On Sun, Sep 21, 2025 at 04:34:40PM +0800, Icenowy Zheng wrote:
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
> Changes in v2:
> - Fixed misspelt "versilicon" in title.
> - Moved minItems in clock properties to be earlier than items.
> - Re-aligned multi-line clocks and resets in example.
> 
>  .../bindings/display/verisilicon,dc.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> new file mode 100644
> index 0000000000000..07fedc4c7cc13
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

This needs an SoC specific compatible. Generally licensed IP compatibles 
are useless because the specs aren't public and there's always 
integration quirks.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4
> +    items:
> +      - description: DC Core clock
> +      - description: DMA AXI bus clock
> +      - description: Configuration AHB bus clock
> +      - description: Pixel clock of output 0
> +      - description: Pixel clock of output 1
> +
> +  clock-names:
> +    minItems: 4
> +    items:
> +      - const: core
> +      - const: axi
> +      - const: ahb
> +      - const: pix0
> +      - const: pix1
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
> +                 <&clk_vo CLK_DPU_ACLK>,
> +                 <&clk_vo CLK_DPU_HCLK>,
> +                 <&clk_vo CLK_DPU_PIXELCLK0>,
> +                 <&clk_vo CLK_DPU_PIXELCLK1>;
> +        clock-names = "core", "axi", "ahb", "pix0", "pix1";
> +        resets = <&rst TH1520_RESET_ID_DPU_CORE>,
> +                 <&rst TH1520_RESET_ID_DPU_AXI>,
> +                 <&rst TH1520_RESET_ID_DPU_AHB>;
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
> 2.51.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
