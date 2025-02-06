Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C362DC02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG4q0Xi7Xfbe56NPaBuKENppegizKJiM7+M/p+nnat0=; b=qgjmhiSjmWb2yQRKqQ9eL1e0JD
	SdR8zMwlc1otO4h6jTNCOpOc3VVmXR5tc2/KVAderSeHXuszmFRJLRQrKxQtLTEV6NYxy3Y3NGEd0
	iUa0QNnTSjDLeKN2nCcVOi0urWI4RA78PUuWEqZPWaMZo2t6BxTyd4JcoBhoyrnnie2kaNqgOTYS1
	9gKHcgFgVJDFpX4hAvpAWhaNOBguRVfSQTiaB2ODabqpvki/abLwYTzQqKFzb50i3G6TArFqCdb/o
	mBbFjSNIK2X6nfZoWpoSxuGcAdd1/8AmkZqdrGFe+2UCjSNAR49KGuRsIxobd7SDAOXt+J2+S96sQ
	dJj8fKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Oy-00000006CMh-1Yua;
	Thu, 06 Feb 2025 11:50:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzzv-000000067u7-2ZSh
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 11:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACE84A438EE;
	Thu,  6 Feb 2025 11:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5272FC4CEDD;
	Thu,  6 Feb 2025 11:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738841082;
	bh=sNzc9rpJrSGgiXFYTxSNOLd9piOIMO0s74xHHWxepHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G90odWPxAXNcL5p8b/ZM6942sxWRYqIyydeudZGXD7kDgY9UdK6wJb20MdLg/aSp0
	 9IDUywrkI2UzLH+JdHjbcyKaq+jnZOSfai2sF8LU+n1oxJKC6fzU8scOHU7e8NC10r
	 BTTlrg0L4UgJkjQICHlroN4o6IoU8OYMoNxQhBW5+2EHF+ClinNegdSlybx7vazQLW
	 cgYYu+wxSa/LHSL8crd+mR/i/SpuC1eWFtX/0+FADDTDWQRREH+ptLR34MpyG6upJ5
	 BgxACN0F58lagv7sBgUSiTBxamJ5sd6D5NBRV0pZLOkoYicvbU7d8sHXHdozPOWaxf
	 P81Kwk0ihXTdA==
Date: Thu, 6 Feb 2025 11:24:38 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
Message-ID: <20250206-overcook-legibly-0350a9af8a2a@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <00dc2fb7-da9b-42c3-9c3b-47d917df7cf6@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <00dc2fb7-da9b-42c3-9c3b-47d917df7cf6@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_032443_784116_F24F0BB7 
X-CRM114-Status: GOOD (  26.65  )
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
Content-Type: multipart/mixed; boundary="===============3328457369269695740=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3328457369269695740==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1iqbN1jWYKwYUDZR"
Content-Disposition: inline


--1iqbN1jWYKwYUDZR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 11:20:35AM +0100, Cl=E9ment L=E9ger wrote:
> On 05/02/2025 17:05, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Using Clement's new validation callbacks, support checking that
> > dependencies have been satisfied for the vector crpyto extensions.
> > Currently riscv_isa_extension_available(<vector crypto>) will return
> > true on systems that support the extensions but vector itself has been
> > disabled by the kernel, adding validation callbacks will prevent such a
> > scenario from occuring and make the behaviour of the extension detection
> > functions more consistent with user expectations - it's not expected to
> > have to check for vector AND the specific crypto extension.
> >=20
> > The 1.0.0 Vector crypto spec states:
> > 	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
> > 	the composite extensions Zvkn and Zvks-- require a Zve64x base,
> > 	or application ("V") base Vector Extension. All of the other
> > 	Vector Crypto Extensions can be built on any embedded (Zve*) or
> > 	application ("V") base Vector Extension.
> > and this could be used as the basis for checking that the correct base
> > for individual crypto extensions, but that's not really the kernel's job
> > in my opinion and it is sufficient to leave that sort of precision to
> > the dt-bindings. The kernel only needs to make sure that vector, in some
> > form, is available.
> >=20
> > Since vector will now be disabled proactively, there's no need to clear
> > the bit in elf_hwcap in riscv_fill_hwcap() any longer.
>=20
> To which part of the commit does this refer to ?

Copy-paste mistake when splitting in two, whoops.

> > @@ -397,8 +414,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >  	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
> >  	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> >  	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
> > -	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
> > -	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvb=
b_exts, riscv_ext_vector_x_validate),
> > +	__RISCV_ISA_EXT_DATA_VALIDATE(zvbc, RISCV_ISA_EXT_ZVBC, riscv_ext_vec=
tor_crypto_validate),

>=20
> I'm not sure if I already made that comment, so here we go again.
> Shouldn't Zvbb use riscv_ext_vector_crypto_validate() as well ?  The
> spec states that Zvbb is a superset of Zvkb and Zvkb uses the
> riscv_ext_vector_crypto_validate() validation callback. I guess Zvbc
> should also use it based on your spec excerpt in the commmit log.

Zvbc does use it, no? I'll amend the Zvbb one, there should only be two
users of the "x" variant.

--1iqbN1jWYKwYUDZR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Sb9QAKCRB4tDGHoIJi
0ldwAP983+O6h9quEOj+A8/HT/Ck02DGt4dHGhmvorY2AWRn6AEA45wAgwsU68ns
s/Feax0psZjLxql/U1SmCwWvWvDHiAc=
=FI6o
-----END PGP SIGNATURE-----

--1iqbN1jWYKwYUDZR--


--===============3328457369269695740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3328457369269695740==--

