Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231C3C7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o72B0BGiXLuaIsA9acpByOXrvYyMMLhilbHvgJzSYY4=; b=olKWocImpQ4FsJeaS6lvaGOx4s
	ICO7Ok0G+6YhAGzyo6BKhMKmIluaTgT7dRGH02b/sKL2Ahe4IfoWUuLHAOgvqml4WuT7RETvL5zsr
	SuAnKWTzmBUwrpLVkac3fZYeP0l5AH+Q5uQUw6gXMhWm+/K3FjrS05o255lSEuSzHkCKGJLgWK1xD
	RRM6LSXWDV5zHR2/IabvZZFDvtijk98a9wv27GfSXoMdOnFLtiqmKcXWHJgJeetc2UNmHLzs4jqTt
	zv+2dabkGD7h8wK4MZCBlH/q1YglJUJ4Fq4B9ZBLg+YbLM2K8UdTLlIoJzeFqI9V1Q2LRdXRT88D7
	6UkRKn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUc2-008IIs-2C;
	Thu, 06 Apr 2023 18:45:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUc0-008II6-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 18:45:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFE8A64B0C;
	Thu,  6 Apr 2023 18:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790D8C433D2;
	Thu,  6 Apr 2023 18:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680806731;
	bh=I5+cukk26vnLknbH5Toe4jO9okYIGo7RP4YmHcNkaVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9p3nfCRGWjjafHcbkGxdjjfrJ/XwY5BSS1v2JPwbZTBExPM6Ym+NfoUZNCk+mDH1
	 16RHTeUK9Szul8wUxrg+NrTUI0WvC+68BBY3yQr1Ohqy9hEYNtv4dYHkZeBKYvMNjf
	 a97PBeMkS57Li+WuERNAC7RW8wwYqjGaiIKij3APDrmEDhFHqmDjkOVAPAIo6bkixi
	 J6L557T5ieTmTczrqofZisYF4s2Imz4WlS+YzJkVFs9QsSH6vZsliA9E8BH4i6b5kk
	 +gSjAP3R8oR/Kiu4S58wmjqvnoK2wYgm+JY271OU+IzRmhdo4Ph4sob0JRaQDNOQ4o
	 SYnCmyHm1OTvQ==
Date: Thu, 6 Apr 2023 19:45:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 1/3] dt-binding: pci: add JH7110 PCIe dt-binding
 documents.
Message-ID: <20230406-cinema-profile-1bfed00e4a5f@spud>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406111142.74410-2-minda.chen@starfivetech.com>
 <38bc48bf-7d8c-8ddd-861f-3b7f3d2edce6@linaro.org>
 <20230406-revisit-patchy-a0063d964070@spud>
MIME-Version: 1.0
In-Reply-To: <20230406-revisit-patchy-a0063d964070@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_114532_294808_A9DE02FE 
X-CRM114-Status: GOOD (  17.44  )
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
Content-Type: multipart/mixed; boundary="===============4912131080551301382=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4912131080551301382==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FH4TbyZ5TRJ4YHod"
Content-Disposition: inline


--FH4TbyZ5TRJ4YHod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 07:35:09PM +0100, Conor Dooley wrote:
> On Thu, Apr 06, 2023 at 08:24:55PM +0200, Krzysztof Kozlowski wrote:
> > On 06/04/2023 13:11, Minda Chen wrote:
> > > +
> > > +  interrupt-controller:
> > > +    type: object
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 0
> > > +
> > > +      '#interrupt-cells':
> > > +        const: 1
> > > +
> > > +      interrupt-controller: true
> > > +
> > > +    required:
> > > +      - '#address-cells'
> > > +      - '#interrupt-cells'
> > > +      - interrupt-controller
> > > +
> > > +    additionalProperties: false
> > > +
> > > +required:
> > > +  - reg
> > > +  - reg-names
> > > +  - "#interrupt-cells"
> >=20
> > Keep consistent quotes - either ' or "
> >=20
> > Are you sure this is correct? You have interrupt controller as child no=
de.
>=20
> I know existing stuff in-tree is far from a guarantee that it'll be
> right, but this does at least follow what we've got for PolarFire SoC:
> Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>=20
> Both PLDA and both RISC-V w/ a PLIC as the interrupt controller, so in
> similar waters.
> This note existed in the original text form binding of the Microchip
> PCI controller:
> | +NOTE:
> | +The core provides a single interrupt for both INTx/MSI messages. So,
> | +create an interrupt controller node to support 'interrupt-map' DT
> | +functionality.  The driver will create an IRQ domain for this map, dec=
ode
> | +the four INTx interrupts in ISR and route them to this domain.
>=20
> Given the similarities, I figure the same requirement applies here too.
> Minda?

Further, if, as I currently suspect, there's a lot of commonality here,
should the binding as well as the driver be split into common pdla bits
and microchip/starfive specific ones?

Suppose that's more one for you Krzysztof.

Cheers,
Conor.

--FH4TbyZ5TRJ4YHod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC8TRAAKCRB4tDGHoIJi
0o4HAP9oLXQVzVevvdCu75mB7hfMBZwV2TEh1L+UnBh9GRsElQD+MKt9L6Sie3wm
Dso18O653hpA0FUvjJEZeW9HslxzfQI=
=o1Sq
-----END PGP SIGNATURE-----

--FH4TbyZ5TRJ4YHod--


--===============4912131080551301382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4912131080551301382==--

