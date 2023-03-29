Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D4DC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QXdxZ9CzINyb7mUlfUuTSmhsaFIvH6jOb9Yw7HTuNo=; b=GTd1Vd1GpsqcIZLIueOmJHVkRN
	5ntVhscsaMg8JHDuPwiFW143AnW4NzIp+V3TR0XbYAS/ixJhJiVwlHAlNKorSsqhbZwb/eWs6kAcz
	//CT9VIyqsQ4xevyd3nIrkI78lY9vJRGlSJ64usDXZw6BZvaP5SLzjZWK2fqJ5dc05PuQn4prXrVE
	xib+KejnneO17P7u27lm3mjlwyNeRwrdU/nLKbzo6Ay/SXzegSnk86g+GTzME9wUq2YJFnFsXzUcX
	Dm3dMhBemf4gJ3t1w0iARZOgbTc552gwKg+2ZctzO0DPKAUlmcZ7RFqhWqzdk/sC7ncM0hjYttIl1
	e7Op5P0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phWIJ-000UDA-2O;
	Wed, 29 Mar 2023 13:56:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phWIG-000UCG-34
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 13:56:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6DF59B82331;
	Wed, 29 Mar 2023 13:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4F2C433D2;
	Wed, 29 Mar 2023 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680098210;
	bh=sz83pbUhcBCvYaINkOvUuSoxstbUEDcsJvVW4LAj494=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZQ1/p5S6U77OOspflCRGHzNPZAMB4cGqlNk1A+wjPklv8F+exGcY/aUJ/XFwOc/s
	 OexNRkWDDsL7W7k7/Qpe8g8Pyd9yPSPhEgyqgEW5KJgPF1bRO/uehcFxKPcXivX+NQ
	 wrhB6TFAJdBz2221jJG33da6pojRR5I16xF8VbAkOj4Jh3l+L0lolIKlKeukZq0kiN
	 Wr41ULt3fo/exyNdNQI+8lWAvsEnPhgG4n2blQ19M7dyuX3reW/Rmiysw19gYCr4X1
	 gnAkD1OlPHeqfCOXLceB9IiOkcMnoSGImtdyJQZ1zN7tql9oFGdz314US03gCBOCQs
	 9ozFsEh5XgdTA==
Date: Wed, 29 Mar 2023 14:56:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2 3/3] riscv: No need to relocate the dtb as it
 lies in the fixmap region
Message-ID: <381c2753-cbcc-40a0-bcb2-67d18e367822@spud>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
 <20230329081932.79831-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230329081932.79831-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_065653_291725_85E4E3F8 
X-CRM114-Status: GOOD (  26.94  )
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
Content-Type: multipart/mixed; boundary="===============2469766799648288695=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2469766799648288695==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e24sXklnJrl97Gf3"
Content-Disposition: inline


--e24sXklnJrl97Gf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 10:19:32AM +0200, Alexandre Ghiti wrote:
> We used to access the dtb via its linear mapping address but now that the
> dtb early mapping was moved in the fixmap region, we can keep using this
> address since it is present in swapper_pg_dir, and remove the dtb
> relocation.
>=20
> Note that the relocation was wrong anyway since early_memremap() is
> restricted to 256K whereas the maximum fdt size is 2MB.

So, should this be marked as a fix, and backported along with 1/3?
Either way,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

And from v1 (although I didn't actually send it for idk what reason):
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/init.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
>=20
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

--e24sXklnJrl97Gf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCRDfQAKCRB4tDGHoIJi
0txGAQCJ95Z8KvRd7YQ/GjQefD8OrTYAFUgQvL3o+EdW+h2eaAD+KEHoGr5BqpRc
ldHxzZyupQd/OEu5QL2owuc2yOxD+Ao=
=UXNP
-----END PGP SIGNATURE-----

--e24sXklnJrl97Gf3--


--===============2469766799648288695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2469766799648288695==--

