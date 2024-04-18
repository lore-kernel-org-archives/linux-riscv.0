Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138B6C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww3JSPtAnZBT/u84KfpK3V4ONgkIjxpsqH8yv5OKWd4=; b=YLBWQgHHH3Bte61pzExCTNvlNj
	eWysSuT486cdDcS6ptNtVCA1YjDv9bvPeVIa1RRSSrNZTc/lvGLpaU9PbWIp7loAHjDMEH0yGnNFQ
	yynJhkvI2q0hnRVGa8Lt11KXJH6I/VoA2g/fYTdh210harzbDMcNecfE49Wszyd+bjKreWoY3WFY8
	jWpYHA2d5uC47wEfDstZzwewLl51MbzM77O9RoZMqo8OrUu1W3XQEsqLwEQ4LyYGWgs+OjZKeFnqx
	/AeGl4YWwUiSDqtFlrLAvBgNeaf/JHpFYD2k8sfya2YcZDFPEC3d/vo/Y76Ih4rRnwTGcxA2A8/9w
	61BMV53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVBH-000000038Xy-45nN;
	Thu, 18 Apr 2024 17:04:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVBE-000000038XQ-0bUY
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 17:04:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3EA70CE18AA;
	Thu, 18 Apr 2024 17:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FC4C113CC;
	Thu, 18 Apr 2024 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713459849;
	bh=+tpRTJtsOFRM7YQSk7tL2XGyEcaVFk2CAaRZfgRJnUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQMnnnfSBVUOkNmpDuqpanPgIdPXohtKKPOIs8QK66pW4vJF8MQEPEq5/TUf17sTm
	 YakEmENtf9PxeIL9CSNhGp3C4EtF80Um2m5hh77C5bJUYSs4Zz9174vsy6guICe8DM
	 TiHKlu2dPN5vERV2YsU8PrcUdxN+RpYdigWS94PwI/uUPA0i7VIaKlhmzT6jl6SQdz
	 fUdyYrV8M3ylSy3NPrZlGxMPcpjTMIRhWO4j8XC+PkKcEU0RJBOgUUT6CiPvwmkKDF
	 Kcdbx0VzPVsVz6A6A76A1w6ClOQD6GvVgunRf7gThzj04fQMs50F48O4h80Km4dEVw
	 ErA3uwJndDYlA==
Date: Thu, 18 Apr 2024 18:04:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: iommu: riscv: Add bindings for
 RISC-V IOMMU
Message-ID: <20240418-approach-liquefy-04551ddefbc4@spud>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <c37cb93e7baa7042a3f82130bf30be6831b558dc.1713456598.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <c37cb93e7baa7042a3f82130bf30be6831b558dc.1713456598.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_100412_660416_4C57B612 
X-CRM114-Status: GOOD (  23.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1543551629861255251=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1543551629861255251==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Rqk2Fw9rLZ9f77fo"
Content-Disposition: inline


--Rqk2Fw9rLZ9f77fo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 09:32:19AM -0700, Tomasz Jeznach wrote:
> Add bindings for the RISC-V IOMMU device drivers.
>=20
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>  .../bindings/iommu/riscv,iommu.yaml           | 149 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/D=
ocumentation/devicetree/bindings/iommu/riscv,iommu.yaml
> new file mode 100644
> index 000000000000..d6522ddd43fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/riscv,iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V IOMMU Architecture Implementation
> +
> +maintainers:
> +  - Tomasz Jeznach <tjeznach@rivosinc.com>
> +
> +description: |+

FYI, the + here is probably not needed.

> +  The RISC-V IOMMU provides memory address translation and isolation for
> +  input and output devices, supporting per-device translation context,
> +  shared process address spaces including the ATS and PRI components of
> +  the PCIe specification, two stage address translation and MSI remappin=
g.
> +  It supports identical translation table format to the RISC-V address
> +  translation tables with page level access and protection attributes.
> +  Hardware uses in-memory command and fault reporting queues with wired
> +  interrupt or MSI notifications.
> +
> +  Visit https://github.com/riscv-non-isa/riscv-iommu for more details.
> +
> +  For information on assigning RISC-V IOMMU to its peripheral devices,
> +  see generic IOMMU bindings.
> +
> +properties:
> +  # For PCIe IOMMU hardware compatible property should contain the vendor
> +  # and device ID according to the PCI Bus Binding specification.
> +  # Since PCI provides built-in identification methods, compatible is not
> +  # actually required. For non-PCIe hardware implementations 'riscv,iomm=
u'
> +  # should be specified along with 'reg' property providing MMIO locatio=
n.

I dunno, I'd like to see soc-specific compatibles for implementations of
the RISC-V IOMMU. If you need a DT compatible for use in QEMU, I'd
suggest doing what was done for the aplic and having a dedicated
compatible for that and disallow having "riscv,iommu" in isolation.

> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: riscv,pci-iommu
> +          - const: pci1efd,edf1
> +      - items:
> +          - const: pci1efd,edf1

Why are both versions allowed? If the former is more understandable,
can't we just go with that?

> +      - items:
> +          - const: riscv,iommu

Other than the compatible setup I think this is pretty decent though,
Conor.

--Rqk2Fw9rLZ9f77fo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiFSgwAKCRB4tDGHoIJi
0l8lAQDVxpOYtqJ5N0VIeqSL5joovSdzpNunYGgrbV4XSnS+VAD/RSNSV7cgp+VK
l9sXMIW7ys3Wzwv8/1/vz3UBCbiDuAo=
=r1Kq
-----END PGP SIGNATURE-----

--Rqk2Fw9rLZ9f77fo--


--===============1543551629861255251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1543551629861255251==--

