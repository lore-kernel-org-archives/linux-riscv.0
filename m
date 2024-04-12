Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06396C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5nAOL1XJFpF4TFyzepKQxNX5I7VEyzizgFJ+pA6NN4=; b=FrGUTFLoTS/zBuyXxy0CVUxtBR
	7U3mDjDJ8YIJ8k74FylIxJV80yRQ8AHB3gaJhY8Y4pdDYSCz0jIMzUWOCBQlFPpEx8HaS9vniJ6dW
	Y5xAjCqoi7tHgllptmmzwrMhXaB5UEuk7fjazaZWUCl2RSWkIiqytBoRzknltxiDXYpwziY3fJhxC
	A1fwIoIg34IZZHng1dOoiB/MfHIaxV6p9ACiUJhQUsBk64sm2e+QqSAMQlH0yuYB1vPtwXEFrRaPY
	YC4SYdIwIeMXpiW2ILX7OttjkdCJCycLSwm/wQm5ewGZEG0QZ/qp6bCzp0wbVBLcRtKnZqU6xYS65
	RwMGlpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLwS-00000000wCe-0D78;
	Fri, 12 Apr 2024 18:48:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLwN-00000000w99-1w5N;
	Fri, 12 Apr 2024 18:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E4FDCE384A;
	Fri, 12 Apr 2024 18:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB36C113CC;
	Fri, 12 Apr 2024 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712947674;
	bh=n5GAgtmQ/zrZB8bAJR7g5z1ea43EI9hfIxBwHjcASrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ov4WZNsLgMqwV02D7qCGrlgn+4CXZEGcpdO/TzMjlw0QaGJPdMXfuabow7LmE1wyp
	 9yp9pZjgTqZfXUHi4kYz/nrLdEXSd+7oLiFEvKSZ4fFVOUcsk7R7mbl+VJWDcrtzba
	 ACMVbEJiDTuVNMs3+ZSLWIlmitOKl+JtGSCsjhrbj4Dwp1XNAWoLeiQYh2YRTY9oNt
	 nj71v6w6v+74c7G4EoIopUhCrWUpLrqoMG8BVb/WNrATeww5DHbZQRZKldyCNw6wWB
	 NCYS5X7RRSFrlH62HqZzU7NtwEteokB4/uPHBtiJru1eveA2uSmMAbd/V3S+EmomnA
	 q3gEwWScvYpgQ==
Date: Fri, 12 Apr 2024 19:47:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240412-eastcoast-disparity-9c9e7d178df5@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <ZhlrdGXfSushUNTp@ghost>
MIME-Version: 1.0
In-Reply-To: <ZhlrdGXfSushUNTp@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_114759_880268_9AED1D58 
X-CRM114-Status: GOOD (  39.50  )
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
Content-Type: multipart/mixed; boundary="===============4071712352659479990=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4071712352659479990==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rke11NB5BctjFg+6"
Content-Disposition: inline


--rke11NB5BctjFg+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 10:12:20AM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 11:25:47AM +0100, Conor Dooley wrote:
> > On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> > > The riscv_cpuinfo struct that contains mvendorid and marchid is not
> > > populated until all harts are booted which happens after the DT parsi=
ng.
> > > Use the vendorid/archid values from the DT if available or assume all
> > > harts have the same values as the boot hart as a fallback.
> > >=20
> > > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property=
 on older T-Head CPUs")
> >=20
> > If this is our only use case for getting the mvendorid/marchid stuff
> > from dt, then I don't think we should add it. None of the devicetrees
> > that the commit you're fixing here addresses will have these properties
> > and if they did have them, they'd then also be new enough to hopefully
> > not have "v" either - the issue is they're using whatever crap the
> > vendor shipped.
>=20
> Yes, the DT those shipped with will not have the property in the DT so
> will fall back on the boot hart. The addition of the DT properties allow
> future heterogenous systems to be able to function.

I think you've kinda missed the point about what the original code was
actually doing here. Really the kernel should not be doing validation of
the devicetree at all, but I was trying to avoid people shooting
themselves in the foot by doing something simple that would work for
their (incorrect) vendor dtbs.
Future heterogenous systems should be using riscv,isa-extensions, which
is totally unaffected by this codepath (and setting actual values for
mimpid/marchid too ideally!).

> > If we're gonna get the information from DT, we already have something
> > that we can look at to perform the disable as the cpu compatibles give
> > us enough information to make the decision.
> >=20
> > I also think that we could just cache the boot CPU's marchid/mvendorid,
> > since we already have to look at it in riscv_fill_cpu_mfr_info(), avoid
> > repeating these ecalls on all systems.
>=20
> Yeah that is a minor optimization that can I can apply.
>=20
> >=20
> > Perhaps for now we could just look at the boot CPU alone? To my
> > knowledge the systems that this targets all have homogeneous
> > marchid/mvendorid values of 0x0.
>=20
> They have an mvendorid of 0x5b7.

That was a braino, clearly I should have typed "mimpid".

> This is already falling back on the boot CPU, but that is not a solution
> that scales. Even though all systems currently have homogenous
> marchid/mvendorid I am hesitant to assert that all systems are
> homogenous without providing an option to override this.

There are already is an option. Use the non-deprecated property in your
new system for describing what extesions you support. We don't need to
add any more properties (for now at least).

> The overhead is
> looking for a field in the DT which does not seem to be impactful enough
> to prevent the addition of this option.
>=20
> >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >=20
> > > @@ -514,12 +521,23 @@ static void __init riscv_fill_hwcap_from_isa_st=
ring(unsigned long *isa2hwcap)
> > >  				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > >  				continue;
> > >  			}
> > > +			if (of_property_read_u64(node, "riscv,vendorid", &this_vendorid) =
< 0) {
> > > +				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, usi=
ng boot hart mvendorid instead\n");
> >=20
> > This should 100% not be a warning, it's not a required property in the
> > binding.
>=20
> Yes definitely, thank you.
>=20
> - Charlie
>=20
> >=20
> > Cheers,
> > Conor.
> >=20
> > > +				this_vendorid =3D boot_vendorid;
> > > +			}
> >=20
>=20
>=20

--rke11NB5BctjFg+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhmB0wAKCRB4tDGHoIJi
0r9KAPwO8kmedwyuPwdW6Gb81xo2SPmPzyE4KeaKjpG7a9zWkQEA+zkrz2aDcEPv
K4koNCrLQrkE4YZhML29KEex9nHPOAg=
=7PfL
-----END PGP SIGNATURE-----

--rke11NB5BctjFg+6--


--===============4071712352659479990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4071712352659479990==--

