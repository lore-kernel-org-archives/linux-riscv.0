Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF72AC77B75
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 00:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS2/+Ddvdqjh8RUmks0floOCQQHtI4EhHYfHpPsRTMk=; b=akwVJLrFqslEnl+eVop2Vx+oi7
	c42QJnQwf2k9mjhbUYo/J79gXQaFVDyXMfz10vLe2VIlXJefp94PczfaWHttYsgoQY7RhLf+2JivB
	WVMnBqYEnnphRPq2QCBNrvAWz/oOaCis5AvIxbxYEYP7ZEOFU3yU86V/Nga34IQgGg/S+bLi0hRtr
	bxT9yS6ksGg6IHwAe2CbackfwtnSlgP2WPEvHURh4JnZlf79J9ddzif3KbJDdJXDBoC+nVXqMTzfT
	veYvlcwbZvZ4iEiPf6gFw4S6+SL0cMC/VtxavbbskHRK6qjitpfmULy1p3zAnNvOrHcKEtfvBgsSe
	nDov9y5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxcox-00DLf1-1j;
	Sat, 13 May 2023 00:09:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxcot-00DLeY-2H
	for linux-riscv@lists.infradead.org;
	Sat, 13 May 2023 00:09:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B02F619FC;
	Sat, 13 May 2023 00:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D3DC433EF;
	Sat, 13 May 2023 00:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683936546;
	bh=1pZ06yirWs0W6TC4CEqfSffZLFzLnE0CwB1B98rSWDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVhDspSMfHrkXYV/P3OL7W0c+SuDnGaUqOhMdNt0naXHlek0TbJLYFGFEO6yiKDO3
	 R4bGnLHA9d3IsuHHvRSopzDgS634kprUVMf97ej1yN8F5D0U9FdKCY4a0FZ++DaMNH
	 6haUhmM1ZY3OWkKkQMJ4HxJ5jDKeXiOob0gORyVObycFyPtrFlwrwldCKQ7iCsz6n2
	 UhjZYhY2Mu6K7pH9O89doula1mXxjACjAOdFN2giPBcQFFEayrug+A2rWmVd+TUmbu
	 ZOUoFAhAFmF5orwVpLh8q3dQVEZJSzDkgIdFtZ0LgL6sAi49QSvYgZTKqedcoLG80H
	 mqDh5sJgkU8eQ==
Date: Sat, 13 May 2023 01:09:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: atishp@atishpatra.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	cyy@cyyself.name, Conor Dooley <conor.dooley@microchip.com>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com,
	krste@sifive.com, Andrew Waterman <andrew@sifive.com>,
	gfavor@ventanamicro.com, markhimelstein@riscv.org,
	philipp.tomsich@vrull.eu
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
Message-ID: <20230513-produce-frivolous-dacc685bac72@spud>
References: <20230512-exhume-unfold-f104dd4c4cbf@spud>
 <mhng-e6406e20-3be9-480f-a42d-87a7b535f297@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-e6406e20-3be9-480f-a42d-87a7b535f297@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_170907_822562_FC6F3128 
X-CRM114-Status: GOOD (  54.68  )
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
Content-Type: multipart/mixed; boundary="===============2184493027015152499=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2184493027015152499==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="km1AyKuL1DJ6QzsM"
Content-Disposition: inline


