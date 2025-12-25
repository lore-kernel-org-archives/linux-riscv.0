Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3251E7AD42
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 11:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eby+QVQPPoV4VnnkicvflHYvXEc/cRZw7GgMpaZVVmU=; b=edyDr1ZF79NdqL
	dsR+FuK0L6i4NJzm9OwNhRBHBww6Nrk8rvlzuI4JmB4SZ1nJi829B6WwpL0KiODUHdjx1ZiEBknG/
	hkcRsUodNmYndpeBPC1uGkJYVM4fHpAMUFgZngUSUgOZMb1QuY+pZyQ8etuRKckBtHA+JPlrba1It
	kFQkBcqIXD6Kopq7T+01gFr8Pk00nQOS3zUwISWr0ABTJ5idgYnP110I0JKa94jaYBSiqwGZhPlu+
	3MfcgRnYMwiUqNblUaTI4dsmr2kSO9GhysExTCOKh8/QFKO0tYrwHHTvDixviEYyGLpIO8Tc1Ls2t
	jAkQXSQFbJjBJzZoKk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYjcd-00000000MtN-1C3R;
	Thu, 25 Dec 2025 11:35:11 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYjca-00000000Msa-3Y4v
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 11:35:10 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-c0224fd2a92so6122956a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 03:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766662508; x=1767267308; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR9ewMLjXFiPPdUADJ8UIVWJfNnUqlBWb4FQrwaT2qY=;
        b=jSn4lR+Enr1WqkJQwNyIsiSaWm7zEGjswjIPvgJcf7Xui0GRS+q7GAOwsPUw7hDyV6
         890bcfHhnllSMlLibGk8hP524EW7s7SNlgWLdiebZWY6+Ha19pY9Tiu9N1GB0rnbNyUS
         aYRGUH8GI8sR+sAmORrdG7seYB6gZS5gwcCYnrXRtkOHzBoroO7BjJcEvAsLIBtc2uK5
         ciSP0qzG+kg2rZ4RBMmhsA1eWm6Q8MJOGlCBYaLcR0rlEX+TS9bpbV29akMfg1bG155q
         klkJQdfuAvK2GXYKt2Y4hRJAokGIjAIHM8bB4I8jQ+3uK7AZE95KGq7nMO6qndoEe94I
         QxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766662508; x=1767267308;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NR9ewMLjXFiPPdUADJ8UIVWJfNnUqlBWb4FQrwaT2qY=;
        b=LYh4UtbRHjMXeQPN3QTQ+b/T3rJ7c5LhrPWrxqjvyKbOGxqnxotPylKtUt+sB1Kh/g
         AIPW4ZedWZ3BYxYTTvV3smZmYsla+3TDGKYfQSd7CSubbxkzrmQk6cSzf19Raf2Y4RYB
         u55nc5y7HzOcGmVhuWIdRgij7ET0kvOrY7zS8Ws/5KDA+2B2Bcwgrr9Za7h2BX0YILYn
         v+ezdkVhyrhrtmlDLSW/9jHPCAG1BdqoXD5RQCGunMTN0Xd1ZaeEhmqm5LZJB/hGi2Yi
         VAFJu6XhItpXOOqc2mR4/vdXT37iEIgrbv6fa2TEXYP988Wv6g6lhIjGJf+homY0IDKf
         Yd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdfWDbBsNZ/zwhqXhi611MyjizeWF5Gpd9qrSQ9RODj5Vbs1eLcC/hXT5dbPeET0QMhpTMPFthGf/n/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj+Uu00wWWGHveNcJqrANESVxpqLWRLbSOdt3d1+3TTeEwLPyg
	dSfjv/nIZImgwuiwhpDw92VUbQc10+AWN7F60ek+PSgnE7S7jSKy9oIBHs16MtA0jXh3IGQA
X-Gm-Gg: AY/fxX4eM4VWcwuYwu/0f18+vNXPob7ugIMgTFNVoOs5h70/4d6do9zCaH/Gim2ehqx
	3trQCUcRLayC4Q0Zr319gSHmBaB+NCxqNOZ9hA8vwYE6YAQf+bPVTCA7HbK3uGV6R1LQErcKEhq
	DW70NlKJaibmJ1VNUBZaDnnxPRiBOG0l5V52yIsVsMkXOdjzhF8qQZvzBEvZStMPz30mfqoRT4T
	LrRD8IsmH3boa3iA1CgfnpHX8bSnwOlwSJEtsePsxFJwaXDkvc2977ONf0i3SdHCRI9fLoVaUsP
	pO1vUtzxLLUKvIryv27FpdAff7l3aq/4Sp2EXvOdffkQzTnsqfFBchEsmHryeiJsKnlFD4nT5Pk
	FI74YC+tj4Q57UMZertwFgJMAOUm216bS5qxWT0vnpzRuzVCP+qMQ0Vrz55BfytH3jATzbQhYLA
	GGJS0RCZ8t44B8DwXLuDgchGXhDVvCYZu1hejWLT/dTgRFMrfWKTvyDSqTZSE7xpQ2FHdbJRQnS
	zcDXuiuGqDFZK88nA==
X-Google-Smtp-Source: AGHT+IG2M8a8qGctLFSHsXVBGxXFam1e3c0AO/WF6f8CTG9U4DPalhsEV923XI9BxX9JmKKZ65n0vg==
X-Received: by 2002:a05:6a20:12cb:b0:34f:a16f:15ad with SMTP id adf61e73a8af0-376aa7f0de4mr19263347637.53.1766655352891;
        Thu, 25 Dec 2025 01:35:52 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp. [125.103.213.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e76de1e41sm10145504a91.2.2025.12.25.01.35.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Dec 2025 01:35:52 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:35:34 +0800
Message-Id: <FBE5FD78-D7E8-4961-BF13-9BDA0F840548@gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_033508_961672_F9EB1A7C 
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
Tested-by: Han Gao <gaohan@iscas.ac.cn <mailto:gaohan@iscas.ac.cn>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
