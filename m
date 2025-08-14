Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93877CA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 20:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSNqeEi9v+Wv8sEvUXmyMZ50QNmS7wZkAq9A9/EUkzY=; b=u92YTORzen4WhG
	N7aMnH4NH7Mq3OI2h8vYlX8inojurzkYWK57TH6Xv60xFX6YlYKGfmT6w0Bubed2GdS7LjR7J7RZu
	v/r0qq2Hk4zozs2hk4EU/ACSKXtryZG6yL6+nJrNHffRTjSQTrWgY/g2/n6VsEC6ZebM8ydv1S0df
	dVPZL0D6s2FGfuNcOB4BUIrW5tq49wjEh4a4UG/c3OFSrFdn+JegdQeilBxxyhEL1IaB3d/nyQVDR
	NyIF1ViGaMKorbb02CcxUHK9NOVO/eMV5bvrVwzq95iDAunvwRblAAZ//+RQGgOiV2GlnF6Ty+HbY
	SXEmaB+N3fOrt1xHlbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umexV-00000000XKx-07bM;
	Thu, 14 Aug 2025 20:54:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umev4-00000000X6q-2ID8;
	Thu, 14 Aug 2025 20:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9744A56ED1;
	Thu, 14 Aug 2025 20:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC8DC4CEED;
	Thu, 14 Aug 2025 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755204689;
	bh=/M4EE7DFqLJynRJpaxxdZKYC5XpUZmPw2hnoERrqOp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVn6XjXkVgHKX31q8ZfXo7rw69ZgSzBWspUWLyQB3kVd5itiTtfuFBvXWGnEPnlNH
	 cVN536Wy1xooiv/AYneWTv9Q1ftQuxJwOsji2f0HR8OBJ3knOX5kA2oPTBPIlfuEiY
	 hoLmiMQT02eO2M5fA8wpc51tUbPMp3nhwTv5nNrrU8nlyOnwzE07HQw/oFHowNr1Ce
	 LsaGcLzhbszy3+41SAnLDDpj8Fg+yqCAOstZmhjsz8TZbcXoBGmQut9q9oBGGQvpMa
	 J8tXi/RpjBlBTOcbcf2W7NwGGej/V0cUSamfgSLYgWWks1TgKjA3eNht+rxAJPSdFv
	 iGooIKvdVXTvg==
Date: Thu, 14 Aug 2025 15:51:28 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
	vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de,
	johan+linaro@kernel.org, thippeswamy.havalige@amd.com,
	namcao@linutronix.de, mayank.rana@oss.qualcomm.com,
	shradha.t@samsung.com, inochiama@gmail.com,
	quic_schintav@quicinc.com, fan.ni@samsung.com,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo
 PHY
Message-ID: <20250814205128.GA3873683-robh@kernel.org>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813184701.2444372-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_135130_737533_B4198825 
X-CRM114-Status: GOOD (  26.06  )
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

On Wed, Aug 13, 2025 at 01:46:55PM -0500, Alex Elder wrote:
> Add the Device Tree binding for the PCIe/USB 3.0 combo PHY found in
> the SpacemiT K1 SoC.  This is one of three PCIe PHYs, and is unusual
> in that only the combo PHY can perform a calibration step needed to
> determine settings used by the other two PCIe PHYs.
> 
> Calibration must be done with the combo PHY in PCIe mode, and to allow
> this to occur independent of the eventual use for the PHY (PCIe or USB)
> some PCIe-related properties must be supplied: clocks; resets; and a
> syscon phandle.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/phy/spacemit,k1-combo-phy.yaml   | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
> new file mode 100644
> index 0000000000000..ed78083a53231
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/spacemit,k1-combo-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 PCIe/USB3 Combo PHY
> +
> +maintainers:
> +  - Alex Elder <elder@riscstar.com>
> +
> +description:

You need a '>' or the paragraphs formatting will not be maintained 
(should we ever render docs from this).

> +  Of the three PHYs on the SpacemiT K1 SoC capable of being used for
> +  PCIe, one is a combo PHY that can also be configured for use by a
> +  USB 3 controller.  Using PCIe or USB 3 is a board design decision.
> +
> +  The combo PHY is also the only PCIe PHY that is able to determine
> +  PCIe calibration values to use, and this must be determined before
> +  the other two PCIe PHYs can be used.  This calibration must be
> +  performed with the combo PHY in PCIe mode, and is this is done
> +  when the combo PHY is probed.
> +
> +  During normal operation, the PCIe or USB port driver is responsible
> +  for ensuring all clocks needed by a PHY are enabled, and all resets
> +  affecting the PHY are deasserted.  However, for the combo PHY to
> +  perform calibration independent of whether it's later used for
> +  PCIe or USB, all PCIe mode clocks and resets must be defined.
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-combo-phy
> +
> +  reg:
> +    items:
> +      - description: PHY control registers
> +
> +  clocks:
> +    items:
> +      - description: DWC PCIe Data Bus Interface (DBI) clock
> +      - description: DWC PCIe application AXI-bus Master interface clock
> +      - description: DWC PCIe application AXI-bus Slave interface clock.

End with a period or don't. Just be consistent.

You need DWC PCIe clocks for your PHY? A ref clock would make sense, but 
these? I've never seen a PHY with a AXI master interface.

> +
> +  clock-names:
> +    items:
> +      - const: dbi
> +      - const: mstr
> +      - const: slv
> +
> +  resets:
> +    items:
> +      - description: DWC PCIe Data Bus Interface (DBI) reset
> +      - description: DWC PCIe application AXI-bus Master interface reset
> +      - description: DWC PCIe application AXI-bus Slave interface reset.

Same here (on both points).

> +      - description: Global reset; must be deasserted for PHY to function
> +
> +  reset-names:
> +    items:
> +      - const: dbi
> +      - const: mstr
> +      - const: slv
> +      - const: global
> +
> +  spacemit,syscon-pmu:
> +    description:
> +      PHandle that refers to the APMU system controller, whose
> +      regmap is used in setting the mode
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      The argument value (PHY_TYPE_PCIE or PHY_TYPE_USB3) determines
> +      whether the PHY operates in PCIe or USB3 mode.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - spacemit,syscon-pmu
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +    combo_phy: phy@c0b10000 {

Drop unused labels.

> +        compatible = "spacemit,k1-combo-phy";
> +        reg = <0xc0b10000 0x1000>;
> +        clocks = <&syscon_apmu CLK_PCIE0_DBI>,
> +                 <&syscon_apmu CLK_PCIE0_MASTER>,
> +                 <&syscon_apmu CLK_PCIE0_SLAVE>;
> +        clock-names = "dbi",
> +                      "mstr",
> +                      "slv";
> +        resets = <&syscon_apmu RESET_PCIE0_DBI>,
> +                 <&syscon_apmu RESET_PCIE0_MASTER>,
> +                 <&syscon_apmu RESET_PCIE0_SLAVE>,
> +                 <&syscon_apmu RESET_PCIE0_GLOBAL>;
> +        reset-names = "dbi",
> +                      "mstr",
> +                      "slv",
> +                      "global";
> +        spacemit,syscon-pmu = <&syscon_apmu>;
> +        #phy-cells = <1>;
> +        status = "disabled";
> +    };
> -- 
> 2.48.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
