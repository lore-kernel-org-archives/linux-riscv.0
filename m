Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B158D132B4
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXH0xcR7af/3rg+Lup86y1wpgL3aXfzzyfoJXQUMBps=; b=1JhMomduh8pSYiEfgiNWhBAuWc
	EUPZtw/gYXeXlEHKeC4uKITdD6eR5jVkDLMIvphMheYvxyHIuhv3F9fTg236wCFfcEfE1CQtz6vcR
	HCqUyeJbNqd5WyE/05ZeJfn9kkBiVpVmRkHYtBzv2C/xUuMzOc3k5OkoH9q/lJkaUw93HGD0CHUWC
	dmMBO9Vhj8mcNswpRknrFyAJRloqNjKlfNjeqFH9i46ctmV5eeeGQavAnmCJ6wUpq8ppT8ZwH+ViD
	D0lW84WJFhFf2c7s/jwhXgD5zk6T218S0ZQi8QRPY8a9K0K501GugeMP7WqkVZfU+AY4+iKOD4fm2
	NvtZYdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w3A-0000000Dfkb-08sQ;
	Mon, 04 Nov 2024 12:19:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vsC-0000000De4R-3xRW
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 12:07:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC8F1A42E91;
	Mon,  4 Nov 2024 12:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F5DC4CED1;
	Mon,  4 Nov 2024 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730722075;
	bh=vsi/33NO427ZAndINphaIY00QOvDA9ey0no25IMNd9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npXjDaGGZ80pU4vZ5j/r8KHDcCtmUDdEQC/2TlGdDWGbkKhfeTBrNjRXVd7bo7N3M
	 Zf0PhHihION3wOtFDRHym/jLTMhd5BgFjLC4dZKe6ZCBsX0EeKJptLeGOyPMvZ+RCR
	 TP3nYhIziZ8vdu67APyeHjs8ItLBeVBhP94zT/nGgHUxxed+aSSJPGroRnOH5EIZY9
	 QdocH/QeuOfA7dVrUer1mBV7sQj4EE5HN2j+T3C00hfXWDr1d4xGqUc/9PjK/JWDQo
	 HMekwVt4NgTs/4OzDZYcc+ITCiSr5ojkNf6AH8bhqb14UkMNzb/M5FIIAoKwRX0RhE
	 T6rnPFfharIUQ==
Date: Mon, 4 Nov 2024 12:07:49 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>, Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
Message-ID: <20241104-number-recall-85e044c9b72d@spud>
References: <20241103074959.1135240-1-inochiama@gmail.com>
 <20241103074959.1135240-3-inochiama@gmail.com>
 <2e775421-0c3e-48ef-8a8c-6734f7fcf298@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <2e775421-0c3e-48ef-8a8c-6734f7fcf298@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_040757_136537_32DA15D0 
X-CRM114-Status: GOOD (  19.58  )
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
Content-Type: multipart/mixed; boundary="===============6287964746155017732=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6287964746155017732==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vFZn2GDfm8gUnKj9"
Content-Disposition: inline


--vFZn2GDfm8gUnKj9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 10:15:56AM +0100, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 03/11/2024 08:49, Inochi Amaoto wrote:
> > Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
> > were ratified in 4dc23d62 ("Added Chapter title to BF16") of
> > the riscv-isa-manual.
> >=20
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 3 +++
> >  arch/riscv/kernel/cpufeature.c | 3 +++
> >  2 files changed, 6 insertions(+)
> >=20
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index 46d9de54179e..97657fb63af6 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -93,6 +93,9 @@
> >  #define RISCV_ISA_EXT_ZCMOP		84
> >  #define RISCV_ISA_EXT_ZAWRS		85
> >  #define RISCV_ISA_EXT_SVVPTC		86
> > +#define RISCV_ISA_EXT_ZFBFMIN		87
> > +#define RISCV_ISA_EXT_ZVFBFMIN		88
> > +#define RISCV_ISA_EXT_ZVFBFWMA		89
> > =20
> >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > =20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 3a8eeaa9310c..1b286f5bc591 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -325,6 +325,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> >  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
> >  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> > +	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
> >  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> >  	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> > @@ -357,6 +358,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >  	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_e=
xts),
> >  	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_e=
xts),
> >  	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_e=
xts),
> > +	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
> > +	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
>=20
> @Conor,
>=20
> Should we wait for your V/F validation support to be merged before this
> one ?

Uh, I don't really see a reason to hold this up on my account. I can
easily rebase on top when I get the motivation to do more work on that
series.

--vFZn2GDfm8gUnKj9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyi5FQAKCRB4tDGHoIJi
0nLvAP9dZnNwlwpdYASHbLLL4ZVIYfSR0JyUNfivFOkfosM0aQEAhemaFYVfqvPL
YewSufLQLOeK2QCh4rruU59GZSdYwAQ=
=uyWh
-----END PGP SIGNATURE-----

--vFZn2GDfm8gUnKj9--


--===============6287964746155017732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6287964746155017732==--

