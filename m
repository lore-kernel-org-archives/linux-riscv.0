Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E45ACD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZHHkZyayb6EMXf2EMLWAvy9iSns0QHCTbLJwXZo8iQ=; b=WTTvm0FOosgpB6dxEEUqSxLxwr
	R6vGNMkoOQiuJuoycFecdoTdHlSkgr4sceMw/VKT3PGEgHTLad5FgNVlQ2xmiwcrkI8UHUwKqgDK4
	6k7iRVoY2ZynWtSidGWxlTIkqR0bPcIDRvjADVN1hm6YOb7JKcanmwutoDsdduNKxmBurK0osz8KS
	wd9GgH0bETwDhu6jWGKhmbTcwQDVeVwIGzDb+2Ct3NMYQV3c7WM5fezZ29XOdAZNj888wkFbG33Mk
	+CmmLkYn+yvmR5hN3zx3UAhWcKHPVLX7XQ9ZA6lAH3B83Pz2sE3sVWgwaAK9szkJsj0hfgrH+m4lY
	gvh2F2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugPd-00000009DnH-3neI;
	Wed, 10 Apr 2024 22:27:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugPa-00000009Dls-2u0s;
	Wed, 10 Apr 2024 22:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 197B561D60;
	Wed, 10 Apr 2024 22:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E43C43390;
	Wed, 10 Apr 2024 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712788041;
	bh=MQwfwXM6s1UZx2FVelAfwabzd67L2NdfTcUOcwAkZa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3/uWsvaOVdQm4bUzZWXXVJh7Wz75OVPDbNxYG47HDWrUe4NRBf2haOzPZ5BTxLZr
	 ZC6IMZAHcrynGxHiYq3jz52i7ej0rN/aJYw+es916TUJ8W0q1hU18178W6RjIR7Mtr
	 u6w32lwy76uxqJ0KHElDXglXLwG3tqXyePsPawNR6jTQLG8NFyOdt+q8rcv9DkP0NC
	 70nM/T3v/QA686jfQLVrIuderjJhiu+MJatd+IiwAja72W6qHSskPMT3YKq/D1IARS
	 F5yGeIPYvce+43LFuqfCiuf0TdQJWhZrnNYilgUguhAsZx/mKtygsI+P7YAAlxXB7m
	 KCNX0t+Sb+ZIA==
Date: Wed, 10 Apr 2024 23:27:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
Message-ID: <20240410-judgingly-appease-5df493852b70@spud>
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
MIME-Version: 1.0
In-Reply-To: <20240410-jawless-cavalry-a3eaf9c562a4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_152722_844445_32557557 
X-CRM114-Status: GOOD (  19.74  )
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
Content-Type: multipart/mixed; boundary="===============7986267205397702244=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7986267205397702244==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UqyEiLRcLky9DwaJ"
Content-Disposition: inline


--UqyEiLRcLky9DwaJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 11:16:11PM +0100, Conor Dooley wrote:
> On Wed, Apr 10, 2024 at 02:32:41PM -0700, Deepak Gupta wrote:
> > On Wed, Apr 10, 2024 at 11:11:00AM +0200, Cl=E9ment L=E9ger wrote:
> > > Add parsing for Zcmop ISA extension which was ratified in commit
> > > b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
> > >=20
> > > Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> > > ---
> > > arch/riscv/include/asm/hwcap.h | 1 +
> > > arch/riscv/kernel/cpufeature.c | 1 +
> > > 2 files changed, 2 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/=
hwcap.h
> > > index b7551bad341b..cff7660de268 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -86,6 +86,7 @@
> > > #define RISCV_ISA_EXT_ZCB		77
> > > #define RISCV_ISA_EXT_ZCD		78
> > > #define RISCV_ISA_EXT_ZCF		79
> > > +#define RISCV_ISA_EXT_ZCMOP		80
> > >=20
> > > #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > >=20
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index 09dee071274d..f1450cd7231e 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -265,6 +265,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> > > 	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> > > 	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> > > 	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
> > > +	__RISCV_ISA_EXT_DATA(zcmop, RISCV_ISA_EXT_ZCMOP),
> >=20
> > As per spec zcmop is dependent on zca. So perhaps below ?
> >=20
> > __RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZCMOP, RISCV_ISA_EXT_ZCA)
>=20
> What's zicboz got to do with it, copy-pasto I guess?
> If we're gonna imply stuff like this though I think we need some
> comments explaining why it's okay.

Also, I'm inclined to call that out specifically in the binding, I've
not yet checked if dependencies actually work for elements of a string
array like the do for individual properties. I'll todo list that..

--UqyEiLRcLky9DwaJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhcSRAAKCRB4tDGHoIJi
0q6sAP9ipmaLBEqGqnK1J/+foh06vDyH4IjZKsQzB4HnpE/08QD+LHYD03uimI1C
REPzlhiL3W105ct+G/bLuPwbDQsvHAM=
=29Jl
-----END PGP SIGNATURE-----

--UqyEiLRcLky9DwaJ--


--===============7986267205397702244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7986267205397702244==--

