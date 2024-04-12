Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50426C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 19:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46C8lFjkqNCNnom9ir6TdhbZzAC22SIQVb+AQNwLaQc=; b=bEA2x3VJzKcgoQlvaN7MetP1yP
	/oZXfYpOeS0tBjOLXn82vR7xVaQBiK/gMZgau3K5Cchv0xEENQrEVvP47XdyVn2zWjKJvLqS+x5xy
	t0HQx0Q3qxfi8N2HrfG4jSNouMCQZgjXPTcphVkdmXBL0u4BdGN7p0UXkQOVb0NTmsZ5YCLHZgZt3
	J9zOeou3PyGbfQNq/EK6+LdUfauwRPss3kmceXckDQ7vY26uVna9LtLhlZCdv4PeDCQl6MCTYKmRy
	G8X/bp5jaEwrrFeeXr4YbM7eYYbTyNzB/m+BOsCoFOqdp7JiCxOsElHgtXm6ObMxVfkV8YMtIxMN8
	bk226BBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvMXb-000000012Q6-0t5f;
	Fri, 12 Apr 2024 19:26:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvMXW-000000012Mj-09XD;
	Fri, 12 Apr 2024 19:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6005CE38B7;
	Fri, 12 Apr 2024 19:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5419DC113CC;
	Fri, 12 Apr 2024 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712949978;
	bh=ArpGHG9cuv9OtQt7jL/xNgqJB9MdPk3k7JUvanjZuic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BE1ZhfCIepy+Sz+T2/94eePFkoOBa4Wa95SbkS2QeDMiyp12yVm5dxbXQ8DBAVn7e
	 zaEoB5oI8W25RYxz9nj1KmtQifkJbq6TcZaZvzr2BZLansHu9+OSr3iV9XFoQ9mehr
	 WDWWtMq8E1dfTt7HdTaOi9lb15ndfSLbPuCdFZmSZKfRDjjictfHUo2RWyRlm9K4E8
	 9JirdX8YiXS/iJ1fnkO5Y3Wi29otvkyu+i2+2rQtPRBfmq1njgVEabcy+rtzdw7f1H
	 vOZ2jbfP0fNsPzw0gK+ZL/PdQRjsoz8WjLOPnKbLLA9WO+GJBKQMbXROTtaPlEzejH
	 FKtr8IV7z/8qw==
Date: Fri, 12 Apr 2024 20:26:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240412-earmark-sanction-810b7222cae5@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <CALs-HsuMZOMpDh8kwQx6FE2mawzt+qTD-WZ6Mvhrt+hUhkZimg@mail.gmail.com>
 <20240412-employer-crier-c201704d22e3@spud>
 <ZhmBfaKXMMtolwSr@ghost>
MIME-Version: 1.0
In-Reply-To: <ZhmBfaKXMMtolwSr@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_122622_503483_6C722FDF 
X-CRM114-Status: GOOD (  43.38  )
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
Content-Type: multipart/mixed; boundary="===============8130743449736478058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8130743449736478058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tJyAzTWQiwGEEGv9"
Content-Disposition: inline


--tJyAzTWQiwGEEGv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 11:46:21AM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 07:38:04PM +0100, Conor Dooley wrote:
> > On Fri, Apr 12, 2024 at 10:04:17AM -0700, Evan Green wrote:
> > > On Fri, Apr 12, 2024 at 3:26=E2=80=AFAM Conor Dooley <conor.dooley@mi=
crochip.com> wrote:
> > > >
> > > > On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> > > > > The riscv_cpuinfo struct that contains mvendorid and marchid is n=
ot
> > > > > populated until all harts are booted which happens after the DT p=
arsing.
> > > > > Use the vendorid/archid values from the DT if available or assume=
 all
> > > > > harts have the same values as the boot hart as a fallback.
> > > > >
> > > > > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT prop=
erty on older T-Head CPUs")
> > > >
> > > > If this is our only use case for getting the mvendorid/marchid stuff
> > > > from dt, then I don't think we should add it. None of the devicetre=
es
> > > > that the commit you're fixing here addresses will have these proper=
ties
> > > > and if they did have them, they'd then also be new enough to hopefu=
lly
> > > > not have "v" either - the issue is they're using whatever crap the
> > > > vendor shipped.
> > > > If we're gonna get the information from DT, we already have somethi=
ng
> > > > that we can look at to perform the disable as the cpu compatibles g=
ive
> > > > us enough information to make the decision.
> > > >
> > > > I also think that we could just cache the boot CPU's marchid/mvendo=
rid,
> > > > since we already have to look at it in riscv_fill_cpu_mfr_info(), a=
void
> > > > repeating these ecalls on all systems.
> > > >
> > > > Perhaps for now we could just look at the boot CPU alone? To my
> > > > knowledge the systems that this targets all have homogeneous
> > > > marchid/mvendorid values of 0x0.
> > >=20
> > > It's possible I'm misinterpreting, but is the suggestion to apply the
> > > marchid/mvendorid we find on the boot CPU and assume it's the same on
> > > all other CPUs? Since we're reporting the marchid/mvendorid/mimpid to
> > > usermode in a per-hart way, it would be better IMO if we really do
> > > query marchid/mvendorid/mimpid on each hart. The problem with applying
> > > the boot CPU's value everywhere is if we're ever wrong in the future
> > > (ie that assumption doesn't hold on some machine), we'll only find out
> > > about it after the fact. Since we reported the wrong information to
> > > usermode via hwprobe, it'll be an ugly userspace ABI issue to clean
> > > up.
> >=20
> > You're misinterpreting, we do get the values on all individually as
> > they're brought online. This is only used by the code that throws a bone
> > to people with crappy vendor dtbs that put "v" in riscv,isa when they
> > support the unratified version.
>=20
> Not quite,

Remember that this patch stands in isolation and the justification given
in your commit message does not mention anything other than fixing my
broken patch.

> the alternatives are patched before the other cpus are
> booted, so the alternatives will have false positives resulting in
> broken kernels.

Over-eagerly disabling vector isn't going to break any kernels and
really should not break a behaving userspace either.
Under-eagerly disabling it (in a way that this approach could solve) is
only going to happen on a system where the boot hart has non-zero values
and claims support for v but a non-boot hart has zero values and
claims support for v but actually doesn't implement the ratified version.
If the boot hart doesn't support v, then we currently disable the
extension as only homogeneous stuff is supported by Linux. If the boot
hart claims support for "v" but doesn't actually implement the ratified
version neither the intent of my original patch nor this fix for it are
going to help avoid a broken kernel.

I think we do have a problem if the boot cpu having some erratum leads
to the kernel being patched in a way that does not work for the other
CPUs on the system, but I don't think this series addresses that sort of
issue at all as you'd be adding code to the pi section if you were fixing
it. I also don't think we should be making pre-emptive changes to the
errata patching code either to solve that sort of problem, until an SoC
shows up where things don't work.

Cheers,
Conor.

--tJyAzTWQiwGEEGv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhmK1AAKCRB4tDGHoIJi
0hziAP4j1liS/8H3/sGH37oV1Ie6vt982Lewk2FPT35h55TKRQEA/iypRsMhmnBH
35WadNZuyEtJ844XSGK0IM1bH0q7eAk=
=Lvox
-----END PGP SIGNATURE-----

--tJyAzTWQiwGEEGv9--


--===============8130743449736478058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8130743449736478058==--

