Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3C606A332
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qo0Djn/b;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IANDX1kn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=egVeMWU6RVpeL9heZ/sVC91hRvGfd3hAoFuL4lCnL2I=; b=qo0Djn/bq/x1Ii7oT2+AAg/uQi
	q0ybZLKCCMNPriVW7zBBolUmS9rdLe5aFxKWddNnOSpulaNeVMV4K1DCz+WpY4Zd3bOv4ZaJEKaMK
	HjzNEubv2tAg9luXvf3CzX3g96G4mi30b6qHX9Xfa5ZTa9rUUvhwQhPk1+kc9o6ePE87kV5J32UY0
	3m7zi5bD3pVOQnYrqpC/OI95P+DJn/wpDEkx3jEe30JrvFMT+bwVFQL/jTq3eGnoysH/Qxz9LoMHr
	e4gGLOwO+wPdzkVhGQ+litmGoUqFB/nEgI9TxzqB7sbYjNYqtlBifcEmh5fA1n8Pc6plH8FtXXiWn
	QbutUo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrpn-0000000D4Ki-2PHI;
	Fri, 13 Nov 2026 14:00:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrpk-0000000D4Jc-3Exo
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 14:00:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F09C66120B;
	Fri, 13 Nov 2026 14:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1218E1F000C4;
	Fri, 13 Nov 2026 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578451;
	bh=Jj7SfMOqG1H+ogyADDrtNoTirjpAkUc8zvWrzzyfhgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IANDX1kn5ZOsf9Y5Dv1t4r+c0WLcH825+FnElSyKTBsfAD9NswVuPCu7Muw+HrdpB
	 Hveo0E8jpqrgkwRuWQawwueOgEsXNHwNMpf2RJpYPfyEC0O1S99CoSVJl/cJOyfZVO
	 3vbfzevo2IAa9o4rw20eEMkXr8i+vX10tQdZLsMPPkjQTq8eVC0LDsNBR1/39jCmJS
	 UwYiwKY+36yiXyDfRmIPX5tcCKcOqb20eWxO+GcILnmFxJOBIfcJqzjSzO337U11iF
	 BhOGfioe0xGyQQHzGW+SdQgtKvL7Hu6gJOlgaJATb+BYfCuSjb4JK6nUxRnSbJ4zsZ
	 UgBmKe98Zyang==
Date: Fri, 13 Nov 2026 14:00:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO on
 all Andes SoCs
Message-ID: <20261113-upon-unmarked-8f4a186bb656@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-17-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261113071143.1446167-17-minachou@andestech.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4819537905982295476=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4819537905982295476==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SS/UlVVSOk0nbyTx"
Content-Disposition: inline

--SS/UlVVSOk0nbyTx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:40PM +0800, Mina Hui-Min Chou wrote:
> ERRATA_ANDES_CMO depends on ARCH_R9A07G043, so it can only be enabled
> for the Renesas RZ/Five, although other Andes SoCs such as those built
> on the A27L2 need it too. Drop the dependency, and select
> ANDES_LLCACHE and CACHEMAINT_FOR_DMA so that the errata always comes
> with its cache driver, which ARCH_R9A07G043 used to guarantee.
>=20
> As ERRATA_ANDES_CMO is default y, it is now also enabled in the generic
> riscv defconfig. The errata only acts on Andes cores at boot, so other
> platforms are not affected.
>=20
> RZ/Five still gets uncached memory for coherent DMA allocations from the
> DMA_GLOBAL_POOL that ARCH_R9A07G043 selects. This patch only covers
> cache maintenance for streaming DMA; how other platforms provide uncached
> memory stays platform specific.
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  arch/riscv/Kconfig.errata | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 4f77b3c6d7fd..3c43e065aa01 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -12,7 +12,9 @@ config ERRATA_ANDES
> =20
>  config ERRATA_ANDES_CMO
>  	bool "Apply Andes cache management errata"
> -	depends on ERRATA_ANDES && ARCH_R9A07G043
> +	depends on ERRATA_ANDES
> +	select ANDES_LLCACHE
> +	select CACHEMAINT_FOR_DMA

If you're selecting it here, can you not drop it from the renesas soc
Kconfig file?

>  	select RISCV_DMA_NONCOHERENT
>  	default y
>  	help
> --=20
> 2.34.1
>=20

--SS/UlVVSOk0nbyTx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcYDQAKCRB4tDGHoIJi
0nTQAPwJJbhObuthsWBsbU3JKpU3lAGYHUwv+uqR8AWCx9/dowD+IBY6yXOGckxO
I/CaHUE13VhWYdtWTaYgdwgtyO4XwAQ=
=9Rwl
-----END PGP SIGNATURE-----

--SS/UlVVSOk0nbyTx--


--===============4819537905982295476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4819537905982295476==--

