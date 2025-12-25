Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E1AE7AD48
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SM+xQe2eOw1gNAdpiukVI1VXJLH6XMFnLkkhBg9gAPI=; b=CNut0+iyk1H19y
	F35S2YVxiMUvkhQhMcA4mJjU14yMoQYsGS3O2QnPizWflLe92xx97owxmo/DX9gEJR2YSOxIOtUvL
	zs3cabBuJ/lAhkrETA+hn2OL4skC1KOaSwiQUH5lKyRf8wm3DTFtISCj3VP+ULtPuHDSRrl9NpDvL
	Hgy8AhRU7C9eaHstQEfTAxYndxlPx5/Ct7LSQqVaTRVzBMOPBI6lncwicWH2WKvcevzpWYltxh05Q
	hSjSeVfBgI/gAFcqviFn4+ET/ApDPfQPMCy/Vj88vD0Bj7g3BnLCLW/FwgQg79cnGSMxBUG0cKS2k
	nkXmbFzEComTi1Xj3dng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYjM9-00000000MCX-1kRB;
	Thu, 25 Dec 2025 11:18:12 +0000
Received: from mail-oa1-x44.google.com ([2001:4860:4864:20::44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYjM6-00000000MBx-1kfa
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 11:18:07 +0000
Received: by mail-oa1-x44.google.com with SMTP id 586e51a60fabf-3ec5df386acso4820545fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766661485; x=1767266285; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wwHqUKmio0zDYl0J/tmo44sND18w8vdAisUr2wfwgY=;
        b=dl6WWPqflKBVWk64HdNypL9aEPbe8gc7DDeOEGGEQsefUk/aFB+Jch51LjsHqMpLDn
         MQjCVecDeBqeevxQvE5wjFVjXNiBxdEfwZMHUYf5JMXFKG37RnXafPnC7KnW6Jx8F+dz
         pke73FC4uDOGY29ZmCShNetXrTllnbFJkca1/CQV9JNn8xq3J3jVISk5u4JDURRx7gUu
         1iCIB5aMCvzvLqEBWWlayqq+AYb1X6RQS75I+RyDm/W+qLIeODEQx119qMTQwccxD6Z+
         8RkqwfqvduStJKzhX8zMF0j0fNGS80VBpUdl4tv9L/9MWQxgfRYHlKxBVsZgSAH8WX1W
         j1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766661485; x=1767266285;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/wwHqUKmio0zDYl0J/tmo44sND18w8vdAisUr2wfwgY=;
        b=Ar8MvMqMlAs95JRkD+02a7Autcus4vzuyUmfr7YrbAYzHW4yUEZO9tWZaOYiYYIY49
         2mWCqZQSIEIcSIDecHNj9z0XDOayPRdul6afxRgKmVqKaxDBEMQFa6TxjKGVJsb8Lbn0
         9MJMKL2hKzYev4I2amOEkiILCzrQ5LgwsF16AO2m2BeVzvVTVTkjsWreZfJ+5t0yfZO1
         DtOAE/7MKOQzWpSbwTHoIOTPeP/0sJb29L/YNGE0kl6RFlEX/7tnCnD15n2uGeKhB5B/
         ZffrvFGcWSUSXEhOt29AooIJ3s6An1dF3sGm0JxMZWjfr/GEXQU/foeCZyL+0j1aCl7f
         w24A==
X-Forwarded-Encrypted: i=1; AJvYcCVpYf1hEBGXW3tvU6qg8a+yKv2Hs5q/Qi5DveSNG1nhpGto+QYHwUFfk3nl4fZRryZnrzRLNDZdydfPyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZbQAS6o/b930TOJ4RFYppy3Oh+NDHf49Ta2VQmuSePtG+s4/q
	9Wi5Q5jSC59+N9YkaeDUgUaFR5W94778eOdFnyuUI82RmBjPZbK47vMXvpmdV+eUdEXpBAAN
X-Gm-Gg: AY/fxX6zKhLODd+K9a2WZnnnpGxPdFNS3JEHnmps0Xs+AB18gCPusJAmAKSEwToo3UZ
	1ChbSGbDVOxbulQMS10IELQ63Aa0RPsHzHUE4YRI8X5cIglA0hoCpFKwU44bY9yApMVaHECETR4
	e5PxoN7GQLclCDg4uYFYZVKxK2cXjsrQd1fBSdQVlN9JH4LXvIhlry2EoNpOJMMQQXvEXnmQFTv
	JMGwgcoMlrKa5zkySt5YnufO4yKIHYT6Ky2mqWjz/5WebDQWK9MBsAUDBGr7L+XMn9aUXzVkzR0
	CCOd/bsqsJchWDCatWnFczT1d32xDiQAIRNPi9oqDWdZH8pJqg+0QbL/9q1SvIJDOV1MyycWiv2
	mC7W9aVCnXfOyPF0zg5IrxTUvNku9G5vFDSGNKbDM70AFS16hwQQrVMWlef1YnhyCfTaBOAx+kw
	goUn6dCdGQNd4VBULSMqJYc/6EmbYytCEKUFljDVnt3ExBZUi7NGGFzVT9tKpgiVobmh6ZNAl+H
	xbbZexrHcJ9H2pqbQ==
X-Google-Smtp-Source: AGHT+IHBA5f7xs8SbixSTyrADxFgnATVVrMs7xqxZBXC0Al/ChYPojBml/FfU3rBeeFAo/nT5Xmn7A==
X-Received: by 2002:a17:902:e88e:b0:24c:da3b:7376 with SMTP id d9443c01a7336-2a2f24270d8mr202538085ad.26.1766655917374;
        Thu, 25 Dec 2025 01:45:17 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp. [125.103.213.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83961sm177814725ad.38.2025.12.25.01.45.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Dec 2025 01:45:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:45:00 +0800
Message-Id: <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_031806_564784_45C271DB 
X-CRM114-Status: GOOD (  23.44  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, "Han Gao \(Revy\)" <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> On Dec 25, 2025, at 00:11, Icenowy Zheng <zhengxingda@iscas.ac.cn> wrote:
> 
> From: Icenowy Zheng <uwu@icenowy.me>
> 
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
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v4:
> - Added a comment for "verisilicon,dc" that says the ID/revision is
>  discoverable via registers.
> - Removed clock minItems constraint w/o specific compatible strings.
> 
> Changes in v3:
> - Added SoC-specific compatible string, and arm the binding with clock /
>  port checking for the specific SoC (with a 2-output DC).
> 
> Changes in v2:
> - Fixed misspelt "versilicon" in title.
> - Moved minItems in clock properties to be earlier than items.
> - Re-aligned multi-line clocks and resets in example.
> 
> .../bindings/display/verisilicon,dc.yaml      | 144 ++++++++++++++++++
> 1 file changed, 144 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> new file mode 100644
> index 0000000000000..fe64cc1466690
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> @@ -0,0 +1,144 @@
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
> +    items:
> +      - enum:
> +          - thead,th1520-dc8200
> +      - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
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
> +
> +  clock-names:
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
> +        description: The first output channel , endpoint 0 should be
> +          used for DPI format output and endpoint 1 should be used
> +          for DP format output.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The second output channel if the DC variant
> +          supports. Follow the same endpoint addressing rule with
> +          the first port.
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
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-dc8200
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
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
> +        compatible = "thead,th1520-dc8200", "verisilicon,dc";
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
> +
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
> 2.52.0
> 

Tested-by: Han Gao <gaohan@iscas.ac.cn>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
