Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D87C1125858
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mzHsiEKaKwrj2+cNJUo/1MmlraPVCw7Q31wvKwNEWI=; b=VQOvqVQZ6Ey4sncaWFSeO6CblD
	H1TtBIg3hMzxlZsXH4rOP1ku+7kRmyErw7zXZyiUEjV7MwirXsNcplYaMgBRhNUepie9NrJ8yKimE
	ue/03xr9rtu4l3BOY5hkRMJsa9Vw7BFlbdgq8Hh9ckepon5FaT51c2k2a3kxTUGZiXg1kierQEu+D
	QKicB22rdTN4wNggk3lh44KSz8aChyirVPKwG75Ex+HKkaEDuV7kfEzG5Ejq6CEJA9jRvU2bsJD+Y
	F8AYDmf3ZekSdYK6ddlDaCR98icu2muOlMWwi72o1U0GKe8GR+UtxoDODL0IjNzA30/ux3HdDdszc
	RrDZ7vsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Np5-0000000C6Y8-26zp;
	Wed, 11 Mar 2026 17:58:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Np2-0000000C6Wt-45ga
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 17:58:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1B6D42D9F;
	Wed, 11 Mar 2026 17:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C115BC4CEF7;
	Wed, 11 Mar 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773251895;
	bh=REZVKE/XRqdzPQdeJe3+5UNr7QWGQUq5Vy/h1znmS7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cy0lEcArPly5OmTy6AXVaIBxwh5aIVqDl3XTzJlbm+09THhYCehxaFsbZL/UVXuwX
	 2rhWaOSdRz8P0k5WYtDmeHYkAO5jTMG8qUwjS60kG5H0JMic48D1EpRgHPrnEiNf/+
	 Cto8rNNXqADIDBLjMvN0qNHnrrSntyv/d9DonpmTJFhzJUkHLOSApE5LueCNvokxMC
	 HS2pLcyXQtBd7aFWE8nnKrqm0p4lHQ0l4II+xluLxlfrdMB+HZ0T19O/4+xJ6VJ7ra
	 fiYABqLAfHI7CT3IJ4Zl1AoQxm7MRskJiao0WjoO8KbxH0KO3a2wXk2EHDobCKTEqy
	 dt7DvfeZCBFUA==
Date: Wed, 11 Mar 2026 17:58:10 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/4] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
Message-ID: <20260311-unlovable-ecosphere-07df196823b3@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
 <20260311-collar-smokiness-5313aa648a6f@spud>
 <177324727784.4047403.339169143402607624.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <177324727784.4047403.339169143402607624.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_105817_082622_1478048D 
X-CRM114-Status: GOOD (  23.97  )
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
Content-Type: multipart/mixed; boundary="===============8414136349412173866=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8414136349412173866==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f75TBWoebi84s6Wt"
Content-Disposition: inline


--f75TBWoebi84s6Wt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rob,

On Wed, Mar 11, 2026 at 11:41:17AM -0500, Rob Herring (Arm) wrote:
>=20
> On Wed, 11 Mar 2026 15:17:39 +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > On PolarFire SoC there are more GPIO interrupts than there are interrupt
> > lines available on the PLIC, and a runtime configurable mux is used to
> > decide which interrupts are assigned direct connections to the PLIC &
> > which are relegated to sharing a line.
> >=20
> > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../soc/microchip/microchip,mpfs-irqmux.yaml  | 77 +++++++++++++++++++
> >  .../microchip,mpfs-mss-top-sysreg.yaml        |  4 +
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/microchip/mic=
rochip,mpfs-irqmux.yaml
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:

AAAAAAAAA, goddammit. I forgot there was a reason why I had not just
sent off the new version of the series.

> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.exa=
mple.dts:18.33-24.11: Warning (interrupt_provider): /example-0/interrupt-co=
ntroller@54: '#interrupt-cells' found, but node is not an interrupt provider
> Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.exa=
mple.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

I wanted to ask about this Rob, I wasn't sure I fully understood it.
I figured it was because...


> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (mi=
crochip,mpfs-irqmux): 'interrupt-map' is a required property
> 	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,m=
pfs-irqmux.yaml

=2E..I had not added the interrupt-map yet...

> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (mi=
crochip,mpfs-irqmux): 'interrupt-map' is a dependency of 'interrupt-map-mas=
k'
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (mi=
crochip,mpfs-irqmux): 'anyOf' conditional failed, one must be fixed:
> 	'interrupt-controller' is a required property
> 	'interrupt-map' is a required property
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller.yaml

=2E..so this schema complained. But why is there a custom warning about
"node is not an interrupt provider", when the conditional schema
produces a warning of its own?

> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.kernel.org/project/devicetree/patch/20260311-collar=
-smokiness-5313aa648a6f@spud
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20

--f75TBWoebi84s6Wt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabGtMgAKCRB4tDGHoIJi
0kLAAP4/StUCvibT5hub5xjSEE2d21x03BUhs+ifxgEyZFkLvgD9EcfeAWt2eGYl
AoCeqdx4b8MruMjeVy1/SlSu8M7GWwg=
=NT5s
-----END PGP SIGNATURE-----

--f75TBWoebi84s6Wt--


--===============8414136349412173866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8414136349412173866==--

