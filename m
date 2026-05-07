Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3690CD343F
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYYcMRsw5yUUK0Q9aooEGyb08h6dxkTd17L8nxIeEkQ=; b=e7IYlU4x4F8H5Q
	3t4IMPi5waxO7RVhg4enIaxfZASYiTn3Cr+6IXRD/D0K9YGc3XBiSGzqQydCKGSnRZTUCecRgxKn4
	LNImtfxnuopQJh96UpT5zwpBcvqF+tYFyTnnN9WVDLWMm9W/wh5DStmP2zWpJzBiaYUOn7ekaPYIY
	FClbmYXev2NwdrhhzQnY4NvCHnRdgugnyq2BUUHBfCLDFh8A2Wk2lwQ7domw20SBnPgMNVb4zTek0
	PIMGuAKlK8TajHKZoX8Z2Zp+qcd2tJdQuyl6NdM7x0KhpwND08F16TMkJkx2JcaUEHC68PSbAG2MA
	0wk25iJWauuKThKudYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL49k-00000004gc2-2Gr6;
	Thu, 07 May 2026 19:13:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL49i-00000004gab-28pL
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 19:13:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9248F60181;
	Thu,  7 May 2026 19:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7A9C2BCB2;
	Thu,  7 May 2026 19:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778181185;
	bh=wryvf8h8saMxe/tJcVAN8lMbAU21FCA47IoyVg/yQ88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwTN2U7ORZdeCaNaxaUSr4neb9ESj0k6NNIQR360HUAN4dPJuj/2NR7QTGu+yzcwV
	 3QesyvlsNJ7RlTfQyJ8yFVT1D1PCrzRzO3eg38ekUO6lyk/KreWR6jlgfvgPL/HTIR
	 9m2WpzcIgl0L0Q11PBqP3pmIAIhV5YGBZYrKEitGK6m/TQVtjzdmU9xKrxtp79CyvP
	 xYc5MEGfRojNdD+zCIaKorIlYYwrYaMc9mz0R01kIdjMKX9ouIBKFGgcxik2671DgK
	 eaYoouGTPxeLo/dyd9F9zjdimTwozLoPHN5x6kUHl1Oy1JAF5qPOSZGhSJpFSJ0/xe
	 MgNuHeqHAzZbg==
Date: Thu, 7 May 2026 14:13:02 -0500
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: pci: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <20260507191302.GA2284447-robh@kernel.org>
References: <20260502101319.2364052-1-inochiama@gmail.com>
 <20260502101319.2364052-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260502101319.2364052-5-inochiama@gmail.com>
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

On Sat, May 02, 2026 at 06:13:17PM +0800, Inochi Amaoto wrote:
> Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> This controller is almost a standard Synopsys Designware PCIe IP,
> with some extra link and reset state control.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/pci/spacemit,k3-pcie-host.yaml   | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> new file mode 100644
> index 000000000000..be2641526b19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K3 PCI Express Host Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +description:
> +  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
> +  DesignWare PCIe IP.  The controller uses the external MSI interrupt
> +  controller.
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +
> +properties:
> +  compatible:
> +    const: spacemit,k3-pcie
> +
> +  reg:
> +    items:
> +      - description: DesignWare PCIe registers
> +      - description: Data Bus Interface (DBI) shadow registers
> +      - description: ATU address space
> +      - description: PCIe configuration space
> +      - description: Link control registers
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: dbi2
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
> +      - description: Interrupt used for port state
> +
> +  interrupt-names:
> +    const: app
> +
> +  msi-parent: true
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 6

You have to define what each entry is. I assume this is 1 per lane 
though I thought only a power of 2 number of lanes was valid.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
