Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82739C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 22:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdHqBi5aRQvdwPgGOYCr+ebbSR355peRuEisCxWDCE0=; b=01kzvCQxqW4j3S4EE7c5mkLfom
	Ky0gbLcb3r0Qab2oKr115iXBlMm5BAgDJ4O//Qzl5FTCNioMOOVsAY3o99CDIO7m/54+PVjQ8p88Q
	7ULnBNAGgiV8dpQKrBp6HDBfUC42riyQzdfwe7COSp65jnhLoXl3OQSJjL5Rj4q+5uXqknK92riza
	nYiqTtnfFwTLXrWGSAc5XPuWy7i60o3qqKUZUjkY00xr8XreAM6RaL4Yog+MtRSj1a8mRp4cha5al
	seAghJPfTw2DTHV9kQXdahhvMZPLVbYEFQHNfGK7G5n8lEtyheb8PRTANvEbXB581wNMNrZcmOJBm
	mlfNJuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK56Y-001gph-N0; Mon, 23 Jan 2023 22:15:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK56V-001gpH-Td
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 22:15:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4FFBDB80DFC;
	Mon, 23 Jan 2023 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2B3C433EF;
	Mon, 23 Jan 2023 22:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674512149;
	bh=dzR9jadCHVHiRlmTtLWKgwiAFnV8i9CLV57+Ug54JSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WODNM7ZmTXCIqpt5GqHEgS+2D9pSHAt0/Pu95CkURnZS11o92eGr5FWTQfVWwamoT
	 2BRj82k959actPJpsKZlGtqv27vuQaMny2oOf27xoZ4D65JVauwyiGPzSfgoYW2GpL
	 OG9YpPtGMxDMjbquvuFZIAHYd6oJswVsCmYXlUxLn47wXwMyTxWCZqETvNxmgCAa02
	 DRXAaMn9g8+NrQ0EKBRhprRM72AFLKohA022Eurn/vhe2Ls6y9csbBCjCk3aZyUEQc
	 rBEZAzTAglnlBFyrOQR+aIp6+810PKwvXal/3BfmcOAFFGO2kSwkL/6BuxoF5pkI9s
	 yzkDityFrYuTQ==
Date: Mon, 23 Jan 2023 22:15:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH v2 1/6] riscv: Split early and final KASAN population
 functions
Message-ID: <Y88HD2ocLQilIuDr@spud>
References: <20230123100951.810807-1-alexghiti@rivosinc.com>
 <20230123100951.810807-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230123100951.810807-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_141552_116895_EB191740 
X-CRM114-Status: GOOD (  14.45  )
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
Content-Type: multipart/mixed; boundary="===============9067549046302727344=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9067549046302727344==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/CdvQ7qYoN72WHHO"
Content-Disposition: inline


--/CdvQ7qYoN72WHHO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

FYI this patch has a couple places with spaces used rather than tabs for
indent.

>  static void __init kasan_populate_p4d(pgd_t *pgd,
> -				      unsigned long vaddr, unsigned long end,
> -				      bool early)
> +				      unsigned long vaddr, unsigned long end)
>  {
>  	phys_addr_t phys_addr;
>  	p4d_t *p4dp, *base_p4d;
>  	unsigned long next;
> =20
> -	if (early) {
> -		/*
> -		 * We can't use pgd_page_vaddr here as it would return a linear
> -		 * mapping address but it is not mapped yet, but when populating
> -		 * early_pg_dir, we need the physical address and when populating
> -		 * swapper_pg_dir, we need the kernel virtual address so use
> -		 * pt_ops facility.
> -		 */
> -		base_p4d =3D pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(*pgd)));
> -	} else {
> -		base_p4d =3D (p4d_t *)pgd_page_vaddr(*pgd);
> -		if (base_p4d =3D=3D lm_alias(kasan_early_shadow_p4d)) {
> -			base_p4d =3D memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
> -			memcpy(base_p4d, (void *)kasan_early_shadow_p4d,
> -				sizeof(p4d_t) * PTRS_PER_P4D);
> -		}
> -	}
> +	base_p4d =3D (p4d_t *)pgd_page_vaddr(*pgd);
> +	if (base_p4d =3D=3D lm_alias(kasan_early_shadow_p4d)) {
> +		base_p4d =3D memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
> +        memcpy(base_p4d, (void *)kasan_early_shadow_p4d,
> +                sizeof(p4d_t) * PTRS_PER_P4D);
> +    }

^^  here.

Thanks,
Conor.


--/CdvQ7qYoN72WHHO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY88HDwAKCRB4tDGHoIJi
0g3jAP9qpKIGB01xKifUub9QHdmf+VkgP+aCUvX0haiSSlOv5gEA5jDr/uhR9d5+
klCEHGmOIU7GXyYShrKt3au2MQpcXQY=
=NeIJ
-----END PGP SIGNATURE-----

--/CdvQ7qYoN72WHHO--


--===============9067549046302727344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9067549046302727344==--

