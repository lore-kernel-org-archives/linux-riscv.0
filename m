Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8113BEDB7CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krOcmF9tovcf0fv6zu+B7kF/FhpuyXbJzZzrpFktHV0=; b=sxG1EbqGObPElX
	JfyqVpuijNjswaJsW4fPf00nK2J5ZRixvt0quaGtWszvQQ0GOFawzzAivZecZRh09icjsvArvqIzD
	Tw3KUKiklYGsd3sQQrcowV4aB+SMf5sg8CybM42dJanjh3Caw88NK//5Mudw+mzyNpMNme/99JV15
	ECk9PZaghTI6PlEfctcKZ9ROFlRhfczhuQgpEkPOPwOxZoWBRZIBDH4seb2Dt+hX/X6m9IjeGHh9F
	4xLjzx95IF48ag99/gDyqzXRcqxeRwuQthk3MvE2ax/savY8+NHhlFo5MPUkoNNUSsPBQ4l+xm9R9
	F+tVmwkiGprgY3aZojNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1Cw-000000066Ur-0IY1;
	Tue, 07 Apr 2026 07:50:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1Cv-000000066UO-099d
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 07:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BCF460128;
	Tue,  7 Apr 2026 07:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD90C116C6;
	Tue,  7 Apr 2026 07:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775548243;
	bh=V9L0KgtiKRhBAbkYtOsVEM62GU0dI0FGYEnsgKtc70Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPXw++5uE3nR3/HNEy5uVeVDsAFaPTiiKKqGHTjB4Rn22ReQsMHvGC/mi78bptaXw
	 w7SeJfUJy8pui3uEJLY+/QNbZsP8bBvrgvWvCsK42E4lU2+aKLFSS3LAZTWvE+yoLB
	 aiUFlPUSHLs6ydgC5O6V30QmiHiK5jQOeBeutcouIdNVlzoHD1QHVIieIj/B76z9r1
	 oGEfUQIlHyvebi3G8m4oOKTKbXJB3l5d0JarBHW9+bHIJWWir+kTIZJX8dVbilx3y8
	 4KJmzAFEJpRvi0mIV4d91tejY8s4mfl105Kz/Qqw1IPNo00G+tDNcmt4Cd3QHKkfsz
	 PC5YzSAe7r93w==
Date: Tue, 7 Apr 2026 09:50:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
Message-ID: <20260407-uptight-tody-of-weather-ae1e35@quoll>
References: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
 <20260407-ultrarisc-pcie-v2-3-2aa2a19a7fb3@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407-ultrarisc-pcie-v2-3-2aa2a19a7fb3@ultrarisc.com>
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

On Tue, Apr 07, 2026 at 10:40:54AM +0800, Jia Wang wrote:
> Add UltraRISC DP1000 SoC PCIe controller devicetree bindings.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/pci/ultrarisc,dp1000-pcie.yaml        | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml b/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
> new file mode 100644
> index 000000000000..d0517130e127
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/ultrarisc,dp1000-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC DP1000 PCIe Host Controller
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  UltraRISC DP1000 SoC PCIe host controller is based on the DesignWare PCIe IP.
> +  This binding describes the UltraRISC specific extensions to the base
> +  DesignWare PCIe binding.

Drop sentence. Do not describe in description what the binding
describes. It's circular / repetitive. Just describe that.

> +
> +maintainers:
> +  - Xincheng Zhang <zhangxincheng@ultrarisc.com>
> +  - Jia Wang <wangjia@ultrarisc.com>
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +
> +properties:
> +  compatible:
> +    const: ultrarisc,dp1000-pcie
> +
> +  reg:
> +    items:
> +      - description: Data Bus Interface (DBI) registers.
> +      - description: PCIe configuration space region.
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: config
> +
> +  num-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [4, 16]
> +    description: Number of lanes to use.
> +
> +  max-link-speed:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 4

If const then deducible from the compatible. Drop the property.

> +    description: Maximum PCIe link speed supported.
> +
> +  interrupts:
> +    description: List of interrupt specifiers used by the controller

Drop description. Obvious.

> +    items:
> +      - description: MSI interrupt
> +      - description: Legacy INTA interrupt
> +      - description: Legacy INTB interrupt
> +      - description: Legacy INTC interrupt
> +      - description: Legacy INTD interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: msi
> +      - const: inta
> +      - const: intb
> +      - const: intc
> +      - const: intd
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      pcie_x16: pcie@21000000 {

Drop unused label

> +        compatible = "ultrarisc,dp1000-pcie";

reg, names and ranges go here. Please follow DTS coding style.

> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        #interrupt-cells = <1>;
> +        reg = <0x0 0x21000000 0x0 0x01000000>,
> +              <0x0 0x4fff0000 0x0 0x00010000>;
> +        reg-names = "dbi", "config";
> +        device_type = "pci";
> +        dma-coherent;
> +        bus-range = <0x0 0xff>;
> +        num-lanes = <16>;
> +        ranges = <0x81000000  0x0 0x4fbf0000  0x0 0x4fbf0000  0x0 0x00400000>,
> +                 <0x82000000  0x0 0x40000000  0x0 0x40000000  0x0 0x0fbf0000>,
> +                 <0xc3000000 0x40 0x00000000 0x40 0x00000000  0xd 0x00000000>;
> +
> +        max-link-speed = <4>;

Drop, compatible defines this.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
