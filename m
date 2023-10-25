Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE64DC25B47
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy7wPcNYR3MHA/sl57QzEHZUTUSLqrjEos/tsShSQBc=; b=j8gkwKpvQ4LsnG1sVIXJxWXeHu
	Eo4YF9c4TvjV8TePvFNM75PMFAs/wKrkK+sA5o0EtQhO09n6znqdqPv325AN4M0OG/40jRaePNOdY
	M5Ei8pRlW2CNLGfhFsOsqc+5VH/a1e8Mkts9Kl/JhtibCgl140h5SJJeUOqRMaOs9ErIITPebpWL4
	YNWk6jah2SMEB4v1Z4RGwXsWrjD1jc5viDqZX8s/7cPMX4EVK+0Mhs65npulIWdSMyxnqG/uHYNbn
	jajzPRXtFL6PGQZ/URDCm+vPCxQFRar2q/mehxR9TI2iNdDSYyxxUtq4qO2FlGPSXm25qvwcVZsH+
	65ISSnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbNQ-00C6NA-1r;
	Wed, 25 Oct 2023 10:44:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbNN-00C6MC-1h
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 10:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 332D262879;
	Wed, 25 Oct 2023 10:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFFDC433C7;
	Wed, 25 Oct 2023 10:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698230675;
	bh=vyk0CahGzySkr/MsVQ+N8DqDKAdjZsqHdysJQBMytWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnl2WGrck9vyls+v1/r84f9LIQsosvLH4r2KxtVDM5OH7kyN//PUTldPpyGUIWYvm
	 r0iA+g4hZAmrguqd0jC3XCIzsv1xs+iBVr1Wzd8qI4MaWPbLLYbrUKb9JxcnD0E+wT
	 FoqJDn8R2jaTY6DW04IoQHuXbDGYKhFURJw+zqd/rlGAMp1NUT/oqXg1h/+N0Qutk1
	 ZnsiRBTNBkEcOySqkd3w66AYMHetbeEZPq1eALaq81HvPuN5iT1ptLgYpJhHCHuBCF
	 j7dd4LTw1nT64nEsV0A3FCgGYy6fQWOk5LzC/U0Y5qNEebnLe4V3cthUv+tWxoUKZ+
	 wQHXAI63eJQAw==
Date: Wed, 25 Oct 2023 11:44:29 +0100
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
Subject: Re: [PATCH v9 14/20] PCI: microchip: Add get_events() callback
 function
Message-ID: <20231025-lizard-prideful-5223384b2c27@spud>
References: <20231020104341.63157-1-minda.chen@starfivetech.com>
 <20231020104341.63157-15-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231020104341.63157-15-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_034437_653724_BF65F1AC 
X-CRM114-Status: GOOD (  25.38  )
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
Content-Type: multipart/mixed; boundary="===============4280040476656978202=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4280040476656978202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VpcLYa4Kji2fW8zZ"
Content-Disposition: inline


--VpcLYa4Kji2fW8zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Oct 20, 2023 at 06:43:35PM +0800, Minda Chen wrote:
> PolarFire implements their own PCIe interrupts,
> which added to global PCIe field for PLDA lack of
> MSI controller, the interrupts to event num mapping
> is different to PLDA local interrupts. So add
> get_events() function pointer.

Just FYI, it's not the PLDA IP's lack of an MSI controller, it's the SoC
itself that doesn't have one. Last time I spoke to Daire about this, he
was surprised that you didn't need something similar. I might reword
this as

"PolarFire SoC implements its own PCIe interrupts, additional to the
regular PCIe interrupts, due to the lack of an MSI controller, so the
interrupt to event number mapping is different to the PLDA local
interrupts, necessitating a custom get_events() implementation."

> Also add struct plda_event_ops function pointer structure
> to struct plda_pcie_rp.

I'd probably also drop this, as it is evident from the diff.

Cheers,
Conor.

