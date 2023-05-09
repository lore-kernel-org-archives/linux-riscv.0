Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E3CC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqGqB5Al1DbSjD6+A+DtOYKFi35aN6NE0Z8fGmJy5Fs=; b=koq38PpR7QxZh5u3Ogs9Oonr3M
	YzU4pM9wv9CS5GYg1WQLunMOwTCRiP29Exq3AwhXbt+2w6WtQpj6hAojMWSRsVifWI2KL3NJRvodQ
	3QbMEnKeGxGSA6QbqZNoAD61NiicnalnnhHA53FNdsvjRZblUb5zZPmccNmTVQQ0W3V9qdL00q0id
	5JIS2D4mzraEaCqebRsH9hZaxNTBGz3a9oQfNhEgmYEjsY2zuh20j4dpSRqUuvwKx2O3/pJQxihvB
	IMViqNx/cEug5Cytl8Zw08m+SGhRpsPvi+JmddmFataEOM4gU87P+ieOKRZfBdcLxUTMUxoz4ptni
	sVXqt6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS5l-0041AE-0i;
	Tue, 09 May 2023 18:29:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS5i-00419P-0h
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 18:29:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C63F6479C;
	Tue,  9 May 2023 18:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28902C433D2;
	Tue,  9 May 2023 18:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683656976;
	bh=/dkH0X9QFvdWzyFSW87BMSJow12Yf5GCpIFiBdDHDpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZZzIsmsQtHwsHlw/HAnmw/XQIzODFlap9ibuHqQ7d+4MyNzAgXSa4IhFmuv9WTan
	 kLODFH2dHAYpeVZGqePoQH80qhgv2tSj5jU4oXXUwtyZRNKi+07c6Ndj1M/+BgEQY1
	 BHbdnmDbJZSMjbPezMB/Fr69QlsRexHcUfu3s41BFHwM2TPIYsxRWWic1zmI6S0I6a
	 xgHw7G4QLxsnGNiq2qC/4jbMR/4SEINam4e6G9OtZ+oOozm9lQxpkOI356BEhYng2M
	 oncHyeecju7244lihby6HIRKlVZnviZ10+bD8P1jkLZvcvjJwje/WpotJ8AWmFT7qF
	 ngQ/6IO3mCE9w==
Date: Tue, 9 May 2023 19:29:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Add Zba, Zbs extension probing
Message-ID: <20230509-exclusion-crested-67dad91b7055@spud>
References: <20230509182504.2997252-1-evan@rivosinc.com>
 <20230509182504.2997252-2-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230509182504.2997252-2-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_112938_331446_EBF9126C 
X-CRM114-Status: GOOD (  19.63  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============2353897299307291051=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2353897299307291051==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B6X/AADM6tnISOtQ"
Content-Disposition: inline


--B6X/AADM6tnISOtQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 11:25:01AM -0700, Evan Green wrote:
> Add the Zba address bit manipulation extension and Zbs single bit
> instructions extension into those the kernel is aware of and maintains
> in its riscv_isa bitmap.
>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Given you added the lads, rather than ignoring them due to the Zbs
change, I think you forgot my R-b from v1?
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> ---
>=20
> Changes in v2:
>  - Add Zbs as well
>=20
>  arch/riscv/include/asm/hwcap.h | 2 ++
>  arch/riscv/kernel/cpu.c        | 2 ++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  3 files changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e0c40a4c63d5..6b2e8ff4638c 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -46,6 +46,8 @@
>  #define RISCV_ISA_EXT_ZICBOZ		34
>  #define RISCV_ISA_EXT_SMAIA		35
>  #define RISCV_ISA_EXT_SSAIA		36
> +#define RISCV_ISA_EXT_ZBA		37
> +#define RISCV_ISA_EXT_ZBS		38
> =20
>  #define RISCV_ISA_EXT_MAX		64

Heh, gonna start getting tight on bits here soonish :)

>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index c96aa56cf1c7..bd294364390d 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -184,7 +184,9 @@ static struct riscv_isa_ext_data isa_ext_arr[] =3D {
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index b1d6b7e4b829..a1954c83638f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -236,7 +236,9 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>  				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> +				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
>  				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> +				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>  				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> --=20
> 2.25.1
>=20

--B6X/AADM6tnISOtQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFqRCwAKCRB4tDGHoIJi
0nC4AQDHsQlCVjBd4jkD1jLd+iPE4qxOG+r9snQk1olq+ZEgKgEA3KF1DHY+2APQ
FwjrrVJr0kk42/XLN6nO4bjwDcd4uQk=
=MHIQ
-----END PGP SIGNATURE-----

--B6X/AADM6tnISOtQ--


--===============2353897299307291051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2353897299307291051==--

