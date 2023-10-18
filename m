Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB684CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDeqU1V5lt04GPptP8yTdRgaDd4YJwBkqtpa7Zq+1w0=; b=zJ7Cb/wOzVc3vJCZtGVQVUlj6N
	SRxBe035ql6fJJLTFjvBm9CMCBB3wZn/DnCtXI850sNRS+3VzoErukLukqdWnvAY20WZkDwNsMP+s
	wDe8TG01HoooLaAZLPvBCSV6jX8RbejMo8U1TuTotAyHgdvebqf86coqs8kBycZ1aMiicFveYK6+G
	EFEHTyMVQeeFr1oawwQnyALTC6jhuo1IGYUAiuPFnKQOdixhNPDMXLDJslKogX60sjYufNxbg4Hf2
	xW68kqitn1ZIaOpRVKoxgMSl6sqiGiHR4SdA2aD13RXXA69v+3MsELt6SMglV47/SK/BevgDPscGJ
	yjg7l2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4lV-00EYWU-1s;
	Wed, 18 Oct 2023 11:31:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4lT-00EYVb-10
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:31:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A473617B4;
	Wed, 18 Oct 2023 11:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B421DC433BA;
	Wed, 18 Oct 2023 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697628662;
	bh=2a3fF360HQENIx57U7Wbr+82JHRHzTNfIBguTuTew0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hO7SQdvI1JxwSmUngjOaS4yakSuhGvtWB6tzEVexM7TNSgntP6UcvUTUerAeqBBW5
	 H3p7HpIbJWPb54PjGdwY2HcubMDAunf+3AoJ46P9bifevmiPMe0AKpvldc2zVrU0iG
	 xqBxGUNf4OkyBCp8bPD0ZrvglNjU60SKPblgaqrY4rHw2g2vL2re0M3MFOs+56Y76/
	 OUTduFs351QSnEqOFENB/S0n4tIZDa4xo81KQN/pQWW3Dq8u3r4s2Fvb8+pEe+0lvq
	 r10U7elHuk4IB5eP9mZJ40FKuFpXmzM3UiH/0lC+CVRqHp4ScXL4WXoZrrj/zSDcla
	 aHE4S5t7K3nvg==
Date: Wed, 18 Oct 2023 12:30:56 +0100
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
Subject: Re: [PATCH v8 16/22] PCI: microchip: Add event IRQ domain ops to
 struct plda_event
Message-ID: <20231018-worrier-sizably-b13023f54b36@spud>
References: <20231011110514.107528-1-minda.chen@starfivetech.com>
 <20231011110514.107528-17-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231011110514.107528-17-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043103_433063_C879D636 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Type: multipart/mixed; boundary="===============0989170634994468022=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0989170634994468022==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="58kJN2dw4v2LbZBq"
Content-Disposition: inline


--58kJN2dw4v2LbZBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 07:05:08PM +0800, Minda Chen wrote:
> PolarFire Implements none-PLDA event interrupts. So the whole event
> domain ops can not be re-used.

IIRC, the reason things are like this is to work around the lack of an
msi controller and are not as a result of changes made to the PLDA IP
by us.

> PLDA event domain ops instances will be implemented
> in later patch.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  drivers/pci/controller/plda/pcie-microchip-host.c | 9 ++++++---
>  drivers/pci/controller/plda/pcie-plda.h           | 1 +
>  2 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index fca1520d56c9..2825c1f5563d 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -811,13 +811,15 @@ static const struct plda_event_ops mc_event_ops =3D=
 {
>  };
> =20
>  static const struct plda_event mc_event =3D {
> +	.domain_ops             =3D &mc_event_domain_ops,
>  	.event_ops              =3D &mc_event_ops,
>  	.request_event_irq      =3D mc_request_event_irq,
>  	.intx_event             =3D EVENT_LOCAL_PM_MSI_INT_INTX,
>  	.msi_event              =3D EVENT_LOCAL_PM_MSI_INT_MSI,
>  };
> =20
> -static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
> +static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port,
> +				      const struct irq_domain_ops *ops)
>  {
>  	struct device *dev =3D port->dev;
>  	struct device_node *node =3D dev->of_node;
> @@ -831,7 +833,8 @@ static int plda_pcie_init_irq_domains(struct plda_pci=
e_rp *port)
>  	}
> =20
>  	port->event_domain =3D irq_domain_add_linear(pcie_intc_node, port->num_=
events,
> -						   &mc_event_domain_ops, port);
> +						   ops, port);
> +
>  	if (!port->event_domain) {
>  		dev_err(dev, "failed to get event domain\n");
>  		of_node_put(pcie_intc_node);
> @@ -930,7 +933,7 @@ static int plda_init_interrupts(struct platform_devic=
e *pdev,
>  		return -EINVAL;
>  	}
> =20
> -	ret =3D plda_pcie_init_irq_domains(port);
> +	ret =3D plda_pcie_init_irq_domains(port, event->domain_ops);
>  	if (ret) {
>  		dev_err(dev, "failed creating IRQ domains\n");
>  		return ret;
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/contro=
ller/plda/pcie-plda.h
> index 6571a4befac9..080932cbe8c4 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -129,6 +129,7 @@ struct plda_pcie_rp {
>  };
> =20
>  struct plda_event {
> +	const struct irq_domain_ops *domain_ops;
>  	const struct plda_event_ops *event_ops;
>  	int (*request_event_irq)(struct plda_pcie_rp *pcie,
>  				 int event_irq, int event);
> --=20
> 2.17.1
>=20

--58kJN2dw4v2LbZBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS/B8AAKCRB4tDGHoIJi
0po5APiWGDsBhIIXOhjo24t9Ngvjf+qyTiHcD80kNJRtBXqJAP4gSLIomdwIbCJf
Fp3FqROWnjnrkrANykQjljJiBa2nDw==
=5HzY
-----END PGP SIGNATURE-----

--58kJN2dw4v2LbZBq--


--===============0989170634994468022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0989170634994468022==--

