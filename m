Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12BCC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfL7PbsNQJFkI6Ql6XD3fRvNa2fK04hRrE26k38bTGg=; b=AsstLShWDwlW99zZuhvvlOgaXH
	RWb4AQWk2V0sfogR3+/aoX2x8ZiYzlaFfb+j/OML33ZLRTXvcyVlOUB8U8MEDrrTfTeZtOcF6R7R+
	gHBvL+52QAVCrLOvEOa//39NRslHgRuX5UsrHTftt+vLvCXp5VzpV5KEI6Gy1Be9USYAhkXWEkkZG
	/G1PbSLcr00HHuObEP22X3MT8xhdvrgCfJtcLqKhJV0JTVAh9L8GlBl72w57nYShRKRFoc5bompwT
	3XuWprDa/FGQSlghcApOxv8H+b9OmF7+7zlRfMkNELpKt/jfcnYAqBaZgDvXDfhHh04sxRorDlrCn
	qdG04KOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtb4-0000000BLmu-17kV;
	Thu, 27 Jun 2024 18:11:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtb1-0000000BLmT-1qMo
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 18:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E7C561E3D;
	Thu, 27 Jun 2024 18:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E493DC2BBFC;
	Thu, 27 Jun 2024 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719511905;
	bh=tGr5k+UOROok+owllKktrHzabgkRJenLZBubo0DTG0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOcG71iLpKz+8wzdjAeKoZo7nbkQl95XMMfEZxdbS4o7jPa+lB+lWeK4f9WmX2PhI
	 ruGfWLpb2elb+eUFkecEt1ZgWHPDQjOlNM7Ep1cA2HoZhykr2jVnbsTvCkbtdc4SFX
	 q3Pf8Eca+NRGe8O1VQmMmccnPrAxQKPyrLQg0uB0yewqr8MGqP7nHyFSU0eshQVb36
	 qGHsTgY8zReYc1tNSIwFIi+n10kKIfbH4lwPvJ7ydhpSrWCJ0gYEWcujBwD5FVRFdX
	 28AuCIeN4JVkB0xg7D6c4hfIWbBAMt6ISKkRGnILp5jActD5QhtV5my0aUutf7g0gS
	 TYHXz/hg/69IQ==
Date: Thu, 27 Jun 2024 19:11:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Chen Jiahao <chenjiahao16@huawei.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/3] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <20240627-wispy-reconfirm-75fd034e62ce@spud>
References: <20240626171652.366415-1-jesse@rivosinc.com>
 <20240626171652.366415-3-jesse@rivosinc.com>
 <20240627-proven-irritably-33594282739f@wendy>
 <762bb09d-af48-47e0-9d65-f530ff37cbc9@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <762bb09d-af48-47e0-9d65-f530ff37cbc9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_111147_636584_05319449 
X-CRM114-Status: GOOD (  47.36  )
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
Content-Type: multipart/mixed; boundary="===============4150715062768892624=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4150715062768892624==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CKxq9ZugmAw+mCd4"
Content-Disposition: inline


--CKxq9ZugmAw+mCd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 01:55:19PM -0400, Jesse Taube wrote:
> On 6/27/24 07:45, Conor Dooley wrote:
> > On Wed, Jun 26, 2024 at 01:16:52PM -0400, Jesse Taube wrote:

