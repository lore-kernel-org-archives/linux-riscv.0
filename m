Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB22EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7oeLwNP3iHQru5HUHxYg8frZ4UROQfqvecBOWzoX6Y=; b=0I/FnF94/9yoQ+Jnbd9z5NxuH5
	sQ0PmtLNWUfSILjRbWoIJzzr3Gqn/t6YY9e7wrgynqS3TOJV5KyXwK7SdiUeRR8A59qbcmT3acF2u
	ifNxKNX5pJe4VD2YCR+0IWprZRiduTSY398S+HuchD0pgzWXWIAVGlGwWfjLKjEFoiMHLBAmCojXT
	HP74OZ29v9XYQYv2AVlTyMIxNJyJtZuNg7ZRiQ82T3tUwTCVd7TTyXcdmNDiMTEUBBpoC5xf/py6D
	3va5gKblv/sdTjeCcAV6bSOEsoo3qCHlYdmxWSTh0+AJ78Br0cgi7Ee7FA7lSgNNcPcs63QsnYrV3
	qDA2yArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf7Z-00DGSE-1H;
	Tue, 04 Jul 2023 12:27:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf7W-00DGRJ-0j
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 12:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688473622; x=1720009622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UjTTupn9qJkicPlewg6pVkjIzGItxTvL5gYYji1MF7U=;
  b=q+ObrEEpm02veop/zRIsPJH9eGPVWkC7zXfYUswUS46+bY0vWM9oGm2s
   3MMyV16DDUqBv/smJElsvtoIXDqBtYfH1k3nX5m35mZk202/yEq1ct4/p
   ejQwiqv4JYF55yFR9DLjBpalSG23ey3+r8VRuO/WAk1KpKNCDDY1cnvB/
   Z9leLk2zdjv7WuPdwcb7apRfO4651ZVXuijGkxAsk6DAlnEHe6gZfFq6T
   sIb0LuPhoweGKs3d+GQhA7qR0lGwGdPUOySsQQ9TcgDx5AsPxkSPXCcB2
   BpZVmnHjnIhD//+HO3cf7oEvLFu5Fc+8zV3D1YB+NHxnAkq9R3SxEDgyx
   g==;
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="asc'?scan'208";a="221231359"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2023 05:26:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Jul 2023 05:26:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 4 Jul 2023 05:26:41 -0700
Date: Tue, 4 Jul 2023 13:26:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Song Shuai
	<suagrfillet@gmail.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Start of DRAM should at least be aligned on PMD
 size for the direct mapping
Message-ID: <20230704-emblem-rubble-e4a3a87cb98e@wendy>
References: <20230704121837.248976-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230704121837.248976-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_052702_428752_7016749C 
X-CRM114-Status: GOOD (  21.79  )
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
Content-Type: multipart/mixed; boundary="===============5084242837453968153=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5084242837453968153==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9jeWf4lkKbux8HSU"
Content-Disposition: inline

--9jeWf4lkKbux8HSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

On Tue, Jul 04, 2023 at 02:18:37PM +0200, Alexandre Ghiti wrote:
> So that we do not end up mapping the whole linear mapping using 4K
> pages, which is slow at boot time, and also very likely at runtime.
>=20
> So make sure we align the start of DRAM on a PMD boundary.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Obviously correct me if I am wrong here, but was this not reported by
Song Shuai as a regression?
Accordingly, should this not have Reported-by, Closes/Link & Fixes tags?

Cheers,
Conor.

> ---
>  arch/riscv/mm/init.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4fa420faa780..4a43ec275c6d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -214,8 +214,13 @@ static void __init setup_bootmem(void)
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
> =20
>  	phys_ram_end =3D memblock_end_of_DRAM();
> +
> +	/*
> +	 * Make sure we align the start of the memory on a PMD boundary so that
> +	 * at worst, we map the linear mapping with PMD mappings.
> +	 */
>  	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
> -		phys_ram_base =3D memblock_start_of_DRAM();
> +		phys_ram_base =3D memblock_start_of_DRAM() & PMD_MASK;
> =20
>  	/*
>  	 * In 64-bit, any use of __va/__pa before this point is wrong as we
> --=20
> 2.39.2
>=20

--9jeWf4lkKbux8HSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKQP1gAKCRB4tDGHoIJi
0itCAPwKOEqJ0dNzrojBEleJ+wILpeeIhBt4b6b8vTdYfsnGlAEAkIk4KBiL+H/E
ZM9Cl8dBOGiaC3Ewi3Po+ryBoyKNNQA=
=fhdf
-----END PGP SIGNATURE-----

--9jeWf4lkKbux8HSU--


--===============5084242837453968153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5084242837453968153==--

