Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4AFC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QO5obIi9pWvLo0yzjMwMxYtXQylzLk/oR6Zxm27WFEc=; b=m6E0MGxZso2TxX2yrY/HAzBPdo
	lYi1QnD9Smw+jFBk68VamvAlm70JuVTxEK5jDMQ5GhA5BcJvdi8+zFKHB36troJfrXj7T8cgaZmsZ
	zwBe3svfMev7DA1KaL3rBIxNFdeB52qlAEfhGLpq15fDX8m0acKOeAzDN513FLwLCXZVF65pZoKUk
	xu0RJ/UEHALv7BWclbuL+EQmQLssdcGfasuKSwO7bmPfGc5c2jqnKETfj5Y67C76oX+EbbaihITDM
	5vm334r3e8hHofkPp4BLi331dTZ1l5tc0IP7HWqyjpXWn+WL4DuHgqlrfKujuYXVrP33LnDR9mOtA
	pAJ/+eFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7H94-000000022yu-0L8k;
	Wed, 15 May 2024 16:06:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7H91-000000022yL-1WSf
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 16:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB9E5614A2;
	Wed, 15 May 2024 16:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09665C116B1;
	Wed, 15 May 2024 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715789178;
	bh=FVFAYxSz1OkRMYh28r8zsQNRYiUe+v6bzZjbGukXwFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/DKxUTjDl9pXY58GoyNPDYosoEaoJP1PSw/3V5uG+PF/3CiGpqn0qul3RKw/kRHA
	 nhmo5V1CFbqBh7fyp18Pr9m385imgdDqSVusBXYprh3fPUbFVCuNB6WZMyueod4Eno
	 65YRqqUsBHEcH23XpuiQOtDIIHJ8vwFywBzaGSW4aMT0/7Q8ZLqijc84CgI4+avtH7
	 hGZJessBR8wyKMF50z5gXE01sFQTW9W1UvtTrQlnfAJ2PERDk8VKO+nIilbv2fDJhH
	 ytFD+8Si+6dzyeNcdHp4zPNQ5O+3FUv5ZdJ07RR+jeELxo5YtznsbVBHS8BmVn3DTh
	 DS6AuVnG0MwDA==
Date: Wed, 15 May 2024 17:06:14 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: fix Andes errata build issues
Message-ID: <20240515-bobsled-corridor-a3f295972e98@spud>
References: <20240515-shimmer-retake-37033de08096@spud>
MIME-Version: 1.0
In-Reply-To: <20240515-shimmer-retake-37033de08096@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_090619_557822_26C0C211 
X-CRM114-Status: GOOD (  15.47  )
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
Content-Type: multipart/mixed; boundary="===============4258686096799226143=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4258686096799226143==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u8jT4CtR+31zyd66"
Content-Disposition: inline


--u8jT4CtR+31zyd66
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 05:02:28PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Commit Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor
> extension framework") added includes for the new vendor_extensions.h

This commit message is actually inaccurate, I'll spin out an immediate
v2..

> header in the T-Head and SiFive errata handling code but didn't do so
> for Andes, resulting in allmodconfig build issues.
>=20
> Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extensio=
n framework")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Charlie Jenkins <charlie@rivosinc.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/errata/andes/errata.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/e=
rrata.c
> index a5d96a7a4682..fc1a34faa5f3 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -17,6 +17,7 @@
>  #include <asm/processor.h>
>  #include <asm/sbi.h>
>  #include <asm/vendorid_list.h>
> +#include <asm/vendor_extensions.h>
> =20
>  #define ANDES_AX45MP_MARCHID		0x8000000000008a45UL
>  #define ANDES_AX45MP_MIMPID		0x500UL
> --=20
> 2.43.0
>=20

--u8jT4CtR+31zyd66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTddgAKCRB4tDGHoIJi
0tagAP4quEfVezaSy0cvTJHJIIALZZzUPi+usFdsUiF6/NhBxwD/e2/+gbQRWRnq
lrfOh9ipPvQ5CficGRd6P3fGzTxcGwU=
=vIlF
-----END PGP SIGNATURE-----

--u8jT4CtR+31zyd66--


--===============4258686096799226143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4258686096799226143==--

