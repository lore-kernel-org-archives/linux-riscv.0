Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B0C636CD
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 21:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0XyDUAQbbJSpzUEKKYmX7lh6omKggQ4Ypb7C6hyXLM=; b=OOh3uW3eM+H20ZxuN94ahRE4Wu
	kFDnJQtdk0Nunw9/RfphpoCVeLZYcgILoZ7uivtZKhs5vlt/QJyUpmcfPLJ5xQhwtuEU2hMVkToBi
	iox5aKLyGd0D6zUwwbn7+kgn1kgK7uS6bsvQspL2b8R7ypl8RdzEKFhGM19cQnrU6wU1gJdunmgY4
	7SGdDh7FJpIFQlJlEg3autD2CU9qphtV5qC/50AIXG5zj5DHL7qZp5rFSY79wdXkSi6ghligx7+cH
	ZY+tzERFETlwDbpMVIRGwhvCdKl8H9PYkamcNkMScDD7cllnotBEQOp305pfqPXzkJx1PbViReR+o
	AUAl/AnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMcA2-005ZnR-Up; Mon, 30 Jan 2023 21:57:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMc9z-005Zmn-HP
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 21:57:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E6149B8169F;
	Mon, 30 Jan 2023 21:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F72C433EF;
	Mon, 30 Jan 2023 21:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675115872;
	bh=Z4TGZhf3eHrHCt3Sa0NR85ldZ1ppOQhU87Ok3n+koAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuMZXw+S6txi8srNik0+3PdRXUrC2OQ9fZZiAFTmMCMquLKVKK5FnGLHhZIuNnRTO
	 44rjiwzZ7NQz/+Bb/ttMYStgD2JT1ojysyp4DBsY4DMxFQSyL9WWV7PRJ0wlSJcvRS
	 EdjKhoW9KOj8E1sfRC99XMlJ3V4zaEV1+v2/l1LXd64xNLEHG/LGBeSxGjpMCs+Lp0
	 +vfR2aBaCGbEeYCjjE7yTjat/YwwViKvzt/jqjHmFsJsmlwpZsbnzIpjwtJb/HFcB1
	 yR8bKCTv+B2XDLlt32F3yd9uN5cvloPEJ8Yg0T77vM/wB16IUc53uTzXjvAMVQzRaV
	 5+ozkN3z/l4fQ==
Date: Mon, 30 Jan 2023 21:57:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
Subject: Re: [PATCH v3 3/4] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Message-ID: <Y9g9XGzF/X3OwXdP@spud>
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
 <20230127091051.1465278-4-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230127091051.1465278-4-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_135755_743644_B20FEDA7 
X-CRM114-Status: GOOD (  17.67  )
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
Content-Type: multipart/mixed; boundary="===============6116586572873001418=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6116586572873001418==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1ItMQVOOAgwFH9Aw"
Content-Disposition: inline


--1ItMQVOOAgwFH9Aw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Alex

On Fri, Jan 27, 2023 at 05:10:50PM +0800, Sia Jee Heng wrote:
> Currently kernel_page_present() function doesn't support huge page
> detection causes the function to mistakenly return false to the
> hibernation core.

This sounds like a bug & should have a fixes tag, no? I assume for
whatever commit enabled huge page support...
We don't support set_memory, which by the looks of things is the other
usecase for this function, so probably doesn't need backporting.

Alex, does this change look good to you?

> Add huge page detection to the function to solve the problem.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  arch/riscv/mm/pageattr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 86c56616e5de..792b8d10cdfc 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -221,14 +221,20 @@ bool kernel_page_present(struct page *page)
>  	p4d =3D p4d_offset(pgd, addr);
>  	if (!p4d_present(*p4d))
>  		return false;
> +	if (p4d_leaf(*p4d))
> +		return true;
> =20
>  	pud =3D pud_offset(p4d, addr);
>  	if (!pud_present(*pud))
>  		return false;
> +	if (pud_leaf(*pud))
> +		return true;
> =20
>  	pmd =3D pmd_offset(pud, addr);
>  	if (!pmd_present(*pmd))
>  		return false;
> +	if (pmd_leaf(*pmd))
> +		return true;
> =20
>  	pte =3D pte_offset_kernel(pmd, addr);
>  	return pte_present(*pte);
> --=20
> 2.34.1
>=20

--1ItMQVOOAgwFH9Aw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9g9XAAKCRB4tDGHoIJi
0pGlAP0bjQRRS6+HAIsKmX7P58Bd2T/oaUv8qKfywJHbG9vAowD+L0RzZBkdA5r9
pc3NRnVRb1tQScs77zx70+bCIz6AWQw=
=aWFx
-----END PGP SIGNATURE-----

--1ItMQVOOAgwFH9Aw--


--===============6116586572873001418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6116586572873001418==--

