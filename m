Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9596ECCF9F0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 00:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7M95R2WE5xkFyefytYyajRmApIDQ7IVOtIWQyLx2bEY=; b=NKGiHrZZAfBbql
	pu4cJOHGpuMzb5osZkW0ZyykuOS8khbJJeZjxIWX9UA1ZD2+d3dVGGFBDFD423G1ne4RyIaXp7w0j
	3XJD9znz8vDnrxFHeYEEmjnzbSzaSHZBrvRHw4uiZFIRg/aMGAAwSf/QYxua0iBl4pApLDmuM0p11
	A0++Iz8yT2+1Ydwo1+XLAGiAZ9x/PI8FgTQvLeqirSYahWmbffhxOf2KSypA53MLw4ZG8M7vfKUqk
	rco8Wy3xCePBULZ6WE9QgUJVavJnCa49yM2/iiPFqKUkCTQE93wKoCR+HPYvcG87OHtF4EEtghWzC
	WNCQi1sdKe5Pu77MP7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdTj-00000005Cw3-1qEZ;
	Fri, 31 Oct 2025 00:58:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdTf-00000005Cve-2cLt
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 00:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F7FF44BF8;
	Fri, 31 Oct 2025 00:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DD7C4CEF1;
	Fri, 31 Oct 2025 00:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761872330;
	bh=dZXI+oZRfP0rR7K4/bP1MqGbDMPf4gEQFxOrKrsv6OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/HU3a2mhbVziJUtzHmXZzdjh5QOrPCUZ7utnBrU2gidZ/OA1iOQMiJVlzmNYHDSx
	 6v4tCSZk0ybeKwAEAIDvPv2kbZ+XcM6sGVdInqoi0Fklfj84aJQNivzQnpNBVS/OBf
	 FbtsGjbcOYuZKY6TkHzhvCu0EdQ6Z5dzVvgXiIa/JwbCLYDrZXAn3zkQDdPXeLjEkf
	 YWNjk3mDWKyWPJfXGfaX5dvUOegQa+vObESs73ndlyKliMeS0/2E2UmXz9pJlOPz02
	 QtNxOaQUHGikyZ5EuTogPfInOiWsn7nVkjRtd9FXim7DagIlxnNEdGqTr5EHqn8zy2
	 B8OwCq+hhLdNg==
Date: Thu, 30 Oct 2025 19:58:46 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	dlan@gentoo.org, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
Message-ID: <20251031005718.GA539812-robh@kernel.org>
References: <20251030220259.1063792-1-elder@riscstar.com>
 <20251030220259.1063792-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030220259.1063792-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_175851_753826_BE746015 
X-CRM114-Status: GOOD (  18.26  )
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

On Thu, Oct 30, 2025 at 05:02:54PM -0500, Alex Elder wrote:
> Add the Device Tree binding for the PCIe root complex found on the
> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
> typically used to support a USB 3 port.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++++++++++++++++
>  1 file changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> new file mode 100644
> index 0000000000000..58239a155ecc0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> @@ -0,0 +1,157 @@
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

Wrap lines at 80.

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
> +patternProperties:
> +  '^pcie?@':

It's always PCIe, so drop the '?'.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
