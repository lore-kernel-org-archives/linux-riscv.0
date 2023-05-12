Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0E4C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Upvp4ru5OkQurBrum/M8VbqtZsfr9UKCrifYssVOLKA=; b=q2fST+++MUDgKAfab9riHkMm6X
	7pG8a6/2mSbaiBPr0q4DG3c5t//ZLAgJFSqWDUcrEhL0yKfd4u/Tc2PHM8lzytQVgnHi7sMMjdIK8
	8h4Ne6UNx9D6wSGHeV/h1ayPaS5E0znjpD0OQCHWRtsGis0OGEq5NO2QQ/3RB6kNO0ASnX/xVFCmn
	ksaa4n/Fwr6pDSJtLkDdcHoX71MbpXQk6ruDQr+0m8lX+GoM0IPXLp89ssyeryX7yorgot3spqmnM
	1sThMo9Iw2TuFJ+o/Y5g9Cuqsyi4siELiQ9feGJU6HHY4vsiKqWfomnnpV0MMj1NBg0HOMVY2oKVE
	mOAdknuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxYcm-00Covw-07;
	Fri, 12 May 2023 19:40:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxYcj-00CovV-0h
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 19:40:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD087656AD;
	Fri, 12 May 2023 19:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58FCC433EF;
	Fri, 12 May 2023 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683920415;
	bh=aaBkrNcAI9Fks2KrLSk/4P+BUcq6lmzh4CQnyOGX0GU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLQT/OsO9npOonIhubdvh80A8klVtrNwL/7QyHD/Iz8uREPjWWwUhB7yEm6LJOjNf
	 D683SZJQedUBF7xsXr4EmEfiV2JC0D+QjahaFj1pHEsl2xmnur6y7nWu196TbDbCWN
	 TSuPVusY7xmO0ZfPoyTF9A+jN72W21eNfUFct1cQ+xFk9+/VGZY3FaOdi/1sBALVEi
	 RHeNAW7aLrb3AWgdnUQhce6qSGZ+pTWjT53xeEiE2me403l5mxOkUclceNMUG83JG2
	 4GENn0cRgNPSyOiJr9wD3rBgj5NArIUoH6+7a6KV8SCAwdLsCT4tzEySunlBHCSEhv
	 TuQP6Jl3twH4Q==
Date: Fri, 12 May 2023 20:40:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: atishp@atishpatra.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	cyy@cyyself.name, Conor Dooley <conor.dooley@microchip.com>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
Message-ID: <20230512-streak-camper-08a68afb5897@spud>
References: <20230511-occupancy-cleat-06e532e3ea11@spud>
 <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_124017_318500_D7D712C3 
X-CRM114-Status: GOOD (  16.86  )
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
Content-Type: multipart/mixed; boundary="===============2520777221319932776=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2520777221319932776==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hlry0DBSFS6pLHzF"
Content-Disposition: inline


--Hlry0DBSFS6pLHzF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 11:01:09AM -0700, Palmer Dabbelt wrote:
> On Thu, 11 May 2023 15:38:10 PDT (-0700), Conor Dooley wrote:
> > On Thu, May 11, 2023 at 03:34:24PM -0700, Atish Patra wrote:
> > > On Thu, May 11, 2023 at 2:47=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > > On Thu, May 11, 2023 at 02:27:44PM -0700, Atish Patra wrote:
> >=20
> > > > That's more than last year at this point, and nothing has changed i=
n the
> > > > documentation! Talk's cheap, ehh?
> > > >
> > >=20
> > > Yup. I will poke RVI folks to check if it still is the plan or change=
d !!
> >=20
> > Sounds good, thanks!

There has been some movement on that front, shall see where it goes
:upsidedown_smile:

> > > We will likely have a vendor specific string parsing logic.
> >=20
> > Complicating the parsing logic is the exact sort of crap that I want
> > to avoid.
>=20
> Ya, I think we're reallly overcomplicating things with the ISA strings.
> Let's just deprecate them and move to something that doesn't need all the
> bespoke string parsing.

Versioning aside, although that removes a large part of the motivation,
the interface becomes quite nice:
of_property_present(node, "riscv,isa-extension-zicbom")

That also gives us the ability to define what supported vendor
extensions actually mean in a dt-binding, which to me is a big win in
terms of the aforementioned "wild west".

--Hlry0DBSFS6pLHzF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF6WGgAKCRB4tDGHoIJi
0tSDAP0Uy884EZU8ra/A9tMZDF/H8y6sKV2j3Y/tSxG8um8DlwD/Zeg0BjmIdXDU
se8CYwnqhCmDITzPbAm4T5pb4tKnyAA=
=07sr
-----END PGP SIGNATURE-----

--Hlry0DBSFS6pLHzF--


--===============2520777221319932776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2520777221319932776==--

