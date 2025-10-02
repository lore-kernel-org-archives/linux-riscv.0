Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23571CAC5BB
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 00:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmIv+7eWaoCKLl/LAqlFeOw343WqpdpntUUg5R/uypI=; b=3m+4R6sd6p1rQX
	g8eNkFTWIDtUu4msY2FwSTvOB/RwWlxEQmAqHlsd6aZWdKG2SAeKIoRfu1CT0agE17pExA8zfaOC6
	AmV7Pkgz0XveLRLjWTfxy8mjPv/ZI7jOe9dXx3hFryk1pYCpFDqgVDm1lwTnFVXxmtMYzj1KJaH6n
	c1FLuzJ0UvuuXVAjwGlFuwMeEKBRdBnicCCS/1F4MpJGAKC5ikxI3vmNPJE4td0RmWTz1tqIgYpSx
	4H4LkIpqlnqhUI9NGhHSJjfJrVqa2hZif/YoW6db1s+Ej5ZPdxrKqzLRZ8vcMKnc/qcXeVp6BxMnp
	s7+iOCTVnv8wsVmfXo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v476y-00000009JBE-3xFM;
	Thu, 02 Oct 2025 00:23:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v476x-00000009JAl-2wS6
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 00:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C81E0601A9;
	Thu,  2 Oct 2025 00:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D677C4CEF5;
	Thu,  2 Oct 2025 00:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759364634;
	bh=nLP9fhz32gTFEWdtwpsj7W9ND021HfhNxyofKluho6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVncy673Ouc6oDlymJrlJBYVllMJPVo9qRPxUCmt7wiJFH5+Sb4PBeeRmIbadcjMZ
	 IRNL+Qgm310d/brridU3WBuserJwTUDJGoPt48MemO+bxadoXwctLeWP2biFyIZQ9o
	 ds0+MUCbh4xckpMv72ksV0abLBftwcd4UUUiTAbvB5K8zhjLYZGIRb7mmzrNgB6xLU
	 LOZRu+h0k+mvsdGM1U14VjlD99qh7QKqHhr8/j4gVrkM0zP2AGxBK2gFuUhRctvhxg
	 4TKkPNahRkz1SuEyX1XyoBywuPGAOdRRW1DxuMgzZinlR5L+BXzkPHNE5dwzZxP5Dw
	 17rdW+LczJGXA==
Date: Wed, 1 Oct 2025 19:23:47 -0500
From: Rob Herring <robh@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
	palmer@dabbelt.com, paul.walmsley@sifive.com, ben717@andestech.com,
	inochiama@gmail.com, thippeswamy.havalige@amd.com,
	namcao@linutronix.de, shradha.t@samsung.com,
	randolph.sklin@gmail.com, tim609@andestech.com
Subject: Re: [PATCH v4 2/5] dt-bindings: PCI: Add Andes QiLai PCIe support
Message-ID: <20251002002347.GA2629882-robh@kernel.org>
References: <20250924112820.2003675-1-randolph@andestech.com>
 <20250924112820.2003675-3-randolph@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924112820.2003675-3-randolph@andestech.com>
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

On Wed, Sep 24, 2025 at 07:28:17PM +0800, Randolph Lin wrote:
> Add the Andes QiLai PCIe node, which includes 3 Root Complexes.
> Only one example is required in the DTS bindings YAML file.
> 
> Signed-off-by: Randolph Lin <randolph@andestech.com>
> ---
>  .../bindings/pci/andestech,qilai-pcie.yaml    | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml b/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> new file mode 100644
> index 000000000000..8effe6ebd9d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/andestech,qilai-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes QiLai PCIe host controller
> +
> +description: |+

Don't need '|+'.

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
> +        dma-ranges = <0x44 0x00000000 0x04 0x00000000 0x04 0x00000000>;
> +        ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x20000000>,
> +                 <0x00 0x04000000 0x00 0x04000000 0x00 0x00001000>,
> +                 <0x00 0x00000000 0x20 0x00000000 0x20 0x00000000>;

Drop ranges and dma-ranges. Not relevant to the example.

> +
> +        pci@80000000 {

pcie

> +          compatible = "andestech,qilai-pcie";
> +          device_type = "pci";
> +          reg = <0x0 0x80000000 0x0 0x20000000>,
> +                <0x0 0x04000000 0x0 0x00001000>,
> +                <0x0 0x00000000 0x0 0x00010000>;
> +          reg-names = "dbi", "apb", "config";
> +
> +          linux,pci-domain = <0>;
> +          bus-range = <0x0 0xff>;

You don't need this if 0-0xff is supported. That's the default.

> +          num-viewport = <4>;

Deprecated...

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
