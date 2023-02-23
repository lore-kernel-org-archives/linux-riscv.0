Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1536EC64ED6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 23:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28dzXsS81K5dT0iNwepwQTQmtTwXzNvoRFg3mYUL1u8=; b=nXfyfOU0v3TVxHXh3RCK0SJ++W
	FjNksiYI4GijP9jZAA2JEtBce4VxP1rn3PHfP2OUGoexFEjZwq+Xre+FrEOVEWlG3VbQOvdHlL+jw
	uzxVZxC0Tu+bNWVhb23Ah3tbit55/sEYKZjPay4JNg0qCq3fbUEw/UBYFsDSydVLBP7YAitBgqLmo
	ZVbgeZqks6LP6ThSHybWScWkhsuXfGAol1XWIu6bQSNJCLGoqrEIyO0m72rW86Hvl+Z8fjZR1GcIK
	1+ZoDPIVelQR23GECFnx61s0Bzb8jOR+fdHd+4H162jyAtkqZbLJ951JD4ql1NriJdpVoHj0vU1GP
	DDob7EfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVL28-000d3f-Oq; Thu, 23 Feb 2023 23:29:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVL26-000d1R-50
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 23:29:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5919E617C8;
	Thu, 23 Feb 2023 23:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E551C433D2;
	Thu, 23 Feb 2023 23:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677194987;
	bh=1rp/S+lf5nCNqRZk8RUeaGPRjXn+5tJN3i9Bz/+DjxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3sTuSXThCFE9kTLWVu8qpLm11zaJB05WSKDcDaeAn7DoLpb0msLeyxOKtRhJDR91
	 U2m0Yd+JlkJvBqZJlwAV3TEas32jB0DsCHgQXyLD9Yi4+VcPEf+1qt2hIg8nwK39s/
	 ycIk5rp66mneS25jjgWQKBHJUtlVTmsqaTGbr0Zn7/g8qnfGaRvjMd4c8p8ekApqTU
	 pEqUxmU5LnRTpaq9zhDLVbrFB0be965+kE+arP17wB5NCckDPcNki6UvzUV5OKvhP+
	 LyEEjqkge+gMFyznnRZ2u8/AqSTjphiJz71Tu4Ey7Wx83JCx1xuFW0vOFj0xsGwsCd
	 f+xDPL8t2PvwQ==
Date: Thu, 23 Feb 2023 23:29:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 5/5] riscv: cpufeature: Drop unused includes
Message-ID: <Y/f25zqMFNDWD2ix@spud>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-6-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230221185603.570882-6-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_152950_278634_BC65CB62 
X-CRM114-Status: GOOD (  16.47  )
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
Content-Type: multipart/mixed; boundary="===============8023118402479898352=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8023118402479898352==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZxQYScz2zfIQn70t"
Content-Disposition: inline


--ZxQYScz2zfIQn70t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 07:56:03PM +0100, Andrew Jones wrote:
> Do some additional include pruning while dropping errata_list.h,
> which is getting dropped, since cpufeature.c includes hwcap.h
> directly to get cpufeature IDs.

This commit message is a wee bit confusingly written. Not advocating
for a respin by any means, but putting the thing that motivated the
change before the opportunistic cleanups would have made more sense to
me. /shrug
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 85c99ae64017..151e1a715db9 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -8,19 +8,14 @@
> =20
>  #include <linux/bitmap.h>
>  #include <linux/ctype.h>
> -#include <linux/libfdt.h>
>  #include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
> -#include <asm/errata_list.h>
>  #include <asm/hwcap.h>
>  #include <asm/patch.h>
> -#include <asm/pgtable.h>
>  #include <asm/processor.h>
> -#include <asm/smp.h>
> -#include <asm/switch_to.h>
> =20
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> =20
> --=20
> 2.39.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ZxQYScz2zfIQn70t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/f25gAKCRB4tDGHoIJi
0kLLAQCYh07u9o3fYsdBMvwEkMn69GJCm0CLrt9hjcWNkGz/swD/ZTC9Uyr96Yct
0P0/lZ1oIsLRaaIZ7UzTYJjY+FsD4Qk=
=LkZL
-----END PGP SIGNATURE-----

--ZxQYScz2zfIQn70t--


--===============8023118402479898352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8023118402479898352==--

