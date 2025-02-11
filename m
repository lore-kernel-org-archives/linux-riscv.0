Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34922C0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoveXm1lD73enF8tVHlOuwVhVPNKEVDMppm1X/jVulY=; b=NDZ+PcBDF/q8MBOHNZXsDA3Ne0
	jKHto8q33sE+AsYAvL4SnVFnYS+U445XSSoYT6Da+mCpxH6L8HlItpZmtf6/Qm5KrImeWscHFF7vG
	Ru3gz8NkjvSZeurEBGh7bLTZPNlgqT9bMtmn9YqsmEcDDVfNIwkd5uB/POXUEBUjb6VOk4CJsnrjB
	Tp70bxPqitq2bmm/Hvc5WB/L8pBkn+CvUNVWt7WtddaDURWz+hTTtsRkmH/7ARt1vFBxr9m5f4Msh
	vR9dj3us/hPsbiJM/zZc3Sbnrl+BSGC/rRdFQ/3iOtHBmraA9Pz4qYPKk/0twRu6rN8eTvKE4dR3S
	2RFBd09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpkl-00000003qI3-15pm;
	Tue, 11 Feb 2025 12:52:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thp2P-00000003h6D-2HZc
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 12:06:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AFDCA40340;
	Tue, 11 Feb 2025 12:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41443C4CEDD;
	Tue, 11 Feb 2025 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739275608;
	bh=i7+ekkT9TnIZYnI8SWpO1ROV9Pa3oWltrv4zlRMPpAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkQW98gJjoQ4CF6Mxndd5RcnONq0pHOBrXhErcD8ckKyL41UVwmMF4zoqAnd1bisB
	 QM16aFq+WbqQaEflbrxARxJFBYNVcZ7iOK/FEcpYwurGNY1qhzaD+mGzn3eD8ox9am
	 oR3VjwsIwwHUIEC+TfUYEBP52aVyEn4fb1EHt3mhxSFAXLagSYZs9tCbbapBWNUCxq
	 +NrzGJOWkX818kGoY+q+s3SNMbwRD86jRY8EaMRdUlR3l340W0LiUt+/1OPtCudC1/
	 263EPNtkhfUnR6Y/hKaa8qeUZaUnMUYbCoLps9Lig0M/ydlU6bsSBkG+ehfJkz8byu
	 n9wq4xHTZMFww==
Date: Tue, 11 Feb 2025 12:06:44 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] RISC-V: add f & d extension validation checks
Message-ID: <20250211-phobia-spiritism-3c0ffba5315d@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-stifle-remake-4e497e96fd66@spud>
 <cfd0a7d1-464f-468d-9302-46d6b28efe5f@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <cfd0a7d1-464f-468d-9302-46d6b28efe5f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_040649_716089_82CFAD1C 
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
Content-Type: multipart/mixed; boundary="===============7471281255387431684=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7471281255387431684==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YYCpN0mPd1hMFh+l"
Content-Disposition: inline


--YYCpN0mPd1hMFh+l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:22:13AM +0100, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 05/02/2025 17:05, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Using Clement's new validation callbacks, support checking that
> > dependencies have been satisfied for the floating point extensions.
> >=20
> > The check for "d" might be slightly confusingly shorter than that of "f=
",
> > despite "d" depending on "f". This is because the requirement that a
> > hart supporting double precision must also support single precision,
> > should be validated by dt-bindings etc, not the kernel but lack of
> > support for single precision only is a limitation of the kernel.
> >=20
> > Since vector will now be disabled proactively, there's no need to clear
> > the bit in elf_hwcap in riscv_fill_hwcap() any longer.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 1c148ecea612..ad4fbaa4ff0d 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -109,6 +109,29 @@ static int riscv_ext_zicboz_validate(const struct =
riscv_isa_ext_data *data,
> >  	return 0;
> >  }
> > =20
> > +static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
> > +				const unsigned long *isa_bitmap)
> > +{
> > +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
> > +		pr_warn_once("This kernel does not support systems with F but not D\=
n");
> > +		return -EINVAL;
> > +	}
>=20
> While I tested to remove the RISCV_ISA_EXT_d from the input isa bitmap
> and it worked, I didn't realized that it was due to the probe order of
> single letter extensions. D is probed before F so that works as
> expected. But returning -EPROBEDEFER would not allow to display the
> warn_once or wrongly display it if D was not yet probed. So I'm inclined
> to keep it as is and rely on probe order (a bit fragile but for single
> letter extensions, that seems acceptable).

I guess it's worth adding a comment to that effect.

> > +
> > +	if (!IS_ENABLED(CONFIG_FPU))
> > +		return -EINVAL;
>=20
> I would have actually move that chunk before the
> __riscv_isa_extension_available() check so that the whole function body
> is elided if FPU is disabled.

I think you're right, but for another reason too - warning when someone
has turned off CONIFG_FPU doesn't make sense.

--YYCpN0mPd1hMFh+l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6s9UwAKCRB4tDGHoIJi
0mlpAPsHpRmdh/Bp/K38cfzgKnrQzJ05SFAo2DNse6NjPs0maQD/eLtlJ7siAn9q
UQsqvwfZVOoiVkZ2sFfrw2hiMSUT/QA=
=BtAZ
-----END PGP SIGNATURE-----

--YYCpN0mPd1hMFh+l--


--===============7471281255387431684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7471281255387431684==--