--km1AyKuL1DJ6QzsM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 04:55:50PM -0700, Palmer Dabbelt wrote:
> On Fri, 12 May 2023 15:05:24 PDT (-0700), Conor Dooley wrote:
> > +CC Greg, Mark, Krste, Philipp, Andrew,
> >=20
> > (this is LKML now, no top posting or html replies)
> >=20
> > On Fri, May 12, 2023 at 08:40:10PM +0100, Conor Dooley wrote:
> > > On Fri, May 12, 2023 at 11:01:09AM -0700, Palmer Dabbelt wrote:
> > > > On Thu, 11 May 2023 15:38:10 PDT (-0700), Conor Dooley wrote:
> > > > > On Thu, May 11, 2023 at 03:34:24PM -0700, Atish Patra wrote:
> > > > > > On Thu, May 11, 2023 at 2:47=E2=80=AFPM Conor Dooley <conor@ker=
nel.org> wrote:
> > > > > > > On Thu, May 11, 2023 at 02:27:44PM -0700, Atish Patra wrote:
> > > > > > > > > That's more than last year at this point, and nothing
> > > has changed in the
> > > > > > > documentation! Talk's cheap, ehh?
> > > > > > >
> > > > > > > > > Yup. I will poke RVI folks to check if it still is the
> > > plan or changed !!
> > > > > > > Sounds good, thanks!
> > >=20
> > > There has been some movement on that front, shall see where it goes
> > > :upsidedown_smile:
> >=20
> > There's been some off-list discussion prompted by Atish with some of the
> > RVI spec folk, from which the upshot __appears__ to be an understanding
> > that using version numbering to indicate removal of ISA features is a b=
ad
> > idea.
> > I'm hoping that this results in the enshrinement of this in the ISA
> > specs, so that we have something concrete to point to as the basis for
> > not needing to handle version numbering. Certainly that'd be great for
> > ACPI and remove concerns there.
> >=20
> > > > > > We will likely have a vendor specific string parsing logic.
> > > > > > > Complicating the parsing logic is the exact sort of crap
> > > that I want
> > > > > to avoid.
> > > > > Ya, I think we're reallly overcomplicating things with the ISA
> > > strings.
> > > > Let's just deprecate them and move to something that doesn't need a=
ll the
> > > > bespoke string parsing.
> > >=20
> > > Versioning aside, although that removes a large part of the motivatio=
n,
> > > the interface becomes quite nice:
> > > of_property_present(node, "riscv,isa-extension-zicbom")
> >=20
> > My current feeling is that, rather than introducing a key-value type of
> > property, adding boolean properties for extensions is the way to go
> > here. The "riscv,isa" part of the DT ABI pre-dates even the ratification
> > of the base extensions (and thus the removal of some features...).
> > Starting again with a new property would allow us to define extensions
> > as per their ratified state, rather than the intermediate & incompatible
> > states that we have currently got with "riscv,isa".
> > Such a model does rely on the strengthening of the wording in the
> > specification.
>=20
> IMO the important part is that we encode an exact version (or commit if
> they're going to stop doing versions) of the spec in the DT.  We've gotten
> burned enough times by just trying to point at the latest spec and trusti=
ng
> that compatibility will be handled in the specs, in practice that doesn't
> work.
>=20
> Given how inconsistent the RISC-V version schemes have been, we really ca=
n't
> assign any semantic meaning to version numbers.  So I don't think it matt=
ers
> all that much if we encode this as
>=20
>    riscv,$SPEC =3D ["v1.0", "v1.1"]
>=20
> or
>=20
>    riscv,$SPEC =3D true // with the binding saying v1.0 or $SHA...
>    riscv,$SPEC-1.1 =3D true // with the binding saying v1.1 or $SHA...
>=20
> Since we can't ascribe any meaning to those version numbers there's nothi=
ng
> to parse in them, so it's just going to plumb into some lookup table in t=
he
> kernel either way.  The important part is just that we document exactly w=
hat
> spec version we're encoding, as that way we can avoid getting burned by
> these changes again in the future.

What I was envisioning was something like:

property:
  riscv,isa-extension-i:
    description:
      This hart implements I, as per version 20191213 of the unpriv
      spec.

If you don't implement that, then don't populate it. If you do, and
things break, you keep both pieces.

The current:

  riscv,isa:
    description:
      Identifies the specific RISC-V instruction set architecture
      supported by the hart.  These are documented in the RISC-V
      User-Level ISA document, available from
      https://riscv.org/specifications/

Is, IMO, utterly unhelpful. My recent addition:

      Due to revisions of the ISA specification, some deviations
      have arisen over time.
      Notably, riscv,isa was defined prior to the creation of the
      Zicsr and Zifencei extensions and thus "i" implies
      "zicsr_zifencei".

Is accurate, but is a symptom of the problem rather than a solution.

> > This had the advantage of being, as I mention above, even easier to
> > parse in software than the key-value pair business - but also is
> > trivially implemented in a dt-binding. What I have been trying to do
> > with the validation of the key-value stuff does not appear to be readily
> > doable!
>=20
> IMO that's the most important deciding factor on how these should be
> encoded.  We're not tracking the ISA string any more, so it doesn't matter
> how closely those line up.  We do have a chance to actually validate the
> interface, though, which was a big problem with the ISA strings.
>=20
> From talking it sounds like the form you're proposing is easier to encode=
 in
> dt-schema than what I'd proposed.  I didn't look at dt-schema at all befo=
re
> thinking up the interface, so you're probably right ;).
>=20
> Assuming that's the case it seems like the way to go as for as I'm
> concerned.
>=20
> > (Another drawback that has come to mind is that we have no way to
> > validate whether mutually exclusive extensions have been added with
> > "riscv,isa")
> >=20
> > > That also gives us the ability to define what supported vendor
> > > extensions actually mean in a dt-binding, which to me is a big win in
> > > terms of the aforementioned "wild west".
> >=20
> > Vendor extensions etc are oft quoted as one of the strengths of RISC-V,
> > and my feeling is that "riscv,isa" is not a mechanism where we can
> > easily handle meanings - especially for vendor stuff where there is
> > otherwise no centralised location for _xfoo -> feature mappings.
>=20
> IMO there's not any fundamental difference: it's not like the standard
> extensions have any meaningful naming/versioning scheme, so it's still all
> just lookup tables.
>=20
> We do get the same benefits from schema validation that we'd get for
> standard extensions, though.  That's probably a way bigger win for vendor
> extensions, as it'll close a big loophole in our DT validation right now
> where users can cram arbitrary stuff into "riscv,isa" and then we have to
> just deal with it.

TL;DR appears to be that I should revise this in a way that functions
in a way that is compatible with dt-schema & send a non-RFC version of
this that also CCs the likes of QEMU, U-Boot & the BSD folk.
I'll give it a wee bit for the RVI lads to figure out what they are
doing.

Thanks,
Conor.

--km1AyKuL1DJ6QzsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF7VHAAKCRB4tDGHoIJi
0jz6AQC4QeGeZQRcsBx9Ni2zfZlH8c9LoZ9H0Rq42d6rZgoB2AD/Qy+Vh3BiPQJv
uYg0/T2Mb0ZODg0HJWnlqllOq1VWNQ4=
=Q3Z1
-----END PGP SIGNATURE-----

--km1AyKuL1DJ6QzsM--


--===============2184493027015152499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2184493027015152499==--

