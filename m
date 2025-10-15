Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02722CCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0CHGcPYTRD7ySKFcqFji7xddSAaoTElMWw/aYiVlmo=; b=k09ez/eM4ioeHA
	3E9J4GdodYmN0V4cJutySRB5P5gWjdAyBAySLTXuol5bpHWkBd7bCaK9eS8S3x5o8Y+rnG/fzqy1d
	k33qDHcWNn8Wv4XQ7M8W9kHYQe85J9O06uY1N3GG4rDxJNDmblKCL8nnylkPFRFBsh2R8Aj9V8XNp
	qZSu+zeY/RJh6F1fQ9bEJ4jAdytTs2b7TyCrEYJdaHFhpnxZPDmg3bxpd06h17/SE8iH5SsDQBwfR
	46COFmowZNxn0exDno0S2voLT9q5Xg3WJRIhnSOrBSg0Gkf/7JmI02Tb1eN4lpJS1yTsrLU3Eq1Ew
	UN5kijjADK0/wCdp5+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92rW-00000001xpS-41Gq;
	Wed, 15 Oct 2025 14:52:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92rT-00000001xob-34fZ;
	Wed, 15 Oct 2025 14:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B14443689;
	Wed, 15 Oct 2025 14:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F48AC4CEF8;
	Wed, 15 Oct 2025 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760539939;
	bh=ADw0XbUINFXw+99thMlJyEEKMXz1G33Y6Fyz/udOs7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riF91sarHuoK7t4am2+p5dxxUbrgULuYBx2SVwAhxTpeD1NYtB46wNTalCGGwGWtq
	 iHehp0VZnF2Ufr7jLAGIAUtAvlIFvJJa/4tuGo91bGJW4oYsm3B2uy8XWD+244DvCH
	 k0ST8OCUPYfPGyFRe5boeRN1qFELPWzIXSWbsA+dRgf5o3t/9hB635UTAwt2RbPioF
	 yZXJqHqdBaB4x2KSdwbzTH21133KVuVRbeGdsKpqMDdF4RO+5OJZgSzFl2+CZthuXX
	 Caal7DGqDslWIEWXwJSuXV+kntKZi8z5IYayeXfNHvp6JjWA/6kA9jvXUqY7qVvzsN
	 iFttDi/Vu7gGA==
Date: Wed, 15 Oct 2025 09:52:17 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
	guodong@riscstar.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	christian.bruel@foss.st.com, shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de, thippeswamy.havalige@amd.com,
	inochiama@gmail.com, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: phy: spacemit: add SpacemiT
 PCIe/combo PHY
Message-ID: <20251015145217.GA3554740-robh@kernel.org>
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251013153526.2276556-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_075219_814997_45F5D94B 
X-CRM114-Status: GOOD (  26.53  )
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

On Mon, Oct 13, 2025 at 10:35:18AM -0500, Alex Elder wrote:
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
> v2: - Added '>' to the description, and reworded it a bit
>     - Added an external oscillator clock, "refclk"
>     - Renamed the "global" reset to be "phy"
>     - Renamed a phandle property to be "spacemit,apmu"
>     - Dropped the label and status property from the example
> 
>  .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
> new file mode 100644
> index 0000000000000..6e2f401b0ac27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
> @@ -0,0 +1,114 @@
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
> +description: >
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
> +  The combo PHY uses an external oscillator as a reference clock.
> +  During normal operation, the PCIe or USB port driver is responsible
> +  for ensuring all other clocks needed by a PHY are enabled, and all
> +  resets affecting the PHY are deasserted.  However, for the combo
> +  PHY to perform calibration independent of whether it's later used
> +  for PCIe or USB, all PCIe mode clocks and resets must be defined.
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
> +      - description: External oscillator used by the PHY PLL
> +      - description: DWC PCIe Data Bus Interface (DBI) clock
> +      - description: DWC PCIe application AXI-bus Master interface clock
> +      - description: DWC PCIe application AXI-bus slave interface clock
> +
> +  clock-names:
> +    items:
> +      - const: refclk
> +      - const: dbi
> +      - const: mstr
> +      - const: slv
> +
> +  resets:
> +    items:
> +      - description: DWC PCIe Data Bus Interface (DBI) reset
> +      - description: DWC PCIe application AXI-bus Master interface reset
> +      - description: DWC PCIe application AXI-bus slave interface reset
> +      - description: PHY reset; must be deasserted for PHY to function
> +
> +  reset-names:
> +    items:
> +      - const: dbi
> +      - const: mstr
> +      - const: slv
> +      - const: phy

I think phy should be first as that's the main one to the phy and the 
others are somewhat questionable. Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
