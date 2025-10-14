Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668D1CCD183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 01:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAelIEHeyRjifIuh0hTOmMAwgsiN6HvxdOgTFSaXjWg=; b=s6DDeW218lRWUY
	D4uptGdOx3+ir+aYlxsKQX7p2a7eXiw+ay/g7+2Jc18i7XxVfVHU/OcLYx/RI0tRvvFDSf1oVll+H
	drTXEe9zjM16udCZTrOe7Z7ltka/h3BjIw5j/WX7jnCfuzIwPnWHhUXoU1GqUX0XUNy8reLU6M2gV
	bYkqUXP4Sctg79DuTJYO9wZoZQziEi5+ZPHd8CBbo17YYiUAS3s9eTgm+KTe85wzerdiMIAsVle1E
	W45pL3htgeikRVRRRkdq2GJMZBiAk3M7drPueCGv0tFz14g2pXMlkgZ2isD70cb4ZPbngFD28lFBs
	KYu8C8NzeMzLNWEO3wrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UGf-0000000EvdX-2Lzw;
	Tue, 14 Oct 2025 01:56:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UGc-0000000Evcl-1sM3;
	Tue, 14 Oct 2025 01:56:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2318725CB6;
	Tue, 14 Oct 2025 03:55:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkLoRsdbueVj; Tue, 14 Oct 2025 03:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760406953; bh=0mh4xG7+M6ggnaXpSXp8eTqz5OBYvKU3WBQiQrvVGBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFXrCGwe3S+r7Iu59V4RRMK+8KqNdYf0Y1nCPBYRaS1Uxs9cSz65LUhlVF+z7jlNf
	 anxe9TPPc16H06SRqR/iygEsRqJ2nrCteSSXVgVQ47fvwY9JTogktvvpOFWMxcyljr
	 J1OB1TRF6C0XRqrh5PMijvbKMuX9oD/Ha6BfleDrn9qD6diUFHkA8gRmWsXR0MFD0l
	 NtafMOB9EPDHsxkgxWZD5JOKVvEnO/4Qk2LqdMmSwCw2Wu330kDf4pV22+jEco4hAL
	 RZtHkuSBQ7p+VPvG3ksOXSpCJp+x8Z8u1WreE/R42/3sQO1T/f8yB2VpEvsuBtNuLV
	 IlHR9m6sjEGKw==
Date: Tue, 14 Oct 2025 01:55:28 +0000
From: Yao Zi <ziyao@disroot.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bhelgaas@google.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org, guodong@riscstar.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, christian.bruel@foss.st.com,
	shradha.t@samsung.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, namcao@linutronix.de,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
Message-ID: <aO2tkGSUTYssSaVf@pie>
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251013153526.2276556-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_185558_925293_F126458E 
X-CRM114-Status: GOOD (  19.17  )
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

On Mon, Oct 13, 2025 at 10:35:20AM -0500, Alex Elder wrote:
> Add the Device Tree binding for the PCIe root complex found on the
> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
> typically used to support a USB 3 port.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - Renamed the binding, using "host controller"
>     - Added '>' to the description, and reworded it a bit
>     - Added reference to /schemas/pci/snps,dw-pcie.yaml
>     - Fixed and renamed the compatible string
>     - Renamed the PMU property, and fixed its description
>     - Consistently omit the period at the end of descriptions
>     - Renamed the "global" clock to be "phy"
>     - Use interrupts rather than interrupts-extended, and name the
>       one interrupt "msi" to make clear its purpose
>     - Added a vpcie3v3-supply property
>     - Dropped the max-link-speed property
>     - Changed additionalProperties to unevaluatedProperties
>     - Dropped the label and status property from the example
> 
>  .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> new file mode 100644
> index 0000000000000..87745d49c53a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> @@ -0,0 +1,156 @@
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

...

> +  num-viewport:
> +    const: 8

This property has been deprecated for a long time, and the driver now
detects viewports at runtime since commit 281f1f99cf3a (PCI: dwc: Detect
number of iATU windows, 2020-11-05), IOW, it makes no effect with the
current mainline DWC PCIe driver. Is it really necessary?

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
