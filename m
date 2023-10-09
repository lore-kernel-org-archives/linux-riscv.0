Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC50E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnTDfaZj/3gZg8Kojw+pRT1o4T9XDFIMzf6Zn+tYiSE=; b=kTcbHD9Rtma4hH5vDDqIz9ZrBf
	H1hfR9VAQsOI9bGvV28hfTy1mCMo7be6005oGLb3R4vCjMVdXiLqWndqIy7moXE7ApytHjmK+n4zE
	uG920xY9fm8cA1ybZBEWTO221L76iFL4+KgNFcMBAisEQ5xb577gtXDOsqXhSLCzNeloaJk5InhvJ
	1lPuXiHodv9Eii9QDln/oCi/NvbuQjdSMJ1jgGajEOQCuWyFrqZ2B4eRFWqOjwzcsN17wx6diRlLZ
	LgaL4zZxTZNj93LgeuT8b2DG3CXR9UklVAtMYS9L83CAW98/g8YtVQcfaEQteSHSFph23cb3AIMm5
	t2lDQJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqW2-00Aq5E-1m;
	Mon, 09 Oct 2023 13:41:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqVz-00Aq3y-1u
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 13:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696858903; x=1728394903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XSmJW9ClZp5/7XxIC/DRM/ldi63Fk1j71dzAvXhfj5U=;
  b=XEL9yx2qFr9pXrdBGnjHkm+WCaeLFiStj/648ohFqEWZFs3QFP8o/hjG
   eX6JAXKldCs01zOHdrJUX0mbRtRm9269geaAdm3zUHn5NoKptrW3GiLrn
   M68HeeCFFJA5KS5eRWfvIsaD3Km5J+2ujq3tq5MbhCZMiZ40sQ3jNQDI7
   r0K7RTJDKdx6w2CD/Oeeu05LugqcJRlTVE+Rwz6jqFs8YdpHfJs6P3sZi
   Nj9MEjhSiaonH62y6Hb6D7Ok9eCH8AdoXxqS8tpDGkss1BUddQmrM/MhW
   eXjgtDtG+jOvJZBgngsnHB4tQ/F6dIzN8HJlFHPT5TDeTNSUGwu1WbnI0
   g==;
X-CSE-ConnectionGUID: l0OiCB+BRwW3jj2zmPqK/Q==
X-CSE-MsgGUID: 0yKD0BfSTYqfk0rzFgtEeQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="asc'?scan'208";a="176447002"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 06:41:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 06:41:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 06:41:33 -0700
Date: Mon, 9 Oct 2023 14:41:12 +0100
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
Subject: Re: [PATCH v7 10/19] PCI: microchip: Add num_events field to struct
 plda_pcie_rp
Message-ID: <20231009-headrest-service-98a59cb982bb@wendy>
References: <20230927100802.46620-1-minda.chen@starfivetech.com>
 <20230927100802.46620-11-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230927100802.46620-11-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_064143_692303_D9B45235 
X-CRM114-Status: GOOD (  21.06  )
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
Content-Type: multipart/mixed; boundary="===============9032366760895326130=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9032366760895326130==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sEI75rBRrFQBXn/N"
Content-Disposition: inline

--sEI75rBRrFQBXn/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 06:07:53PM +0800, Minda Chen wrote:
> Avoid using NUM_EVENTS macros in common codes.

This isn't common code though, this code is in the Microchip driver.
It may become common code later, but for now the commit message is
inaccurate. Otherwise, the change itself seems okay to me, so with an
accurate commit message
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  drivers/pci/controller/plda/pcie-microchip-host.c | 7 ++++---
>  drivers/pci/controller/plda/pcie-plda.h           | 1 +
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index 81aac2d72a2f..d9dd63084e2b 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -648,7 +648,7 @@ static void plda_handle_event(struct irq_desc *desc)
> =20
>  	events =3D mc_get_events(port);
> =20
> -	for_each_set_bit(bit, &events, NUM_EVENTS)
> +	for_each_set_bit(bit, &events, port->num_events)
>  		generic_handle_domain_irq(port->event_domain, bit);
> =20
>  	chained_irq_exit(chip, desc);
> @@ -811,7 +811,7 @@ static int plda_pcie_init_irq_domains(struct plda_pci=
e_rp *port)
>  		return -EINVAL;
>  	}
> =20
> -	port->event_domain =3D irq_domain_add_linear(pcie_intc_node, NUM_EVENTS,
> +	port->event_domain =3D irq_domain_add_linear(pcie_intc_node, port->num_=
events,
>  						   &mc_event_domain_ops, port);
>  	if (!port->event_domain) {
>  		dev_err(dev, "failed to get event domain\n");
> @@ -914,7 +914,7 @@ static int plda_init_interrupts(struct platform_devic=
e *pdev, struct plda_pcie_r
>  	if (irq < 0)
>  		return -ENODEV;
> =20
> -	for (i =3D 0; i < NUM_EVENTS; i++) {
> +	for (i =3D 0; i < port->num_events; i++) {
>  		event_irq =3D irq_create_mapping(port->event_domain, i);
>  		if (!event_irq) {
>  			dev_err(dev, "failed to map hwirq %d\n", i);
> @@ -1006,6 +1006,7 @@ static int mc_host_probe(struct platform_device *pd=
ev)
> =20
>  	bridge_base_addr =3D port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
>  	plda->bridge_addr =3D bridge_base_addr;
> +	plda->num_events =3D NUM_EVENTS;
> =20
>  	/* Allow enabling MSI by disabling MSI-X */
>  	val =3D readl(bridge_base_addr + PCIE_PCI_IRQ_DW0);
> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/contro=
ller/plda/pcie-plda.h
> index 32a913d4101f..5b09ffed623c 100644
> --- a/drivers/pci/controller/plda/pcie-plda.h
> +++ b/drivers/pci/controller/plda/pcie-plda.h
> @@ -150,6 +150,7 @@ struct plda_pcie_rp {
>  	raw_spinlock_t lock;
>  	struct plda_msi msi;
>  	void __iomem *bridge_addr;
> +	int num_events;
>  };
> =20
>  irqreturn_t plda_event_handler(int irq, void *dev_id);
> --=20
> 2.17.1
>=20

--sEI75rBRrFQBXn/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSQC+AAKCRB4tDGHoIJi
0gWCAP9MfVaT63SoQZwNi1fdkEQbfvmc6Ncemk2TYXraL5KyDAEAo8e60IqflnrY
IKLu5sOyiDtLkZa1h8z3iPSfgyBdDgM=
=ejRb
-----END PGP SIGNATURE-----

--sEI75rBRrFQBXn/N--


--===============9032366760895326130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9032366760895326130==--

