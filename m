Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F14C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 18:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+OMy7LayI1TsVwuEv6Abihm9VESLJXFx8zYDdSf+to=; b=Qdy4t6y80NMeK7uWXzvsUKw7RZ
	16rp96f4Y9aDPL1ogjVLOL9wlYPlqcJLT2a1B9DJ/27KGnwYzJ/hfVaZto8/r5YtRRLPt5KBQHI9p
	ni1REKSXhCGjCzOJNEihtSQD2wDxsK4QEviGRvAXmUJluxnFEUXs8z+SeY9fCiDnSOAZuTkRCSMeH
	a+Xpw8/zSYH7wfE9FrrWjrisyy0e53yCpEuGiN9oJpXKaJ8pPDay7E1nhlWW5EUTUnZE9FCmFI0DU
	eLmkB+Zqg3cLR6IBHa6WJtJXfMnKmE1KELe3XUNzy8+kzb2+MFxFD/yLPQ7e5hrbdIyCSpgBwQh4L
	e5NdXxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2zdk-00A4R3-S5; Wed, 07 Dec 2022 18:59:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2zdc-00A43i-2G
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 18:59:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65DB56152C;
	Wed,  7 Dec 2022 18:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104C8C433D6;
	Wed,  7 Dec 2022 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670439562;
	bh=4v3xEhvQ57hJJCvAOzIurur7lWIN97xzHJuBXAMK7KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTjeiBTnRq/PM/fkT+6C8UzWXXkNM5QeTjCiJaEV8JI6McXyJGuEs08ZcWf1VgqYN
	 k0I6G61yh46DNfgcNq4EA5/vzMOpZcnJ8JpygN5+GwutCRK99yTUNBlJevM1cf3GeR
	 SmpOSQGuA6kFOzJn291pgnrWLDX4JSrHb+9gxRSpiiCF7cV1OKeedLTDtarS3nazuV
	 IWgDVe/d/9YUrhaGBiZHRDUMkX7/RHV4ipkuLXCOCSvvou6KCgmlyvz58qOuONw3qD
	 RH2kqtZopnIvi9Jioeapq5YmJnqLTqatQzIuttQOuhFgrafgF0uuBUf6CfB33gAnKO
	 6iLyH5jTm285w==
Date: Wed, 7 Dec 2022 18:59:18 +0000
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, ajones@ventanamicro.com, alex@ghiti.fr,
	jszhang@kernel.org
Subject: Re: [PATCH v9 3/3] riscv: mm: support Svnapot in huge vmap
Message-ID: <Y5DihlKTtRFTil+S@spud>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-4-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20221204141137.691790-4-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_105924_208342_FA4BADD3 
X-CRM114-Status: GOOD (  22.33  )
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
Content-Type: multipart/mixed; boundary="===============4461181380388879699=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4461181380388879699==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0j8ZzugOjRWjPT0f"
Content-Disposition: inline


--0j8ZzugOjRWjPT0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 04, 2022 at 10:11:37PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>=20
> As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
> implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
> for Svnapot to support huge vmap about napot size.
>=20
> It can be tested by huge vmap used in pci driver. Huge vmalloc with svnap=
ot
> can be tested by changing test_vmalloc module like [1], and probe this
> module to run fix_size_alloc_test with use_huge true.
>=20
> [1]https://github.com/RV-VM/linux-vm-support/commit/33f4ee399c36d355c412e=
be5334ca46fd727f8f5

Please make this one a standard Link: tag.

>=20
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>=20
> diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vm=
alloc.h
> index 48da5371f1e9..6f7447d563ab 100644
> --- a/arch/riscv/include/asm/vmalloc.h
> +++ b/arch/riscv/include/asm/vmalloc.h
> @@ -17,6 +17,65 @@ static inline bool arch_vmap_pmd_supported(pgprot_t pr=
ot)
>  	return true;
>  }
> =20
> -#endif
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +#include <linux/pgtable.h>
> =20
> +#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
> +static inline unsigned long arch_vmap_pte_range_map_size(unsigned long a=
ddr, unsigned long end,
> +							 u64 pfn, unsigned int max_page_shift)
> +{
> +	unsigned long size, order;
> +	unsigned long map_size =3D PAGE_SIZE;
> +
> +	if (!has_svnapot())
> +		return map_size;

These ones are obvious about what you're gonna do if !has_svnapot()
though, nice :)
With a proper Link: tag
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +
> +	for_each_napot_order_rev(order) {
> +		if (napot_cont_shift(order) > max_page_shift)
> +			continue;
> +
> +		size =3D napot_cont_size(order);
> +		if (end - addr < size)
> +			continue;
> +
> +		if (!IS_ALIGNED(addr, size))
> +			continue;
> +
> +		if (!IS_ALIGNED(PFN_PHYS(pfn), size))
> +			continue;
> +
> +		map_size =3D size;
> +		break;
> +	}
> +
> +	return map_size;
> +}
> +
> +#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
> +static inline int arch_vmap_pte_supported_shift(unsigned long size)
> +{
> +	int shift =3D PAGE_SHIFT;
> +	unsigned long order;
> +
> +	if (!has_svnapot())
> +		return shift;
> +
> +	WARN_ON_ONCE(size >=3D PMD_SIZE);
> +
> +	for_each_napot_order_rev(order) {
> +		if (napot_cont_size(order) > size)
> +			continue;
> +
> +		if (!IS_ALIGNED(size, napot_cont_size(order)))
> +			continue;
> +
> +		shift =3D napot_cont_shift(order);
> +		break;
> +	}
> +
> +	return shift;
> +}
> +
> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
> +#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
>  #endif /* _ASM_RISCV_VMALLOC_H */
> --=20
> 2.37.4
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--0j8ZzugOjRWjPT0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5DihgAKCRB4tDGHoIJi
0ojgAP9VMIciEVQrkjbEiiOzpxJS5v1bFpfwwtNVZCLcqoV1rgD/WKsLG/UScw6F
NiRnHqtkD+i871zBUytdmKL8SDpx7ws=
=EecO
-----END PGP SIGNATURE-----

--0j8ZzugOjRWjPT0f--


--===============4461181380388879699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4461181380388879699==--

