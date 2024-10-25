Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1B9D149CD
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 16:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYNWOK4KHAZ1hQwONzA5INdlrol6Mgbe7u/NOarhRhU=; b=MMM0FccIFkC6N/4gvBV6sLgshc
	zpwASyOGvP+/et7dHjxxWjAmR5RZLlYPdFRC6+ix4NWIrCQYJvNzRB+RTdxP78z54K1iMcDgf6JHi
	oa0Utm67AjAS45ICnL9gKd7OoENF9QerkcrsdGAzFzq+pIBTmf3/cGPDteSc9XFiI0qcYlgnuWwQH
	NS/WOypyHvwovdpCRxHMMYOtcH6xiuMT1K9ZyNDswGarTcu1Ozfid7WUxsO4STuXojueEVqxWY1jj
	GNIkZp1Cwgs/TpRiPDOBBByzKGDLJHSXcTz3hx5Z08GU4wvNMCSW3Nrly08OQ+ZWUE+pjuF4ydB7X
	9qE1aAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NZV-00000004Ula-2h46;
	Fri, 25 Oct 2024 16:53:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NZT-00000004Ukn-1d2K
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 16:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B99C5C5F0E;
	Fri, 25 Oct 2024 16:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE92AC4CEE3;
	Fri, 25 Oct 2024 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729875234;
	bh=mZ20vGt23x6kwR08MBJTGLjtyFlZt4JECmZ6eocGZhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJ57wxgQl26dw00jvHIkCz8BY1qNcJDhne+yEt/g4C1GpC37DYHrUWIihVaeIarNp
	 mssbN/R1+BPJk1WgortTtVjvlA22spTtqlYk2OFsAkDieVUX1r2N00G1nLUzB5nbf7
	 paofRo4TGF7QfBOFz0NKmyuw3T7aoLxozQejOcE42tC0jkSCFCMmX2ZuzilWIysDm4
	 y2YEDe4wDXobiG49pUP3NdDDMvdEq8W64uvE66Ufxse+n3T/sLOzgbUskepEVbMchJ
	 WeFTB1FvrvdUImm86JPec/9AwCpIotR7+NxC5801UHdVrASyXDQJkI4PdRuYqFlcQj
	 LvcddiaYd8rOQ==
Date: Fri, 25 Oct 2024 17:53:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: riscv: document vector crypto
 requirements
Message-ID: <20241025-defile-blaming-12fc1e3a62e0@spud>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
 <20241024-pungent-lasso-42dd3512a3c8@spud>
 <20241025022411.GB1781@sol.localdomain>
 <20241025024224.GC1781@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20241025024224.GC1781@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_095355_491950_7602C105 
X-CRM114-Status: GOOD (  16.47  )
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
Content-Type: multipart/mixed; boundary="===============0600684770842383719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0600684770842383719==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C3HU7TQO57knau1B"
Content-Disposition: inline


--C3HU7TQO57knau1B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 07:42:24PM -0700, Eric Biggers wrote:
> On Thu, Oct 24, 2024 at 07:24:11PM -0700, Eric Biggers wrote:
> > On Thu, Oct 24, 2024 at 01:34:33PM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >=20
> > > Section 35.2. Extensions Overview of [1] says:
> > > | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the =
composite extensions Zvkn and
> > > | Zvks-- (sic) require a Zve64x base, or application ("V") base Vecto=
r Extension.
> > > | All of the other Vector Crypto Extensions can be built on any embed=
ded (Zve*) or application ("V") base
> > > | Vector Extension
> > >=20
> > > Apply these rules in the binding, so that invalid combinations can be
> > > avoided.
> >=20
> > It looks like that part of the spec is wrong, though.  The Zvknhb and Z=
vbc are
> > correct, but the list of the composite extensions that at least one of =
them is
> > included in is: Zvkn, Zvknc, Zvkng, Zvksc.
> >=20
>=20
> I am attempting to fix this in
> https://github.com/riscv/riscv-isa-manual/pull/1697

Looks like at least one person agrees with you, but I'll wait til that's
merged before submitting another version. Thanks for reporting it.

--C3HU7TQO57knau1B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxvNHQAKCRB4tDGHoIJi
0rPiAQDKaBX0AuIAHT3DnlKh92juYKdfZUvId9M1ah/kZAXt0QEAmmMl+zMQ+XSZ
rnymJW1NSZtykaUKiLZaZ5MgTaVR6Ag=
=nlLZ
-----END PGP SIGNATURE-----

--C3HU7TQO57knau1B--


--===============0600684770842383719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0600684770842383719==--

