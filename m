Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62EBCCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 17:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsZyV53zTDxQm7n1eVeBctqrOrP6H1m/5q5ybHUYKcY=; b=CFFWUyoAQckZAI5d2UEX4nRnME
	1QMeiZfOBTnjxYnkqyqlEBcLNlrUMfnJwOFk99zaES0xlM8vRhPmR73Efts+bDYCnDiTEeLjXmwCB
	hr/hT+5kNzH1PRtM4rzNWlq30EdUS7LQ4XtDMXiYUzSaQwh6OujvkAtU+4Z5/OZe20Vb3lGp3axo9
	wIv+2pCVejeT5mQu6fnLn5R4pSgZY+OBKQBWWc9DzbzpLc7NTrDLj8KAXvvkdoIAP+/FWYWebqiD0
	zJFgKsFqhDGRsJ7BZaarvbO+RhlWbb9xNSshmagHsEp7b5z6IhzeSmt+o9e+2e8QRGCo/7IxYQ49P
	+WCd1mJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtvY-0000000EWot-28Hr;
	Mon, 20 Oct 2025 17:44:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtvU-0000000EWoI-3kPW
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 17:44:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7445642BA2;
	Mon, 20 Oct 2025 17:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A86C4CEF9;
	Mon, 20 Oct 2025 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760982248;
	bh=UGG12C0YM5gqVQtZMlTCg/cATtlJaDQQ0Fiijdez2oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKRbJojvIKHCqkefW/DpMAV1M99m0j6YO0Tj1OD2zHTj+bDqqx7TobNR5L0KtHDCW
	 dBNEVA6/rs08/Hyexa8t+YPNOO7QqVjqd6TsMc/F90aC9RQLEV+eT2ANXNJT16Q+A+
	 yhxcI+1wCPK5fYXygRLV8YEpWRZ++mJ++LzlyKz3oKfWuFNhaJIYQqcsCimCd6J8vi
	 cJNfdX4YsK4LIYPa9pO7bCBJ1cQwmLl+V/pDJCoKjDnJn7t9LtSmZuGZ+cQyn9+6gI
	 0N9BhFNhWtEkRGpvQMNhUdU+6lHGZATGMnfJTGy+Up3DoIhidC1yWjIMtiHHbP4JBZ
	 yN+H12d67oRNQ==
Date: Mon, 20 Oct 2025 18:44:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: spi: fsl-qspi: add optional resets
Message-ID: <20251020-henna-headache-fae4440ec7a8@spud>
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-2-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251020165152.666221-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_104408_971873_4D357E10 
X-CRM114-Status: GOOD (  14.94  )
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
Content-Type: multipart/mixed; boundary="===============3550895964126245284=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3550895964126245284==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="17adE0b1pBWXLXwb"
Content-Disposition: inline


--17adE0b1pBWXLXwb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:51:44AM -0500, Alex Elder wrote:
> Allow two resets to be optionally included for the Freescale QSPI driver.

This is a binding, please don't mention the driver here.

> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml =
b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> index f2dd20370dbb3..0315a13fe319a 100644
> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> @@ -54,6 +54,11 @@ properties:
>        - const: qspi_en
>        - const: qspi
> =20
> +  resets:
> +    items:
> +      - description: SoC QSPI reset
> +      - description: SoC QSPI bus reset

If none of the fsl devices have resets, this should be added alongside
the new spacemit compatible and not permitted for the other compatibles.


> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.48.1
>=20

--17adE0b1pBWXLXwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZ04wAKCRB4tDGHoIJi
0lEKAP4tn2+XRwM5eBj2d46u1mM+jjxVgwNB08I2twSsMQSpRQEAupOGQFen6YpA
+RHiekfk56oRh7/fLzUhP5reWtEMSQc=
=KgvV
-----END PGP SIGNATURE-----

--17adE0b1pBWXLXwb--


--===============3550895964126245284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3550895964126245284==--

