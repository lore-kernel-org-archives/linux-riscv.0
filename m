Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3443BCAC5B8
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 18:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YikKHTinUESK6qA2F0usCdXPTPqvk+RWLSSEOZDlPAU=; b=V0SIYwlayppXLj
	oAvCNdP02rQY3SCrGxnl/jMWPgvvergLBr3E5HCbTjnjwOtkJHA12YkzGPzG+c84L5v3tQTVFcYs1
	TAUWSPVaScjduTXExW/BY5K8QCj0BwC4ydAVjxJVPQkg4GWyftVtGNYMidKTTUjIBrWA4B8CuTkh8
	t4ZOQv8N82kYG5xqMnH5dqI7jw8snVgjF8I2E6bMsbS9sgNr4IMq+CLhblbnfV6PoCwdmim6sriie
	4O/Pj3sf5NQygYg8YGotPz5nEEBdiRiugE2Xg7y+gk2jfn1AkcWxOXsGdt+Y4zVY1wqWiQWdbL6kP
	fD6MmPA0ZxfMdWcw+Qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5qJl-00000000ci0-0PaB;
	Mon, 06 Oct 2025 18:52:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5qJj-00000000chg-14DV
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 18:52:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F37A4514C;
	Mon,  6 Oct 2025 18:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F48C4CEF5;
	Mon,  6 Oct 2025 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759776734;
	bh=ZWvIVGXtiM/1nsG2Z8koPrcNspjPo3e9IYnBwDXQV30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQr/WvAh+y+d0RJDvIqzaEvsC4+YqkpNRMZegn/9RhfuEcXIP6vbZ2lCb3vhMACbv
	 SbnNR3Zi8ly3zOl0WSV0C2aIWTKEImCE2awKQfcOc23+bRjW/F5KrZpkRD1vErunSF
	 okbn6i9YHOzA+dMm3dQVE8km3I9EpbAcnB+Ys7BptD8Ku9sVRbwDG37QBs20F2Zu2N
	 +2OAy063JaSuqbW6dXkezvxfSujipaTFr5jR7crcFntRQI5pD5b5B6LuKz0enfW7hz
	 Ey7Y94ARuIdrWNtG47GlzfclMUmYmJ5taDoIK3UlOOVOThML9BM5gsCXmxJTUbOtti
	 t/Y7HONM29MvA==
Date: Mon, 6 Oct 2025 13:52:13 -0500
From: Rob Herring <robh@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
	palmer@dabbelt.com, paul.walmsley@sifive.com, ben717@andestech.com,
	inochiama@gmail.com, thippeswamy.havalige@amd.com,
	namcao@linutronix.de, shradha.t@samsung.com, pjw@kernel.org,
	randolph.sklin@gmail.com, tim609@andestech.com
Subject: Re: [PATCH v6 2/5] dt-bindings: PCI: Add Andes QiLai PCIe support
Message-ID: <20251006185213.GA61386-robh@kernel.org>
References: <20251003023527.3284787-1-randolph@andestech.com>
 <20251003023527.3284787-3-randolph@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251003023527.3284787-3-randolph@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_115215_337619_F3427300 
X-CRM114-Status: GOOD (  16.87  )
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

On Fri, Oct 03, 2025 at 10:35:24AM +0800, Randolph Lin wrote:
> Add the Andes QiLai PCIe node, which includes 3 Root Complexes.
> Only one example is required in the DTS bindings YAML file.
> 
> Signed-off-by: Randolph Lin <randolph@andestech.com>
> ---
>  .../bindings/pci/andestech,qilai-pcie.yaml    | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml b/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> new file mode 100644
> index 000000000000..419468430e7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/andestech,qilai-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes QiLai PCIe host controller
> +
> +description:
> +  Andes QiLai PCIe host controller is based on the Synopsys DesignWare
> +  PCI core. It shares common features with the PCIe DesignWare core and
> +  inherits common properties defined in
> +  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml.
> +
> +maintainers:
> +  - Randolph Lin <randolph@andestech.com>
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +
> +properties:
> +  compatible:
> +    const: andestech,qilai-pcie
> +
> +  reg:
> +    items:
> +      - description: Data Bus Interface (DBI) registers.
> +      - description: APB registers.
> +      - description: PCIe configuration space region.
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: apb
> +      - const: config
> +
> +  ranges:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 1

You can drop this. #interrupt-cells is already defined in 
pci-bus-common.yaml.

> +
> +  interrupt-map: true
> +
> +required:
> +  - reg
> +  - reg-names
> +  - "#interrupt-cells"
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-map-mask
> +  - interrupt-map
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      bus@80000000 {
> +        compatible = "simple-bus";
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Drop this node. No reason to show "simple-bus" in this example. Also it 
fails checks:

Documentation/devicetree/bindings/pci/andestech,qilai-pcie.example.dts:30.24-59.13: Warning (unit_address_vs_reg): /example-0/soc/bus@80000000: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.example.dtb: bus@80000000 (simple-bus): 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

> +
> +        pcie@80000000 {
> +          compatible = "andestech,qilai-pcie";
> +          device_type = "pci";
> +          reg = <0x0 0x80000000 0x0 0x20000000>,
> +                <0x0 0x04000000 0x0 0x00001000>,
> +                <0x0 0x00000000 0x0 0x00010000>;
> +          reg-names = "dbi", "apb", "config";
> +
> +          linux,pci-domain = <0>;
> +          #address-cells = <3>;
> +          #size-cells = <2>;
> +          ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x0 0xf0000000>,
> +                   <0x43000000 0x01 0x00000000 0x01 0x0000000 0x1f 0x00000000>;
> +
> +          #interrupt-cells = <1>;
> +          interrupts = <0xf>;
> +          interrupt-names = "msi";
> +          interrupt-parent = <&plic0>;
> +          interrupt-map-mask = <0 0 0 7>;
> +          interrupt-map = <0 0 0 1 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
> +                          <0 0 0 2 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
> +                          <0 0 0 3 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
> +                          <0 0 0 4 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +      };
> +    };
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
