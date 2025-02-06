Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD4DC02199
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsgX5L6sKBk/Tbb5nQAEiikO4N23L81OIyf/j3hfNv8=; b=axCmdC27NAOW6estQ3AkuVNUcX
	ACxV4rhv9SQjKnKxeZNNh8frgXvswvMEjVmdtuRzhifHOYswwkPpSWPJhIVJZC3pIAedi12fDSLkO
	XkR6yit1CMPmZ9T5mXU5hdX61QGYkLgWQBykhgaTvPH1G/0Po2vOD/xT05kmd8+qnWV38kZySpGv3
	wWQouMtlvvolvnKCfLAdbWu2zH/sNDLL3bKd1rRSHVFT+4my74vgimivGVi4ZHJgu1zOswZ1U+MgF
	GHHSltKzwFxnTQp5wYXkP6gNqOuuNLCnubk+ZCjGNPaEie02mWBUtK0NQwSSaYAPorDWLsAbnm3dB
	GyfinVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Ow-00000006CL4-43MC;
	Thu, 06 Feb 2025 11:50:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzvB-000000066vu-06MA
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 11:19:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E079C5C6009;
	Thu,  6 Feb 2025 11:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50286C4CEE0;
	Thu,  6 Feb 2025 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738840787;
	bh=3XahQA8TQAgihPAyJGt25gw9A3FPf+HkIq/LUtxGP0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBvz8toNMyQ6ZjYf/IQq9RRVau1wIWEhGT6FxGSGHStmdqm7sNhXRYBqIQwINV2ar
	 XAu8OAohsqsvvlbpMuUoEhmV0NDoJT3cyr1IEySvpieiTroP51g6D4wOHJw3Q3d6va
	 miWNmARGY/FAdLouIPUldsp5fo9RtTAq6Q7uy0mNgBZGmdKQCz7q2UZ7B0pN5k8BwX
	 8PeD0mG5T01NAY9irTXqYo18NyrWeefyhCTOo9fgV1jR2A9HRw0D6IJAS6XLD4IoEx
	 8q0wonF5v5mNRYhAiKoA5vNQbSocZRHTcxP6xlNzIv3KZ2uEFMhhc+RTnrunbt0SSR
	 pncO6pJNP414g==
Date: Thu, 6 Feb 2025 11:19:43 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] RISC-V: add vector extension validation checks
Message-ID: <20250206-silica-outscore-b2ec7ff9e945@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-defensive-lent-04936dac6bdd@spud>
 <0df559c7-920d-4d89-b1c8-75380750e7e1@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <0df559c7-920d-4d89-b1c8-75380750e7e1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_031949_151714_DD2F5E0D 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Type: multipart/mixed; boundary="===============4055372761382058239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4055372761382058239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V6mvoxu1BVi3A3Yn"
Content-Disposition: inline


--V6mvoxu1BVi3A3Yn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 11:08:57AM +0100, Cl=E9ment L=E9ger wrote:
> On 05/02/2025 17:05, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >  static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
> >  				 const unsigned long *isa_bitmap)
> >  {
> > @@ -326,12 +355,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
> >  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
> >  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> > -	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, r=
iscv_ext_vector_float_validate),
> >  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> > -	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv=
_xlinuxenvcfg_exts,
> > -					  riscv_ext_zicbom_validate),
> > -	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv=
_xlinuxenvcfg_exts,
> > -					  riscv_ext_zicboz_validate),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv=
_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv=
_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
>=20
> This chunk seems to just remove line wrapping for existing code, not
> sure if this is intended.

I probably removed the line wrapping from it in passing because I found
the array very difficult to follow once all the validate callbacks were
added to it with correct line wrapping applied. I did intend to not line
wrap what I was adding, I forgot I removed line wrapping for existing
stuff too.


--V6mvoxu1BVi3A3Yn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6SazgAKCRB4tDGHoIJi
0mMmAP93yvPqPwcG5qUxXWQ3qHHgVY+taj5FOU7P3hoG2VFyBQEAyHkOHxBY8WCW
xApKqajWM/qiauG9iUUCYYs7+cSzDwM=
=SMY1
-----END PGP SIGNATURE-----

--V6mvoxu1BVi3A3Yn--


--===============4055372761382058239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4055372761382058239==--

