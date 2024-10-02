Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E3ACF8547
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 23:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUVT9sR3Jx5/kJ5jopsTSx63pUPSeVp3BP/8uyW7HWo=; b=4ETJy3CLdf7wNB
	z19E755Sbfld5Py4LRhmYQjbS9hmdB9amTcPp1rwH4e6/SHLGZc4KuWTzQoeU+1j1Lvsyjf0DWs2t
	NUU/h1JcxHpSBaqn9YasbDXDEddCTH9fXRdlJAk09h/10ltSYtJmw2TJnC3TEdP6xtk+P4mc7Ef5i
	K90ohoL8PQgUggGq2xUdB22fRNy7YE/Ak6RTccykKlEprPH40Q078ZC2p83Bb6SWA8KZorEObhS+F
	fvARSsodCieR5+EEfYnto3O1jvylkDFC9ZK39VPUcsvd/TBmYXWMYfkpg8JjrwWCCqNPUrLMh+gCR
	2N7xmsqnmrv13+q3YA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8oz-00000007kwj-1HOv;
	Wed, 02 Oct 2024 23:31:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8lH-00000007kAh-2wnu;
	Wed, 02 Oct 2024 23:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8EA4CA41682;
	Wed,  2 Oct 2024 23:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777BEC4CEC2;
	Wed,  2 Oct 2024 23:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727911682;
	bh=MDFYbH0l8/JCnv5G74aFoLHuvJehI0qeBVHtHdp/RPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuMLcGGlluvdM+NJ6u03ob2mi6xCrpH2bRbb8Gft53xQlnGVsNEdk7dxarRzPTvaL
	 pbgZXAsaVnQImpjYs0hznEuzVGADOFHm0vp+2oD13hhRm5STrYmf4u6V6MUcJXM2Pt
	 BBoZ6x4m37cXHbizX6+ZFBf88Olfy1BOlCny8lQyoDiQHTykZBqvFZSQrdNyH0bWcP
	 waKKne/VLvp+r8wQl/WVnX4lobOUnfN+ICfxlOk65sU1YOAyoc7PHvWQYHtywYU7nT
	 TygWiGMFEIifWBtwuqc8V0EfZ/3aLaFSWQ4ut/Evj69a2ho06RFvyhm+Gcr1+R35w/
	 hn6sMDZw+iYFA==
Date: Wed, 2 Oct 2024 18:28:01 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 04/11] dt-bindings: soc: microchip: document the two
 simple-mfd syscons on PolarFire SoC
Message-ID: <20241002232801.GA1520357-robh@kernel.org>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-unvaried-clever-374b4d763849@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-unvaried-clever-374b4d763849@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_162803_892609_55F95B00 
X-CRM114-Status: GOOD (  27.13  )
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

On Wed, Oct 02, 2024 at 11:48:02AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> There are two syscons on PolarFire SoC that provide various functionality of
> use to the OS.
> 
> The first of these is the "control-scb" region, that contains the "tvs"
> temperature and voltage sensors and the control/status registers for the
> system controller's mailbox. The mailbox has a dedicated node, so
> there's no need for a child node describing it, looking the syscon up by
> compatible is sufficient.
> 
> The second, "mss-top-sysreg", contains clocks, pinctrl, resets, and
> interrupt controller and more. At this point, only the reset controller
> child is described as that's all that is described by the existing
> bindings. The clock controller already has a dedicated node, and will
> retain it as there are other clock regions, so like the mailbox,
> a compatible-based lookup of the syscon is sufficient to keep the clock
> driver working as before so no child is needed. There's also an
> interrupt multiplexing service provided by this syscon, for which there
> is work in progress at [1].
> 
> Link: https://lore.kernel.org/linux-gpio/20240723-uncouple-enforcer-7c48e4a4fefe@wendy/ [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip/microchip,mpfs-control-scb.yaml | 44 +++++++++++++++
>  .../microchip,mpfs-mss-top-sysreg.yaml        | 54 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-control-scb.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-control-scb.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-control-scb.yaml
> new file mode 100644
> index 0000000000000..4f9168320243c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-control-scb.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-control-scb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire SoC System Controller Bus (SCB) Control Register region
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description:
> +  An assortment of system controller related registers, including voltage and
> +  temperature sensors and the status/control registers for the system
> +  controller's mailbox.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: microchip,mpfs-control-scb
> +      - const: syscon
> +      - const: simple-mfd

Where's the child nodes?

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;

Don't need the soc node.

> +
> +      syscon@37020000 {
> +        compatible = "microchip,mpfs-control-scb", "syscon", "simple-mfd";
> +        reg = <0x37020000 0x100>;
> +      };
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
> new file mode 100644
> index 0000000000000..98ccec3caad51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire SoC Microprocessor Subsystem (MSS) sysreg Register region
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description:
> +  An wide assortment of registers that control elements of the MSS on PolarFire
> +  SoC, including pinmuxing, resets and clocks among others.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: microchip,mpfs-mss-top-sysreg
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    description: |

Don't need '|'.

> +      The AHB/AXI peripherals on the PolarFire SoC have reset support, so
> +      from CLK_ENVM to CLK_CFM. The reset consumer should specify the
> +      desired peripheral via the clock ID in its "resets" phandle cell.
> +      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list
> +      of PolarFire clock/reset IDs.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      syscon@20002000 {
> +        compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
> +        reg = <0x20002000 0x1000>;
> +        #reset-cells = <1>;
> +      };
> +    };
> +
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
