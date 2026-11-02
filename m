Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1895A606D81D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BGmwqQMk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrJUtj1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hS/FiBWE6TpvfMNcX2vxtUE9gz5bQY+/RhDL/wG394Y=; b=BGmwqQMkgTeU2Ql/+l4et66QmA
	6h4gdWwnZOdMYXSlS5gCoUK4tFFsDEYoffA5NNo2TeZ2jmSTRO3b1VvNgKie7vHVvSy0R7biHH4cD
	/9AFFPxiqxw8qaihf1PC4KPhc+1JTKIPAOlteAhqimBlgbAKqmdZFlklhtrKPrLizZNqVcn2C7O0E
	Jo/niwepm3b+bSKlUv1AsFSZM6NbdRs0Go4l0ORJOWlX0wcHLPU4w8MLUW8+Er4tPsqoA3jOVOdu6
	kyJXPgLfZWL6H+jhuE+ibzNdo79W0aB2Cm0/kAQ8qrRgXVTzLfyuZLTg73IZmOyUcPeDTFpskWdbZ
	ubKrL3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxHI-0000000035K-1c4I;
	Mon, 02 Nov 2026 19:01:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxHH-0000000035C-1oaj
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:01:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34DA541168;
	Mon,  2 Nov 2026 19:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6741F00A16;
	Mon,  2 Nov 2026 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646067;
	bh=ZecBYjWUhN4z7fJ6GXfUmUEfwYtS6fvFv39qR2svdwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OrJUtj1QmMk8l1ckUmFtbmCtyGHk78wo4/k1AMngqmUzGb25vHp7820KWVkl2lSMF
	 rmU+YOR7SyfXAoSs+sjcUYAhq+M4MI5oqqsNvpPTU8IEh7uaxIEn7NNoNaKNUyyDLL
	 ZWN6jw+KcG8SvcYQMTXHaIHLk9ThnnrVMfcODPpGalpIZvpIe0nE1oYlR3Bj9kcrIs
	 C1S2MrFKRWxx39BqfcRMfho537Saox7qxlTGPbwesu/SdrCmRKWuUMinDs4+qNA+fC
	 HgT89W9Ii8pqPgUTdNXc3aR5n5uanYs7dmKQV8zvfmF3zuzQ8BaBFy8poI72foXumx
	 L5zWxtz03WDrg==
Date: Mon, 2 Nov 2026 19:01:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Hildenbrand <david@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] riscv/mm: fix up the mm-fixes merge of
 free_pmd_table()
Message-ID: <b396618b-fa12-46c2-9140-d9e555dc8408@sirena.org.uk>
References: <as0D2sHzh_UnNF5L@sirena.org.uk>
 <20261030221401.155797-1-sashal@kernel.org>
 <20261030153347.5641a97e22e18ddff6043416@linux-foundation.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261030153347.5641a97e22e18ddff6043416@linux-foundation.org>
X-Cookie: Used with permission.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0698532647742283965=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============0698532647742283965==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d4hTvcyUwKyTx7AM"
Content-Disposition: inline


--d4hTvcyUwKyTx7AM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2026 at 03:33:47PM -0700, Andrew Morton wrote:
> On Fri, 30 Oct 2026 18:14:01 -0400 Sasha Levin <sashal@kernel.org> wrote:

> > Mark, this applies on top of next-20261030 and is meant to be folded into
> > the mm-fixes merge resolution. Next/merge.log says it was resolved using
> > a previous resolution, I think the one from the risc-v/mm conflict on
> > 2026-10-12, which had the same problem (next-20261012 has it too).

> Thanks.  The "mm: Fix page-table teardown during memory hot-remove", v3
> series was problematic, but I now have all four patches lined up in
> Muchun's as-sent order in mm-hotfixes-unstable.  I'll push that in the
> next hour or three.  Then hopefully any -next merge resolution can just
> go away.

I skipped Sasha's fixup on the basis that you'd already handled things.

--d4hTvcyUwKyTx7AM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmro3e0ACgkQJNaLcl1U
h9COuQf+O2VXd86qGVq15jkmyMh4j7Bj5xIAx+eVfhmzlQ45rUKfhDjZ6Pq6h5h+
1TdZGPLr1IJxy/0qf1JJz5fkPGJFAsuzPD9EL8N004bOqyyRkfodbCitEFqElTkF
5uTKNfKdCLxamg7DbokoU8IdYo5nreN53iJJrBuXNL4ENGgeiktDyqayZxBFWmcQ
AdV/7nfbFs49gftjcdI7/YdtwCmgYZaVp/jEKTz5aCnxZ0VCLTj0UvPbI2PViwtY
QVB48svqCofi8vlzR0uaYQnws5+YRCLw3Lva/bnMFftefvg+geRww5pCuH5iTPET
QLo+yXOc8G3jxE0EZGeN7Nj7EIF45A==
=TEHF
-----END PGP SIGNATURE-----

--d4hTvcyUwKyTx7AM--


--===============0698532647742283965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0698532647742283965==--

