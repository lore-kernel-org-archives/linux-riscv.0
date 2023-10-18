Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE35CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggUUDTsnc77IOg63gPohSznfiPnF95rSBMI0KiVLam8=; b=xGLw2Rd1cBX7Eq1aqL0sSwGWpA
	avYEskwLPYoOmOTMdQoxMVZW62NdHK8KR6q93PjNkdTCeGCqDx7XYhR4rWyfO67Yf2hnVQ8E2MTpV
	6gygjr00k9LGxS/+n0U4leDB48Q5GTR2qTCVkoOwk2niL1gtONrSJM/gdldSEC5FqSiljuwwHCtL2
	G+7K3obVgwHKTnmrTyPpPe3n9g6V6JMzx/wMg8C1jHUsuzs0Gr440zTgP6lRXekgILnZlcH/TyvJb
	ptcG1lueMIuo9KdEjICZP9sdSKMeNfBcJzVwAZ4fUTarQv3hTHgjVxw+Vjy+1KkyqgJVY/WFNIT/l
	B6rLsXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3y3-00ESdJ-09;
	Wed, 18 Oct 2023 10:39:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3y0-00EScj-28
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 10:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 854726176E;
	Wed, 18 Oct 2023 10:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8849EC433C7;
	Wed, 18 Oct 2023 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697625595;
	bh=j11DdRa2L1dUqtW3EelcXbCkjO9B0hcjr/Wwlj3hR5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9tV+RiXbptKtQxPEmVdAhDVccVnZYa61THs9AEXN5z7ObVtzEwWBniJCqpCJElFp
	 D05IfxoqWDDgya2gv9o7kMwqx9BnhtMtUH4fzoczgdiXKlPFkEubBcLC45RW1C+76X
	 vB+NgZqBrkOozxfhKQZz7HG8wNNxQJ1TXY8xloY+jhWGFFPs1FVF26QzDPfbvNhfiT
	 +NQ51muc0kiWZN7F7dJ3HN1by7U/o47onOc99xqQ8YBNyEo1XlB8vye6TEcKF3/E76
	 Vl+2ne0+DNTf+bhvWtOD9Dgp3iPG0wURSTyXbdsOKBzOkvMHhQjovB0NeMtz9Z7gGA
	 YMJMHV3IBgCRw==
Date: Wed, 18 Oct 2023 11:39:49 +0100
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
Subject: Re: [PATCH v8 04/22] PCI: microchip: Add bridge_addr field to struct
 mc_pcie
Message-ID: <20231018-prefix-algebra-972f3e33b165@spud>
References: <20231011110514.107528-1-minda.chen@starfivetech.com>
 <20231011110514.107528-5-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231011110514.107528-5-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_033956_802366_2A60F065 
X-CRM114-Status: GOOD (  18.24  )
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
Content-Type: multipart/mixed; boundary="===============9032924865099978065=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9032924865099978065==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qCrH5eub/BoEPs+2"
Content-Disposition: inline