> > > +/* Based off of fdt_stringlist_contains */
> > > +static int isa_string_contains(const char *strlist, int listlen, con=
st char *str)
> > > +{
> > > +	int len =3D strlen(str);
> > > +	const char *p;
> > > +
> > > +	while (listlen >=3D len) {
> > > +		if (strncasecmp(str, strlist, len) =3D=3D 0)
> > > +			return 1;
> >=20
> > How does this handle searching a devicetree containing "rv64ima_zksed_z=
kr"
> > for the extension zks? Hint: https://godbolt.org/z/YfhTqe54e
> > I think this works for fdt_stringlist_contains() because it also
> > compares the null chars - which you're not doing so I think this also
> > brakes for something like riscv,isa-extensions =3D "rv64ima\0zksed\0zkr"
> > while searching for zks.
> >=20
> > > +		p =3D memchr(strlist, '_', listlen);
> >=20
> > Or how does this handle searching "rv64imafdczkr" for zkr? It's gonna
> > run right off the end of the string without finding anything, right?
>=20
> Yes...
>=20
> Is that a valid isa,string?

It is. I wish I had just not allowed it, but I was more naive then and
figured we should allow whatever the spec did. Technically versioning of
the extension isn't allowed, but in the wild people do put it in, so I
believe that a parser shouldn't break when it encounters versioning,
even if the regex for the property doesn't permit them:
^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-=
9a-z])+)*$

> I will try to copy how cpufeature.c as close as
> posible.

The comments there should be fairly understandable, but that parser has
a different goal to the one here, so you should be able to make things
simpler. I hope at least.

> > Handling "riscv,isa" is not trivial, but at least the search for extens=
ion
> > approach here skips dealing with some of what has to be done in the "re=
al"
> > parser with the version numbers...
> >=20
> > Maybe we just say screw "riscv,isa", as it's deprecated anyway, and onl=
y.
> I think it's important to have.
>=20
> > add this new feature for "riscv,isa-extensions" which is far simpler to
> > parse and can be done using off-the-shelf fdt functions?
> >=20
> > If not, then I think we should use fdt_stringlist_contains verbatim for
> > "riscv,isa-extensions".
>=20
> Ok I had a notion that riscv,isa-extensions could be upercase they
> cant/wont. I will use fdt_stringlist_contains.
>=20
> > and introduce a custom function for "riscv,isa"
> > only.
>=20
> That was my original thought I will do that.
>=20
> >=20
> > > +		if (!p)
> > > +			p =3D memchr(strlist, '\0', listlen);
> > > +		if (!p)
> > > +			return 0; /* malformed strlist.. */
> > > +		listlen -=3D (p - strlist) + 1;
> > > +		strlist =3D p + 1;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/* Based off of fdt_nodename_eq_ */
> >=20
> > Why can't we just use fdt_nodename_eq?
>=20
> Because fdt_nodename_eq_ is static.
> I will change the comment to "copy of fdt_nodename_eq_".
> Oddly there is `of_node_name_eq` but not `fdt_nodename_eq`

of_node_name_eq comes from the kernel, fdt_nodename_eq comes from
libfdt. I figure the former cannot be used this early since we've not
extracted the dtb and parsed it yet...

> > > +/*
> > > + * Returns true if the extension is in the isa string on all cpus
> >=20
> > Shouldn't we only be checking CPUs that are not disabled or reserved,
> > rather than all CPUs?
>=20
> Its way easier to just check all the cpus rather then make sure we are
> runing on one thats has the extention. I will add a continue for
> dissabled/reserved cpus.
>=20
> > To use Zkr for KASLR this is kinda irrelevant
> > since really we only care about whether or not the boot CPU has Zkr,
> > but in general we only want to consider CPUs that we can actually use.
> > For example, if you did this for FPU support with mpfs.dtsi, you'd get
> > told that the F/D extensions were not present cos hart 0
>=20
> Can we assume that the boot hart is always 0?

Nah, You cannot assume that the boot hart is hart 0, in the example I gave
here hart 0 is not available to Linux.

> > doesn't have
> > them, even though it's disabled and will not be used by Linux.

--CKxq9ZugmAw+mCd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2rWgAKCRB4tDGHoIJi
0pWXAQDJV/bVVnD9ChN+ne/BYsY76hcJyFnXGcsb19WWlTuwLQD6AsVXQpESVWJR
BTr7LWT8JXfZoRCczrvBZCSqNsVMvwE=
=MvYD
-----END PGP SIGNATURE-----

--CKxq9ZugmAw+mCd4--


--===============4150715062768892624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4150715062768892624==--

