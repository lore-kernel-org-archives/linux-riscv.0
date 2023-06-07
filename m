Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1615C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pY7Xi45TawZa0quQpAfecmcFkxA1TXH+1Du+/hMVUJc=; b=pDZmyEjHEnc0YXYuYo+R2P+38b
	W3jGu+fslgPi1X86930ibFbFqZz/3OJhR0knlJD3kiCVPSG1/urtU7Lww4NoLLNlCLkkcIbGjPbwD
	EUMalnVh9sU1L/wNSShoJVyzWJl1ceVHcLaA+AQWjMYpQVu1PIJF1gOgQpjSXWneHqYVoUjOU14PF
	kKDVz5Wmz+lesqlfnKFXz4sRefYc58Xneky/Z1Un+O4c7rDwdXDTcEn+w1+67nklVuLq+bUdaTARS
	rIOjI1yUC8SvBDVsUVOnJxho7kwuyjznWuoJWsmksZgK7hTRhcaaKWTnrArsSljtbam5tyFRnXjls
	JYJGOgLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6xix-006o52-3D;
	Wed, 07 Jun 2023 18:17:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6xiv-006o4I-0i
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 18:17:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98D1860AAF;
	Wed,  7 Jun 2023 18:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BFDC433D2;
	Wed,  7 Jun 2023 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686161852;
	bh=Ag8b6jclnIS3ni+j5UQhwSXc0W17dRqILjpn9E7ZUQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FiouR0Ej+H6nlg65fXSk7tiRWif1fAW7Ennjo+mAK1TmLYnAab6SBxOgeJsmqVJq9
	 GJTVt+c+vq9rwo3fHcxIQqWUDvY6Q/w8mZZ5DxlFEhaS70Af5vhFhNtXlOeYxyDmyN
	 +UDyF+s2LcemwyStZaTNGlqRod6/i+LSWJSeqcun/w7kds9e3j26Rz7hV8Ky5jDN87
	 MlIThW7UjApWMoP7K137joHNb0A9ToQ6Yb1ZoKaOCzkEeAGyngppBcVKM0ugb4amDM
	 wh6z0JjCXnuTQBcSwMbCPwNXk5vN3pYrAmLvfbiGjuFZ9USlahQv+5cQXMpKu5gQr5
	 7LU+4L4VaAPdQ==
Date: Wed, 7 Jun 2023 19:17:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Woody Zhang <woodylab@foxmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, alexghiti@rivosinc.com
Subject: Re: [PATCH] riscv: reserve DTB before possible memblock allocation
Message-ID: <20230607-jogging-grudging-70dede86bc53@spud>
References: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_111733_345101_0CD1B212 
X-CRM114-Status: GOOD (  23.61  )
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
Content-Type: multipart/mixed; boundary="===============2547165613802602371=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2547165613802602371==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J+jihW930ktvqPjh"
Content-Disposition: inline


--J+jihW930ktvqPjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Alex, you should take a look at this patch.

On Wed, Jun 07, 2023 at 09:35:19PM +0800, Woody Zhang wrote:
> It's possible that early_init_fdt_scan_reserved_mem() allocates memory
> from memblock for dynamic reserved memory in `/reserved-memory` node.
> Any fixed reservation must be done before that to avoid potential
> conflicts.
>=20
> Reserve the DTB in memblock just after early scanning it.

The rationale makes sense to me, I am just wondering what compelling
reason there is to move it away from the memblock_reserve()s for the
initd and vmlinux? Moving it above early_init_fdt_scan_reserved_mem()
should be the sufficient minimum & would keep things together.

Cheers,
Conor.

>=20
> Signed-off-by: Woody Zhang <woodylab@foxmail.com>
> ---
>  arch/riscv/kernel/setup.c | 10 ++++++++++
>  arch/riscv/mm/init.c      |  9 ---------
>  2 files changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 36b026057503..c147fa8da929 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -16,6 +16,7 @@
>  #include <linux/console.h>
>  #include <linux/screen_info.h>
>  #include <linux/of_fdt.h>
> +#include <linux/libfdt.h>
>  #include <linux/sched/task.h>
>  #include <linux/smp.h>
>  #include <linux/efi.h>
> @@ -256,6 +257,15 @@ static void __init parse_dtb(void)
>  		pr_err("No DTB passed to the kernel\n");
>  	}
> =20
> +	/*
> +	 * If DTB is built in, no need to reserve its memblock.
> +	 * Otherwise, do reserve it but avoid using
> +	 * early_init_fdt_reserve_self() since __pa() does
> +	 * not work for DTB pointers that are fixmap addresses
> +	 */
> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> +		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +
>  #ifdef CONFIG_CMDLINE_FORCE
>  	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index c6bb966e4123..f8c9a79acd94 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -254,15 +254,6 @@ static void __init setup_bootmem(void)
>  	 */
>  	early_init_fdt_scan_reserved_mem();
> =20
> -	/*
> -	 * If DTB is built in, no need to reserve its memblock.
> -	 * Otherwise, do reserve it but avoid using
> -	 * early_init_fdt_reserve_self() since __pa() does
> -	 * not work for DTB pointers that are fixmap addresses
> -	 */
> -	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> -		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> -
>  	dma_contiguous_reserve(dma32_phys_limit);
>  	if (IS_ENABLED(CONFIG_64BIT))
>  		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
> --=20
> 2.39.2
>=20

--J+jihW930ktvqPjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIDJtwAKCRB4tDGHoIJi
0pCXAP99xsCphB3DBvIziKavjWB1iLOkD+X3H97tW1E7cMtkzAEArXHyHtW6kTX/
gRag6vi2QGqXh4hG1YvtqvIpp1G2MQE=
=yaX+
-----END PGP SIGNATURE-----

--J+jihW930ktvqPjh--


--===============2547165613802602371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2547165613802602371==--

