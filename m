Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE723C0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 13:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Edj8EEFyAih3ehJzawUzNq+GouQ9IHVQ+G8ZGDzJC0=; b=U1Qh3v2r/PWaQN3nFLg0Us1q4T
	p0umUjrBwY3jKV8ymU1mCH1AYuCBJuT568zcg8WetYGUKF89sUQxKE7cI/DCj1U9Nw9bHA/bH6p2B
	z7yvMElk7OhCh70QSJME9OBHlhza7SVJ9X/0mo0QWtKM0jm0FzNRhstUab6VegoQyPugnt8UkiaeI
	ryV0M98yKROVdILMpFg9mF28YoV8HhNJC6yF5GwqH3TN4MQ4cTvWwxZ+jMiMh9Hy4KYZZ9OIvuDnx
	RZObs4RxfAOR4WrOk8Aih6bfKCve+/W3SFfqnf3Tw28iS25p//S+2jXyGNtHo5wCgaYkUA5KlwDEf
	UbTY5Lkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqaY-000000040HB-1VN2;
	Tue, 11 Feb 2025 13:46:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqZe-0000000406q-0Fb5
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 13:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6F1CA40460;
	Tue, 11 Feb 2025 13:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9529EC4CEDD;
	Tue, 11 Feb 2025 13:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739281512;
	bh=gfp/lscMg8Zqo5eVValThcg9uc0spTm0nNpPie2Egn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ho6Q784Hr4pay/kPWa7uGDgtMy2D2FV4ugDHgSlsJ90OhNcI6+j44Dhy/rxmPRxRU
	 6KpHg2E1U+Rkd8IZntVBCl7qRFB27olxZOmxcfinJqgwVkkZRZ+D0TRb4QfGnGw5Tc
	 iBxKbaCZGLt8tfVEO76QPX/ft9d5qWgIcdKztRm+BtJpUTE6hWj+5lvgVbCsBmiEtH
	 VBBclUr0pnOlRWzH5M7jXbluxLrSHPe2HC+i8/eJyVL0MqYBXSe1xYN3N6JBmw/j0V
	 NP2ezJMEYH/NieO2HnxhwWEmAB8WGD8cY03OHDS90szEfPDkhWBDQX7/3+okNjH8qc
	 vMAqBfV/xvhxg==
Date: Tue, 11 Feb 2025 13:45:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v3 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
Message-ID: <20250211-dizziness-eclair-2ef49cc5ad0e@spud>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-3-inochiama@gmail.com>
 <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>
 <7qkfqzhytjq2qwo2wg3xtkoqu6id6wduckeeudbn2yt5p5p7xv@2gl5bcny26rk>
MIME-Version: 1.0
In-Reply-To: <7qkfqzhytjq2qwo2wg3xtkoqu6id6wduckeeudbn2yt5p5p7xv@2gl5bcny26rk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_054514_241702_28E9DEA3 
X-CRM114-Status: GOOD (  30.03  )
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
Content-Type: multipart/mixed; boundary="===============4501405945751903050=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4501405945751903050==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Se8lg8BspTeEI14q"
Content-Disposition: inline


--Se8lg8BspTeEI14q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 08:42:39AM +0800, Inochi Amaoto wrote:
> On Mon, Feb 10, 2025 at 03:38:58PM +0100, Cl=E9ment L=E9ger wrote:
> >=20
> >=20
> > On 06/12/2024 06:58, Inochi Amaoto wrote:
> > > Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
> > > were ratified in 4dc23d62 ("Added Chapter title to BF16") of
> > > the riscv-isa-manual.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  arch/riscv/include/asm/hwcap.h | 3 +++
> > >  arch/riscv/kernel/cpufeature.c | 3 +++
> > >  2 files changed, 6 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/=
hwcap.h
> > > index 869da082252a..14cc29f2a723 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -100,6 +100,9 @@
> > >  #define RISCV_ISA_EXT_ZICCRSE		91
> > >  #define RISCV_ISA_EXT_SVADE		92
> > >  #define RISCV_ISA_EXT_SVADU		93
> > > +#define RISCV_ISA_EXT_ZFBFMIN		94
> > > +#define RISCV_ISA_EXT_ZVFBFMIN		95
> > > +#define RISCV_ISA_EXT_ZVFBFWMA		96
> > > =20
> > >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > > =20
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index c0916ed318c2..5cfcab139568 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -341,6 +341,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> > >  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> > >  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
> > >  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> > > +	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
> >=20
> > Hi Inochi,
> >=20
> > You could add a validation callback to that extension:
> >=20
> > static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
> > 			       const unsigned long *isa_bitmap)
> > {
> > 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
> > 		return 0;
> >=20
> > 	return -EPROBE_DEFER;
> > }
> >=20
> >   ...
> >   __RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN,
> > riscv_ext_f_depends),
> >=20
> >=20
> > But I'm ok with the current state of that patch since I have the same
> > thing coming for other extensions as well.=20
>=20
>=20
> I think it is good for me to add the check, and I wonder it is possible
> to add the extra check for zvfbfmin and zvfbfwma like this:
>=20
> static int riscv_ext_zvfbfmin_validate(const struct riscv_isa_ext_data *d=
ata,
> 				       const unsigned long *isa_bitmap)
> {
> 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_v))
> 		return 0;

This is not needed I think, V "turns on" Zve32f. If anything, you should
be checking for CONFIG_RISCV_ISA_V here ^^

You /could/ call the resulting riscv_vector_f_validate(), since this is
nothing specific to Zvfvfmin, and could be used for another extension
that requires a Zve32f or Zve64 minimum base.

>=20
> 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32F))
> 		return 0;
>=20
> 	return -EPROBE_DEFER;
> }
>=20
> static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *d=
ata,
> 				       const unsigned long *isa_bitmap)
> {
> 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZFBFMIN) &&
> 	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVFBFMIN))
> 		return 0;
>=20
> 	return -EPROBE_DEFER;
> }
>=20
> > So with or without my previous comment fixed:
> >=20
> > Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >=20
> > Thanks,
> >=20
> > Cl=E9ment
> >=20
>=20
> Thanks,
>=20
> Regards,
> Inochi
>=20
> > >  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> > >  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> > >  	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> > > @@ -373,6 +374,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> > >  	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d=
_exts),
> > >  	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f=
_exts),
> > >  	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x=
_exts),
> > > +	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
> > > +	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
> > >  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
> > >  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
> > >  	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> >=20

--Se8lg8BspTeEI14q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6tUYgAKCRB4tDGHoIJi
0jpAAQCJT260gZ44MqS5WAFaSS3YHM7pcKksbbBcRbLLRJRt1QEA1VuoISvTOdKy
o4hirdu8NCqh0sYTznq3JAJE5ckAFw4=
=fqGt
-----END PGP SIGNATURE-----

--Se8lg8BspTeEI14q--


--===============4501405945751903050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4501405945751903050==--

