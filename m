Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22D9CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 16:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DabbfLelSGzk0kSIT9LFfVeTeFlhIHXbVKz8RQiWSx8=; b=bksnqzACWJUS2G4i1ZIWPmtSkm
	htDHsvVx1LzmCaP4J+c1augHJEwh5r7u0Gw/aeCBSrGFIE2SuhwDcMDJh1Q8gBh7mT0t7Oqey6xVH
	XCYA2cPmR3rf7yrOK7PXAvo3gJzMQeWgwbLvKQAF52mdBZE0z+di4bdxsx5vWUKvNvgWI6/Mrj2Cj
	XbVCwCf1zRPZ+i/Pt5wa+tq1Q9HqiUuHgvtLp9AyG/sfBWKq8O0hgvcEDTcJXLYEjpSoquTSLd+WL
	b5LPr/9IFk8WmpuBNgIy38V3jlofxX5R09gBro7Tm6nv8ambiOnuKNIYoNN0Kzu/Oa1M9G4iA88Dw
	6BPSetLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCNC-00000005Acu-1OKH;
	Mon, 15 Sep 2025 16:48:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCNB-00000005Ack-2gzp
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 16:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15881601F3;
	Mon, 15 Sep 2025 16:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84C3C4CEF1;
	Mon, 15 Sep 2025 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757954892;
	bh=WQA8yZXJ9fX2DhH1V6vZEYWM0tWKWwWe9hNuujBFV00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C9XFcap1I2mhRx2afrhKhwgXGsLL9QcZAZI7rOuicb4bHC8CxFEguFgM1pnq0DBog
	 9PQ4H/4ke6cimoXAWQktcOl4mbrTVjKXfHQ9Wa/EmjaQTk7YCXGZ4DfELKCygU7tKd
	 TprEcrcCgAb2XTnMNuNTTE3xQBW0z3MyAiRqhxod2t6+05ON2orc3kj4yyoIOobt5F
	 sDoDTufGBkEM8ijYcwlZ1zq4UrgKtkAJwMHhpTtlv89I3OqIvGLKyaMmd+WitWvjoH
	 fNHuzzRFRDh8BATAQWtFUNTCFzBWmckIxAqRoGAbF06JoO3pVix6RsqVmI4LxPq9Wg
	 K5KCYzWXHJJcw==
Date: Mon, 15 Sep 2025 17:48:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <jms@tenstorrent.com>, Joel Stanley <joel@jms.id.au>,
	Michael Neuling <mikey@neuling.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 7/7] riscv: Kconfig.socs: Add ARCH_TENSTORRENT for
 Tenstorrent SoCs
Message-ID: <20250915-overeater-escalator-9ed8a77d809d@spud>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-7-ddb0d6860fe5@tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20250913-tt-bh-dts-v1-7-ddb0d6860fe5@tenstorrent.com>
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
Content-Type: multipart/mixed; boundary="===============6683153905679924208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6683153905679924208==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cHMJMGHJfC+NtBBa"
Content-Disposition: inline


--cHMJMGHJfC+NtBBa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 02:31:06PM -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@tenstorrent.com>
>=20
> Add Kconfig option ARCH_TENSTORRENT to enable support for SoCs like the
> Blackhole A0.
>=20
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/Kconfig.socs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 61ceae0aa27a6fa3a91da6a46becfd96da99fd09..ff733a998612d429e7b1e0027=
6eb86290d8331a3 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -57,6 +57,14 @@ config ARCH_SUNXI
>  	  This enables support for Allwinner sun20i platform hardware,
>  	  including boards based on the D1 and D1s SoCs.
> =20
> +config ARCH_TENSTORRENT
> +	bool "Tenstorrent SoCs"
> +	help
> +	  This enables support for Tenstorrent SoC platforms.
> +	  Current support is for Blackhole P100 and P150 PCIe cards.
> +	  The Blackhole A0 SoC contains four RISC-V CPU tiles each
> +	  consisting of 4x SiFive X280 cores.

Can you add this to defconfig too, so that it gets build by default in
that configuration?

> +
>  config ARCH_THEAD
>  	bool "T-HEAD RISC-V SoCs"
>  	depends on MMU && !XIP_KERNEL
>=20
> --=20
> 2.34.1
>=20

--cHMJMGHJfC+NtBBa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhDRgAKCRB4tDGHoIJi
0jQrAP9Vn6YoN51FdwADMapdbRnnjWP3M9R8PvkSA2d0UeID9wD/Wk2sTq4sKW2f
ptcxToCfzx9hY/tmsSUCi0aw0dNKkAk=
=ii9g
-----END PGP SIGNATURE-----

--cHMJMGHJfC+NtBBa--


--===============6683153905679924208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6683153905679924208==--

