Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A948CCA476
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8z4Kz4GULTRvGCgooae0nNytI+a6Ffc8Uyad1ILNHk=; b=SRaWofww6wWb9umqOvg6c12w5J
	emNT6K2wfEwD1q0ES4nQGyFkkKj0dy1rJVwS8SDZUrfWdFeMhQUZXU4v2N0ti74eT9oB9zS7BApHZ
	f+0uky88WUyVd6r6CFc78+fybgABFmgaWJ9WDBVj8kPLEjXPUruMApJQFi2+Q/n0VEdsAHZIwb34p
	2QIe5ogTnrUl/NEBmo5mVF/ZSDkxPGucDDjWnk+a9vQIZ0DTYYYR4acVU9ty1zjPK3Gb6mOx5LWkM
	/tDWr+r7+JOfCEZZmerfe732RiHV926B6awF8QV6hAlhfwv/lahZWYw9E6HNQl84Uin95TvckBz+F
	Kuu0tvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7XmG-0000000A6cf-3fYa;
	Sat, 11 Oct 2025 11:28:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7XmF-0000000A6cW-1CiU
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 11:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DA35603F8;
	Sat, 11 Oct 2025 11:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DAFC4CEF4;
	Sat, 11 Oct 2025 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760182120;
	bh=fFZME1Zq/TXDxklk7L6f3c4lY/X0+FFz/z5+NJU4maM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWbg/PO6DKqYeIhDmuS9m2hcwXXkiKPyE8jwsI3vfAVuJDsE7Jx5Effz0U7JHvEJ3
	 ckmJ9Ib7hyS/MX/clqQfP0zzVkOqYhAnjOOWUFFGCAOWkolsDFjGZbkoYptNSKaXZK
	 sJ5ZAWl53+Cl5VOw4bhFlR9mqOuNj2v5ZLavQt1wr3qn1IN17dBtaaX1aFttVa+xul
	 KrvnC2DG7uum+2d6s+iD7uuZNkCH5JG3Se+VgPvN9nJL/2UI993wRLLtNczDz5/GEf
	 Zxf/LQ6BNpHI8WFbLFJJs1UL/edi6UCHmSJR+JNQ6oFInPASAG+AUoacQsVvrqYTy8
	 mp8vTsFzu6NQg==
Date: Sat, 11 Oct 2025 12:28:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Vivian Wang <uwu@dram.page>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] riscv: Use __riscv_has_extension_{likely,unlikely}
Message-ID: <20251011-buffing-never-4911edc10600@spud>
References: <20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============2213782795665941308=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2213782795665941308==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hJqoiJHTRSDkGTYh"
Content-Disposition: inline


--hJqoiJHTRSDkGTYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 11, 2025 at 07:35:42AM +0800, Vivian Wang wrote:
> There are about a dozen uses of asm goto in arch/riscv just to select
> between two code paths with the alternative mechanism. Convert them to
> the existing helpers __riscv_has_extension_{likely,unlikely}.
>=20
> In each case, I have preserved the existing code's choice of asm goto
> pattern while picking between "likely" and "unlikely", namely:
>=20
>   ALTERNATIVE("j %l[no]", "nop", ...)   -> "likely"
>   ALTERNATIVE("nop", "j %l[yes]", ...)  -> "unlikely"
>=20
> Since the helpers are just implementations of these patterns, the
> performance should be the same as before.

Can you explain why you're opting for the __ variant, instead of the one
without __? They should do the same thing in your cases, and resolve to
the alternative, since the non-alternative function call will be
unreachable and the assert is compiletime. There's currently no users of
the __ prefixed versions outside of other extension detection helpers, and
I think it should probably be kept that way if possible.

>=20
> These patches are also available at:
>=20
> https://github.com/dramforever/linux/tree/riscv/altn-helper/v2
>=20
> ---
> Changes in v3:
> - Rebased on riscv for-next
>   - Resolve conflict, use ALT_RISCV_PAUSE() in moved lines
> - Link to v2: https://lore.kernel.org/r/20250821-riscv-altn-helper-wip-v2=
-0-9586fa702f78@iscas.ac.cn
>=20
> Changes in v2:
> - Cc'd authors who initially introduced the asm goto blocks
> - Use existing __riscv_has_extension_{likely,unlikely} instead
> - Remove bogus comment for Zbb being likely (checksum)
> - Restructured patch to minimize diff (bitops, hweight, cmpxchg)
> - Link to v1: https://lore.kernel.org/r/20250820-riscv-altn-helper-wip-v1=
-0-c3c626c1f7e6@iscas.ac.cn
>=20
> ---
> Vivian Wang (5):
>       riscv: pgtable: Use __riscv_has_extension_unlikely
>       riscv: checksum: Use __riscv_has_extension_likely
>       riscv: hweight: Use __riscv_has_extension_likely
>       riscv: bitops: Use __riscv_has_extension_likely
>       riscv: cmpxchg: Use __riscv_has_extension_likely
>=20
>  arch/riscv/include/asm/arch_hweight.h | 24 ++++++----------
>  arch/riscv/include/asm/bitops.h       | 32 ++++++---------------
>  arch/riscv/include/asm/checksum.h     | 13 +++------
>  arch/riscv/include/asm/cmpxchg.h      | 12 +++-----
>  arch/riscv/include/asm/pgtable.h      | 15 +++++-----
>  arch/riscv/lib/csum.c                 | 53 ++++++++---------------------=
------
>  arch/riscv/mm/pgtable.c               | 22 +++++++--------
>  7 files changed, 53 insertions(+), 118 deletions(-)
> ---
> base-commit: cd5a0afbdf8033dc83786315d63f8b325bdba2fd
> change-id: 20250820-riscv-altn-helper-wip-00af3a552c37
>=20
> Best regards,
> --=20
> Vivian "dramforever" Wang
>=20

--hJqoiJHTRSDkGTYh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOo/XgAKCRB4tDGHoIJi
0jvdAQCIqf7X54DcteMBhDN+nrmCddguGzCLjFJhHeX2dEqxsgD9FcS8maAfQ5mV
37ddsRUOuxb+6L24yupPTTl++SiuvQ8=
=7YcE
-----END PGP SIGNATURE-----

--hJqoiJHTRSDkGTYh--


--===============2213782795665941308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2213782795665941308==--

