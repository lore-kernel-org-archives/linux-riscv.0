Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D3EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xy1sbMlUV9vrdDtABmJwCxbls2BR6Yz1GgTc2E8zxhA=; b=SOsjKsFkd1Waq/9tfgFoau+ylI
	UB2qj4/WZl06Y63XezZ2SoZX67oIVBaFluo++auWqYOWSdhvI25dC2y/A7d0KP0w1LlxD/Nwf/nHy
	i0l9Ys5GwC3jhjMe86HSBsEz0sBF2k8C5r+t4hb+6Ve7qCi5lCAWjHNNnfn+V0bd+DlzrosYKiN0l
	ZbptHSeBXthY9jAP4sVqWRNX3mKBCT1pUE3+ApBxaTo8Yh4aJk/VRaJruJLxexWMg9oMaNxpRiFPM
	lO1lR3vXJP+LYDgjWdOR4mFf2kbnon0aRbQlAXHprXWnj0w9jBBTINqWbe3nc4AaZsMGHfuY0aSrD
	Xdb+ltyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hfI-00B3GR-0r;
	Thu, 30 Nov 2023 14:05:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hfE-00B3Dg-29
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 14:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F3408B844F5;
	Thu, 30 Nov 2023 14:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A52C433C8;
	Thu, 30 Nov 2023 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701353108;
	bh=lmIGpKWrJyGtIsNIsR54E9YSDqwPCFA4y8LfMhRheK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STUxfY0mRk7um76FD5/rHkPm2ztlpi6k/23SFfFByJTfCbR1vyS5z3yel3e2eWO9a
	 3ntX+q9LMyax8uzDlOX6ROZnAiqC+DErfFoYCU2aH2dOXFLiOCnDLU7T2/IyFTV7TO
	 DPZKBfTNhASlgO5i0IdjK/TmS8ELPXrr5rZDnMl28ulftr+WTxB8BlYvf2dlkCBCnM
	 ssX5AtKHdo0OV3IeBZPuH7rjrdsSd6PwtqmZSNizLyisS48kCd8KyvlsIXflO7ABOg
	 jnSeI/AsywjB2WRTo2/kLi2RBsQr+JYYBZloviOZLzUdezNiPGs0cffFYGyXuJBOCl
	 W5GwPvauUn2tw==
Date: Thu, 30 Nov 2023 14:05:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v1 1/8] riscv: errata: Add StarFive JH7100 errata
Message-ID: <20231130-creed-fragrant-e0d91f125cb2@spud>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
 <20231126232746.264302-2-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20231126232746.264302-2-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_060512_840776_B73661C5 
X-CRM114-Status: GOOD (  19.17  )
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
Cc: devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3570976986931901693=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3570976986931901693==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ioHz8gwtxd+71Mjh"
Content-Disposition: inline


--ioHz8gwtxd+71Mjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 12:27:39AM +0100, Emil Renner Berthing wrote:
> This not really an errata, but since the JH7100 was made before
> the standard Zicbom extension it needs the DMA_GLOBAL_POOL and
> RISCV_NONSTANDARD_CACHE_OPS enabled to work correctly.
>=20
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/Kconfig.errata | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index e2c731cfed8c..692de149141f 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -53,6 +53,23 @@ config ERRATA_SIFIVE_CIP_1200
> =20
>  	  If you don't know what to do here, say "Y".
> =20
> +config ERRATA_STARFIVE_JH7100
> +	bool "StarFive JH7100 support"
> +	depends on ARCH_STARFIVE && NONPORTABLE
> +	select DMA_GLOBAL_POOL
> +	select RISCV_DMA_NONCOHERENT
> +	select RISCV_NONSTANDARD_CACHE_OPS
> +	select SIFIVE_CCACHE
> +	default n
> +	help
> +	  The StarFive JH7100 was a test chip for the JH7110 and has
> +	  caches that are non-coherent with respect to peripheral DMAs.
> +	  It was designed before the Zicbom extension so needs non-standard
> +	  cache operations through the SiFive cache controller.
> +
> +	  Say "Y" if you want to support the BeagleV Starlight and/or
> +	  StarFive VisionFive V1 boards.
> +
>  config ERRATA_THEAD
>  	bool "T-HEAD errata"
>  	depends on RISCV_ALTERNATIVE
> --=20
> 2.40.1
>=20

--ioHz8gwtxd+71Mjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWiWbQAKCRB4tDGHoIJi
0u/jAQCrrpHJcB50JqgVgzMBgnx7WBxwRTTudybT8nQKUtYhFwD/cfgMwzTaZjJq
WBDq1ck0ck5FCB5pz9sJ3Wmfg/dAmg4=
=Mabv
-----END PGP SIGNATURE-----

--ioHz8gwtxd+71Mjh--


--===============3570976986931901693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3570976986931901693==--

