Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF6BC0219D
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mp7jYa7yFGCb1SLYRYYKVwMh/PYWemXy3UdUYcmJUAc=; b=TPGnCTJoKXFAbdhaZfUCHBZ6DI
	Wfks8wSYtE+rwJVpjpyLWqSv7c7xOVOL/NmkbI4Z0hs9yDfNGUsuUGyWfCNks88PNfZ5Wb6p+fmkH
	TiAja9VGP6D/oM8dXLnGC6V2wSCEIay/lUMEn7uOyrNUdqPXv7dCZ65DXbPmK/yus7P0bohSU5UaW
	hugpedXSyQ4YRSYB4mAz8DIv6rGAtpqWeMttUKcOJL/1nrED0BzKtsSN2oYYFM/YcN3NVba0E09AA
	KiEksjSiUxagzYzshxp8ocIJHNI1SXdSNt8R2lDRwjjrvePoLTr+BJF+Dn3OwjTSpLm9jpUBmIJbx
	g+K1p3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpxD-00000003slQ-1NUn;
	Tue, 11 Feb 2025 13:05:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpTj-00000003nHt-0IMj
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 12:35:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD437A40321;
	Tue, 11 Feb 2025 12:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AFAC4CEDD;
	Tue, 11 Feb 2025 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739277302;
	bh=MA14njnJTflw/O+wK7u99/DEzkLn82WquM8a6RvG0Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOjrMX6LCFqH0i2YuNm9+qyiW/Eb92E4QreqJ2T9+GlDiXgX0Jte8aGHcOXFbLmxU
	 gQ1FfAm54IJx1GhDUrrdjH9AIggQvdCusC3fd1kDlkCVNHxIhJj5b2aG7ddaErmAsw
	 SKZjQCI59+Vm0NVrZ+wjJt9cquceo3ChPd0QGEg3DcSvZ59tXQfJnSRGMHhtqzQ3LW
	 cRr2VhUJauJVgc0rulls9zzoMF9hrFZ+OB0fQ+a99AMpgwkh+8RcMxCvrZOemrBJ1r
	 LHVP06OAVbozyEKNRRUey2NkYmJo0FjUSDwT54h8h7pPxJRJex5recJzei7hoixe/P
	 RT/tET6XJS7jg==
Date: Tue, 11 Feb 2025 12:34:57 +0000
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
Message-ID: <20250211-implode-mute-8ff31f44bdf9@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <f1ce7aa9-63e3-41bd-9bb0-a54ebc714dff@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <f1ce7aa9-63e3-41bd-9bb0-a54ebc714dff@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_043503_248286_C0386534 
X-CRM114-Status: GOOD (  35.73  )
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
Content-Type: multipart/mixed; boundary="===============6820237291863785592=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6820237291863785592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2QQXwfJwMNFQMRKG"
Content-Disposition: inline


--2QQXwfJwMNFQMRKG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 09:45:44AM +0100, Cl=E9ment L=E9ger wrote:
>=20
>=20
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
> >=20
> > Link: https://github.com/riscv/riscv-crypto/releases/tag/v1.0.0
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 49 +++++++++++++++++++++++-----------
> >  1 file changed, 33 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 40a24b08d905..1c148ecea612 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -138,6 +138,23 @@ static int riscv_ext_vector_float_validate(const s=
truct riscv_isa_ext_data *data
> >  	return 0;
> >  }
> > =20
> > +static int riscv_ext_vector_crypto_validate(const struct riscv_isa_ext=
_data *data,
> > +					    const unsigned long *isa_bitmap)
> > +{
> > +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * It isn't the kernel's job to check that the binding is correct, so
> > +	 * it should be enough to check that any of the vector extensions are
> > +	 * enabled, which in-turn means that vector is usable in this kernel
> > +	 */
> > +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X=
))
> > +		return -EINVAL;
>=20
> After a second thought, I think it should be this:
>=20
> if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X))
> 	return 0;
>=20
> return -EPROBEDEFER;
>=20
> Extensions can be enabled later (but can not be "reverted") so check for
> the extension to be present (in which case it's ok), or wait for it to
> be (potentially) enabled.

Ah, of course it is operating on the /resolved/ isa, not the source one.
Makes me thing the parameter of all the validate callbacks should be
"resolved_isa_bitmap" instead of "isa_bitmap" to make things clearer?


--2QQXwfJwMNFQMRKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6tD8QAKCRB4tDGHoIJi
0rbMAP4r/yeGzY8gnolAtoXxntJZm835aG220lRMaGrFycBfywD/dVqx4BlphFDL
rdGYdaDO/nBthbezTn7ZCNX4CIT5QAM=
=5wwm
-----END PGP SIGNATURE-----

--2QQXwfJwMNFQMRKG--


--===============6820237291863785592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6820237291863785592==--

