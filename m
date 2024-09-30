Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7759ACE8347
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OZ3WMTcvLiAVcJusNiCOFmJd1Mg7nauGsJ6tP1tsxQ=; b=IaMVq8AjIBfMwF9YNpjgy9ERAS
	fsJCLrpArXFTVsffT5NsxIfLvYeqo5e5tHEdefcNbWtqXpcsGzBR04DhigqcE1kaegzbvj+gn5xuv
	pDxAK8xn8rUm1xOjJOHh0AwuyQvk5/yJtyx5wRg3DE9a0pYcydwHtHDO8wUgaA651uffM9uKFOSvy
	IYJFnY7qfeDABlWIoU96bx5B4BhQLFH60/ZDIFkzbs4lrQtV8VwzD+KYae+JIdLXObWcCRlIok3xc
	KkfHpCyJdgML0lzv3PJqBaYquW+VzyR/b+QlQlBwjBzPAKu2EzSYUJ5vOF4PGaf2gsd6tYV0BKIwW
	0CjH68GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAE-0000000HSwT-3hfj;
	Mon, 30 Sep 2024 14:14:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGkO-0000000HN5X-3thI
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4189A4256E;
	Mon, 30 Sep 2024 13:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A02AC4CEC7;
	Mon, 30 Sep 2024 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704051;
	bh=b71U8gGO5CeeJLzH8fxt8y1xLe5F5T9LsFaZJ/y1igY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IqvwUj9v7tMZrw9J7Q4xfkWoz6YU/RBjCoEEpimdVteecYcF0FhkmWrIjN/muaO5L
	 g6LpsVSL9lpDvWZ3HTaJnxsvHSbForNW3xQ3Nx0DbbZ2oNAVMryF71UXB2e7p6Yn1j
	 W2OE55trNd1EWTJ4x456+kx5/wN+nuiGZ2PR08IfSKrFsu9YgeqKGDxIiFUQY1BU0j
	 bzcZavxQ9qb/NEE7NO8AUrpd9YKqY+XhkWXrRvMF6g8idSM637X7LmWto19hw36MBR
	 diu1DoweoLjiO9XLoxWMtI+e2Xrss5g9i7o2F3JXG2HDI1nim3/Hxb+RCyDNBZGpUQ
	 WkJkfVYzbw/Kg==
Date: Mon, 30 Sep 2024 14:47:27 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 07/20] dt-bindings: clock: mpfs-ccc: Add
 PIC64GX compatibility
Message-ID: <20240930-siesta-dandy-cb83076f68f2@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-8-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-8-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064733_062474_4BE797F3 
X-CRM114-Status: GOOD (  14.15  )
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
Content-Type: multipart/mixed; boundary="===============2788424647338463468=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2788424647338463468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WZasyoaWaR6SUx82"
Content-Disposition: inline


--WZasyoaWaR6SUx82
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:36AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX SoC Clock Conditioning Circuitry is compatibles
> with the Polarfire SoC
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.y=
aml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> index f1770360798f..9a6b50527c42 100644
> --- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> @@ -17,7 +17,11 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: microchip,mpfs-ccc
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-ccc
> +          - const: microchip,mpfs-ccc
> +      - const: microchip,mpfs-ccc

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> =20
>    reg:
>      items:
> --=20
> 2.30.2
>=20
>=20

--WZasyoaWaR6SUx82
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqr7wAKCRB4tDGHoIJi
0g+YAQC2pAyyoANnVvonXgOAp+seHCS5qLMcnRgDuwtA+N6p1wEAlsGBNaSU8FMY
snCwQ2cdghqeMYQDlLX3qxhh9yCuIwM=
=ukWt
-----END PGP SIGNATURE-----

--WZasyoaWaR6SUx82--


--===============2788424647338463468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2788424647338463468==--

