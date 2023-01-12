Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDAEC61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQiSX35h2vgKBU35+xGpXCgQXRSk1ZBuN+mG4b7CvF4=; b=U3V/tATdjgvGT8j+Phf8FxuFdM
	USPEZSzV9fRZMSosnxIDRj4qTjFyR0sbBwSmuEOraZz3M/dPyUYxLtI6K+HzeHjPNzvr35kCWwSWo
	e++/j4KMKEqsZ1W5i85rMP56/QbF0RyNDM8YQEVzM9eovDxCajg3zoGGnvQbmTbvzSwWaC5z/gJ89
	AZJa5P8DuCqPhpP8DuyYgVA2SFvTJ9dS6X0D0UyLGlJR83gr8emRXLwXZsPiCfr/C4TFQBq3JUXfo
	6BjxWuVs9cjCxdQn/LWXzg1hYTPBWdwa2KYorlb2oZMhh82+mredehvmLB6HXlfOD+GH2Z6NBayx2
	2gNgwPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4rI-00H5uF-Gw; Thu, 12 Jan 2023 21:11:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4rF-00H5tT-RH; Thu, 12 Jan 2023 21:11:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4335DB8201A;
	Thu, 12 Jan 2023 21:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE5CC433F0;
	Thu, 12 Jan 2023 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673557886;
	bh=1lv/KvuGHQRZDolHVavCfpp7julHCynpA3AX6pvaaYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W73etmzP/d6CGmvUkDbdoac85hc30hUPm02Kv4pn0xFu4zYtLpZjEWE93CUBNxd6i
	 2nu133GHYGhFhQDdUOQL9B4okHCebgBjKSmBvbIWXrNDpQ5gnur9ig105lzUkf5Fxw
	 k4nH+XqvNA/uPVc9r+2x6RT0P/mnPg5ZwR9xkkPvqF7nuQQrTet00VDk2+qEjKc2lt
	 aULGfARm5St002zse5h/cpBDOXNCJ9vMOyMgq1PQjiJgFJHxCZLmpALsAMzY0k6bTC
	 9qvVz0cXHBmLWRo00/ZEjHxVfDiyQTO4OI4w+g6zlj9w6ONR0vjO+4WoTdW31GGmHJ
	 s8iXAduhRnVUw==
Date: Thu, 12 Jan 2023 21:11:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 03/13] riscv: cpufeature: detect
 RISCV_ALTERNATIVES_EARLY_BOOT earlier
Message-ID: <Y8B3ekXED+xY82w4@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230111171027.2392-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_131134_065775_A8925879 
X-CRM114-Status: GOOD (  20.05  )
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
Content-Type: multipart/mixed; boundary="===============2418248098552155381=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2418248098552155381==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LovTwAzFAus9XXMr"
Content-Disposition: inline


--LovTwAzFAus9XXMr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 01:10:17AM +0800, Jisheng Zhang wrote:
> Currently riscv_cpufeature_patch_func() does nothing at the
> RISCV_ALTERNATIVES_EARLY_BOOT stage. Add a check to detect whether we
> are in this stage and exit early. This will allow us to use
> riscv_cpufeature_patch_func() for scanning of all ISA extensions.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Probably overkill at this stage, but:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

BTW, would you mind CCing me on all patches in a series if I have
previously reviewed the series? Makes life easier :)

> ---
>  arch/riscv/kernel/cpufeature.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 421b3d9578cc..37e8c5e69754 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -328,6 +328,9 @@ void __init_or_module riscv_cpufeature_patch_func(str=
uct alt_entry *begin,
>  	struct alt_entry *alt;
>  	u32 tmp;
> =20
> +	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +
>  	for (alt =3D begin; alt < end; alt++) {
>  		if (alt->vendor_id !=3D 0)
>  			continue;
> --=20
> 2.38.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--LovTwAzFAus9XXMr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8B3eQAKCRB4tDGHoIJi
0l9WAQDjvV5jMZGRfroca+fqF0wW1R9hBcmFQzlJLcSWlBTmtgD7ByB9qSa0diKz
FIYUuKDPYTNZQkruAhzCCdeHLGitswk=
=MlP/
-----END PGP SIGNATURE-----

--LovTwAzFAus9XXMr--


--===============2418248098552155381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2418248098552155381==--

