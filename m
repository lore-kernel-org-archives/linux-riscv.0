Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2932CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNRunqKbYo0nuhT+8OIhoSc2RQq0ViC5LzQi3HrEW1A=; b=3oFclfSfM5H72HxQKyRoIjBRG2
	3o7wdkjleKa0fb3nyrB5GWCTqmr1E9w4I66xkImoLVFmnGlb/XgXuVVOwRLSTms/6e6sbEOXrhUI4
	B63naoqkmroW5iCwSeP3t2bwzCwYnktgz93fBWMvlmoH8IlCl5GuV0d0g1Nkf+4BP21w+NAP3LLa9
	WW+o+jS/sjr9QfOEUxm0e/R0qLaKsvmeKDOvJYB/z0Q/XA1Xo+pKY+/tiStv34SbHEb0Iz0Pi7MTP
	g9XcDiPeAC9dvuxkM2Z5hPldF4UMMa0Ipr0lEXB2y3R3OvYYB6Y9V+bkC1BpkWYp6ZHyUUPKQXl4p
	9Zz4Xt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtATl-00FLLv-0v;
	Wed, 18 Oct 2023 17:37:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtATh-00FLL2-2D
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25A7061890;
	Wed, 18 Oct 2023 17:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1483BC433C8;
	Wed, 18 Oct 2023 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697650624;
	bh=oFj2hOD0FJcu+azHgKmYICzh2htgdd2Wv5h+L8tXxW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGoxBFH7kFpGXuNXarPS4c99yt2NmcMHGAG61xiXgEWbuhSQUwdufy6ZcWmie//K6
	 2jQuz48qza50itX3m+nM3m+zLLxqwx5TNu/1H8FtrTLZESdAtSePpowbxfuT5Som1/
	 QPL/LCRRiN+oL3q8cCeBAmbndhX3IOgO4kT4U2yMaWE5XkgV9R+nRpulbZ124R93cJ
	 ungaM9yiPw1lhiU37GjtiwsYnLFvTSZ0OBc7Sy8iwKvJ72tQYuRo9EIulRnA6DnKE0
	 A219HIJQcfYQmv5RCfbfUtzRYWo0CbTk1gzcwIa6Ca9T1AZrZdCczZZ1/wFytbveoI
	 7iGVvpM33p3iQ==
Date: Wed, 18 Oct 2023 18:36:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Message-ID: <20231018-flagpole-footpad-07a6228485f3@spud>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
MIME-Version: 1.0
In-Reply-To: <20231018-scrap-bankable-a0f321d97a46@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_103705_808157_AC156500 
X-CRM114-Status: GOOD (  26.73  )
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
Content-Type: multipart/mixed; boundary="===============7458266702921525576=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7458266702921525576==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cYWeMTHrHEjyZ4VV"
Content-Disposition: inline


--cYWeMTHrHEjyZ4VV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 06:33:34PM +0100, Conor Dooley wrote:
> On Wed, Oct 18, 2023 at 10:24:15AM -0700, Evan Green wrote:
> > On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger=
@rivosinc.com> wrote:
> > >
> > > Factorize ISA extension reporting by using a macro rather than
> > > copy/pasting extension names. This will allow adding new extensions m=
ore
> > > easily.
> > >
> > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> > > ---
> > >  arch/riscv/kernel/sys_riscv.c | 32 ++++++++++++++++++--------------
> > >  1 file changed, 18 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_ri=
scv.c
> > > index 473159b5f303..e207874e686e 100644
> > > --- a/arch/riscv/kernel/sys_riscv.c
> > > +++ b/arch/riscv/kernel/sys_riscv.c
> > > @@ -145,20 +145,24 @@ static void hwprobe_isa_ext0(struct riscv_hwpro=
be *pair,
> > >         for_each_cpu(cpu, cpus) {
> > >                 struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> > >
> > > -               if (riscv_isa_extension_available(isainfo->isa, ZBA))
> > > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> > > -               else
> > > -                       missing |=3D RISCV_HWPROBE_EXT_ZBA;
> > > -
> > > -               if (riscv_isa_extension_available(isainfo->isa, ZBB))
> > > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> > > -               else
> > > -                       missing |=3D RISCV_HWPROBE_EXT_ZBB;
> > > -
> > > -               if (riscv_isa_extension_available(isainfo->isa, ZBS))
> > > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> > > -               else
> > > -                       missing |=3D RISCV_HWPROBE_EXT_ZBS;
> > > +#define CHECK_ISA_EXT(__ext)                                        =
           \
> > > +               do {                                                 =
           \
> > > +                       if (riscv_isa_extension_available(isainfo->is=
a, __ext)) \
> > > +                               pair->value |=3D RISCV_HWPROBE_EXT_##=
__ext;       \
> > > +                       else                                         =
           \
> > > +                               missing |=3D RISCV_HWPROBE_EXT_##__ex=
t;           \
> > > +               } while (false)
> > > +
> > > +               /*
> > > +                * Only use CHECK_ISA_EXT() for extensions which can =
be exposed
> > > +                * to userspace, regardless of the kernel's configura=
tion, as no
> > > +                * other checks, besides presence in the hart_isa bit=
map, are
> > > +                * made.
> >=20
> > This comment alludes to a dangerous trap, but I'm having trouble
> > understanding what it is.
>=20
> You cannot, for example, use this for communicating the presence of F or
> D, since they require a config option to be set before their use is
> safe.

Funnily enough, this comment is immediately contradicted by the vector
subset extensions, where these CHECK_ISA_EXT() macros are used wrapped
in has_vector(). The code looks valid to me, since has_vector() contains
the Kconfig check, but does fly in the face of this comment.

>=20
> > Perhaps some rewording to more explicitly
> > state the danger would be appropriate. Other than that:
> >=20
> > Reviewed-by: Evan Green <evan@rivosinc.com>



--cYWeMTHrHEjyZ4VV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTAXuwAKCRB4tDGHoIJi
0ssgAQCFsE/VyWSVFRI6XGd2p+Q+D0bkhT1pEi2sRvGHdVIbwAEAlRpXF0hcPhDv
uK+YFm8QJY4dKBMhZ6EtzbVoIv6ctA8=
=a1cl
-----END PGP SIGNATURE-----

--cYWeMTHrHEjyZ4VV--


--===============7458266702921525576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7458266702921525576==--

