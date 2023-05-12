Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADF7C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4tT4WIxIm5HiD0mP0H8nF/I2+3wqK9eQLfw0om1phw=; b=5FEh2JZn9Bhj1RPGSWGf1mQS6D
	xUnyYmlXKsktgoSwO2Ask+7OpJlSEHsnOoOieZPORlHNdq/qYpCX6wCOg5TffruWYdbdvBG7McAfH
	EJQOl+dZ+sbJEEjGmcxMXw6h4XYSkDCQlUKUgZNeVmNhDuselWm7Jv2B+w5K1AbMPCXG506WcEvaR
	zYvc/6ne3fwIDbMqZEbwyXa6PR/eW0k86Ni4sr00ZdmSeXDZnfCFtBXKVSFZ6NQw4IdTyyTgm8Spw
	ZG0P0LkOV7NRmxFm/6YzPbiDWwpHj34bmIT0nd7k/t336bnfn8DwNnHP1m7a7UTEa8qajxffLmgNb
	T84OePCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxatJ-00D9Si-2n;
	Fri, 12 May 2023 22:05:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxatH-00D9SA-0y
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 22:05:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 972D36101C;
	Fri, 12 May 2023 22:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE6AC433D2;
	Fri, 12 May 2023 22:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683929130;
	bh=ApJ9Qb4Gro11DEKs8nfF0r47PFHsphmqYBvK21zTLf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+p0Lpj2nU/h5/tl4sQmISJVp/W/6yiSGwtC5yv+TrVUIuFqxAW8uQVXO2OzEW1zc
	 SMQw5cG5hkMmdScekZWrpqQ7ybed+ThUXFfNSXkYkisbB3Ok83WPD6/jS7vRrAz/8J
	 wlcaR44y3LB2jLM1qSk21K272gX7EMEfxEl2VDZ8q5+V9dNtpmOIXb/zM706OQ7BkM
	 dTclZuJFC2ebWInAKtgIddgWEUAbmhcmm442XpwHYapZcwyo9sSkybWro29wvVdKTf
	 H65eMvseq/TuINFBgOFbo8YJ7XfmIrCnYGbsS3lUgZXdYhDsjOt4aJYROOpE3u99ZL
	 WnFtlQaVTc5/w==
Date: Fri, 12 May 2023 23:05:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: atishp@atishpatra.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	cyy@cyyself.name, Conor Dooley <conor.dooley@microchip.com>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com,
	Krste Asanovic <krste@sifive.com>,
	Andrew Waterman <andrew@sifive.com>,
	Greg Favor <gfavor@ventanamicro.com>,
	Mark Himelstein <markhimelstein@riscv.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
Message-ID: <20230512-exhume-unfold-f104dd4c4cbf@spud>
References: <20230511-occupancy-cleat-06e532e3ea11@spud>
 <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
 <20230512-streak-camper-08a68afb5897@spud>
MIME-Version: 1.0
In-Reply-To: <20230512-streak-camper-08a68afb5897@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_150531_452756_B2E7D625 
X-CRM114-Status: GOOD (  26.99  )
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
Content-Type: multipart/mixed; boundary="===============7604462124199221221=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7604462124199221221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pD0yAV/sPNy+VSlC"
Content-Disposition: inline


--pD0yAV/sPNy+VSlC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Greg, Mark, Krste, Philipp, Andrew,

(this is LKML now, no top posting or html replies)

On Fri, May 12, 2023 at 08:40:10PM +0100, Conor Dooley wrote:
> On Fri, May 12, 2023 at 11:01:09AM -0700, Palmer Dabbelt wrote:
> > On Thu, 11 May 2023 15:38:10 PDT (-0700), Conor Dooley wrote:
> > > On Thu, May 11, 2023 at 03:34:24PM -0700, Atish Patra wrote:
> > > > On Thu, May 11, 2023 at 2:47=E2=80=AFPM Conor Dooley <conor@kernel.=
org> wrote:
> > > > > On Thu, May 11, 2023 at 02:27:44PM -0700, Atish Patra wrote:
> > >=20
> > > > > That's more than last year at this point, and nothing has changed=
 in the
> > > > > documentation! Talk's cheap, ehh?
> > > > >
> > > >=20
> > > > Yup. I will poke RVI folks to check if it still is the plan or chan=
ged !!
> > >=20
> > > Sounds good, thanks!
>=20
> There has been some movement on that front, shall see where it goes
> :upsidedown_smile:

There's been some off-list discussion prompted by Atish with some of the
RVI spec folk, from which the upshot __appears__ to be an understanding
that using version numbering to indicate removal of ISA features is a bad
idea.
I'm hoping that this results in the enshrinement of this in the ISA
specs, so that we have something concrete to point to as the basis for
not needing to handle version numbering.=20
Certainly that'd be great for ACPI and remove concerns there.

> > > > We will likely have a vendor specific string parsing logic.
> > >=20
> > > Complicating the parsing logic is the exact sort of crap that I want
> > > to avoid.
> >=20
> > Ya, I think we're reallly overcomplicating things with the ISA strings.
> > Let's just deprecate them and move to something that doesn't need all t=
he
> > bespoke string parsing.
>=20
> Versioning aside, although that removes a large part of the motivation,
> the interface becomes quite nice:
> of_property_present(node, "riscv,isa-extension-zicbom")

My current feeling is that, rather than introducing a key-value type of
property, adding boolean properties for extensions is the way to go
here. The "riscv,isa" part of the DT ABI pre-dates even the ratification
of the base extensions (and thus the removal of some features...).
Starting again with a new property would allow us to define extensions
as per their ratified state, rather than the intermediate & incompatible
states that we have currently got with "riscv,isa".
Such a model does rely on the strengthening of the wording in the
specification.

This had the advantage of being, as I mention above, even easier to
parse in software than the key-value pair business - but also is
trivially implemented in a dt-binding. What I have been trying to do
with the validation of the key-value stuff does not appear to be readily
doable!

(Another drawback that has come to mind is that we have no way to
validate whether mutually exclusive extensions have been added with
"riscv,isa")

> That also gives us the ability to define what supported vendor
> extensions actually mean in a dt-binding, which to me is a big win in
> terms of the aforementioned "wild west".

Vendor extensions etc are oft quoted as one of the strengths of RISC-V,
and my feeling is that "riscv,isa" is not a mechanism where we can
easily handle meanings - especially for vendor stuff where there is
otherwise no centralised location for _xfoo -> feature mappings.

Cheers,
Conor.

--pD0yAV/sPNy+VSlC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF64JAAKCRB4tDGHoIJi
0uEQAQD0lEiQVpTPAZLb4JIc6zKJZt383lZ8qO42lIGHhyFkfwEApmNL/4VzHCA0
NRGWyAGbcXWSmiRUKkVBHQRXTFnosQc=
=yDPz
-----END PGP SIGNATURE-----

--pD0yAV/sPNy+VSlC--


--===============7604462124199221221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7604462124199221221==--

