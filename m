Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C671DC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nhe2MLueGPY51tOFpAH0pqD3dzgIyzAC1xLeET3ikJU=; b=yLxJuRTLNhDc2ScOwTsmkjd46w
	f2Zb2Xdi2zCaGEYFYUqQizH3orhBZQh8eLJEEyP5ey2entq6+BA91LXhWFDkyrhlMUu5yt0r5ICx1
	TKWZmsdDkvXUNVfsFD3KiZAwMK3fl0hnF3qhK61GfcDx+3tRz7libC2tRZ3EV5pHzJU8LTdy737Bx
	Gcbisd5bAEIwiCQrXRXXhbeMcrm9nwhwn4oIK/fkDk6rxga21fNVrXAlNv9O9UBsln8/Htd3fl64Q
	0BPFF24COwjkvWOV0Rig7qssLkTL6tXfqndre456HqulT0sQkvCaMk1TejaMsj5bB2pyHvDLiRVao
	PfiX/Ftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6by-0000000EDAq-33LG;
	Wed, 17 Jul 2024 15:30:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6bv-0000000ED9e-273P
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 15:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E0E9CE17E3;
	Wed, 17 Jul 2024 15:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203A6C4AF0D;
	Wed, 17 Jul 2024 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721230188;
	bh=3y6J4/IWm8k/uSeOISrjXuhjwcWCcnKSS8UTJoDbyRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NecC90XexhGoyFhzFxrlcWTvnpYVtoqz/haenUdhAM1tUHYwL2QvnIDokC5JL/IFj
	 LTcONI2qs57x1+JT8oC8wwAF/yLog3atHfbwNsqaDo/tjMiMeiA/zrtUdooRhjJY8/
	 ZclSG+F1yYWlCHVQupgwzV20IedJXDKFzeSfbhLah/S06XErDyqLIcJEGZXrDLgHJL
	 6i4aZYMAajymRGkMre1vdzBOxJXYfSKHvWQGw9iSjkfejUX7ioa8NsZsWMzQ/M8P9l
	 Ema8B/GGA9GZen3Y1rgO/zjo66BGuswiolVlvJxNZngrSL2JUZMZP87wOoJ2OO4Vz/
	 kfNRIj9nqkevA==
Date: Wed, 17 Jul 2024 16:29:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 03/11] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <20240717-enroll-snowless-e722e367789b@spud>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-4-alexghiti@rivosinc.com>
 <20240717-e7104dac172d9f2cbc25d9c6@orel>
MIME-Version: 1.0
In-Reply-To: <20240717-e7104dac172d9f2cbc25d9c6@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_083031_910143_35B99815 
X-CRM114-Status: GOOD (  15.95  )
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
Content-Type: multipart/mixed; boundary="===============8996852788041132646=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8996852788041132646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DKnFDS9hDsllBOMu"
Content-Disposition: inline


--DKnFDS9hDsllBOMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 10:26:34AM -0500, Andrew Jones wrote:
> On Wed, Jul 17, 2024 at 08:19:49AM GMT, Alexandre Ghiti wrote:
> > -#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
> > +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, =
o, n)	\
> >  ({									\
> > +	__label__ no_zabha_zacas, end;					\
> > +									\
> > +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
> > +	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
> > +		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
> > +				     RISCV_ISA_EXT_ZABHA, 1)		\
> > +			 : : : : no_zabha_zacas);			\
> > +		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
> > +				     RISCV_ISA_EXT_ZACAS, 1)		\
> > +			 : : : : no_zabha_zacas);			\
>=20
> I came late to the call, but I guess trying to get rid of these asm gotos
> was the topic of the discussion. The proposal was to try and use static
> branches, but keep in mind that we've had trouble with static branches
> inside macros in the past when those macros are used in many places[1]
>=20
> [1] commit 0b1d60d6dd9e ("riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SI=
ZE=3Dy")

The other half of the suggestion was not using an asm goto, but instead
trying to patch the whole thing in the alternative, for the problematic
section with llvm < 17.

>=20
> > +									\
> > +		__asm__ __volatile__ (					\
> > +			prepend						\
> > +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
> > +			append						\
> > +			: "+&r" (r), "+A" (*(p))			\
> > +			: "rJ" (n)					\
> > +			: "memory");					\
> > +		goto end;						\
> > +	}								\
> > +									\
> > +no_zabha_zacas:;							\
>=20
> unnecessary ;
>=20
> >  	u32 *__ptr32b =3D (u32 *)((ulong)(p) & ~0x3);			\
> >  	ulong __s =3D ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
> >  	ulong __mask =3D GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
> > @@ -133,6 +155,8 @@
> >  		: "memory");						\
> >  									\
> >  	r =3D (__typeof__(*(p)))((__retx & __mask) >> __s);		\
> > +									\
> > +end:;									\
> >  })
> > =20
> >  #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, =
o, n)	\

--DKnFDS9hDsllBOMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpfjZQAKCRB4tDGHoIJi
0jmTAP0dEPFTp/z1/WjfXISimZGtZLdRe3vvDV8JgqZQi53RggD/ZBBpVOJzd6N0
fF1PJI/P3vzXi3Ey9CSl+w1GE1dOgAM=
=6ofA
-----END PGP SIGNATURE-----

--DKnFDS9hDsllBOMu--


--===============8996852788041132646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8996852788041132646==--

