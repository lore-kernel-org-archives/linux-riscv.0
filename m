Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64A1CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWmo3QSXy0iNs5IwZFOsY70wIy5JxCppeiye6h1sT44=; b=cDWkt+/Y9hYEOeLTsZP70KP//9
	7CsalYKNoFreRpearqJXs7CEbj9MsHnBiIuT5BmytopGNvokXFTgpJX8Q6SxtGZAQ8c0s89LUsDOe
	ZJ4yECrYkgU77xdJivRrCxDRqMuJUk4e0FiYnkPmE04/FhBLstOyh+Gu6wRQyWc6q2iOjicStrYxI
	M2ya6aR2zZGhWj1DlPF/0LjCeawV2cQ8bN5SV3ZLNbKUeLpF8ateZC9jyE0KmBmhDLsoGuzPbFkfY
	8g4ZPYnYWGCyEBLsBa9WCuNH7aIHT4oBnBrdbNIJyGXT+IPmcs+C/5nGvSwwrL/ZlHgaI341fnVxh
	oH1uJFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGBk-00000000kr4-3BGY;
	Tue, 19 May 2026 08:52:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGBi-00000000kpW-098U
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 08:52:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D57140AF9;
	Tue, 19 May 2026 08:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2447C2BCB3;
	Tue, 19 May 2026 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180749;
	bh=+HfGak7yHuL/XgYwB0Bq0zu3smcoi8dm7pRi4GjPR8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2CO19EwhBh9ujMggPV1riiBBdFi0ZpZd4G6bSZiquF4m7Yj7ba1rTdZ/21o2nT/r
	 mJUiJ2WVwaPjXjzPknmGinP2N5r+wa2t1EgcUyR6Ie2W8KIIkTAQdFngJxYhnxyzsY
	 EI11iIQHMp8QNKwddp8rwcNP2xiH2BVlB90fu0fMcxA2SwjIxXikODspgdzf7nlZfY
	 6RjdTGEoLu8EEPIzvYOTgurM+twW40ejwhCnRxv+SVv7ar4pl9RbCxpPM1/KTyZf5u
	 x1LznxrbbM63VSdPi4kVrqOtXiRBwclF/rjYiEM6G7iFmSBghs1OBCHR/Tii6oW0g2
	 Rwr0GnJXuxc9A==
Date: Tue, 19 May 2026 09:52:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Han Xu <han.xu@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH 1/3] spi: dt-bindings: fsl-qspi: support SpacemiT K3
Message-ID: <c7833af4-eab0-4651-821a-68c53b9a62fc@sirena.org.uk>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
 <20260519-k3-pico-itx-qspi-v1-v1-1-c32afeeaf741@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-1-c32afeeaf741@gmail.com>
X-Cookie: Huh?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_015230_094812_DAD28337 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Type: multipart/mixed; boundary="===============3505812358700565545=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3505812358700565545==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8SblKUXhOngtSLCU"
Content-Disposition: inline


--8SblKUXhOngtSLCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 02:15:55PM +0800, Zhengyu He wrote:
> Add the SpacemiT K3 QSPI compatible to the fsl-qspi binding.
>=20
> K3 has its own SoC integration, so board DTs should describe it
> with a K3-specific compatible instead of reusing the K1 string.
>=20
> Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
> Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
> ---

The signoff of whoever is sending the patch should be last in the list
of signoffs, each signoff is certifying the ones before.

--8SblKUXhOngtSLCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMJMUACgkQJNaLcl1U
h9ChuQf+PprmNVxKDo7Qo1X+Me5eypSTZ1LJGD9uf589k2G4Z5l1SAIJ6UvdSCTC
uNghM/uNx0j6KPxpgPYumiVC5kSiMpFCq3AAalBE+TyuIrQkSbUCsOFuE+2wyJfo
vD6hBOUXU3r48JRY2YaZAnO51xdP8IpFTx09WpnWmsw9fgehpOGjumEgc7aK34VQ
MMDyRi2ex/gRHqFw4dPhJt+LTtC1DAPUUMLNFH5f/uUiDlN9mE93qE3q99m1XLWz
D7tTorYqemjTVt6XBmuodAeO0ubJFSEcPTp3QPdkRIfdCaYsCr04/+AcvT4DEHq0
sDa6//E+EXqeM3SX6Aul9vW6hvlX1w==
=VJUZ
-----END PGP SIGNATURE-----

--8SblKUXhOngtSLCU--


--===============3505812358700565545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3505812358700565545==--

