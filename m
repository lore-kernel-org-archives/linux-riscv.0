Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D294DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMz3u4B/aZMAAoyVbLsHWTqfnX2yUp9GFdRpnBRJ4n8=; b=mc/PuRkgugTiBNdISzojEP5W2/
	2nq7XL3m3/rrzF9SPZx9+KOWPSy7X1BYPVHG4/u3II73kIOgwKYTvBAXC1GQReQFFVAQytdPTf+IV
	cEKY6TzHkEosyZ/53aGJWhf6v4XrnMsAS2YlG7Pn27KOTgNELjKC1XuJcFCdFhu/lVSdf+ARUUgNI
	pEyZYB2S8Tq0DW14byB8up6On/OLBoCKhhuS7+og14e7oufgHhk2+iWXk4WFr4oqr3j44eOMrMOGZ
	nQpzHp6GeF7a5UNyIPJsnG+4Lqy6ftBxHQdci7Nmw7N4yLha7UZ9siXiLtI+bpPl6R22z/zrZ4TKJ
	aOGnyBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxQ9U-003EjD-1P;
	Mon, 30 Oct 2023 11:09:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxQ9R-003Ehw-0v
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 11:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BBAA6B80AD1;
	Mon, 30 Oct 2023 11:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50D5C433C7;
	Mon, 30 Oct 2023 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698664183;
	bh=7Is5mZRkBpmJqgtrKqJiMwJvcStuzj0Yd5n23xJQ1Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6NvMHCcQbR17HkQj5ZE1vsu/3lpuZJ2Y5UjrI+xVyYCvIf9KtDA3oC9pXD14P8yA
	 MokpgzT1EQw4dsJ9846G5xdYc+Dbb+tw44wlNkbpYChAgQO0h+yd8oiyC0VXm7SbZ+
	 noYOhqQQnrdfZazQIG/UPcr17B5EjWyClCCl+Su47n4y9rh+8USJj/nGFbUkkba5Za
	 ZQi/3Qy+qOd77ETXnddFNLw75S9oGYeAWTHkq76oKhX0E3DbJO2VhZM2zYIf47f4va
	 3gL2WPyhEh7S/QooYGvTrPrMHJtZzI2q0xccIBVN1E2FwziCTAlUA64HrmvCgAHAbA
	 C8MbkQqm9Hpyw==
Date: Mon, 30 Oct 2023 11:09:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: linux-next: Tree for Oct 27 (drivers/cache/ax45mp_cache.o)
Message-ID: <20231030-overhand-brittle-b2c4dc7ad4e6@spud>
References: <20231027180429.5f718601@canb.auug.org.au>
 <1ee2f92d-7aad-4140-9ab0-bc52ea0d6fce@infradead.org>
 <a7fe0eca-2a18-41b1-a0a9-e54a6e49903b@infradead.org>
MIME-Version: 1.0
In-Reply-To: <a7fe0eca-2a18-41b1-a0a9-e54a6e49903b@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_040945_597375_DF98E5A3 
X-CRM114-Status: GOOD (  17.09  )
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
Content-Type: multipart/mixed; boundary="===============2653421287571664623=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2653421287571664623==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ihK0gQBGsMu9kYtp"
Content-Disposition: inline


--ihK0gQBGsMu9kYtp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 10:17:35PM -0700, Randy Dunlap wrote:
>=20
>=20
> On 10/29/23 22:12, Randy Dunlap wrote:
> >=20
> >=20
> > On 10/27/23 00:04, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20231026:
> >>
> >=20
> > on riscv32:
> >=20
> > riscv32-linux-ld: drivers/cache/ax45mp_cache.o: in function `ax45mp_cac=
he_init':
> > ax45mp_cache.c:(.init.text+0xe4): undefined reference to `riscv_noncohe=
rent_register_cache_ops'
> >=20
> > Full randconfig file is attached.
> >=20
>=20
> or with a different config file:
>=20
> iscv32-linux-ld: arch/riscv/mm/pmem.o:(.text+0xa): undefined reference to=
 `noncoherent_cache_ops'
> riscv32-linux-ld: arch/riscv/mm/pmem.o:(.text+0xe): undefined reference t=
o `noncoherent_cache_ops'
> riscv32-linux-ld: arch/riscv/mm/pmem.o: in function `.L6':
> pmem.c:(.text+0x8a): undefined reference to `noncoherent_cache_ops'
> riscv32-linux-ld: pmem.c:(.text+0x8e): undefined reference to `noncoheren=
t_cache_ops'
> riscv32-linux-ld: drivers/cache/ax45mp_cache.o: in function `.L26':
> ax45mp_cache.c:(.init.text+0xd8): undefined reference to `riscv_noncohere=
nt_register_cache_ops'
>=20
> and that randconfig file is attached.
>=20
> I also have this one on riscv64:
>=20
> riscv64-linux-ld: arch/riscv/mm/pmem.o: in function `arch_wb_cache_pmem':
> pmem.c:(.text+0x20): undefined reference to `noncoherent_cache_ops'
> riscv64-linux-ld: arch/riscv/mm/pmem.o: in function `arch_invalidate_pmem=
':
> pmem.c:(.text+0xcc): undefined reference to `noncoherent_cache_ops'
> riscv64-linux-ld: drivers/cache/ax45mp_cache.o: in function `.L30':
> ax45mp_cache.c:(.init.text+0x174): undefined reference to `riscv_noncoher=
ent_register_cache_ops'
>=20
> LMK if anyone wants the .config file for that one.

I think Christoph has already posted a fix for that one:
https://lore.kernel.org/all/20231028155101.1039049-1-hch@lst.de/

I'll look at the other one, if Prabhakar doesn't beat me to it.

Cheers,
Conor.

--ihK0gQBGsMu9kYtp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZT+O8wAKCRB4tDGHoIJi
0oWcAQCRfMFgi2G6yLd1ro+KnsXU5vOCvzGFMAHYU6DVuma4NAEAv4ij3to+LO/3
TQ5ElxYhmordl/skVIXTKLIYGMB4AwQ=
=/Adh
-----END PGP SIGNATURE-----

--ihK0gQBGsMu9kYtp--


--===============2653421287571664623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2653421287571664623==--

