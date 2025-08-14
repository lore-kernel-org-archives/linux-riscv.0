Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10468CA0EE0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 02:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhL+m6ecLMjujWkfaedGzpCyOzDCPnVWqKQAHZRynMA=; b=gsGckTjQH9Rbdr
	Z2Pq1i3UdlOtmu2ZITHWfbySOvd/aFili3y7G1eR+h0GVslRA2q1XCWq4vCulj36SEkbUPZfxCDX1
	iiKZb010OUV/rTlqJ8PKjDLsBZfLdEQ+SuDLJoXlgC2fWoEDiHX4Uxna57yANVk2/t9xCazAtkKFb
	uUGQvbzNIe+kHxsDiLH71vnOdIRc85WpGWZUObLZmcdbuE0hqDJ0XL9wqEhMcyU8mh7LJFC3u7E7m
	0TbHAORs+9/wr3/Nnvq6CYICfTv+iIPpZWBuQ/nF9/mSAzhz4MRPTR3t/Ibfj1Y5U2D1b7I1+ZBX7
	8qc0QdRBtk4J3Ua2tlOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umO4w-0000000FbvT-2SzI;
	Thu, 14 Aug 2025 02:52:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umO4s-0000000FbuS-3TOl;
	Thu, 14 Aug 2025 02:52:32 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7B03E2524A;
	Thu, 14 Aug 2025 04:52:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cu1DZ5Gm8wiw; Thu, 14 Aug 2025 04:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755139946; bh=HTBR17vhoYZ8Fi2t2D3VIezhF9RyLF5ybAAkSkRGq8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IP0lyHCvPv+3+laZDJpARS5vDAKdwVsdhv8aZpJ5IvVRrvQM1z27khXbxpnj+zrMB
	 5HcafG2t4IiYPOLHc+fFm3/m3okPNtlifM+Dybdo6Tbb6qDXcejrXy+B9S/rtORe87
	 CFwCebY00Xoo9MC7aAAX7+Q6gKCFG5K5B5W8f+dnGNnkPPDpz2PT7s/gvNMf9CrcdA
	 Juphco4xYgVhAf4Uk/RQCMspBrS/y1vDm7KtATFNruZtsj1GjTrzhjobOW4G5mrFHy
	 erPVFeKHdD2DosHAtc+A7v8eDaX/bTg5ucv1Z4toHLO04pnCYWESuA/1XsVdBkaVQP
	 m1Zirohbl2zOA==
Date: Thu, 14 Aug 2025 02:52:03 +0000
From: Yao Zi <ziyao@disroot.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, bhelgaas@google.com, vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	tglx@linutronix.de, johan+linaro@kernel.org,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com, shradha.t@samsung.com,
	inochiama@gmail.com, quic_schintav@quicinc.com, fan.ni@samsung.com,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo
 PHY
Message-ID: <aJ1PJBax-Pj983OZ@pie>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813184701.2444372-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_195231_286912_8E3574E2 
X-CRM114-Status: GOOD (  17.26  )
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

...

> +  spacemit,syscon-pmu:
> +    description:
> +      PHandle that refers to the APMU system controller, whose
> +      regmap is used in setting the mode
> +    $ref: /schemas/types.yaml#/definitions/phandle

Clock controllers and ethernet controllers all use spacemit,apmu to
refer the APMU system controller. Do you think it's better to keep them
aligned?

...

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +    combo_phy: phy@c0b10000 {

This label is unnecessary.

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

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
