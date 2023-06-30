Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FB1EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 17:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5IFUjM5VY/IQJkjmTR0hYHpH37fbURYZJ2yyupIDWI=; b=OJL0lmY35Oq43tFTdNoYr9l4df
	kfccalNeDucG5G568IF6okBstjuwiX/gcITHzAVaipwGcaL/OykoFSwnHhiat+3VMul+Ty1pOKeoj
	9Bnifo+o1YLVPN8V6gYvqCrfZCU8FzkCedRDFmSJGFR2IS2ABW5MBPrG8MHc4bUmh/Nz7jgKzmXrw
	k4xkfcHCRnsVO9N5EMePW5T71r8P14DWk2Q4q4U3VEFMSQbkHa8KLzkTB+bK3Kr5/+nUBmuNb04H6
	ljsiVGLAy49d9Xb/8ygDWaerPEZkCQ1f7F1xZrCwh9k32vuniaR0e8nSYzJjfHbnzDZb/ICe6hB/p
	aHU4fotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFI6O-004CX1-1z;
	Fri, 30 Jun 2023 17:40:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFI6M-004CWW-0t
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 17:40:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6655E617AC;
	Fri, 30 Jun 2023 17:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0773DC433C8;
	Fri, 30 Jun 2023 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688146808;
	bh=fgMw4Lp/89gtsazSrFpFs6t2HizOmMl025qH0SfI+3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDtJjJBwaYpzniZn58CZW7gfEA4yVbEcCAXoEczsJPipXrnCHZ/iEoIIhJRJYioYv
	 Mv2s6ZaJrq2alFzZ9QMF7xRvC2J/KZ4N5vqOuJuTcUOk96GLXw22Iv6zGcgKDCgYqX
	 V80VgNhFGWPJ6vwAAjUTdGLfDAjH7hNJznbG34XtJ1kOg4ICngoslMBuKtd5J/YFfa
	 BGP3LcMb+IgmCJWvwjW0Ieaxqb8do132PC9BUM+P7c7WQsiztb4omluj4SOinSJowB
	 KHP4TbIZDXj2u4cLH7wIBI2dZF1Bgvb0SrMmIfgBOiWd966YnXzHvnrjhk2MJRnMqd
	 O2wfBYO8bgLLQ==
Date: Fri, 30 Jun 2023 18:40:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Stefan O'Rear <sorear@fastmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
	Leo <ycliang@andestech.com>, Oleksii <oleksii.kurochko@gmail.com>,
	linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
	u-boot@lists.denx.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230630-scheming-hurry-947c54f131a5@spud>
References: <20230626-unmarked-atom-70b4d624a386@wendy>
 <a6449161-d800-4094-bf15-cde890ed17b5@app.fastmail.com>
 <CAOnJCULs47ZCai5EOQJPFrgV1-2xPjWAOB2CfUDStcigsR5Wew@mail.gmail.com>
 <20230627-harmonize-monastery-c6b40d2e5556@wendy>
MIME-Version: 1.0
In-Reply-To: <20230627-harmonize-monastery-c6b40d2e5556@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_104010_400917_D685BBA5 
X-CRM114-Status: GOOD (  43.11  )
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
Content-Type: multipart/mixed; boundary="===============6169246103829629990=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6169246103829629990==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AjUvKUIkfgdr2+xV"
Content-Disposition: inline


--AjUvKUIkfgdr2+xV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Been implementing feedback, so going back through this

On Tue, Jun 27, 2023 at 12:30:25PM +0100, Conor Dooley wrote:
> On Mon, Jun 26, 2023 at 11:35:10PM -0700, Atish Patra wrote:
> > On Mon, Jun 26, 2023 at 5:40=E2=80=AFPM Stefan O'Rear <sorear@fastmail.=
com> wrote:
> > > On Mon, Jun 26, 2023, at 6:10 AM, Conor Dooley wrote:
>=20
> > > > Off-list, some of the RVI folks have committed to shoring up the wo=
rding
> > > > in either the ISA specifications, the riscv-isa-manual or
> > > > so that in the future, modifications to and additions or removals of
> > > > features will require a new extension. Codifying that assertion
> > > > somewhere would make it quite unlikely that compatibility would be
> > > > broken, but we have the tools required to deal with it, if & when it
> > > > crops up.
> > > > It is in our collective interest, as consumers of extension meaning=
s, to
> > > > define a scheme that enforces compatibility.
> > > >
> > > > The use of individual properties, rather than elements in a single
> > >
> > > no longer individual properties
> > >
> > > > string, will also permit validation that the properties have a mean=
ing,
> > > > as well as potentially reject mutually exclusive combinations, or
> > > > enforce dependencies between extensions. That would not have be pos=
sible
> > >
> > > Under what circumstances is a device tree which declares support for a
> > > superset extension (e.g. m) required to also declare support for its =
subsets
> > > (e.g. zmmul)?  There are compatibility issues in both directions.
> > >
> > > Proposal: If an extension X is a superset of an extension Y and X is =
present
> > > in riscv,isa-extensions, Y must also be present if Y was ratified or =
added
> > > to the schema before X, but need not also be present if Y was ratifie=
d after
> > > or at the same time as X.  If X "depends on" Y, then Y must be presen=
t in
> > > riscv,isa-extensions even if X and Y were ratified at the same time.
>=20
> Yes, I think that this all makes sense from a compatibility point of
> view. Splitting it up:
>=20
> > > If an extension X is a superset of an extension Y and X is present
> > > in riscv,isa-extensions, Y must also be present if Y was ratified or =
added
> > > to the schema before X
>=20
> This makes total sense from a "being nice to" software point of view.
>=20
> > > but need not also be present if Y was ratified after
> > > or at the same time as X.
>=20
> It may make sense to reduce this to only after, or not permit the
> supersets at all where they are ratified alongside their subsets.
> Cross that bridge when we come to it perhaps.

I ending up doing some proof of concept implementation of this for linux
the other day, I think "at or at the same time" is the way to go. Up to
me to enforce while reviewing binding patches I guess!

> > > If X "depends on" Y, then Y must be present in
> > > riscv,isa-extensions even if X and Y were ratified at the same tim
>=20
> For Linux, this is already the case for F & D. I think that's a good
> policy to follow.

> > > > +        - const: i
> > > > +          description: |
> > > > +            The base integer instruction set, as ratified in the
> > > > 20191213
> > > > +            version of the unprivileged ISA specification, with the
> > > > exception of
> > > > +            counter access.
> > > > +            Counter access was removed after the ratification of t=
he
> > > > 20191213
> > > > +            version of the unprivileged specification and shunted =
into
> > > > the
> > > > +            Zicntr and Zihpm extensions.
> > >
> > > I think this may belong in the description of zicsr?  rdcycle in 2019=
1213
> > > is a special case of csrrs, which is in zicsr not the base.
>=20
> Sorry, this is a bit unclear. Do you mean that the sentence you have
> provided here should be in the Zicsr entry?

I went and checked this, rdcycle appears in chapter 10 "Counters", not
chapter 9 "Zicsr". I'll slightly reword it & put it in both sections
since the specs are (IMO) unclear in this regard.

Cheers,
Conor.

--AjUvKUIkfgdr2+xV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8TcgAKCRB4tDGHoIJi
0kfhAP9LUTyxG2UPb9njPjY61mUQw7bCuGAoavL5xUWQbnhDFQEAsxfEEvEMtCk4
UEUiLHTChRa5oy2pr1vS8chP0tO/Sw0=
=VCpO
-----END PGP SIGNATURE-----

--AjUvKUIkfgdr2+xV--


--===============6169246103829629990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6169246103829629990==--

