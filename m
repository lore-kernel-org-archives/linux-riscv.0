Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4498AC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aA2Yo0icHa6mbAyu/Zc86vfdDsrOp3KFJOat4Dn1Ao=; b=BkdgpOsy6vikxGDwvfDzq115Hl
	tmrlHFskOsnJsd4cQYB3PnLynYJwMDoxpnWgBD2zbDSLCuruHj7H3snk5hNykAAWtljFXisAqLgVw
	ByLeGm2wHjlXx+HSbJT8fTX3rYkqiyajMPZstbpl5fFA5IrrKJW1XKcvIsZM9feSgl5dz2cMXcxug
	FYCg4TpiXCQsV2lurHIERiQYQS7UY6PKcG4um8Fy0FwdH7pQiKyB7MiaR2J68k4JomKhGET6EOCa8
	y0jcMVFxELFS+Shvszh5BYm5gv3wnFyAwvWJhmzftcUH4oorcUJ48f/t2F/svaWtrMMfAvyapcncR
	uZjuvGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGPfq-0041W3-2E;
	Thu, 21 Dec 2023 20:29:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGPfm-0041VL-29
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 20:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2FBFDB8208C;
	Thu, 21 Dec 2023 20:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B557C433C7;
	Thu, 21 Dec 2023 20:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703190576;
	bh=GLPwYHlJ8x8CC2ZjS/hbGnZAkXoFODBXx25zO0WgP5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RB6D6Rnd1pKUiP8WcHVN4/voeyF/rIxEiRR2YIatXbf5y0c/He+mc41gDaHpXVJlJ
	 sN72jvTnV0UxKgKNZZ/BNRbb0SGrtzG1pqhAu+abK620hbNSihKLuc2eCa/G/oZaAT
	 iGsaJOuTx6Rdt0kXPKatKS9uFiD/k9vWLbmQKJYOGZ5y+6I9RX0n0iOBEBi6esZRhF
	 WbX3TbOF+Jpc9Mw8Cq8tFJbC/h0tC6O0L6FYBxokYyp/Qn8HeVpz/UrVYv35U+GVb1
	 HrBiNRM1WLGuz7010N2ucObjl153Nr2twHNoi50v9t3vVXp4VNhrVy7Jm79p7HywiR
	 gZBDrad7xFEug==
Date: Thu, 21 Dec 2023 20:29:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>, hch@lst.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
Message-ID: <20231221-discount-decade-e306e5878c46@spud>
References: <20231221185152.327231-1-fido_max@inbox.ru>
MIME-Version: 1.0
In-Reply-To: <20231221185152.327231-1-fido_max@inbox.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_122939_029495_BD6FD32C 
X-CRM114-Status: GOOD (  21.09  )
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
Content-Type: multipart/mixed; boundary="===============8775001017854534495=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8775001017854534495==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m9L8Yh/1MYWrfu4R"
Content-Disposition: inline


--m9L8Yh/1MYWrfu4R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+ Christoph

I don't think this patch is correct. Regardless of whether we support
cache management operations, DMA is assumed to be coherent unless
peripherals etc are specified to otherwise in DT (or however ACPI deals
with that kind of thing).

What problem are you trying to solve here?

On Thu, Dec 21, 2023 at 09:51:52PM +0300, Maxim Kochetkov wrote:
> Not all the RISCV are DMA coherent by default.=20

What is a "RISCV"? I believe this sentence should be "not all RISC-V
systems are DMA coherent." but that is provided for by the
"dma-noncoherent" property, set for peripherals (or buses) that are not
DMA coherent.

> Moreover we have
> RISCV_DMA_NONCOHERENT option.
> So set ARCH_DMA_DEFAULT_COHERENT only when RISCV_DMA_NONCOHERENT is not s=
et
>=20
> Fixes: c00a60d6f4a1 ("of: address: always use dma_default_coherent for de=
fault coherency")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d6824bec2c00..111c5d92d503 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -14,7 +14,7 @@ config RISCV
>  	def_bool y
>  	select ACPI_GENERIC_GSI if ACPI
>  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> -	select ARCH_DMA_DEFAULT_COHERENT
> +	select ARCH_DMA_DEFAULT_COHERENT if !RISCV_DMA_NONCOHERENT

I think this is actually buggy, for things like distro kernels
RISCV_DMA_COHERENT will always be set, but those kernels are expected
to be used on systems that are cache coherent also.

Thanks,
Conor.

>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> --=20
> 2.40.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--m9L8Yh/1MYWrfu4R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYSgLAAKCRB4tDGHoIJi
0u/aAP0QwgAVeaL+V/KwjoqqvHiJTMZXmApkakiQZL1fuV8lgwD/UR0j8eNQzR8R
ztGAgxGUpsmf/LpuMHHnp/xIYdD/BwM=
=U837
-----END PGP SIGNATURE-----

--m9L8Yh/1MYWrfu4R--


--===============8775001017854534495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8775001017854534495==--

