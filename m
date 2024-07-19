Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9809BC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xB4P5b2euHmIgRzdGuXFGOJ5PtNxCEgvGM+d5EXhz8=; b=k1EySg1PMMu/TDmcgCxQXw48HN
	aMtPEEQs5JAZuX+wT3iKOaI8pm0dsMILlDuuJEv5yDjgw6h91ynrbRaRaR20ksY9t0pbM7ESnb7J6
	jRapaAKXRm52yt5BDgc49twIH78LeNXGIE4K8urr/78/ac935OFZaB013j1imL+wMX7QOCMEbHQ/A
	GmE0LzSaDPcX+CrR1qlDHbwTz5RnPa2fQdo5Ye0eoGeSO9OeLlwJUnRIazwfvB0ocCprj/UMqdoXK
	zEvp9bujCTEkxZ4m2jezIPtGap+X5f36PK7GKEL3oTwt3M5lPuIlbNcWMCSG2rEGcO4s6aoH0P+jl
	vCQbd94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUivT-000000023iv-0V7Z;
	Fri, 19 Jul 2024 08:25:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUivQ-000000023iG-0wbj
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BA2960918;
	Fri, 19 Jul 2024 08:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA259C32782;
	Fri, 19 Jul 2024 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721377509;
	bh=LM592MhcG52g/Uy25xMnj5tFMtQlEAaW7s+pk78voK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYdclaLpdJbN7LOhN06Kw/8fZWJACXXvGTJXZLE/fjBz3DOGva5/xoEW8XXmHq+KG
	 rDWW16qhBdrKiM7az1dw2QEma/lqVuNvsUWnsxR5jCInM30mHHIzonxJPARWa1xz1u
	 kxzPc4JbPXJRmZ63/7jnFcM1CE7/SkLXVo9DtAi3L/iIEZ17ECXvB5rGW12MHHcU7n
	 RyDF+83Xq6HMnnT+0j7TRl3wcieAwh2UghGejaYD7+zo87VJfz931y4jd/8er9tfUT
	 6lX+ej8iPgpXR3YOtElx1fNbHkgFoFAuRwdHfd1qGV3Kuvt85LQ9XcUmSFoAY9fuA7
	 hvDFcNh+SYAIg==
Date: Fri, 19 Jul 2024 09:25:04 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: cpufeature: Do not drop Linux-internal
 extensions
Message-ID: <20240719-deity-squander-e17b4dfed649@spud>
References: <20240718213011.2600150-1-samuel.holland@sifive.com>
 <20240718-a5097a4070f457529d2fff91@orel>
 <a36e07a1-f4da-4d6f-9e68-929b77b70836@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <a36e07a1-f4da-4d6f-9e68-929b77b70836@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_012512_357407_3F66B6C4 
X-CRM114-Status: GOOD (  20.26  )
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
Content-Type: multipart/mixed; boundary="===============0443327652195046344=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0443327652195046344==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2cm0NOChvUbrKYjc"
Content-Disposition: inline


--2cm0NOChvUbrKYjc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 09:11:20AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 18/07/2024 23:57, Andrew Jones wrote:
> > On Thu, Jul 18, 2024 at 02:29:59PM GMT, Samuel Holland wrote:
> >> The Linux-internal Xlinuxenvcfg ISA extension is omitted from the
> >> riscv_isa_ext array because it has no DT binding and should not appear
> >> in /proc/cpuinfo. The logic added in commit 625034abd52a ("riscv: add
> >> ISA extensions validation callback") assumes all extensions are includ=
ed
> >> in riscv_isa_ext, and so riscv_resolve_isa() wrongly drops Xlinuxenvcfg
> >> from the final ISA string. Instead, accept such Linux-internal ISA
> >> extensions as if they have no validation callback.
> >=20
> > This assumes we'll never need a validation callback for a Linux-internal
> > ISA extension. We can make that assumption now and change our mind
> > later, but we could also add Xlinuxenvcfg to riscv_isa_ext now and
> > modify the places where it matters (just print_isa?). If we add
> > Xlinuxenvcfg to the array with a NULL name then we could do something
> > like
> >=20
> >  print_isa()
> >  {
> >     for (...) {
> >         ...
> >         if (!riscv_isa_ext[i].name)
> > 	   continue;
> >     }
> >  }
>=20
> I would rather add it to the riscv_isa_ext[] array and avoid handling it
> differently. There is already the xandespmu extension in this array so
> xlinuxenvcfg can be added as well.

xandespmu and xlinuxenvcfg are fundamentally different, the former is
parsed from devicetree and is a real extension. xlinuxengcfg is an
internal flag. I don't think we should be printing it.

--2cm0NOChvUbrKYjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpoi4AAKCRB4tDGHoIJi
0hxJAP9i3N6jApI0vw2TIsG19OWezjdWX2r7e+qRhyN4c8UXgQEAl80AVpDO0HgA
Xq/YtJebpMDHWKe/KJ3Sb1gXvmg/Mwg=
=s+ux
-----END PGP SIGNATURE-----

--2cm0NOChvUbrKYjc--


--===============0443327652195046344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0443327652195046344==--

