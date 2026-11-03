Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAD9606A32C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=08A6vjHK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TqtcnPlE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ljMj+lNK/4y9X0LQ0r2vtYf7nV/AcTDdu9DNqatAUzc=; b=08A6vjHKRgvfJf8XQlmSyGCu+/
	wWYPHdy83ebJYGqOR/4AvCTjtFd4+02bNLWZPEWCCdo/oaNQrj3gaPiJW828KSHtBcp5f/1MOX5qz
	r9XtHewwuwa+/0nJ6PWhyhvso0dbmHER9/xuIxf5Gnp9WGG2RrCyQPeiA8FMZUnIACnG/RanWDOeY
	6TO0H/pBRLiAAug1VMOE37a0Zzihne39xUEif8QgWPYJ4n46pHN6JfhhglBhy6xT5rB6XBvajOkqd
	cqtHsbOns6HURfcktkTuRzjxolf3b+LqEA9QRWDuNY4sxJggTbY7xMnZ4cy4umnoL1OP+/D5+bnP7
	WjF6n+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJZZ-00000003TMp-45GA;
	Tue, 03 Nov 2026 18:49:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJZY-00000003TMU-2srt
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 18:49:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DBF643604;
	Tue,  3 Nov 2026 18:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2101F00A02;
	Tue,  3 Nov 2026 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793731768;
	bh=fP04ZpmNAf1RNl3ZAByulH2Uas5k3RTZiNWH+dKnMwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TqtcnPlE2JIVRxHinTkM45BDyZFNL33vRUsIaH5gy0erND8IZE/PO/AYLwrvRTM6Y
	 5BUgp7IW0FX0rdbdfSJiWNF+szFm1J9fVgyuPb97Fhmw0fDCL207QDvHohYqzafnen
	 Rz+jt9L2f9PonF54iQ5GY+qjzCxnd47QXZeIL8U7WkBTg1RuGqXtSAcJlhpDwxqjXL
	 K0x0TCmVTHs7JxwukdlosYfsNSSvFp8Q5KFF3nBU/fI69N0AUfbR+Ym9kBHh9gih5u
	 waKBjpQlMVYzgTFsBc2fT/UHZGGVn5wAIOq0pv35ApWvzFiYlSYKEd7j8wGqX+Rpsx
	 zEw8KwmAL9Dpw==
Date: Tue, 3 Nov 2026 18:49:22 +0000
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
Subject: Re: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <20261103-abnormal-remedy-05f07229b231@spud>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
 <20261102-persuader-catering-5ed81c35ae0e@spud>
 <1bcc885c-b013-4ab3-9b08-1d1f89b09762@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1bcc885c-b013-4ab3-9b08-1d1f89b09762@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5288726782109935563=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5288726782109935563==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hbZ37NZYZyvMho4S"
Content-Disposition: inline

--hbZ37NZYZyvMho4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 02:57:29PM +0200, Vladimir Kondratiev wrote:
> Some of issues already fixed on v4.
> - Link to v4:
> https://patch.msgid.link/20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com
>=20
> On 11/2/26 20:46, Conor Dooley wrote:
> > On Mon, Oct 26, 2026 at 11:20:02AM +0200, Vladimir Kondratiev wrote:
> >> The A extension is Zaamo plus Zalrsc. MIPS P8700 implements only
> >> Zalrsc, and its AMO instructions trap to SBI. A typical atomic is
> >> about 40 cycles with LR/SC and about 600 cycles with an emulated AMO,
> >> so keep the existing AMO sequences when the toolchain defines
> >> __riscv_zaamo or __riscv_atomic, and use an LR/SC loop otherwise.
> >>
> >> Add RISCV_ISA_ZAAMO and RISCV_ISA_ZALRSC. Both default on, and that
> >> selection still passes "a" in -march. Zaamo can be turned off only
> >> with CONFIG_NONPORTABLE; Zalrsc remains required because cmpxchg and
> >> the conditional atomics are LR/SC sequences. An LR/SC-only build
> >> passes _zalrsc instead of "a".
> >>
> >> Suggested-by: Chao-ying Fu <cfu@wavecomp.com>
> >> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> >=20
> > As you can see by the lkp reports, this is not the right way to do this.
>=20
> I fixed these lkp reported bugs in v4 by TOOLCHAIN_HAS_ZALRSC that test
> compiler support of _zalrsc in -march

Right, I'll go conjure up a reply to v4 so.

--hbZ37NZYZyvMho4S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauossgAKCRB4tDGHoIJi
0oWwAP495dJRvyantdd0aiHJkf2TkWUWeZTCv+sj8dYEk9iGXAD/frROj/a8WNTi
IF278EwVJ6FvORosO9Yv1LsiVWq4aQM=
=kYd3
-----END PGP SIGNATURE-----

--hbZ37NZYZyvMho4S--


--===============5288726782109935563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5288726782109935563==--

