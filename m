Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F34C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 20:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laeKNVKl/QSM4+gjBx2sKCsts8gamiMUS4467ee0nZ8=; b=s4E5aYvRw9Al3SjWT8tCJ3RORA
	2Q2a1/wgBEmjSQy+Yy4/YZCVkkNHYLqZglh21yTNLBy2Tb/pIxICfbSJKyZAfNWIqgc6AUIUouJgW
	KDx5UzZAoSArEfodSt98ioHyoo4skiRc/mxno5BuKQyquc4YQR9QK58iBRndaGX1HREbAABBdhGDM
	bGBuS1BUZLQRNDWhAZHIsmTqK1UrmEy0asDPSRdRKQv0TQ9dEteSm1+BDSOz5c1apwdUkew/qJBa1
	OZP4uS8wGBeN/jvT2sDv5mOiOdO5ouF6aDoP5bPg3HnA5zVakeY126puKJhEptPdLjo0jSCY0X6pL
	nbzhSmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ST3-0000000DzRr-1kiD;
	Fri, 26 Apr 2024 20:46:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0SSz-0000000DzP5-0zky;
	Fri, 26 Apr 2024 20:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 106DFCE1C6D;
	Fri, 26 Apr 2024 20:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42C9C113CD;
	Fri, 26 Apr 2024 20:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714164401;
	bh=FpnES2VzAJAeOqxKGH0lg2Bnjqd4mkcolNpkPfg+scg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAQAPudpDakoNEU3GRdPIGAx3jXltg8+z70mavPQj+osxfFlcbSQCoNioaYDQzixc
	 UDe2Z3W6FQcgSevbm0wq9plVxSDN0Ziw/AfmIBAlejymaPcRmUHZ4sbQ36E07THTjP
	 9CcBpyoL0MS6Yu2YApMucm7KK2u1Mq449EIoACUlckAtCW/0c6LpA7rUor6NfNjN+h
	 vkQZlmuW+2ONsIX/3CwbmTtcCtqQ6qG6d5GAzWPh//WH8JO7diTvQet5GXnAIhxJXX
	 Keb8E/cK36zmHrIXTfnsmQl5729B6N9NNL6Qyt3yl6p3Z5behPJbj5VccYHKx+/1Ht
	 O9uOf/+wJKbfw==
Date: Fri, 26 Apr 2024 21:46:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 09/17] riscv: drivers: Convert xandespmu to use the
 vendor extension framework
Message-ID: <20240426-wackiness-fringe-d296412b0c06@spud>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-9-67cff4271d1d@rivosinc.com>
 <20240426-venue-maximum-f78ac451b146@spud>
 <ZiwPyyBK2br8yKei@ghost>
MIME-Version: 1.0
In-Reply-To: <ZiwPyyBK2br8yKei@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_134645_641689_C6022455 
X-CRM114-Status: GOOD (  32.56  )
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
Content-Type: multipart/mixed; boundary="===============4520701806734579848=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4520701806734579848==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="obfZp8CibtUO+FNM"
Content-Disposition: inline


--obfZp8CibtUO+FNM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 01:34:19PM -0700, Charlie Jenkins wrote:
> On Fri, Apr 26, 2024 at 05:25:20PM +0100, Conor Dooley wrote:
> > On Sat, Apr 20, 2024 at 06:04:41PM -0700, Charlie Jenkins wrote:
> > > Migrate xandespmu out of riscv_isa_ext and into a new Andes-specific
> > > vendor namespace.
> > > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sb=
i.c
> > > index 8cbe6e5f9c39..84760ce61e03 100644
> > > --- a/drivers/perf/riscv_pmu_sbi.c
> > > +++ b/drivers/perf/riscv_pmu_sbi.c
> > > @@ -24,6 +24,8 @@
> > >  #include <asm/errata_list.h>
> > >  #include <asm/sbi.h>
> > >  #include <asm/cpufeature.h>
> > > +#include <asm/vendorid_list.h>
> > > +#include <asm/vendor_extensions/andes.h>
> > > =20
> > >  #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
> > >  asm volatile(ALTERNATIVE_2(						\
> > > @@ -32,7 +34,7 @@ asm volatile(ALTERNATIVE_2(						\
> > >  		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
> > >  		CONFIG_ERRATA_THEAD_PMU,				\
> > >  	"csrr %0, " __stringify(ANDES_CSR_SCOUNTEROF),			\
> > > -		0, RISCV_ISA_EXT_XANDESPMU,				\
> > > +		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
> > >  		CONFIG_ANDES_CUSTOM_PMU)				\
> > >  	: "=3Dr" (__ovl) :						\
> > >  	: "memory")
> > > @@ -41,7 +43,7 @@ asm volatile(ALTERNATIVE_2(						\
> > >  asm volatile(ALTERNATIVE(						\
> > >  	"csrc " __stringify(CSR_IP) ", %0\n\t",				\
> > >  	"csrc " __stringify(ANDES_CSR_SLIP) ", %0\n\t",			\
> > > -		0, RISCV_ISA_EXT_XANDESPMU,				\
> > > +		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
> > >  		CONFIG_ANDES_CUSTOM_PMU)				\
> > >  	: : "r"(__irq_mask)						\
> > >  	: "memory")
> > > @@ -837,7 +839,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *p=
mu, struct platform_device *pde
> > >  		   riscv_cached_mimpid(0) =3D=3D 0) {
> > >  		riscv_pmu_irq_num =3D THEAD_C9XX_RV_IRQ_PMU;
> > >  		riscv_pmu_use_irq =3D true;
> > > -	} else if (riscv_isa_extension_available(NULL, XANDESPMU) &&
> > > +	} else if (riscv_isa_vendor_extension_available(-1, XANDESPMU) &&
> >=20
> > What's the rationale for this not using riscv_has_extension_unlikely()?
> > Happens once in probe so don't bother? I forget if we discussed it when
> > the code was added, but it would save us from the NULL/-1 syntax,
> > neither of which I think is a good interface.
>=20
> Doesn't look like something that was ever commented on in the series,
> but I may have missed it. I can change this to use the alternatives.

Yeha, not really a question for you but thinking aloud and wondering if
someone would remind me. I really don't like
riscv_isa_extension_available() because it doesn't respect config
options etc, but ultimately I think the series that Clement is currently
working on for Zc* is could be the saviour there, as the callbacks his
most recent version has I think could make it much easier to hook in and
turn off extensions. Should be helpful for the sort of confusing shit
that Eric was complaining about last week on Andy's vector series.

>=20
> This also wasn't supposed to be -1, it's supposed to be the id of the
> vendor.
>=20
> >=20
> > Also, I'd prob drop the "drivers" from $subject.
> >=20
> > I'll come back and look at the rest of this Monday, it's a sunny Friday
> > here and I've still got my devicetree patch queue to clear..
> >=20
>=20
> - Charlie
>=20
> > Cheers,
> > Conor.
> >=20
> > >  		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
> > >  		riscv_pmu_irq_num =3D ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
> > >  		riscv_pmu_use_irq =3D true;
> > >=20
> > > --=20
> > > 2.44.0
> > >=20
>=20
>=20

--obfZp8CibtUO+FNM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiwSqgAKCRB4tDGHoIJi
0gNhAQDrHkAfioAOiId8a0oZe9Tp2bWKu1pfHE//przLWplaKAEApP4lOWJpBqcf
vxWNFoKpgkDlzQEmtSnjR0ttsqkgAwI=
=M/W8
-----END PGP SIGNATURE-----

--obfZp8CibtUO+FNM--


--===============4520701806734579848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4520701806734579848==--

