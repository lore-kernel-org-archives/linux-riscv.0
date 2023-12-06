Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A2FC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 10:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTjWFzKnk0I16X7ebFNL7bzz+TWK/s6PM0iLg0UDevE=; b=dyMkyltadbMOQBQ//vwnX5APUL
	f/B61Tv9gLffjUGtfep0ds9WfnZujWx18Klbs3sIEIrr8JCLgpBU0IgUt7CScBKxXbKm0P80OG0wk
	C1m2k7cST82VSCyG0/UAP61OZQXFgvyR7MzAl5b7NMBLWXS0vBvUyLFSFkIR+fz55X6UE0xOZ8XUY
	E3TpJPOqIRZgK82xRBl1IFY9LltmSqvXUaQJtaMsAQ2chwXDx1VNWA5km9OZBqjMghtRMZGNfcZQl
	yEAVE2FbDaHQfX7dpWc55Z5w5fFi/xBhaXVUV/eKk9i4yHpw8ujL50KzA6quFS/jygLDNCK97OPM2
	jc9QWDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rApZP-009oji-1T;
	Wed, 06 Dec 2023 10:55:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rApZL-009oih-2k;
	Wed, 06 Dec 2023 10:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 715FBB81F68;
	Wed,  6 Dec 2023 10:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F62C433C8;
	Wed,  6 Dec 2023 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701860153;
	bh=CvKE1IH3LYnXGhtee6s3Q9ZQyTzdlpf3P98EaHJKW/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aW9tMVZ8X8hTnrUJt2kVZEBKg3OqNJNF0L0l9tspUrRzVceWE6yMFP6tQoDrVXCxS
	 iCME7Z7Qty6HE/6uXnIIgyae9s4cz+fEO2d6Lo4r8ekJbk/kcjW614pX+O89Pe5U6C
	 iIRU0EdtdDOjQLkyrMNfsn43pzlI0SY88bTXl1TrL69nLzjkTdasDdPtJl28UKNVnu
	 HAfQW8pTkpCGrZ0Hl3RPFhAZ2ofQXkphd0sXu4uWRVXogGv1ZAkUrS68h3RWLBNTaq
	 O3MKr2UvcxTM9qUxiTgAYwWmEoF52mUmJzFUwryYHIVfDi32fy4EAOVUuX7dOoxcKY
	 jRFsD/yQvBtpg==
Date: Wed, 6 Dec 2023 10:55:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] drivers: perf: constify the ctl_table argument of the
 riscv user access handler
Message-ID: <20231206-flanking-frill-fffeca740221@spud>
References: <CGME20231206084652eucas1p1fd6025710032f3a4a64b05dab67a2a17@eucas1p1.samsung.com>
 <20231206084642.802053-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20231206084642.802053-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_025556_019799_1761ED28 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7470550521102422910=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7470550521102422910==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bllXRtefT9FoHVhp"
Content-Disposition: inline


--bllXRtefT9FoHVhp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 09:46:42AM +0100, Marek Szyprowski wrote:
>=20
> Fix riscv build break after commit c8be9e66ca1e ("sysctl: treewide:
> constify the ctl_table argument of handlers").
>=20
> Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument o=
f handlers")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

This breaks the build when applied to the RISC-V tree. I'm going to mark
it "handled elsewhere" in patchwork since it needs to go into whatever
tree has the broken commit.

Thanks,
Conor.

--bllXRtefT9FoHVhp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXBTNAAKCRB4tDGHoIJi
0g+CAPwJ49hgJ9JEla24sr8w7HMLc1m/NehzyP5r8yTlkre2TQEA7SZee3gvdL7i
80kwXZlyHO6IsP9BRkSoWLYBnpaxKAw=
=NaDC
-----END PGP SIGNATURE-----

--bllXRtefT9FoHVhp--


--===============7470550521102422910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7470550521102422910==--

