Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B4AC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJsUpDdx9GT5Y/adLy6PQdTqkR/Xcr0E8ICqkhJ3WeM=; b=2VA9dcAHhGNa3k+Y/jXa2XlOAF
	rpSeS5AJvIE9/Im4Qbf9DbXzUN1s9bhO1iD5YpnQPAdKaMuPZU0Ez9qJfu04szyKY6HVFi26Wg1cS
	wiDcz695/TWxxmwLAhJ5PwLEfd8QExXBJo5pQIDG6y7MCsO4X3wuzpn95w5b964pxSUbIelQDze+V
	ub0waH8uZW5DxtqUzuMJSTmQWno/Hj2p+hXU+lagsmS8o8a8DlXYJFod+XhS+Z4zc5hsHsUzO5wpE
	NtPx/iL/8eltQo6UY3rftix4mQ8/TRBbcMZ//0gbFB0sOJ79raYW6WMhHaWbDvMqWDEIFR8wHLFl8
	IN07kj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVY3X-00HD5j-12;
	Mon, 14 Aug 2023 13:56:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVY3U-00HD5H-0p
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692021384; x=1723557384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YwTl7FoVXzeyWZyOruZWQM/vpqIr7zcT8t87H4sv/6o=;
  b=YISsjN46Aj6i7fipR9aWBVR2yWa0aJWPljUYohL5JGL9HoVAiz15K3YV
   2nDuKkusuBkkc54i/aAwbLW+LJBd28ecNvIhTLyagHHQ/ttky51yLAT3g
   WE3lmu34AAAfA6R7Oyz4cR4me8tRqw6jrt89A5hlpQC3zjTFh8NsJ2Voe
   +gkWUZISfJj2kT/frLP3yajBZ6pJJOBKHDABHT6mO8oDzCeRo5DDfl5Kb
   J8fUA9cpdEi3xUTKH6WjCxb4xMRVDsU9ZUsTltou4sboaJWCRHGPdkewZ
   +oMC9f51Qkz38V1T1GohS7wwaz0FV8yc6/qXIMDEpQxcU5Pcn0O3mxu0M
   A==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="225314377"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 06:56:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 06:56:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 06:56:19 -0700
Date: Mon, 14 Aug 2023 14:55:40 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v3 07/11] PCI: microchip: Rename IRQ init function
Message-ID: <20230814-vividness-disgrace-115283ea6f9a@wendy>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-8-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230814082016.104181-8-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_065624_358257_2A6884E0 
X-CRM114-Status: GOOD (  20.45  )
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
Content-Type: multipart/mixed; boundary="===============6779799160262633783=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6779799160262633783==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hd1d+M8rsCdBs80F"
Content-Disposition: inline

--Hd1d+M8rsCdBs80F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 04:20:12PM +0800, Minda Chen wrote:
> Rename IRQ init function and prepare for re-use
> IRQ init function.
>=20
> rename list:
> mc_init_interrupts -> plda_init_interrupts
> mc_pcie_init_irq_domain-> plda_pcie_init_irq_domains
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../pci/controller/plda/pcie-microchip-host.c | 37 +++++++++++++------
>  drivers/pci/controller/plda/pcie-plda.h       |  7 ++++
>  2 files changed, 33 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/=
pci/controller/plda/pcie-microchip-host.c
> index b42f1aac3ec3..140e7ca1a5cb 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -559,7 +559,7 @@ static int mc_pcie_init_clks(struct device *dev)
>  	return 0;
>  }
> =20
> -static int mc_pcie_init_irq_domains(struct plda_pcie_rp *port)
> +static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port, struct =
plda_evt *evt)
>  {
>  	struct device *dev =3D port->dev;
>  	struct device_node *node =3D dev->of_node;
> @@ -572,8 +572,8 @@ static int mc_pcie_init_irq_domains(struct plda_pcie_=
rp *port)
>  		return -EINVAL;
>  	}
> =20
> -	port->event_domain =3D irq_domain_add_linear(pcie_intc_node, NUM_EVENTS,
> -						   &event_domain_ops, port);
> +	port->event_domain =3D irq_domain_add_linear(pcie_intc_node, port->num_=
events,
> +						   evt->domain_ops, port);
>  	if (!port->event_domain) {
>  		dev_err(dev, "failed to get event domain\n");
>  		of_node_put(pcie_intc_node);
> @@ -658,14 +658,15 @@ static void mc_disable_interrupts(struct mc_pcie *p=
ort)
>  	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
>  }
> =20
> -static int mc_init_interrupts(struct platform_device *pdev, struct plda_=
pcie_rp *port)
> +static int plda_init_interrupts(struct platform_device *pdev,
> +				struct plda_pcie_rp *port, struct plda_evt *evt)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	int irq;
>  	int i, intx_irq, msi_irq, event_irq;
>  	int ret;
> =20
> -	ret =3D mc_pcie_init_irq_domains(port);
> +	ret =3D plda_pcie_init_irq_domains(port, evt);
>  	if (ret) {
>  		dev_err(dev, "failed creating IRQ domains\n");
>  		return ret;
> @@ -675,15 +676,18 @@ static int mc_init_interrupts(struct platform_devic=
e *pdev, struct plda_pcie_rp
>  	if (irq < 0)
>  		return -ENODEV;
> =20
> -	for (i =3D 0; i < NUM_EVENTS; i++) {
> +	for (i =3D 0; i < port->num_events; i++) {
>  		event_irq =3D irq_create_mapping(port->event_domain, i);
>  		if (!event_irq) {
>  			dev_err(dev, "failed to map hwirq %d\n", i);
>  			return -ENXIO;
>  		}
> =20
> -		ret =3D devm_request_irq(dev, event_irq, mc_event_handler,
> -				       0, event_cause[i].sym, port);
> +		if (evt->request_evt_irq)
> +			ret =3D evt->request_evt_irq(port, event_irq, i);
> +		else
> +			ret =3D devm_request_irq(dev, event_irq, plda_event_handler,
> +					       0, NULL, port);

Is there a particular reason this if/else addition ended up in this
patch, but the if/else addition in plda_handle_event() ended up in the
next one?

Otherwise, this looks fine to me.

--Hd1d+M8rsCdBs80F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNoyXAAKCRB4tDGHoIJi
0uB+AP9gjLStAfRzFpKp3mEswylGIjBBR1gl7TtbEkK6nH03LgD/W2C+fihWQiZi
7BAhqXi8t0ZG1uBUHTJz0v62pVBWVAk=
=H1ht
-----END PGP SIGNATURE-----

--Hd1d+M8rsCdBs80F--


--===============6779799160262633783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6779799160262633783==--

