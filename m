Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495E7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAc7yAeJq+pNBPlEMdYNziX+dDRUMjs1aR316OmaKoI=; b=M1HfgI0OM1bjdP8Vu7HgAP7QxB
	RvdJZQgmVQZP3O/147W6hTQnyNZ6H9wCk1u16Vgvmbfuuj+N5y5J9panED/OMzrG2P2pU6t/jOChm
	Pl99/K1fF7R9a8OI8BXLFSAIZZ3E1Z9p7IRKKsI5w0Prbn9pYcr3/0sCN9WNP/B6GLP7eP1QCpYgW
	hA8p8Zk/nbHZ3f5CfiIkpFUm965fBzu41ksmblm5+Zh79zuxPxEkynYH42trzOdThUdzYMJWLQ/oh
	pUbl/4F1B++RZic+6nZyAyd5xPl+VBocH443+itDjpa09lj3RhGzWPJ72g4Eh/zXC6p7sfdRb+hzQ
	sTAjL+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8TdI-00HXHd-6Q; Thu, 22 Dec 2022 22:01:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8TdF-00HXFs-C1
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 22:01:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3583461D62;
	Thu, 22 Dec 2022 22:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0F5C433EF;
	Thu, 22 Dec 2022 22:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671746499;
	bh=0AHFrmtAkzUY8TmraN3K72lLEpI4eao1ncPI5QWPLq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkelR5Yf6MJK35i2G7HbiRdwiWSrGDls5wzM68w0OZYqUqEzJdcfcVtq3GkYePakY
	 C7a35OYyTNCzLvJb5RwjRW0aFz5jQcalCNY/E8Foz88MNHX/oV9mmNsYrZpBSPM2Vg
	 KaiTe352DbYEpYnoDXedqBS/SBSYWRxioRoUKOjjOMHB4rRLNUkes2H/AKCgfLlw7A
	 rOnsOSqLO9gPuo4xJkCdcESXKiwQuE1PTqRLd2u991OMYnpqZEE/3HwaC3EC400SKu
	 3GbdX3vPiYVM89RulVx6nbBsTPN1BbbEinYYuYUvpjXHbfYR92lbdRR3KDUymRfHUV
	 vL4xjcshiRTiQ==
Date: Thu, 22 Dec 2022 22:01:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH 0/6] RISC-V kasan rework
Message-ID: <Y6TTvku/yuSjm42j@spud>
References: <20221216162141.1701255-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20221216162141.1701255-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_140141_536498_0D1DB1D9 
X-CRM114-Status: GOOD (  26.48  )
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
Content-Type: multipart/mixed; boundary="===============3784713436216903198=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3784713436216903198==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TCn4u6SoH/sj16af"
Content-Disposition: inline


--TCn4u6SoH/sj16af
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex!

On Fri, Dec 16, 2022 at 05:21:35PM +0100, Alexandre Ghiti wrote:
> As described in patch 2, our current kasan implementation is intricate,
> so I tried to simplify the implementation and mimic what arm64/x86 are
> doing.

I'm not sure that I am going to have much to contribute for this series,
but I did notice some difficulty actually applying it. At whatever point
you sent it, the pwbot did actually give it a shakedown - but it doesn't
apply any of the "usual suspects" tree wise.
It looks like multiple patches interact with commit 9f2ac64d6ca6 ("riscv:
mm: add missing memcpy in kasan_init"), which caused me some difficulty
that was not just a trivial resolution.
A rebase on top of v6.2-rc1 is (I would imagine) a good idea for this
series?

For the future, perhaps using the base-commit arg would be useful for
stuff like this :)

> In addition it fixes UEFI bootflow with a kasan kernel and kasan inline
> instrumentation: all kasan configurations were tested on a large ubuntu
> kernel with success with KASAN_KUNIT_TEST and KASAN_MODULE_TEST.
>=20
> inline ubuntu config + uefi:
>  sv39: OK
>  sv48: OK
>  sv57: OK
>=20
> outline ubuntu config + uefi:
>  sv39: OK
>  sv48: OK
>  sv57: OK
>=20
> Actually 1 test always fails with KASAN_KUNIT_TEST that I have to check:
> # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan__test.c:1020
> KASAN failure expected in "set_bit(nr, addr)", but none occurrred
>=20
> Note that Palmer recently proposed to remove COMMAND_LINE_SIZE from the
> userspace abi
> https://lore.kernel.org/lkml/20221211061358.28035-1-palmer@rivosinc.com/T/
> so that we can finally increase the command line to fit all kasan kernel
> parameters.
>=20
> All of this should hopefully fix the syzkaller riscv build that has been
> failing for a few months now, any test is appreciated and if I can help
> in any way, please ask.
>=20
> Alexandre Ghiti (6):
>   riscv: Split early and final KASAN population functions
>   riscv: Rework kasan population functions
>   riscv: Move DTB_EARLY_BASE_VA to the kernel address space
>   riscv: Fix EFI stub usage of KASAN instrumented string functions
>   riscv: Fix ptdump when KASAN is enabled
>   riscv: Unconditionnally select KASAN_VMALLOC if KASAN
>=20
>  arch/riscv/Kconfig                    |   1 +
>  arch/riscv/kernel/image-vars.h        |   8 -
>  arch/riscv/mm/init.c                  |   2 +-
>  arch/riscv/mm/kasan_init.c            | 511 ++++++++++++++------------
>  arch/riscv/mm/ptdump.c                |  24 +-
>  drivers/firmware/efi/libstub/Makefile |   7 +-
>  drivers/firmware/efi/libstub/string.c | 133 +++++++
>  7 files changed, 435 insertions(+), 251 deletions(-)
>=20
> --=20
> 2.37.2
>=20
>=20

--TCn4u6SoH/sj16af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6TTvgAKCRB4tDGHoIJi
0orbAP9JIVPQo+hgzKfF1ShcT+6Ln7xErm9HazmhbtqIG0D61gEA5NgEVxpsOv3f
J9oJpI8UCyLrfCOHSx5LFudR2RhlJgs=
=WKhG
-----END PGP SIGNATURE-----

--TCn4u6SoH/sj16af--


--===============3784713436216903198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3784713436216903198==--

