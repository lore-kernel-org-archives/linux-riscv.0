Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48116C5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHzPjeGaw5ETrD7vl28pA80BUodtlMFWTy/rwdJGf4c=; b=CCtYE0T9B8aYAXe+gb+v5lbojz
	DaNrey2SgiWETU/9iBG7eZRsoOz6x73BiBIz1SX6oCoBCyOULM7P2hGkJCtFp9g3Ej0iMdhRbueiB
	WVJDzq1QmDIZZKDoC2Rw3xnK2LUHRh96s5LBP8TWKi5ZeNPNkIF3P9W9/abGQpO5q4zbTdlW5JIq+
	t0V6ODlMBiotfuzvaBk143VBlLDOyvrdL+Hpkjjbvg0TtmNSzi/qD5FrrQ+Rxk2up5iM2k3SpBhCT
	XjgBwkkm/Lc8YEAtHtjLSWrJfDU30ZEsqgzag0ygCjLFKosXN7u9EGsONT6dDoot0lGjIS1TjXZop
	6IHK73Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSNB-0000000CJuS-1Twq;
	Mon, 10 Aug 2026 15:57:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSNA-0000000CJu4-0oUA
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:57:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 275E260A6E;
	Mon, 10 Aug 2026 15:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1592E1F000E9;
	Mon, 10 Aug 2026 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377426;
	bh=F8KMGkDAu8YfisZR65YDGzCtBVE/c5WiRa/IXVQny+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zeg9FNUMM2KrxPAAWXESkFjWTVPWBRERSBkvOYk5/S6uyldbHHk3bnMYGSeZGR+uD
	 h9ua0GAJofD6qVA5EL9nA56XDP8Q3MY3AUZbSwgcySg3ZIdzjfmoydBrKALHRq+Hqd
	 TUrhsbPIxhk94eGNiT2lU9UrMeSraHgvHXXNuLCBjrgiTcepzZV7+sDgc43zAqMNY4
	 09KmBuTKU3UiRdHQApqlvfY3VYBSzCgiw9wECgr3f6xVJN895ZQN5V9g7/iOS1rFBe
	 +kagO+ycU3ojYnGkJAx8EewEr6/MYZzuQE0JwpAMU4fE7dQKuidPYYzFf1SQiQ6xdi
	 DaHE0PRaYRGmQ==
Date: Mon, 10 Aug 2026 16:57:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chao-ying Fu <cfu@mips.com>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: Re: [PATCH v4] riscv: Use Zalrsc extension to implement atomic
 functions
Message-ID: <20260810-preoccupy-earwig-c8d98044c1da@spud>
References: <20260723-p8700-zalrsc-v4-1-59c21b252e29@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20260723-p8700-zalrsc-v4-1-59c21b252e29@htecgroup.com>
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
Content-Type: multipart/mixed; boundary="===============5858553390011303695=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5858553390011303695==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uy53EvrMdPjGy9dT"
Content-Disposition: inline

--uy53EvrMdPjGy9dT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 05:51:53PM +0200, Aleksa Paunovic wrote:
> From: Chao-ying Fu <cfu@mips.com>
>=20
> MIPS P8700 does not natively support Zaamo instructions.
> They are emulated with Zalrsc extension instructions instead [1].
> Since the emulation is implemented through M-mode traps in the SBI
> layer, it is best to avoid using these instructions wherever possible on
> the P8700.
>=20
> Implement kernel atomic operations using LR/SC sequences only.

> This is achieved by using the errata mechanism, with minimal
> interference on other cores.

This does not seem appropriate, you don't have an actual erratum.
Rather, you don't meet the minimum extension requirements that linux
currently has and want to avoid emulation.

>=20
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Co-developed-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> [1] https://mips.com/wp-content/uploads/2026/03/MIPS_P8700_P8700-F_Progra=
mmers_Reference_Guide_Rev1.86_2-17-2026.pdf

