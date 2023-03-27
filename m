Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463EFC76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlZSDagXLkR53zvjsWchTHvJOB2x2WqiysG4NbKfzkI=; b=XuQzwfN60QzKTsDNfNpORwZo93
	021H9jEULo+vFrVlCZZcNHmbNoOvTX0YiCh2axRgsv+UeWb6QrMO4QbRqKmL6zI27VDlfnGbDzw+H
	cEIDYnl02uGUW0o7iAS5RcUu3QGhcOqdJe9usrC/xigvglT2zjMPWVBgZfPYzRHZMRBlhbIp9s7Za
	GqmfZ7C7FYoLRrQuvGUcCAPft02AdSSEhYGZyYqzd0yGrhjwCqFsRklTdXjM6CMA2hqiTAiCfSPae
	uy54a/o5azMUUN87oZAbNADa6VR5TThQxU4DvnVvFlGl+gQ9vWgkKjSC+J3epQ7qERmzNd0/7etPF
	sfG8ef0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkfH-00Ai2q-2y;
	Mon, 27 Mar 2023 11:05:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkfF-00Ai2F-2M
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 11:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679915126; x=1711451126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GgXbckYTFkQV2tIg709b/OEujag8CJ5VTsBLx9lycVU=;
  b=sPLu6qcdiJ1bVry+YP9k0l1vtlIqtkUxI174qkrEHvkmCwUlI2/gmztf
   Q+b8Lklmk+MTPCKiOZOt9r6UHFbSylZ8y4xGuJo+7WBxDuBypRRsiHExr
   QvvnNLxoNLJqBVvHd6fBhBwfI9iwQJEvtbVk5pBIvAF+X195rX7w6CoIu
   k5NjSRlEOALvgBWhSRzbSzzIgWmrRySi61MsxR8tqBKDV2LU/EdY7cnM8
   tFBGtkuyLx27o7DKnu6zbvnb07oaQoDQ9oGzF5/d063RV0BuMGqGtOatb
   yaj8SG7lcCFb/fOH4x94hlOZD1zebNhqloPkKh12urRgy9baA4XFjb1R3
   w==;
X-IronPort-AV: E=Sophos;i="5.98,294,1673938800"; 
   d="asc'?scan'208";a="206875213"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Mar 2023 04:05:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 04:05:24 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Mar 2023 04:05:22 -0700
Date: Mon, 27 Mar 2023 12:16:40 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes 2/2] riscv: Do not set initial_boot_params to the
 linear address of the dtb
Message-ID: <831ec4a4-694b-4ace-9500-9b2189a7f16d@spud>
References: <20230323163347.182895-1-alexghiti@rivosinc.com>
 <20230323163347.182895-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230323163347.182895-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_040525_781538_7BA38D21 
X-CRM114-Status: GOOD (  25.19  )
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
Content-Type: multipart/mixed; boundary="===============9217669458661286638=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9217669458661286638==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="02vHZQlH3px5uXlr"
Content-Disposition: inline

--02vHZQlH3px5uXlr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 05:33:47PM +0100, Alexandre Ghiti wrote:
> Now that the dtb early mapping was moved in the fixmap region, we can
> keep using this address since it is present in swapper_pg_dir, so remove
> the dtb relocation which was wrong anyway since early_memremap is
> restricted to 256K whereas the maximum fdt size is 2MB.

I feel bad making this comment since only one of us is a native speaker,
but for the future would you mind breaking up overly long sentences like
the above? Say:

	Now that the dtb early mapping was moved in the fixmap region, we can
	keep using this address since it is present in swapper_pg_dir, and
	remove the dtb relocation.
	The relocation was wrong anyway since early_memremap() is restricted to
	256K whereas the maximum fdt size is 2MB.

>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/setup.c |  5 +----
>  arch/riscv/mm/init.c      | 21 ++-------------------
>  2 files changed, 3 insertions(+), 23 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 542eed85ad2c..a059b73f4ddb 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -278,10 +278,7 @@ void __init setup_arch(char **cmdline_p)
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>  	unflatten_and_copy_device_tree();
>  #else
> -	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))

btw, how come it is safe now to drop this? This feels like a separate
change that should be its own commit, no?

Cheers,
Conor.

> -		unflatten_device_tree();
> -	else
> -		pr_err("No DTB found in kernel mappings\n");
> +	unflatten_device_tree();
>  #endif
>  	misc_mem_init();
> =20
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fb78d6bbabae..0f14f4a8d179 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -249,25 +249,8 @@ static void __init setup_bootmem(void)
>  	 * early_init_fdt_reserve_self() since __pa() does
>  	 * not work for DTB pointers that are fixmap addresses
>  	 */
> -	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
> -		/*
> -		 * In case the DTB is not located in a memory region we won't
> -		 * be able to locate it later on via the linear mapping and
> -		 * get a segfault when accessing it via __va(dtb_early_pa).
> -		 * To avoid this situation copy DTB to a memory region.
> -		 * Note that memblock_phys_alloc will also reserve DTB region.
> -		 */
> -		if (!memblock_is_memory(dtb_early_pa)) {
> -			size_t fdt_size =3D fdt_totalsize(dtb_early_va);
> -			phys_addr_t new_dtb_early_pa =3D memblock_phys_alloc(fdt_size, PAGE_S=
IZE);
> -			void *new_dtb_early_va =3D early_memremap(new_dtb_early_pa, fdt_size);
> -
> -			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
> -			early_memunmap(new_dtb_early_va, fdt_size);
> -			_dtb_early_pa =3D new_dtb_early_pa;
> -		} else
> -			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> -	}
> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> +		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> =20
>  	dma_contiguous_reserve(dma32_phys_limit);
>  	if (IS_ENABLED(CONFIG_64BIT))
> --=20
> 2.37.2
>=20
>=20

--02vHZQlH3px5uXlr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCF7GAAKCRB4tDGHoIJi
0ts6AQDb+pcZNp3/7YMv9QJ9u4I98b7RvTwRnE5UuN3+JH4UhQD/X0RAUe9R4za7
ZCccbrF9/AA34ggCZVWP9nkIy7hiFgc=
=VPva
-----END PGP SIGNATURE-----

--02vHZQlH3px5uXlr--


--===============9217669458661286638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9217669458661286638==--

