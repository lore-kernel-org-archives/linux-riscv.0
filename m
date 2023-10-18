Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ADDCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnxYcqKAWAGtggBwOqvRy3tNs1tO6mBE8BOEoPjQfEA=; b=vg00xhhzdfrypqdo+dRXMGCVgJ
	IE13xFUc2wCJg5qr4kbsMxf1hpwsfLRVkf7jr2G1LK2BUopJt8NpuY4J+GK2Do69nDoYLqIzRK5XU
	gMjpgcFtARM6Px1q3vQIZW8dlJkF/dbllQ6UV/RWx2Zgr/uEkJEpSwt3OZO8rpOTdTZyTrtlH1YLx
	6Vi317ekjZnco6dv2/Po1qCn2WKUALV3YHoPjGKU0neCB+wyZVqArmDMtY5l7cAwaqlpWzunRYtXi
	AaVzF2x3dNICGPdihgg1S/pyOjFSszrQP9XMEwgzBSau/qWlTPLtv/XZD1S3rvHneECoBjLae9JRt
	jsdgO5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3zq-00ESpU-04;
	Wed, 18 Oct 2023 10:41:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3zn-00ESoy-2h
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 10:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A75861780;
	Wed, 18 Oct 2023 10:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0F8C433C7;
	Wed, 18 Oct 2023 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697625706;
	bh=sFyrtrR928O5YNONsxuEouDQvRY8IpL62l5ARmvnQ5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDZtuWgWGHcT2MnvPBicnbXZWhpcKOcfBeGcN7UZvFCojB5gZBL4+6tMFkS5bvl0Q
	 RIEg5sn1xLTHy9FWx9oG/cAdbnMh9g9yYbPUsn4x0BRylUoCYhN9jK7RRy3ZgSDmWf
	 406RkW0ejGk0OmysreiA7xHA2pGRQGUz+frO4KXMZGrXbYQIDEaWvaPIno1HUa4QYd
	 9DFB5TSYWni6cEyjqgk7u36b9e1X1EM/c4wMDMHHD7laQNq771G7z6Srvdbqso2JEy
	 Ggtk1UqPEHbH6fnOuEq8AqIuCksCBVa6oEUq7Gj0ld2EJOd6bhHSp5n16q5d5lIcsI
	 SrmW+bCoO9HUg==
Date: Wed, 18 Oct 2023 11:41:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v8 06/22] PCI: microchip: Move PCIe host data structure
 to plda-pcie.h
Message-ID: <20231018-defender-moonlit-3d9a06faddcd@spud>
References: <20231011110514.107528-1-minda.chen@starfivetech.com>
 <20231011110514.107528-7-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231011110514.107528-7-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_034147_959639_B65612F9 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Type: multipart/mixed; boundary="===============5673716040458453071=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5673716040458453071==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ZHf5FLqtzeKhJjg"
Content-Disposition: inline


--+ZHf5FLqtzeKhJjg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 07:04:58PM +0800, Minda Chen wrote:
> Move the common data structures definition to head file for

nit: "to a header file so that these data structures"

> these data structure can be re-used.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 20 ------------------
>  drivers/pci/controller/plda/pcie-plda.h       | 21 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index 3dc4d4ca9d0c..261147a0a446 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -21,9 +21,6 @@
>  #include "../../pci.h"
>  #include "pcie-plda.h"
> =20
> -/* Number of MSI IRQs */
> -#define PLDA_MAX_NUM_MSI_IRQS			32
> -
>  /* PCIe Bridge Phy and Controller Phy offsets */
>  #define MC_PCIE1_BRIDGE_ADDR			0x00008000u
>  #define MC_PCIE1_CTRL_ADDR			0x0000a000u
> @@ -179,23 +176,6 @@ struct event_map {
>  	u32 event_bit;
>  };
> =20
> -struct plda_msi {
> -	struct mutex lock;		/* Protect used bitmap */
> -	struct irq_domain *msi_domain;
> -	struct irq_domain *dev_domain;
> -	u32 num_vectors;
> -	u64 vector_phy;
> -	DECLARE_BITMAP(used, PLDA_MAX_NUM_MSI_IRQS);
> -};
> -
> -struct plda_pcie_rp {
> -	struct device *dev;
> -	struct irq_domain *intx_domain;
> -	struct irq_domain *event_domain;
> -	raw_spinlock_t lock;
> -	struct plda_msi msi;
> -	void __iomem *bridge_addr;
> -};
> =20
>  struct mc_pcie {
>  	struct plda_pcie_rp plda;
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/contro=
ller/plda/pcie-plda.h
> index 727fc54312c9..363fcbbaf6ec 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -6,6 +6,9 @@
>  #ifndef _PCIE_PLDA_H
>  #define _PCIE_PLDA_H
> =20
> +/* Number of MSI IRQs */
> +#define PLDA_MAX_NUM_MSI_IRQS			32
> +
>  /* PCIe Bridge Phy Regs */
>  #define PCIE_PCI_IRQ_DW0			0xa8
>  #define  MSIX_CAP_MASK				BIT(31)
> @@ -99,4 +102,22 @@
>  #define EVENT_PM_MSI_INT_SYS_ERR		12
>  #define NUM_PLDA_EVENTS				13
> =20
> +struct plda_msi {
> +	struct mutex lock;		/* Protect used bitmap */
> +	struct irq_domain *msi_domain;
> +	struct irq_domain *dev_domain;
> +	u32 num_vectors;
> +	u64 vector_phy;
> +	DECLARE_BITMAP(used, PLDA_MAX_NUM_MSI_IRQS);
> +};
> +
> +struct plda_pcie_rp {
> +	struct device *dev;
> +	struct irq_domain *intx_domain;
> +	struct irq_domain *event_domain;
> +	raw_spinlock_t lock;
> +	struct plda_msi msi;
> +	void __iomem *bridge_addr;
> +};
> +
>  #endif
> --=20
> 2.17.1
>=20

--+ZHf5FLqtzeKhJjg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS+2ZAAKCRB4tDGHoIJi
0g8wAQDLfI6cKlLrcjsYvlotPgj0HcXfUcSgUawM+JMX+fAPQwD+MmEJIKAlAn6Q
BqFWTN4tAvjPd7jdT0K4YbncnvPBRw8=
=M+Mv
-----END PGP SIGNATURE-----

--+ZHf5FLqtzeKhJjg--


--===============5673716040458453071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5673716040458453071==--