--qCrH5eub/BoEPs+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 07:04:56PM +0800, Minda Chen wrote:
> For bridge address base is common PLDA field, Add this
> to struct mc_pcie first.
>=20
> INTx and MSI codes interrupts codes will get the bridge base
> address from port->bridge_addr. For these codes will be
> changed to common codes. axi_base_addr is Microchip its own
> data.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 23 ++++++++-----------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index a34ec6aad4be..60870ee1f1c9 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -195,6 +195,7 @@ struct mc_pcie {
>  	struct irq_domain *event_domain;
>  	raw_spinlock_t lock;
>  	struct mc_msi msi;
> +	void __iomem *bridge_addr;
>  };
> =20
>  struct cause {
> @@ -339,8 +340,7 @@ static void mc_handle_msi(struct irq_desc *desc)
>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>  	struct device *dev =3D port->dev;
>  	struct mc_msi *msi =3D &port->msi;
> -	void __iomem *bridge_base_addr =3D
> -		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	void __iomem *bridge_base_addr =3D port->bridge_addr;
>  	unsigned long status;
>  	u32 bit;
>  	int ret;
> @@ -365,8 +365,7 @@ static void mc_handle_msi(struct irq_desc *desc)
>  static void mc_msi_bottom_irq_ack(struct irq_data *data)
>  {
>  	struct mc_pcie *port =3D irq_data_get_irq_chip_data(data);
> -	void __iomem *bridge_base_addr =3D
> -		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	void __iomem *bridge_base_addr =3D port->bridge_addr;
>  	u32 bitpos =3D data->hwirq;
> =20
>  	writel_relaxed(BIT(bitpos), bridge_base_addr + ISTATUS_MSI);
> @@ -488,8 +487,7 @@ static void mc_handle_intx(struct irq_desc *desc)
>  	struct mc_pcie *port =3D irq_desc_get_handler_data(desc);
>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>  	struct device *dev =3D port->dev;
> -	void __iomem *bridge_base_addr =3D
> -		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	void __iomem *bridge_base_addr =3D port->bridge_addr;
>  	unsigned long status;
>  	u32 bit;
>  	int ret;
> @@ -514,8 +512,7 @@ static void mc_handle_intx(struct irq_desc *desc)
>  static void mc_ack_intx_irq(struct irq_data *data)
>  {
>  	struct mc_pcie *port =3D irq_data_get_irq_chip_data(data);
> -	void __iomem *bridge_base_addr =3D
> -		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	void __iomem *bridge_base_addr =3D port->bridge_addr;
>  	u32 mask =3D BIT(data->hwirq + PM_MSI_INT_INTX_SHIFT);
> =20
>  	writel_relaxed(mask, bridge_base_addr + ISTATUS_LOCAL);
> @@ -524,8 +521,7 @@ static void mc_ack_intx_irq(struct irq_data *data)
>  static void mc_mask_intx_irq(struct irq_data *data)
>  {
>  	struct mc_pcie *port =3D irq_data_get_irq_chip_data(data);
> -	void __iomem *bridge_base_addr =3D
> -		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	void __iomem *bridge_base_addr =3D port->bridge_addr;
>  	unsigned long flags;
>  	u32 mask =3D BIT(data->hwirq + PM_MSI_INT_INTX_SHIFT);
>  	u32 val;
> @@ -540,8 +536,7 @@ static void mc_mask_intx_irq(struct irq_data *data)
>  static void mc_unmask_intx_irq(struct irq_data *data)
>  {
>  	struct mc_pcie *port =3D irq_data_get_irq_chip_data(data);
> -	void __iomem *bridge_base_addr =3D
> -		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	void __iomem *bridge_base_addr =3D port->bridge_addr;
>  	unsigned long flags;
>  	u32 mask =3D BIT(data->hwirq + PM_MSI_INT_INTX_SHIFT);
>  	u32 val;
> @@ -896,8 +891,7 @@ static void mc_pcie_setup_window(void __iomem *bridge=
_base_addr, u32 index,
>  static int mc_pcie_setup_windows(struct platform_device *pdev,
>  				 struct mc_pcie *port)
>  {
> -	void __iomem *bridge_base_addr =3D
> -		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	void __iomem *bridge_base_addr =3D port->bridge_addr;
>  	struct pci_host_bridge *bridge =3D platform_get_drvdata(pdev);
>  	struct resource_entry *entry;
>  	u64 pci_addr;
> @@ -1081,6 +1075,7 @@ static int mc_host_probe(struct platform_device *pd=
ev)
>  	mc_disable_interrupts(port);
> =20
>  	bridge_base_addr =3D port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	port->bridge_addr =3D bridge_base_addr;
> =20
>  	/* Allow enabling MSI by disabling MSI-X */
>  	val =3D readl(bridge_base_addr + PCIE_PCI_IRQ_DW0);
> --=20
> 2.17.1
>=20
>=20

--qCrH5eub/BoEPs+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS+13wAKCRB4tDGHoIJi
0scjAQDhrkZUunucMZI0RXCT/PVHRPxjeaEj5Btpn50y+TDCHAD9EkOlHuKnIDOA
jsXGsg7DnuvYG5LslZ9g0LO1/2MAXwc=
=VpnB
-----END PGP SIGNATURE-----

--qCrH5eub/BoEPs+2--


--===============9032924865099978065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9032924865099978065==--

