Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A279CCD1A7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 13:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Tz60xr4Vf12kKfxm2DniVANLq93dmqHdVz0QuWFkH0=; b=qtinDBX69sGx2G
	Z0s5mDsMWm+I53wcJK5RibjupfKQB7pFH+JGV8oyjMstYs103n2zphxqcUhbfQaC/fJCmrGdFC+ws
	ZYLGoOIEAMXf5kvYn88CnfkhVqlU5i6jwLwyDrgH8LTceCACGUHqNRIKXKyCz8+H2tYrxs25IYaUe
	oFbKolA96gdZxV3cBjT/U0f689lq9+11PqS5sek/Cgsk97uxqwjzzCMZHWMVy7Yiol+6QrP17U9tP
	maqfMw57N8QkeTknBlnGDKT6aR5VA9J9HYsJ8BHJ1Bwku7MZkz38r+6MSs05bsy3+BgUmjuuI2AQV
	vgXuBlJsb6XEFZycI0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCRU-0000000H9cj-2a9b;
	Tue, 21 Oct 2025 13:30:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCRR-0000000H9cF-1oHO
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 13:30:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D22224343D;
	Tue, 21 Oct 2025 13:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2ACC4CEF1;
	Tue, 21 Oct 2025 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761053420;
	bh=TYwNPmQgCPJl15/tu+lF46PWA2zAyxHpdfqlwEfJl4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrCDX60SgwFPULyfPpayppmJ0fqejs4Do7UsqATkShfhF5rxG1k4uEylrzMJm+m3B
	 1l688jkyk/D8vvN+0J1fS70ZtplBnD7m/I/eLqBJ1mCaNYoIW9Np7Q+/p4NEBekV4c
	 +D9gWhjlve317aEJdKadfeUwvydjCYfXsMNssAnL5q3ECMvINcKZW8poc5bO5oioT4
	 TE/n9HHwauOHVcE31U4zSyp8hmg2zM6RqXKViYYX8nq/pL+3ePslNhzfY4bK1jHtQ7
	 MOrTN4U3P0C07h+IgOj5nJMhJKYljKbxG+ESXMcFBVrwlOqu9gmfve50I89KsCxQ4C
	 zcE7dmx7mfG7A==
Date: Tue, 21 Oct 2025 08:30:18 -0500
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
Subject: Re: [PATCH v8 2/5] dt-bindings: PCI: Add Andes QiLai PCIe support
Message-ID: <20251021133018.GA13337-robh@kernel.org>
References: <20251014120349.656553-1-randolph@andestech.com>
 <20251014120349.656553-3-randolph@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014120349.656553-3-randolph@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_063022_517233_C8F6933A 
X-CRM114-Status: GOOD (  16.39  )
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

On Tue, Oct 14, 2025 at 08:03:46PM +0800, Randolph Lin wrote:
> Add the Andes QiLai PCIe node, which includes 3 Root Complexes.
> Only one example is required in the DTS bindings YAML file.
> 
> Signed-off-by: Randolph Lin <randolph@andestech.com>
> ---
>  .../bindings/pci/andestech,qilai-pcie.yaml    | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml b/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> new file mode 100644
> index 000000000000..ca444e4766ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> @@ -0,0 +1,84 @@
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

Drop the 2nd sentence as the schema says the same thing with the $ref.

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

interrupt-names:
  const: msi

> +
> +required:
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
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
> +      pcie@80000000 {
> +        compatible = "andestech,qilai-pcie";
> +        device_type = "pci";
> +        reg = <0x0 0x80000000 0x0 0x20000000>,
> +              <0x0 0x04000000 0x0 0x00001000>,
> +              <0x0 0x00000000 0x0 0x00010000>;
> +        reg-names = "dbi", "apb", "config";
> +
> +        linux,pci-domain = <0>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0x00 0x10000000 0x00 0x10000000 0x0 0xf0000000>,
> +                 <0x43000000 0x01 0x00000000 0x01 0x0000000 0x1f 0x00000000>;
> +
> +        #interrupt-cells = <1>;
> +        interrupts = <0xf>;
> +        interrupt-names = "msi";
> +        interrupt-parent = <&plic0>;
> +        interrupt-map-mask = <0 0 0 7>;
> +        interrupt-map = <0 0 0 1 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 2 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 3 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 4 &plic0 0xf IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +    };
> +...
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
