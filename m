Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684E3E95A95
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiIuTtVg20+rxPbFaeptnIpk8MuWMVpnIFHmjFDRu4Y=; b=qDzaK7SetIW11OzLAKgQcqS/Vw
	yeDZj79YYzKG9212H4grUdCSUyuIU6v1dTumLWxqc6ccTDYo+uAOcbOopNbOvaJCj7uv5gKZd4S6Z
	8xmHnoEQYO4jafCfm2HvIGoBu2zC+xc+3dpEw0VLxtdXOs4K2oFYuKnCWwZDDGm1gvR+bf3F+7+LZ
	QOLUaZNrZOWh+8wduzzZiRWTlSlC2wCd4Za0fvABkoWL5k/yGyijbzprWf6aoUbGp1M39PXsc8YtZ
	pjS69iqtlsh/1mmVoaBmVsrgNCaa1nwDO7uqz+pVuLQTRkpqk4fVvh+vhazTmnIoJetRcQ7AVzh+y
	YW3qlumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqjD-00Arfn-05;
	Mon, 09 Oct 2023 13:55:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqj9-00Arem-1P
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 13:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696859719; x=1728395719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gyAyyVVpeXrkP6kYXa6+1hGK7jwZaqHDO7BPBGN0kt4=;
  b=xGrlnZ4rv5ykW1LWM0RpJcv+f9ikcg9Ls/2lMtXaiGCG+y/rglY9WLYw
   UsBxy+5tt3yxcDvU4+KMjoXObjilJtFFWYEDN7DqZ9MLh37qb1yX8+Lol
   ucwnYDZKihBsxNGVe++ZFM145mZK2FIXOfnmlnBuUceaMNjW1yT0sMiR7
   qOIpirswEGsONfCAKttRREV7x4sDEvZyK0zZa5c0sT/AKOV3wMkGDsgbF
   WzgVESE3rgQrvdvuZaCw7Hh0FYIoBfco+HQeskXtdpp+4722/KmbP6j50
   QG3ZHBB8jJ5zO5EVhSYh8s4Ht6qpzUlt4ABk9hWar1ia6KbNBw/FK4/ti
   g==;
X-CSE-ConnectionGUID: BCeMba0SR+ms7gMS9QQd6g==
X-CSE-MsgGUID: BpGGr/ejTDuwg8VyZ1RHXw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="asc'?scan'208";a="9287955"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 06:55:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 06:55:11 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 06:55:08 -0700
Date: Mon, 9 Oct 2023 14:54:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v7 14/19] PCI: microchip: Add event IRQ domain ops to
 struct plda_event
Message-ID: <20231009-walk-tranquil-915f1a35f58c@wendy>
References: <20230927100802.46620-1-minda.chen@starfivetech.com>
 <20230927100802.46620-15-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230927100802.46620-15-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_065519_536835_F1481C90 
X-CRM114-Status: GOOD (  19.53  )
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
Content-Type: multipart/mixed; boundary="===============5977216475859148480=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5977216475859148480==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m6KZbs29qDbK8z+n"
Content-Disposition: inline

--m6KZbs29qDbK8z+n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Sep 27, 2023 at 06:07:57PM +0800, Minda Chen wrote:
> For register different event domain ops, Add domain_ops
> pointer to struct plda_event.

Again, the motivation for making this change should, IMO, be mentioned
in the commit message. The code change itself seems fine to me.

Thanks,
Conor.

>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  drivers/pci/controller/plda/pcie-microchip-host.c | 12 +++++++++---
>  drivers/pci/controller/plda/pcie-plda.h           |  1 +
>  2 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index 875bdb03ce22..49e09d24eb8f 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -810,13 +810,15 @@ static const struct plda_event_ops mc_event_ops =3D=
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
> @@ -830,7 +832,8 @@ static int plda_pcie_init_irq_domains(struct plda_pci=
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
> @@ -923,13 +926,16 @@ static int plda_init_interrupts(struct platform_dev=
ice *pdev,
>  	int irq;
>  	int i, intx_irq, msi_irq, event_irq;
>  	int ret;
> +	const struct irq_domain_ops *irq_dom_ops;
> =20
>  	if (!event->event_ops || !event->event_ops->get_events) {
>  		dev_err(dev, "no get events ops\n");
>  		return -EINVAL;
>  	}
> =20
> -	ret =3D plda_pcie_init_irq_domains(port);
> +	irq_dom_ops =3D event->domain_ops ? event->domain_ops : &mc_event_domai=
n_ops;
> +
> +	ret =3D plda_pcie_init_irq_domains(port, irq_dom_ops);
>  	if (ret) {
>  		dev_err(dev, "failed creating IRQ domains\n");
>  		return ret;
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/contro=
ller/plda/pcie-plda.h
> index 48d7bc471137..122084a3318a 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -155,6 +155,7 @@ struct plda_pcie_rp {
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

--m6KZbs29qDbK8z+n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSQGJwAKCRB4tDGHoIJi
0gYuAP9YmN8fqrCvIcDZ84hExyo6Vu/F1CIxaPdG74xU36uKvQEAqgc/XKWQMzpn
ynbUEg/q3dgQSY95wyw26lrTyWvOrAg=
=jw9K
-----END PGP SIGNATURE-----

--m6KZbs29qDbK8z+n--


--===============5977216475859148480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5977216475859148480==--