> plda_handle_events() will call the get_events() callback
> function pointer directly. For the robustness of codes,
> add checking in plda_init_interrupts().
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/plda/pcie-microchip-host.c | 14 +++++++++++++-
>  drivers/pci/controller/plda/pcie-plda.h           |  8 ++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index e57827bdb4b3..5a8c134bf643 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -652,7 +652,7 @@ static void plda_handle_event(struct irq_desc *desc)
> =20
>  	chained_irq_enter(chip, desc);
> =20
> -	events =3D mc_get_events(port);
> +	events =3D port->event_ops->get_events(port);
> =20
>  	for_each_set_bit(bit, &events, port->num_events)
>  		generic_handle_domain_irq(port->event_domain, bit);
> @@ -811,7 +811,12 @@ static int mc_request_event_irq(struct plda_pcie_rp =
*plda, int event_irq,
>  				0, event_cause[event].sym, plda);
>  }
> =20
> +static const struct plda_event_ops mc_event_ops =3D {
> +	.get_events =3D mc_get_events,
> +};
> +
>  static const struct plda_event mc_event =3D {
> +	.event_ops         =3D &mc_event_ops,
>  	.request_event_irq =3D mc_request_event_irq,
>  	.intx_event        =3D EVENT_LOCAL_PM_MSI_INT_INTX,
>  	.msi_event         =3D EVENT_LOCAL_PM_MSI_INT_MSI,
> @@ -925,6 +930,11 @@ static int plda_init_interrupts(struct platform_devi=
ce *pdev,
>  	int i, intx_irq, msi_irq, event_irq;
>  	int ret;
> =20
> +	if (!event->event_ops || !event->event_ops->get_events) {
> +		dev_err(dev, "no get events ops\n");
> +		return -EINVAL;
> +	}
> +
>  	ret =3D plda_pcie_init_irq_domains(port);
>  	if (ret) {
>  		dev_err(dev, "failed creating IRQ domains\n");
> @@ -935,6 +945,8 @@ static int plda_init_interrupts(struct platform_devic=
e *pdev,
>  	if (irq < 0)
>  		return -ENODEV;
> =20
> +	port->event_ops =3D event->event_ops;
> +
>  	for (i =3D 0; i < port->num_events; i++) {
>  		event_irq =3D irq_create_mapping(port->event_domain, i);
>  		if (!event_irq) {
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/contro=
ller/plda/pcie-plda.h
> index fba7343f9a96..df1729095952 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -102,6 +102,12 @@
>  #define EVENT_PM_MSI_INT_SYS_ERR		12
>  #define NUM_PLDA_EVENTS				13
> =20
> +struct plda_pcie_rp;
> +
> +struct plda_event_ops {
> +	u32 (*get_events)(struct plda_pcie_rp *pcie);
> +};
> +
>  struct plda_msi {
>  	struct mutex lock;		/* Protect used bitmap */
>  	struct irq_domain *msi_domain;
> @@ -117,11 +123,13 @@ struct plda_pcie_rp {
>  	struct irq_domain *event_domain;
>  	raw_spinlock_t lock;
>  	struct plda_msi msi;
> +	const struct plda_event_ops *event_ops;
>  	void __iomem *bridge_addr;
>  	int num_events;
>  };
> =20
>  struct plda_event {
> +	const struct plda_event_ops *event_ops;
>  	int (*request_event_irq)(struct plda_pcie_rp *pcie,
>  				 int event_irq, int event);
>  	int intx_event;
> --=20
> 2.17.1
>=20

--VpcLYa4Kji2fW8zZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTjxjQAKCRB4tDGHoIJi
0v/SAQDRiAXXqGRy9m/AUw9pj3sJr4ivAGBtz8KzxccyA+j95wEAocpvZFjhWPOm
nozItcTK51XJiZ8vx5gaY/QitcvM1AY=
=02nV
-----END PGP SIGNATURE-----

--VpcLYa4Kji2fW8zZ--


--===============4280040476656978202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4280040476656978202==--

