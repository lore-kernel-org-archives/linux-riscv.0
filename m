Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192B2606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 19:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAdqn6LR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=butBOikZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PaXh0Ua5UHrCAmT4wjA3p1s7YTfTbkdaJB/z5NpUSrw=; b=MAdqn6LR54F9z1Pi4M7UA3Awdp
	vpXuUxZzplHzv/bzc+gUxp9XU90NkJjCEeS1QCryJQII/LV/aXYEFNLaOQwFMwbrAFmyD7a/QwSUp
	S4z4iYLcbqNpErTRA4bFxNeLLR6UYuIFhvw2jWtwUErYpONkkG4//ntYdsx9Z1y/mJRN4N53AJJ0Z
	SkjoaWNRlZXPrAVwXvLxuk/48IrN97Vfv/Q5QNjpVPiju1iFW+lr24wpOc3sVC/9JnRDMzw0AFGka
	ql/N++jZUV8lBJyz63lR1r5tlURj2xiYhOb7dYCYk4ROKokNXBoLZP/7W0/6+RQTeDY2RnS5Jvuxn
	WoFbDKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxdk-000000005ot-2SzP;
	Mon, 02 Nov 2026 19:24:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxdj-000000005oG-0t4a
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:24:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0BF943AD6;
	Mon,  2 Nov 2026 19:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5E21F00A16;
	Mon,  2 Nov 2026 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647458;
	bh=BqhAHZ1CAtWu/7yJzc2Z1CotAWcWleo0RVIl/xA44qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=butBOikZsSTt6L+OgmLjcLlwoy1icu8Z0meF6li9wTbJCgd7o9KG3YERIQmLWn/os
	 6/PphErsbvCfBXuC+G1xamDNqRymIcKvXGavKrF5O2q56iRKksae6nfjJhM5LRAS2z
	 KnvNnjzXg30V+heQDPRauiomUylktC/jxRffmoDAQIhaAjd04yIhZaZxVSzwrsQG/Q
	 H+2XNm1pxJfdtWqdftFbIRd4gjC8NgTt90/hdzP3uCgPFk5rcukhp4OIsnsX4PTeAw
	 Ic7wB//aUsUzXUvoQNOpZvCxM/KCThD+dAi8xeOl/YtVgj6dHTGE43+mCw7vcBsk8t
	 1bRfioQZK+poQ==
Date: Mon, 2 Nov 2026 19:24:14 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] riscv: add ARCH_OPENHWGROUP Kconfig option
Message-ID: <20261102-rice-large-30bcaaf9de67@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-7-marouene.boubakri@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102141727.640769-7-marouene.boubakri@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6316029288558148515=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6316029288558148515==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVuCYZvGx7jAhdE2"
Content-Disposition: inline

--SVuCYZvGx7jAhdE2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 03:17:25PM +0100, marouene.boubakri@oss.nxp.com wro=
te:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>=20
> Add the SoC selection entry for OpenHW Group platforms, which is used
> to build the device trees of the CVA6 APU FPGA platform.
>=20
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
>  arch/riscv/Kconfig.socs | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index cecbce0c49..289448e489 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,15 @@ config ARCH_MICROCHIP
>  	help
>  	  This enables support for Microchip SoC platforms.
> =20
> +config ARCH_OPENHWGROUP
> +	bool "OpenHW Group SoCs"
> +	help
> +	  This enables support for OpenHW Group SoC platform hardware.

> +	  Current support is for the CVA6 APU, the FPGA platform built
> +	  around the CVA6 application class core, with the 32-bit (cv32a6)
> +	  and 64-bit (cv64a6) configurations of the core on the Digilent
> +	  Genesys 2 board.

Delete all this, it'll just bitrot over time.

> +
>  config ARCH_RENESAS
>  	bool "Renesas RISC-V SoCs"
>  	help
> --=20
> 2.43.0
>=20

--SVuCYZvGx7jAhdE2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujjXgAKCRB4tDGHoIJi
0jALAP0WW8TLwZ7TIANzBaugcK0mbOjCrVpgWybIjtJQ951x5wEAktICrb4s4gPY
pj1QuLqMdR3V8VoBM2VBfuXOfRWqjwU=
=dT3B
-----END PGP SIGNATURE-----

--SVuCYZvGx7jAhdE2--


--===============6316029288558148515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6316029288558148515==--

