Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635AD606A338
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 18:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kk5S8Pyx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhZYwHzn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rQ/gFDhfW2R9qgF+ngHjlEdRSK+A5/kp27hP1IR4Dnw=; b=kk5S8PyxmuFdtA2vQ7ptukSUW2
	k6N3KQ3Hly7S2tveupjQgjCbC5SEfT8Xi20kHy5lDkxiyyzCy52rObvPD6K4KO3BLE+SBkNw9R2Cn
	+kWGetaFzaDZIBSFPFLNWpT8DOpoUhnHWrMk18A5N6T2wuIa7wpckSbf+N6ymvx93qV7Cb1Pq1oCi
	nYyZcCBZX3RHHDssSpJauvW6nEpeO04BK0zo5VOYwLRHO9M3lDvuNmWDzIkspz5e9tL8oXqCmMNLh
	TfCM9SVGAD1+XRmTmvTHsjECIuJB2iaoOABlBYbrwkHr+B6zPv7kSsnwrnmYgTuxQegAoibUpQavc
	wGrEg8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJZ7-00000003TGq-1NVE;
	Tue, 03 Nov 2026 18:49:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJZ6-00000003TGg-0e94
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 18:49:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8682F403B9;
	Tue,  3 Nov 2026 18:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17511F000C1;
	Tue,  3 Nov 2026 18:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793731739;
	bh=UoYGoOCeXt2Q5fxKK2iVTHww4b9e78V4ejqYwenbYq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lhZYwHznG+xueBWT3/fzca7tqrZuJ0Al4DWBVbU4EuVj9ek4SioM7dx0bZ1vXCEy8
	 JFNChRvYll1M9b/Fkz5KeLBZP56+6EzPZR25IPQokltvNaYMy/Wpgg2NGVtbJr/haa
	 Fn3nRqzoqYFBgu/LKx3PBsSDJNO+NTHpM1ZOIY1pFsptXb6pGpWBQaVCZnx2t/cerI
	 iVkGzHNcGZ+WMw0tPp/mBvnWUqBhk9ncZUuXAoE6o8AYoeWzCzU6hBSHSdPmKc+c4g
	 /2rcOgmBsMiuIx3xqCVD+TshmCMsqfRqhjjAqGBrdhp4ZWi6Kwt2mgrsn6A3TMQg5F
	 SXuNoByHFBtlg==
Date: Tue, 3 Nov 2026 18:48:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: accept the atomic extensions this kernel
 was built with
Message-ID: <20261103-unlearned-platform-26f2d441d53e@spud>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>
 <20261102-shredder-pauper-67ef6eaae556@spud>
 <4197b67b-0ef1-4ea2-84f6-b142f67739de@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4197b67b-0ef1-4ea2-84f6-b142f67739de@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1065760237620577966=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1065760237620577966==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i9VuwXoprUw+Psbr"
Content-Disposition: inline

--i9VuwXoprUw+Psbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:31:21PM +0200, Vladimir Kondratiev wrote:
> On 11/2/26 20:21, Conor Dooley wrote:
> > On Mon, Oct 26, 2026 at 11:20:03AM +0200, Vladimir Kondratiev wrote:
> >> riscv_early_of_processor_hartid() rejects a hart unless its
> >> riscv,isa-extensions property contains "a". That rejects a Zalrsc-only
> >> hart even when the kernel was built to use only LR/SC.
> >>
> >> Require "a" or "zaamo" when the kernel emits AMO, and "a" or "zalrsc"
> >> when it emits LR/SC. A normal build defines both toolchain macros and
> >> still requires the full A extension. The legacy "riscv,isa" fallback
> >> keeps its rv{32,64}ima check.
> >>
> >> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com
> >>
> >=20
> > IMO, this should not be a separate patch.
>=20
> I can squash it with previous patch.
> My thought was: it address different aspect. While previous patch allows
> compiling code that don't use AMO, this one is about correct
> manifestation of the extensions supported by CPU. One can use only
> previous patch and declare "a" support in the riscv,isa-extensions. Not
> exactly true but works. With this patch, one can say "zalrsc" instead of
> "a". This have no effect on how kernel get compiled but let user space
> know exact CPU features.

This has nothing to do with letting userspace know about cpu features
though, this code rejects CPUs during boot that do not meet the minimum
featureset of the kernel. Your previous patch relies on this, you can't
boot a zalrsc only kernel without making this change so I would say this
is intrinsically linked and should be part of the prior patch. Just
because it works if you lie about what your hardware can do, doesn't
justify splitting it...

--i9VuwXoprUw+Psbr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauoslQAKCRB4tDGHoIJi
0haJAQDZXCXvVEOJDxmbKsedJsLnDKgzlkczNtiuT6+CIPN9ywD/U6/S15pu+u3t
orTSZ/KTwdzMkH7Izbancr/CM6fhFAQ=
=q9Ad
-----END PGP SIGNATURE-----

--i9VuwXoprUw+Psbr--


--===============1065760237620577966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1065760237620577966==--

