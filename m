Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07230CCD1AB
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eNYucp36yuJTljQtWCHvH5B/d4rYI9+PU8NVVdfxlg=; b=ePszXACN7yIv60
	suv62E9ix0fzBvCV7Zg0exhSeS1JT0C/FckGaZ2EQdYjG38e8Gb+qz6vc1Q/0EvYkZRxqSAWXYpdv
	2cS33kKbb/ODNVfx/WolcG1nqfdsfDPWjKxqHDFSF/9IYPuqFLB+i1E1dLzyPNOHIgfFqk0W9QyRA
	EBiaxNTSY70A2zJH+lYDukpZEOB+YlcP1UGda73jMrUfxgGkLGSswcAAFQ4aLD2daGZxOb6jDOw3U
	a/7gP2dTYWWKOYRpuy2dsDDz4YKt0DllmrDrnffppcmqOT6OLrWfD/BTuFU9PT8MIDxjayVK1unKf
	j6qS5SD7wM5ExAJp0oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwzL-0000000F0Sq-3ZH5;
	Mon, 20 Oct 2025 21:00:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwzK-0000000F0S6-2jR4
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 21:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D930062177;
	Mon, 20 Oct 2025 21:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100C0C113D0;
	Mon, 20 Oct 2025 21:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760994003;
	bh=/LZcJJRPVP3eFE1ecANAOSgixAXIk4StHRr4bpii2GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXaAfJlAW5OJIVavpJS9PVvzhr/gsU/4BsqEO61ogsn+/mc83QgqVMI/PaqdNlsw7
	 uHAtBWRkXlzkPR8c0GBH5jLr+FBRdZD4SO5wXAniJuV+fA8MHutaoRV5TxIcREvC+Q
	 GeWd80jSwayMO9L6qWN/XMNz5mrK3uhJLo9IB0e6JcWqnqSrMnTsxFzzEfYbO6fXnj
	 zkXPLBRdKqm4G5yhgLEFZ3X5eerk7KrxspQoH6BbalRvy6m6YELQgjMJc3cP97sP+A
	 zS77KUb/mPR+8JlGv5E8O5pIl2e2WFBXksZv3bPqj5LGRT75JJ/UU2AcFHOO2PU2Qh
	 euBeoY0R7wHXg==
Date: Mon, 20 Oct 2025 16:00:01 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	dlan@gentoo.org, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
Message-ID: <20251020210001.GA1764520-robh@kernel.org>
References: <20251017190740.306780-1-elder@riscstar.com>
 <20251017190740.306780-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017190740.306780-4-elder@riscstar.com>
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

On Fri, Oct 17, 2025 at 02:07:35PM -0500, Alex Elder wrote:
> Add the Device Tree binding for the PCIe root complex found on the
> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
> typically used to support a USB 3 port.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Remove the "num-viewport" property
>     - A "phy" reset is no longer required
> 
>  .../bindings/pci/spacemit,k1-pcie-host.yaml   | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> new file mode 100644
> index 0000000000000..89f8b6b579c6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 PCI Express Host Controller
> +
> +maintainers:
> +  - Alex Elder <elder@riscstar.com>
> +
> +description: >
> +  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys
> +  DesignWare PCIe IP.  The controller uses the DesignWare built-in
> +  MSI interrupt controller, and supports 256 MSIs.
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-pcie
> +
> +  reg:
> +    items:
> +      - description: DesignWare PCIe registers
> +      - description: ATU address space
> +      - description: PCIe configuration space
> +      - description: Link control registers
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: atu
> +      - const: config
> +      - const: link
> +
> +  spacemit,apmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      A phandle that refers to the APMU system controller, whose
> +      regmap is used in managing resets and link state, along with
> +      and offset of its reset control register.
> +    items:
> +      - items:
> +          - description: phandle to APMU system controller
> +          - description: register offset
> +
> +  clocks:
> +    items:
> +      - description: DWC PCIe Data Bus Interface (DBI) clock
> +      - description: DWC PCIe application AXI-bus master interface clock
> +      - description: DWC PCIe application AXI-bus slave interface clock
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
> +      - description: DWC PCIe application AXI-bus master interface reset
> +      - description: DWC PCIe application AXI-bus slave interface reset
> +
> +  reset-names:
> +    items:
> +      - const: dbi
> +      - const: mstr
> +      - const: slv
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt used for MSIs
> +
> +  interrupt-names:
> +    const: msi
> +
> +  phys:
> +    maxItems: 1
> +

> +  vpcie3v3-supply:
> +    description:
> +      A phandle for 3.3v regulator to use for PCIe
> +
> +  device_type:
> +    const: pci

Both of these are part of pci-bus-common.yaml and can be dropped from 
here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - spacemit,apmu

> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges

Always required by pci-bus-common.yaml. Drop.

> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - interrupts
> +  - interrupt-names
> +  - phys
> +  - vpcie3v3-supply

> +  - device_type

Always required by pci-bus-common.yaml. Drop.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