This should be a Link: tag, and be above the signoffs.
>=20
> ---
> The patch was tested on QEMU configured to emulate an eight-hart MIPS P87=
00 CPU.
> Testing done since v3: futex kselftests and perf futex tests. These tests=
 caught the issues described below.
> The same tests were executed on the Boston board with a single-hart P8700=
 core.
>=20
> Since the main issue was with an incorrectly written erratum, it shouldn'=
t affect Vladimir's version [1].
> However, since chips supporting only one part of the A extension are rare=
, we believe it might be
> better to address this using the alternative mechanism, instead of demand=
ing that the wider community
> relax the A extension requirement.

Alternatives, sure. Relaxing the A extension requirement on the other
hand basically makes no difference, if we have to insert an alternative into
anything using AMO instructions, may as well do it properly and support Zal=
rsc
only systems rather than abuse the errata mechanisms. Any multiplatform ker=
nel
(so anything provided by a distro) is going to turn on any errata that are =
not
listed as being non-portable.

The minimum requirements have been known for a long time too, since the
port was merged, so I personally don't feel charitable here. Your
firmware already can deal with the emulation, so I don't really see why
we should be adding alternatives because people selling (or buying) IP
cannot be bothered to meet the extremely basic minimum requirements of the
software they want to support.

>=20
> Changes in v4:
> - The amo part of the ALT_TEST_AND_OP_BIT_ORD erratum erroneously hardcod=
ed zero as the destination register.
>   This is fixed in v4.
> - futex.h was missing the ANDN case.
> - Link to v3: https://lore.kernel.org/r/20250901-p8700-zalrsc-v3-1-ec64fa=
bbe093@htecgroup.com
>=20
> Changes in v3:
> - Use alternatives to replace AMO instructions with LR/SC
> - Rebase on Alexandre Ghiti's "for-next" branch.
> - Link to v2: https://lore.kernel.org/linux-riscv/20241225082412.36727-1-=
arikalo@gmail.com/
>=20
> Links:
> [1] https://lore.kernel.org/linux-riscv/20260120-lrsc-only-v2-0-a522e640d=
27d@mobileye.com/
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  arch/riscv/Kconfig.errata                    |  11 ++
>  arch/riscv/errata/mips/errata.c              |  13 +-
>  arch/riscv/include/asm/atomic.h              |  29 ++--
>  arch/riscv/include/asm/bitops.h              |  28 ++--
>  arch/riscv/include/asm/cmpxchg.h             |   9 +-
>  arch/riscv/include/asm/errata_list.h         | 215 +++++++++++++++++++++=
++++++
>  arch/riscv/include/asm/errata_list_vendors.h |   3 +-
>  arch/riscv/include/asm/futex.h               |  40 ++---
>  arch/riscv/kernel/entry.S                    |  10 +-
>  9 files changed, 290 insertions(+), 68 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 3c945d086c7d0266b685f9506d58b0662af071c4..cd5bd5e8eb395418c3ad103db=
d836c775b7fd901 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -44,6 +44,17 @@ config ERRATA_MIPS_P8700_PAUSE_OPCODE
> =20
>  	   If you are not using the P8700 processor, say n.
> =20
> +config ERRATA_MIPS_P8700_AMO_ZALRSC
> +	bool "Replace AMO instructions with LR/SC on MIPS P8700"
> +	depends on ERRATA_MIPS && 64BIT
> +	default n

Why is this default n if your platform does not work without it?

Cheers,
Conor.

--uy53EvrMdPjGy9dT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann0zAAKCRB4tDGHoIJi
0pV0AP9dFi5zIRbiUP/yTcCr4NiRk1C1kjFuGwY4WAU40n22tgD/bLTz/Kw7ydAO
N+l2FVIBjDFpvTaqZiYaRJheaTQSAQ0=
=qtR+
-----END PGP SIGNATURE-----

--uy53EvrMdPjGy9dT--


--===============5858553390011303695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5858553390011303695==--

