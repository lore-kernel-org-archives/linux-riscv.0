Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612BEC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHmfvA58pWloYAxW65Hma7IPh6zZvs4nUiyDFx3akjo=; b=coJXmk1L9ySzHzdf02RPQKiF+Y
	xTllkvdKwtkjigxfvNhKuvN3OJdzzAGy8jCUq8ujh123IPLSadx+/sFJxXNtmXRb98z49sQze9XDh
	OaU6aXl34HrrbulwxN7TsX1UDh/cruCDHpsPn9c0cL+mkXqKW5qk/Z/ulllkJDDeXuu5cetFs5sw9
	imXHwJbjAeAxuOzwuHo2qh+dmL8RZSFreDb4n9NYqSXs/d7BWvc+cbMsG9O1uqRSw06IkXZl5VjyK
	iUxBByAgsetZ958W+Cbf70R4C2McZrWvnMBYDU0jADzHlr+kcqtURDguj8gPpgw/xaN2mt0Nz1luL
	YdGqnyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmyl-00GCoC-MV; Wed, 08 Feb 2023 16:07:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmyi-00GCnJ-0A
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 16:07:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 665DC61707;
	Wed,  8 Feb 2023 16:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2599AC433D2;
	Wed,  8 Feb 2023 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675872442;
	bh=MizIyAawhq+F4R5MZOxbqg63Ufjh+lQp41X/NpeYSKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnQqmXGdoP54FZkz2PdyC8X+w9Wvu67kpBtBZ1Hz/VgJYehjuSfiktMuIfE5lm+ea
	 nmV9+ZxRDHB01zTUxNzwO/bR3JRKze9/MmflKldUCYymloCu/2IujtJ1zNpN9i2zMA
	 FcSpgaIz7L6IFkGQe7vQ/lOmhTiNXBH/Cm2i55T98aMlSHNFFgbvJZoQhaPGNUOMJM
	 +20DOOP3nPXHxUOA+iojJ2FMQKbXpbDUhX96MxFbt46s4jHrUIB9Te+BmGyhdiWExY
	 jNTvcakExUD0YU7kHlkhw2MCVYKysVDyYTmAIHnKAz7SffSa7HzVzdCcrEB6huTaba
	 emuYFS5DOVqhQ==
Date: Wed, 8 Feb 2023 16:07:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Documentation: RISC-V: Define Xlinuxs{s,m}aia
Message-ID: <Y+PIt3I32fiVWWhp@spud>
References: <17CF439E-8933-4358-987B-85352DCAE4DD@kernel.org>
 <mhng-474f7ecd-65b8-4cfa-8b75-e51b896cc58e@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-474f7ecd-65b8-4cfa-8b75-e51b896cc58e@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_080724_142513_3FEF2C2B 
X-CRM114-Status: GOOD (  34.95  )
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
Content-Type: multipart/mixed; boundary="===============2640053131902350773=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2640053131902350773==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="88L/RHZCr3RHUt/E"
Content-Disposition: inline


--88L/RHZCr3RHUt/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 07:52:06AM -0800, Palmer Dabbelt wrote:
> On Thu, 02 Feb 2023 23:32:47 PST (-0800), Conor Dooley wrote:
> >=20
> >=20
> > On 3 February 2023 00:12:01 GMT, Palmer Dabbelt <palmer@rivosinc.com> w=
rote:
> > > The AIA specification was only partially frozen, but provides no way =
to
> > > refer to the subset of behavior that has been frozen.
> >=20
> > Ahh, wonderful.
> >=20
> > > It seems like
> > > there's not a whole lot of interest in the non-frozen behavior, so le=
t's
> > > just define an extension that only consists of the frozen behavior
> >=20
> > >=20
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > > Documentation/riscv/extensions.rst | 10 ++++++++++
> > > 1 file changed, 10 insertions(+)
> > > create mode 100644 Documentation/riscv/extensions.rst
> > >=20
> > > diff --git a/Documentation/riscv/extensions.rst b/Documentation/riscv=
/extensions.rst
> > > new file mode 100644
> > > index 000000000000..c12bd3780520
> > > --- /dev/null
> > > +++ b/Documentation/riscv/extensions.rst
> > > @@ -0,0 +1,10 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +Custom RISC-V Extensions
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +
> > > +* The `Xlinuxsmaia` and `Xlinuxssaia` extensions coorespond to the s=
tandard
> >=20
> > Typo: correspond
> >=20
> > > +  `Smaia` and `Ssaia` extensions as defined by version 1.0-RC2 of th=
e RISC-V
> > > +  Advanced Interrupt Architecture (AIA) specification, with the diff=
erence that
> > > +  chapters 5 (Duo-PLIC) and 9 (IOMMU Support for MSIs to Virtual Mac=
hines) do
> > > +  not exist.
> >=20
> > Perhaps this document needs an intro section specifying what you expect=
 to go in it.
> > Is this for any custom stuff, or just places where Linux has to work ar=
ound RVI?
>=20
> > From talking on the patchwork call, it sounds like 1.0.0-rc2 may not be
> what's going to be ratified.  If the plan really is to remove the draft
> chapters when the spec is ratified, which does sometimes happen, then tho=
se
> might just solve the problem -- but sometimes things marked as drafts get
> ratified, so we really just have no idea what the spec is going to be.  I=
t's
> going to be pretty much imposible to get everyone on the same page until =
we
> can see the spec that's going to be ratified.  So I think until that gets
> sorted out, there's not really a whole lot more we can do here.
>=20
> The other option would be to just properly commit to moving away from ISA
> strings in the DT interface.  We've sort of soft-forked already, but we're
> at least trying to keep things looking similar.  Properly forking would
> really make everyone happy, as we'd no longer need to worry about the spe=
cs
> getting the details right.

So reading between the lines (based on that patchwork call), this is a
self-NAK for this patch and a NAK for adding the regular variants of
these extensions to the ISA string in the first place.
Perhaps it'd be worth noting that on [1] where the CC list is both
broader and more specific? (Apologies if you already indended doing so
there & I'm just preempting you).

Thanks,
Conor.

1 - https://lore.kernel.org/linux-riscv/CAK9=3DC2XAaB0GXh1tO060dWxZR2pSAVJh=
ejUaa+W=3DQ+9nk_gYKA@mail.gmail.com/T/#ma126fa3fcd97af944a659ad544753020fac=
7b89d

--88L/RHZCr3RHUt/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+PIngAKCRB4tDGHoIJi
0rROAQCGaV3AbzntGDwFOHUvMg5J9J/vodtoGfeah3dUErylXgD/Tl99zMmDOCcH
gBgIOkCyZXML6g03iN6hnQjTkNXQCQk=
=5jL2
-----END PGP SIGNATURE-----

--88L/RHZCr3RHUt/E--


--===============2640053131902350773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2640053131902350773==--

