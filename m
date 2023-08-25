Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1F6C3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9RC0Tk6FBdvigQPEY2/0jJsgzmtwpALIlVWNvQdsBo=; b=A8Tig6B45JrSDSA6jWEMkSZlzh
	hrhW0Mvr5cAr9/Hs1du/WCYjFkaSoxa+EaQqYQIkSziiCphHtsWWyAnxFQEYvBhbDHzu9DaqTeJdM
	oD4VGYW5M1qWGnTICacnZqgIlPFzJCnKCaAk61RpPe6VDroRxx3pFLisTlnQ8V1oRJSRpsR+/cQt4
	aah87SxM2o9yCAZ/rfpFbBwX9O8X7DdeG5SGoBINbzPw5LXBtxS0xnTcOq8tu23yJG7FKmtB25c3y
	rOPk4gkfl6+L/VYDxA8aGtElC6YqcU6JuJvAFsCM+dnlDF6yeqiToBxEoT9TnpDIaajlzJaAh6PUx
	+uXskJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVeN-005LY9-2P;
	Fri, 25 Aug 2023 12:10:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVeL-005LXM-0K
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 12:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692965449; x=1724501449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7WOd2tGjgKOiq0ZivZVRqSVMJmTMZHLUBWKTtr0MnyE=;
  b=hEyaUU3O1IdaiBhzFfAZ4lcOFRgHY1EcEJPzG5GCwOSQD63QUKLQe57K
   n+x7MYfQkJTTkbolXBuaS7lFC3gTNJsbbQ7RpsLv6WgPTl7F7TQ4ksqNj
   sqkqa3X90ML7374F5nn5u9vD1qslZfEnMLInKlP347ThOgJX6BmWM+XBg
   OtIlUVJmTMvvIrCwG34gqY21YmlOQybdxkXO/6xOzEuCVuCgx0yErvVuX
   1qClsOGx6zcXHdUNTO3Gfitji24WPSmydSFPLoxqjXAnBmEtRPVf/3M54
   9kCYGG9QyOT1hbZiBLO4KFQox+YQonk1EQJ0lVJfiW9fh05dIDMGAk4/r
   w==;
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="asc'?scan'208";a="231709314"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2023 05:10:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 25 Aug 2023 05:09:57 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 25 Aug 2023 05:09:54 -0700
Date: Fri, 25 Aug 2023 13:09:13 +0100
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
Subject: Re: [PATCH v4 08/11] PCI: microchip: Move IRQ init functions to
 pcie-plda-host.c
Message-ID: <20230825-sip-pentagon-e1760dcfce58@wendy>
References: <20230825090129.65721-1-minda.chen@starfivetech.com>
 <20230825090129.65721-9-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230825090129.65721-9-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_051049_147678_6B51915D 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: multipart/mixed; boundary="===============4733816991188917024=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4733816991188917024==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3Mzadswy/UgLR3pW"
Content-Disposition: inline

--3Mzadswy/UgLR3pW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Daire, can you look at this one too please?

On Fri, Aug 25, 2023 at 05:01:26PM +0800, Minda Chen wrote:
> Move IRQ init functions to pcie-plda-host.c.
> mc_handle_event() is merged to plda_handle_event().
> Set most of the IRQ functions to static in pcie-plda-host.c
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

> -void plda_handle_event(struct irq_desc *desc)
> +static void plda_handle_event(struct irq_desc *desc)
>  {
>  	struct plda_pcie_rp *port =3D irq_desc_get_handler_data(desc);
>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> @@ -264,14 +268,18 @@ void plda_handle_event(struct irq_desc *desc)
> =20
>  	chained_irq_enter(chip, desc);
> =20
> -	val =3D readl_relaxed(port->bridge_addr + ISTATUS_LOCAL);
> -	origin =3D val;
> -	val =3D val >> A_ATR_EVT_POST_ERR_SHIFT;
> -	events |=3D val & 0xff;
> -	if (origin & PM_MSI_INT_INTX_MASK)
> -		events |=3D BIT(EVENT_PM_MSI_INT_INTX);
> -	val =3D (origin >> PM_MSI_INT_MSI_SHIFT) & 0xf;
> -	events |=3D val << EVENT_PM_MSI_INT_MSI;
> +	if (port->ops && port->ops->get_events) {

I still don't love the dancing here. Can you just always register a
callback?

Thanks,
Conor.

> +		events =3D port->ops->get_events(port);
> +	} else {
> +		val =3D readl_relaxed(port->bridge_addr + ISTATUS_LOCAL);
> +		origin =3D val;
> +		val =3D val >> A_ATR_EVT_POST_ERR_SHIFT;
> +		events |=3D val & 0xff;
> +		if (origin & PM_MSI_INT_INTX_MASK)
> +			events |=3D BIT(EVENT_PM_MSI_INT_INTX);
> +		val =3D (origin >> PM_MSI_INT_MSI_SHIFT) & 0xf;
> +		events |=3D val << EVENT_PM_MSI_INT_MSI;
> +	}
> =20
>  	for_each_set_bit(bit, &events, port->num_events)
>  		generic_handle_domain_irq(port->event_domain, bit);

--3Mzadswy/UgLR3pW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOiZ6QAKCRB4tDGHoIJi
0vy8AQCbzdPqfIsg4Rb+K+nCGb0DwA4IC2wBkiUhYzZPvjqQLQEApoBsItvyi8Rf
Ge4Jyp0msR/nVvWuYP8BEVG8nnZTgQI=
=zD2O
-----END PGP SIGNATURE-----

--3Mzadswy/UgLR3pW--


--===============4733816991188917024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4733816991188917024==--

