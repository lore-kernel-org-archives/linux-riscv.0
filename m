Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72A4CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1umavr5eIImb68lLWUiylZE+H1NWlHN/O2x0SpdVrCM=; b=X1+q/oDt0C/AFppQeSWkXbSrjw
	6i8z4/uAr9LzpZpgWSFO9mcQ6AE+EOv1qLK55kjACNgq0moHR8MwHeT6IDBjE/A10W/aOxwi42Cu2
	UpMsKgifpH6mk4i/tydU9hHloXUFjJsgK9LbGbzTJeex1UURTyCJENTYAPowZm0ZVO0M7x/LTgb3g
	nCiiq2TZK5857wpdTL4yBnbuhgUL+68oMpe4N0a1jiygG0ZlR2mzaX5LBePdrd5W0KUy0YQf4bKXv
	NlAjQybgq41FfCn1yEd5u6kUHITGZ+IeyU4hVM8R23Z+PtnAvlDx2oJTzYqkYKIJGMjvjwS4ayaPL
	ShyIccLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAQU-00FKwZ-1K;
	Wed, 18 Oct 2023 17:33:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAQQ-00FKvd-1o
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA97ACE25DF;
	Wed, 18 Oct 2023 17:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E13DC433C7;
	Wed, 18 Oct 2023 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697650420;
	bh=7zgoNI+OfIXrNzrN4IJbV0dCAC9KZrvxc9Xg9ZUOnCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDQnIXWzKC43dbxZfVTnVjok0UL7TPypYfSo/HySbMUuG2jPJP4OUM3mzUe7VM+gE
	 mms9iV/gB1AkmMuuX2h3B+4zOOMVDBmag+h0mAFPbwlZOOUR8NT6UvFUflcrEZd3tR
	 6rBbh7Nps4NTqYoaNfonYLKr9tAKir7b6pxWW59kN4TVczo9qHM06AWoeITO/Hb5yM
	 b8gAmfSmxcK8KUTCDDbWQXU+hUMb7NN0iqf5wYxSpsRrPEf3P9evlz3tm73XT6/5+1
	 nxAiDkzccHEhMGNuYhVedKK78y2GkNOdiZSTxVFQypjJ1V1HDjN+hw96NclMUD/myH
	 5HO+xeToqGGhw==
Date: Wed, 18 Oct 2023 18:33:34 +0100
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
Message-ID: <20231018-scrap-bankable-a0f321d97a46@spud>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_103342_958757_FBD733F1 
X-CRM114-Status: GOOD (  22.08  )
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
Content-Type: multipart/mixed; boundary="===============7691279728440773754=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7691279728440773754==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cAVknSgQgov33/M7"
Content-Disposition: inline


--cAVknSgQgov33/M7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 10:24:15AM -0700, Evan Green wrote:
> On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@r=
ivosinc.com> wrote:
> >
> > Factorize ISA extension reporting by using a macro rather than
> > copy/pasting extension names. This will allow adding new extensions more
> > easily.
> >
> > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> > ---
> >  arch/riscv/kernel/sys_riscv.c | 32 ++++++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_risc=
v.c
> > index 473159b5f303..e207874e686e 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -145,20 +145,24 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe=
 *pair,
> >         for_each_cpu(cpu, cpus) {
> >                 struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> >
> > -               if (riscv_isa_extension_available(isainfo->isa, ZBA))
> > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> > -               else
> > -                       missing |=3D RISCV_HWPROBE_EXT_ZBA;
> > -
> > -               if (riscv_isa_extension_available(isainfo->isa, ZBB))
> > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> > -               else
> > -                       missing |=3D RISCV_HWPROBE_EXT_ZBB;
> > -
> > -               if (riscv_isa_extension_available(isainfo->isa, ZBS))
> > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> > -               else
> > -                       missing |=3D RISCV_HWPROBE_EXT_ZBS;
> > +#define CHECK_ISA_EXT(__ext)                                          =
         \
> > +               do {                                                   =
         \
> > +                       if (riscv_isa_extension_available(isainfo->isa,=
 __ext)) \
> > +                               pair->value |=3D RISCV_HWPROBE_EXT_##__=
ext;       \
> > +                       else                                           =
         \
> > +                               missing |=3D RISCV_HWPROBE_EXT_##__ext;=
           \
> > +               } while (false)
> > +
> > +               /*
> > +                * Only use CHECK_ISA_EXT() for extensions which can be=
 exposed
> > +                * to userspace, regardless of the kernel's configurati=
on, as no
> > +                * other checks, besides presence in the hart_isa bitma=
p, are
> > +                * made.
>=20
> This comment alludes to a dangerous trap, but I'm having trouble
> understanding what it is.

You cannot, for example, use this for communicating the presence of F or
D, since they require a config option to be set before their use is
safe.

> Perhaps some rewording to more explicitly
> state the danger would be appropriate. Other than that:
>=20
> Reviewed-by: Evan Green <evan@rivosinc.com>

--cAVknSgQgov33/M7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTAW7gAKCRB4tDGHoIJi
0nhVAQCLhafGLIz6kNxqBPqbvT0nF5pEAuym/4xsHPY7LR48wAEAyEIW4fTv7pLN
AshYRoolc15bM671HyzLYWakxep6WAU=
=CY63
-----END PGP SIGNATURE-----

--cAVknSgQgov33/M7--


--===============7691279728440773754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7691279728440773754==--

