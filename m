Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BD3C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 23:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOEpbwQBUKN+RkfaZfBI6AnbIxw7iTGPADdEXOVMZ1A=; b=2qjjEVKRrbZVjbY1QsNOf9LTV9
	WB+ZSY5gpn3L+qqHd80BZ1lKb5gFlTQphOCbu+c+/xPp+g4s+Bno0ruhHzA4/HeNfS1qb83Y3oIes
	LET0fArJJPUnR0yeCpWZd79gOebnpq5VcO0PjjAnroIDVJqidT/sQuCoy/M337bQcWMLbX6Kmbf8q
	bf7AKtbnkt9Mr+yMUHqUHR/4ycnCTvpvqRUmx4xCSli4rrzH+Lo19w2y4+R9oMEKwUA1dcXVDq0RF
	yjzLYNpqGClcLvPvkGZVOSZKNBPCt06JSAnGxzzCEZ8ttveg7OQIXwlk/sH0Wn1//on8wO3IvF/fo
	CwZTYxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UZu-000X3H-W2; Thu, 22 Dec 2022 23:02:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UZM-000WaM-Kc
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 23:01:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3371B81EE6;
	Thu, 22 Dec 2022 23:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE17C433D2;
	Thu, 22 Dec 2022 23:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671750101;
	bh=b5vBQy9xmlynU0ZwLY3V6etOZQg6/rWZ2rpl4BeJhpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0OeFLw4cb8cPkowmGEi3Wdr08wRHIOs5p4sf1n0mxVghXsPrJdetb4PvUKIuk1Pp
	 sA1O/bTA7L9M+Zqwx/C4397D3cTFI58zurU9GtkKYRLDZuI7EbBbUIvJrD4gcYFlzm
	 UP3GVNF/k5eaDSc3H7XBxKGtDJpfQ3hyjFwj4ILtGIFAJ2rsThbfh+yK65vQY+ztr5
	 nrNPLD2wGD7BuWFjTN4fFnb5bBao8tkJVpN6dd6cMDkg11ct7fOqb371xjuJ/ZoaZr
	 8tkluZcJJH+L7CgfdX8SfHMMOQA/dt/F8e1MYSWASDGvrK9k8FZPG1K1gHidUiUu7m
	 LqpIrYegOPzew==
Date: Thu, 22 Dec 2022 23:01:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux@rivosinc.com,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: add base extensions to enum riscv_isa_ext_id
Message-ID: <Y6Th0o3Bl8vBj+vn@spud>
References: <20221222224104.3449841-1-vineetg@rivosinc.com>
 <Y6TgAxg3csoQqaFr@spud>
MIME-Version: 1.0
In-Reply-To: <Y6TgAxg3csoQqaFr@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_150145_154691_68885BD2 
X-CRM114-Status: GOOD (  24.07  )
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
Content-Type: multipart/mixed; boundary="===============6554720380232043191=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6554720380232043191==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7zh3RNXCMfbSQS6l"
Content-Disposition: inline


--7zh3RNXCMfbSQS6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I got distracted, actually +CC Jisheng..

On Thu, Dec 22, 2022 at 10:53:59PM +0000, Conor Dooley wrote:
> Hi Vineet,
>=20
> On Thu, Dec 22, 2022 at 02:41:04PM -0800, Vineet Gupta wrote:
> > This allows for using the enum in general to refer to any extension.
>=20
> What is the point of this patch? It's hard to understand the rationale
> without having any user, especially...
>=20
> >=20
> > Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index b22525290073..b861e711e3ac 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -26,16 +26,6 @@ enum {
> > =20
> >  extern unsigned long elf_hwcap;
> > =20
> > -#define RISCV_ISA_EXT_a		('a' - 'a')
> > -#define RISCV_ISA_EXT_c		('c' - 'a')
> > -#define RISCV_ISA_EXT_d		('d' - 'a')
> > -#define RISCV_ISA_EXT_f		('f' - 'a')
> > -#define RISCV_ISA_EXT_h		('h' - 'a')
> > -#define RISCV_ISA_EXT_i		('i' - 'a')
> > -#define RISCV_ISA_EXT_m		('m' - 'a')
> > -#define RISCV_ISA_EXT_s		('s' - 'a')
> > -#define RISCV_ISA_EXT_u		('u' - 'a')
> > -
> >  /*
> >   * Increse this to higher value as kernel support more ISA extensions.
> >   */
> > @@ -53,6 +43,15 @@ extern unsigned long elf_hwcap;
> >   * available logical extension id.
> >   */
> >  enum riscv_isa_ext_id {
> > +	RISCV_ISA_EXT_a =3D ('a' - 'a'),
> > +	RISCV_ISA_EXT_c =3D ('c' - 'a'),
> > +	RISCV_ISA_EXT_d =3D ('d' - 'a'),
> > +	RISCV_ISA_EXT_f =3D ('f' - 'a'),
> > +	RISCV_ISA_EXT_h =3D ('h' - 'a'),
> > +	RISCV_ISA_EXT_i =3D ('i' - 'a'),
> > +	RISCV_ISA_EXT_m =3D ('m' - 'a'),
> > +	RISCV_ISA_EXT_s =3D ('s' - 'a'),
> > +	RISCV_ISA_EXT_u =3D ('u' - 'a'),
>=20
> ... as it is diametrically opposed to another patchset which deletes
> this enum, with a rationale.
> https://lore.kernel.org/linux-riscv/20221204174632.3677-5-jszhang@kernel.=
org/
>=20
> +CC Jisheng.
>=20
> Also, please run get_maintainer.pl, there's a bunch of people touching
> this area at the moment & CCing them would be great.
>=20
> Thanks,
> Conor.
>=20
> btw, is the rivos list intentionally on CC?
>=20
> >  	RISCV_ISA_EXT_SSCOFPMF =3D RISCV_ISA_EXT_BASE,
> >  	RISCV_ISA_EXT_SVPBMT,
> >  	RISCV_ISA_EXT_ZICBOM,
> > --=20
> > 2.34.1
> >=20
> >=20
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



--7zh3RNXCMfbSQS6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6Th0QAKCRB4tDGHoIJi
0oSkAQCtC0WtC/IY4w+DQTKoqA7YTCihCzqSfURwPYh/TIC+6QD/R6z3WC4E7vt1
opGGz7TfQ/NiqJH+hoMDMj77/5x64AU=
=dV6E
-----END PGP SIGNATURE-----

--7zh3RNXCMfbSQS6l--


--===============6554720380232043191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6554720380232043191==--

