Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7733CD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 17:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inQxQzmWy850ILJmxhfdT6v/HLtTMiVSK3+FC5LORFM=; b=p0ENSGxik46y5HgnmrrGugV6b6
	s93a1Qcg6BSZ6gBHmLMZ+Jp5LHC15Z7+Jefwr9u/0F7J6Q6mXkQn2tC2Z/bhK/4UrEKOVinmbcURM
	LYPQTivd/zLEuBGozTsdB27amE++9smG7Av3XknAH0Nn4JMNfXwnX+w6hjvEfFOVE88wff9H9Mcme
	JkmyxI37VlhCWrUUB+mJ5HScecKQNozyC2ceJMLMVDCoXJ0FkDQU8C5hqBy1N6VbzK2OSErdksCR3
	MheajP2zjJyIU31k/ydsizRbbUdT/xRRYrqb8q2xYsc7/OdhzleCUAt6tnY7wf/NqkrvpDW9WYFH4
	zaA03nyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOJq-00000002PU0-0hVV;
	Tue, 19 May 2026 17:33:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOJo-00000002PTf-3cZc
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 17:33:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14A586022D;
	Tue, 19 May 2026 17:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAEEC2BCB3;
	Tue, 19 May 2026 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779212003;
	bh=OFHWUXNGWxFbICuzubVh5vO/lOH+x7PUKPvYkl3tkJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pfrfoz46I95pjJ2nm+7HuXbrSR57ndgaUbXTrpOD/uzvPcPLHBkpVcLiZakJzjTxS
	 Yy8RD28pdi2xaLZuL88flj+/yUPqQMsGqv4WrpZkHmHl4fSDgGmppZJ3y4r0ydU9dZ
	 VvXmSfavuYusIjAf5qgcp5IMQyzI4I65xsJrJYoF7c+FgTzUYfAiIwM3BQGBEGuEfy
	 UJv2MHb0T3FW5C2ljJiwplQTDgKz+R9UNwBoVQDBA1GCddN0SuoIn5lhoajTb3uyqU
	 zlH4dC0pZCGDZdG24IDK2V7vYs68VVlupOF8ThvRu2FlySq+CaOzGhljq/BHLwGcGy
	 857nfc/BZ4cew==
Date: Tue, 19 May 2026 18:33:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH 1/3] spi: dt-bindings: fsl-qspi: support SpacemiT K3
Message-ID: <20260519-morbidly-reveal-41c32b61d135@spud>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
 <20260519-k3-pico-itx-qspi-v1-v1-1-c32afeeaf741@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-1-c32afeeaf741@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1825123255068331300=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1825123255068331300==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="izvLbv2E4eJvgIBX"
Content-Disposition: inline


--izvLbv2E4eJvgIBX
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
>  Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml =
b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> index 1d10cfbad86c..025f10ed242c 100644
> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> @@ -20,6 +20,7 @@ properties:
>            - fsl,ls1021a-qspi
>            - fsl,ls2080a-qspi
>            - spacemit,k1-qspi
> +          - spacemit,k3-qspi
>        - items:
>            - enum:
>                - fsl,ls1043a-qspi


Given the driver has:
|        { .compatible =3D "spacemit,k1-qspi", .data =3D &spacemit_k1_data,=
 },
|+       { .compatible =3D "spacemit,k3-qspi", .data =3D &spacemit_k1_data,=
 },
this looks wrong.
The k3 should fall back to the k1 compatible unless there's some
non-obvious reason why it can't.

pw-bot: changes-requested

Thanks,
Conor.


--izvLbv2E4eJvgIBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagye3gAKCRB4tDGHoIJi
0qqdAQCBH2MK7fD56lufJ0cYGCRPInQEGcvWw2xW+7Jm0CWbXwEA6R/QTOnSCHkR
xpCaSAe7y14x91PfPs3C5IME46kAuAE=
=+Cry
-----END PGP SIGNATURE-----

--izvLbv2E4eJvgIBX--


--===============1825123255068331300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1825123255068331300==--

