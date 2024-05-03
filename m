Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A611CC10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSodn9bfoFh67tE/I2enaD6buAP6G9DaUZY6M/hPuz8=; b=LkGYWdeTJcYstGZMJfwY0PMOk/
	EmJunI7HwLaJN9gYvgO4DgL0zvkFdx3rt7jrZGfNODW87ucZ6Zbd6oYrU5ZhLOuM5Uj4XGGJnr76A
	bWh3G35L1temco05fk6MmNObujfvaHOoDnPBxxq3mUr9eJTV3fiEQBEEx7h9DvvCCY8Wabi86evm/
	U/0tDXgWg+y4dvyKBGk7vMGlzhBDjEHDw/aC1yedyOanOh10hjbocXVJp38DRLptddsaToczTHgOe
	k6lQ+651HteOpkwolylbKjIGZeVEkZDGzeWaW4QPGHw2/1/lSrneds9xzNVcLtX5wCYl2TaUkjRDv
	Nf5L+DgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2qL5-0000000G5aZ-1DAR;
	Fri, 03 May 2024 10:40:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2qL2-0000000G5Zh-0QPx
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 10:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E9C761C5E;
	Fri,  3 May 2024 10:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50E8C116B1;
	Fri,  3 May 2024 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714732822;
	bh=HwTDULx37Hivyl033gJtCf+zwXB9XjlSfMV+ADfX2R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSimArr3h5HMGwFITZ05NcVzIiDIDgU0D4grxMiFIuv0D7p2lV1eQri4uCWaRU7zW
	 ySK+e0AUgYM7fszEq32bfTG0L/CjV3Q+YdXSnAK3RnM5vyt9VoLh5uPSs5pg1JSRV8
	 g4CaPgpXfbMr/p9OSviNzHxwgKGHOj8qDRsvMubzrLP56Sr9eRvA1NQXTeSzIPH8EW
	 MeLFLEcRgasif/XJkavoyWC4lZF4ryyXBtn5+pMe0wiZ5L24IlvqNtXpXX8bCq5okY
	 c3w0Sre3oAFRF41ihWTk0oDl9JF8TlmK5tM77kzv5w6nLelQ6UdxU+hZ7Jq7zdqJ4g
	 d77VtLvMbQwLw==
Date: Fri, 3 May 2024 11:40:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com
Subject: Re: [PATCH 2/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Message-ID: <20240503-gooey-distill-40e09638c082@spud>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
 <20240502143410.12629-3-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240502143410.12629-3-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_034024_550677_77FF48B0 
X-CRM114-Status: GOOD (  17.73  )
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
Content-Type: multipart/mixed; boundary="===============8021249635599651876=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8021249635599651876==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RpCXvjDOjTtHu/S6"
Content-Disposition: inline


--RpCXvjDOjTtHu/S6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 03:34:09PM +0100, Prajna Rajendra Kumar wrote:
> The PolarFire SoC SPI controller supports multiple chip selects,but in
> the MSS, only one CS line is physically wired. To reflect this hardware
> limitation in the device tree, the binding enforces that the 'num-cs'
> property defaults to 1 and cannot exceed 1 unless additional
> chip select lines are explicitly defined using GPIO descriptors.
>=20
> Fixes: 2da187304e55 ("spi: add bindings for microchip mpfs spi")
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
> ---
>  .../bindings/spi/microchip,mpfs-spi.yaml      | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yam=
l b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> index 74a817cc7d94..19951951fdd6 100644
> --- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> @@ -13,9 +13,6 @@ description:
>  maintainers:
>    - Conor Dooley <conor.dooley@microchip.com>
> =20
> -allOf:
> -  - $ref: spi-controller.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -43,6 +40,22 @@ required:
>    - interrupts
>    - clocks
> =20
> +allOf:
> +  - $ref: spi-controller.yaml#
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
> +          default: 1
> +          maximum: 1

I think this isn't quite right actually. The default for num-cs should
be 1, regardless of whether cs-gpios are used or not, only the maximum
is affected by using GPIOs for chip select.

> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.25.1
>=20

--RpCXvjDOjTtHu/S6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjS/EgAKCRB4tDGHoIJi
0gUKAQCnSigafjhVUe3GHPm6zS2lCDzCAuS4IBfpgkSpfFBarwD/SbdHQKZYcw3w
D2Nz5ZJzoYFiIZKxzyWEK7CqQHUspQw=
=yaL9
-----END PGP SIGNATURE-----

--RpCXvjDOjTtHu/S6--


--===============8021249635599651876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8021249635599651876==--

