Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE3EE49B0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cS1rDGQzCp1FB9QABobKO2Yy1EW53s/26uxszPvF+7A=; b=NULNieybWMR+2MUccnqr05Vk0H
	9ADSzBlA4P7ctgfmNGGRIqAUdEFH3v+33gejGiVO/4y9BVf/086Vi0ESFfgRD0JHmCYBlmcs3mkGk
	P4HtBGfr1AjowKjsBbzLqVk+hcCvIDZesYE0DLRaFUeWRSvseteiOK5sCiZlf5J3zPYc65i+wR//r
	AeQvinEfl0fRFgUSyKSO34aMOGfOZ5UbKbePiagTHROYDdeGZdDBh7LI4SpWfqseBT01RK1sLHNYk
	UG9839qtFX9mvUQCXfB2WGuH7rd+hR4OA/X2mU0cYA+iskrWcSLpdL0y1hzIECFrjxbs3JjK0Yoqe
	Kn32JrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq26-0010Yp-0k;
	Wed, 23 Aug 2023 15:44:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq22-0010Vz-2c
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 15:44:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB2C565663;
	Wed, 23 Aug 2023 15:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4006DC433CA;
	Wed, 23 Aug 2023 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692805469;
	bh=v+F5qVNBnDPT0ow+PQY3LNqNk+ehfsGslEzfY//TfAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEFgywyp5/ykToGR+ILRJn8bgUMJws+XqbkLh7A5kgrXdHOZ3dg59cMA43c/TyFXj
	 AJdfV2hlWovCgnP7+4IMn9vAboOCEFj23FqbHw+woIgRA+/b7jpBq7NsFYnon5Iwnd
	 JG667DX2pgKm0fiLuPT+x+Ti0faiVlgk9IjxLiZASTYqNt+aswaTuGB7EMffDLQp5R
	 M4q9/ablZWbHH91Z1LvyW7PJ9+no3z/QZ+1xULaql78pEbH6h0FClad7HGT4i5PfD/
	 uZIWoDTf0tFjUrl4SHhAOiS/V9Ibx2cz293AbYlteBrt4QjNg4zd40z5dtT28QxBFI
	 QB4XOdAYwOkag==
Date: Wed, 23 Aug 2023 16:44:24 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>, linux-next@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] riscv: Require FRAME_POINTER for some configurations
Message-ID: <20230823-disown-footman-e326acc3270c@spud>
References: <20230823082845.354839-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230823082845.354839-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_084430_936023_9A9516E1 
X-CRM114-Status: GOOD (  20.17  )
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
Content-Type: multipart/mixed; boundary="===============7825439024362350560=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7825439024362350560==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o0g/CRFRrx5sGNGu"
Content-Disposition: inline


--o0g/CRFRrx5sGNGu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 10:28:45AM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> Some V configurations implicitly turn on '-fno-omit-frame-pointer',
> but leaving FRAME_POINTER disabled. This makes it hard to reason about
> the FRAME_POINTER config, and also triggers build failures introduced
> in by the commit in the Fixes: tag.
>=20
> Select FRAME_POINTER explicitly for these configurations.
>=20
> Fixes: ebc9cb03b21e ("riscv: stack: Fixup independent softirq stack for C=
ONFIG_FRAME_POINTER=3Dn")
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

I think this is reasonable, even if you pre-patch version of this seemed
quite sceptical.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/Kconfig  | 1 +
>  arch/riscv/Makefile | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 10e7a7ad175a..cd8075c092c3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -62,6 +62,7 @@ config RISCV
>  	select COMMON_CLK
>  	select CPU_PM if CPU_IDLE || HIBERNATION
>  	select EDAC_SUPPORT
> +	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTR=
ACE)
>  	select GENERIC_ARCH_TOPOLOGY
>  	select GENERIC_ATOMIC64 if !64BIT
>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6ec6d52a4180..1329e060c548 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -87,9 +87,6 @@ endif
>  ifeq ($(CONFIG_CMODEL_MEDANY),y)
>  	KBUILD_CFLAGS +=3D -mcmodel=3Dmedany
>  endif
> -ifeq ($(CONFIG_PERF_EVENTS),y)
> -        KBUILD_CFLAGS +=3D -fno-omit-frame-pointer
> -endif
> =20
>  # Avoid generating .eh_frame sections.
>  KBUILD_CFLAGS +=3D -fno-asynchronous-unwind-tables -fno-unwind-tables
>=20
> base-commit: 89bf6209cad66214d3774dac86b6bbf2aec6a30d
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--o0g/CRFRrx5sGNGu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOYpWAAKCRB4tDGHoIJi
0mKaAP0aaEUhXRcAHwUXqe9ooYV73f52MonjrCsYxXzCTPH9FwD+PUiPpzSF10EG
X7kxYMCXzvZnWVpAPtS/hvQvMG7HJgM=
=0Fx+
-----END PGP SIGNATURE-----

--o0g/CRFRrx5sGNGu--


--===============7825439024362350560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7825439024362350560==--

