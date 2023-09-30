Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A716E7735F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 09:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncyM+0BEc906ObOd6+TWEIxmZRFmOiTamQ5jWJaizrQ=; b=hOaslsPipr90P2otTJdoutybjX
	5CuXVvF1F4W24KPvKROEWMHWQ3xEbI6RhlpdHZABf1r2OTc4bKc5cX9KIPJvohcgwVEyC8zM5zika
	j5QaZx5zkyiTWnTTXnAC++MZodt5dFtTJTzfz6BuVZ2vsEvHfSkvqHFAPxBvmmYwBatSGtb+Ii1NB
	ucarENPYYHPy4kmXnq0XfNXxhCZc9/Hor/IzKNajIqnkt62A3rBcdSudLvLKkUa8iJdOXkHw3kJ0I
	PF/cRqTuV8tFaMdwkpSijcrq1QJVYAFI0uW2yuLCMX314GiO3Oe8p0Q9a3Fa030AhAngvg758RoPY
	c5GuQRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmW3h-009E5c-2M;
	Sat, 30 Sep 2023 09:14:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmW3d-009E4z-3C
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 09:14:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5C9B2B803F7;
	Sat, 30 Sep 2023 09:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABD2C433C8;
	Sat, 30 Sep 2023 09:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696065279;
	bh=26DZrEFmmX7RPrQtrMeeSVZD6kM5LM3HQlhgRqueXPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMA4lonEOQcec+Y8U5X5uNPY9wy9SAqm8cvrp3N/D9OQuPojEY5CMrfbFvlHeVuIC
	 kDJXYuyKlcCJ09Q6e+/O4OtuyfcTo3Sdchh8MdtED0rM3RfnGVy1IgVcio5HfJ8pRQ
	 EEbw7emfAhc93brMUsc/bz40LDdaLvuafpZpjP7FHA6d7lAzfGBCLvpgUUjgwTsk+u
	 Ju35FdtKswl6b5xzXTQmORx5HMH2sR3mIPpCxm4NCR+LFC2jLXEFVkXC6tKoVe1LPE
	 A2MGxiwjheZxsMF6x/TIR9bzxlK+Jx6iRe/Fctnsi4P+OrFZuAm5lzLHxG/o9vZijG
	 0OIkeo9dbixxw==
Date: Sat, 30 Sep 2023 10:14:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes 2/2] riscv: Fix set_huge_pte_at() for NAPOT
 mappings when a swap entry is set
Message-ID: <20230930-unnoticed-slacked-0bf5696cc265@spud>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
 <20230928151846.8229-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230928151846.8229-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_021442_317757_AA40CBC4 
X-CRM114-Status: GOOD (  25.93  )
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
Content-Type: multipart/mixed; boundary="===============3414792672520412096=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3414792672520412096==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5QYzZhHNu7GI5bSx"
Content-Disposition: inline


--5QYzZhHNu7GI5bSx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 05:18:46PM +0200, Alexandre Ghiti wrote:
> We used to determine the number of page table entries to set for a NAPOT
> hugepage by using the pte value which actually fails when the pte to set =
is
> a swap entry.
>=20
> So take advantage of a recent fix for arm64 reported in [1] which
> introduces the size of the mapping as an argument of set_huge_pte_at(): we
> can then use this size to compute the number of page table entries to set
> for a NAPOT region.
>=20
> Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/20230922115804.2043771-1=
-ryan.roberts@arm.com/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Breaks the build. Your $subject marks this for -fixes, but this will not
build there, as it relies on content that's not yet in that branch.
AFAICT, you're going to have to resend this with akpm on CC, as the
dependency is in his tree...

Thanks,
Conor.

> ---
>  arch/riscv/mm/hugetlbpage.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index e4a2ace92dbe..b52f0210481f 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -183,15 +183,22 @@ void set_huge_pte_at(struct mm_struct *mm,
>  		     pte_t pte,
>  		     unsigned long sz)
>  {
> +	unsigned long hugepage_shift;
>  	int i, pte_num;
> =20
> -	if (!pte_napot(pte)) {
> -		set_pte_at(mm, addr, ptep, pte);
> -		return;
> -	}
> +	if (sz >=3D PGDIR_SIZE)
> +		hugepage_shift =3D PGDIR_SHIFT;
> +	else if (sz >=3D P4D_SIZE)
> +		hugepage_shift =3D P4D_SHIFT;
> +	else if (sz >=3D PUD_SIZE)
> +		hugepage_shift =3D PUD_SHIFT;
> +	else if (sz >=3D PMD_SIZE)
> +		hugepage_shift =3D PMD_SHIFT;
> +	else
> +		hugepage_shift =3D PAGE_SHIFT;
> =20
> -	pte_num =3D napot_pte_num(napot_cont_order(pte));
> -	for (i =3D 0; i < pte_num; i++, ptep++, addr +=3D PAGE_SIZE)
> +	pte_num =3D sz >> hugepage_shift;
> +	for (i =3D 0; i < pte_num; i++, ptep++, addr +=3D (1 << hugepage_shift))
>  		set_pte_at(mm, addr, ptep, pte);
>  }
> =20
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--5QYzZhHNu7GI5bSx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRfm+gAKCRB4tDGHoIJi
0m0zAP91gvh8xVeSCkLcZbXEq+3qnMduthZnz3KibSQU6EOWGQD/ZuPEswXNV4uy
bVcB6Egf+5E3mB3MeG1hbuQ6lvtluQ0=
=1QHA
-----END PGP SIGNATURE-----

--5QYzZhHNu7GI5bSx--


--===============3414792672520412096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3414792672520412096==--

