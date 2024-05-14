Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D53C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 17:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pb+9ZsOZkLVibsP5/oh6gHu48FIUuKjoyicJa/EJ7WQ=; b=dyT8JjlgPCEb8TNecNCxa6But0
	tdItolJEUhO5Hv92k5xBW+ghaLpRpTfVKZS2/mF3ZSvsj3s7zOuArGIaFaJNvt+0Iat8pYgwKq93d
	qfkxv1/EHy8enkk0rwE1qHDUztvXTI03112b0r0Syp1sXFIOWJ0stuW/1p/e8Xwh2RzErCoxEAxDz
	7zeVIHD3oNsoPVVEC6w0Ds+5ZXJ+vU3pghzSHFaWB86XuolzT+Km4OtEnK+sLULlplxpdFPlJiLBM
	lGSehBDVTIEfQSMuc8+mcbNNWgycxCQHD0b1d3F5fxzbOMZ20EOBOP2AUChvbrXCuHd+0p5zRepxa
	+cAAHJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wKZ-0000000GiuV-2T9l;
	Tue, 14 May 2024 17:52:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wKV-0000000Gitx-3mT6
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 17:52:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C54F6123A;
	Tue, 14 May 2024 17:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162D2C2BD10;
	Tue, 14 May 2024 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715709166;
	bh=qNjfAu4NG8Akw8mfYF0kzZEJKjB5jWGN4i5QOPlFrB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBSn7cCsiYFVHEcWWUE6cMnbPTvP4BFaM+w3KWH/7v//xyStDoT5EBv7cudLYy8Df
	 GS3oSxPvx+AIHWGPD8rj7FXwF1CEquWs9hT99rG2N1LiJE+M7bQs34COp8B5FBiU3j
	 72GxDJ/PYklcDkTyeA9oAYpOUepbHXsVoI/oKAE28SHZAhfnSnmbeSpU1UyZLBLeP4
	 AQcdwsjGzh6P/aRKS6vta/ZCh1FTzUwNxrWoaeW1nmJQ26Y9YP2AdidzldlVngz0Ha
	 tUUkpYrBtEzlMWYbMsOFKJOaYkP/f7OFVo/hJnFTLVWHVtH46pjKPmdKRgc8Ev54UZ
	 eez/SBZ6fYYqQ==
Date: Tue, 14 May 2024 18:52:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Message-ID: <20240514-parmesan-enslave-444763e785ff@spud>
References: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
 <20240514104508.938448-2-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240514104508.938448-2-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_105248_055504_B7BCA31A 
X-CRM114-Status: GOOD (  20.77  )
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
Content-Type: multipart/mixed; boundary="===============7953890913153579288=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7953890913153579288==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l5DifMLtxko3ajhl"
Content-Disposition: inline


--l5DifMLtxko3ajhl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 11:45:06AM +0100, Prajna Rajendra Kumar wrote:
> The PolarFire SoC SPI "hard" controller supports eight CS lines, out of
> which only one CS line is physically wired. The default value of
> 'num-cs' was never set and it did not didn't impose a maximum value.
>=20
> To reflect this hardware limitation in the device tree, the binding
> enforces that the 'num-cs' property cannot exceed 1 unless additional
> CS lines are explicitly defined using GPIO descriptors.
>=20
> Fixes: 2da187304e55 ("spi: add bindings for microchip mpfs spi")
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 29 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yam=
l b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> index 74a817cc7d94..ffa8d1b48f8b 100644
> --- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> @@ -13,9 +13,6 @@ description:
>  maintainers:
>    - Conor Dooley <conor.dooley@microchip.com>

I provided the conditions below, so it's maybe a little disingenuous for
me to provide a review from a dt-bindings correctness point of view, but
then again I am the one listed as a maintainer for this particular
binding and what's being done here does match the hardware, so:

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


> =20
> -allOf:
> -  - $ref: spi-controller.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -43,6 +40,32 @@ required:
>    - interrupts
>    - clocks
> =20
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,mpfs-spi
> +    then:
> +      properties:
> +        num-cs:
> +          default: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,mpfs-spi
> +      not:
> +        required:
> +          - cs-gpios
> +    then:
> +      properties:
> +        num-cs:
> +          maximum: 1
> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.25.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--l5DifMLtxko3ajhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkOk6QAKCRB4tDGHoIJi
0uJUAP4wXa6qR/dXqw/b2iphEzu9Bm1hdToleARl0CE/hfXq0gD+L6NBEDBLxgCv
w/3GtTtJfnjoa2V5Ll1nAKLqgilP+w4=
=MaCe
-----END PGP SIGNATURE-----

--l5DifMLtxko3ajhl--


--===============7953890913153579288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7953890913153579288==--

