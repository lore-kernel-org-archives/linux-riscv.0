Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BA6C3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoV939t0htPlO2UAgwEkHfo/DC7M+85q4NsbBKFxmK4=; b=aLn0TOdzDKv0LA0WQSyrGKWZQo
	TIxPAJ9tAbTzSz3eDul/oK6bsr7u/ndFpKoCT/ymTOJi0Q1XzRZA0s2ndoU5MffnXaGTCAPO9glnT
	acM76ZVapvFiDNmVBoyDncaXCThR7pkkAUedvuPjdBqJmWYFGrsiHyRPlCA+aG7TQU6aUXIWqbPpi
	e7TdpRFQLIV4u5ctZnHpaMFgYJoMg+KZtomyYnbolj/qpxRJe1tXTXCMsj5Aa/ewBNU0hKoL3fRTH
	MMz2KzDuImlAS3jcFXoeJdCNPT6CazPVe3hA96qvjp8bT+de+55aeadz16k4kTf4k548dM/vO354z
	2rzhp/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwmU-0000000EiNG-1QVK;
	Thu, 11 Jul 2024 16:36:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwmP-0000000EiLQ-3ZlY
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A4A9CE1307;
	Thu, 11 Jul 2024 16:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35202C116B1;
	Thu, 11 Jul 2024 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720715783;
	bh=Jm3fjypV3N6HlvJt0y25c+PAjLhFWFvzu7Kl/s6RaTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmwMI+5d9Th3iwz7epJYE2FbdQfTWExyVI6BF8sK97OCCVMceLgVJgO8BORqxd1bR
	 nElisC8y8rRmTrEIm49B+nKnETKCb83l9GMZ4u8Y4lWyfuQeI53CckMxpVvkW5nSTB
	 MG2w9oZSQUzL1qauOV6aA4FqSzx4zGKcbVQC2F1Q3eMsLVYhZS2ZrtRQkxpCdBbwYM
	 bWaEzSRV2JWtei0867yL3wAfZxa5RDZ1GG8SKXRm6ge8fzymJBCGeScQA5fjhMWwFK
	 RrfQo5HIGnAVTzBasaEnyVEhVBEHwjApyIg7KfpqJMVR9wmXisygBXzWiAKNMCwEfO
	 /I/3Hzipx6cHw==
Date: Thu, 11 Jul 2024 17:36:18 +0100
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
Message-ID: <20240711-silicon-fringe-20466250f6b3@spud>
References: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
 <20240514104508.938448-2-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240514104508.938448-2-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_093626_274296_0EE8C4CA 
X-CRM114-Status: GOOD (  19.52  )
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
Content-Type: multipart/mixed; boundary="===============4282716658152156351=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4282716658152156351==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="46hh1M94wZx3zWh6"
Content-Disposition: inline


--46hh1M94wZx3zWh6
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

So, it turns out that "maximum" here should actually be 2, as there's a
CS routed via the FPGA fabric as well. I think default should become 2
also. I can show you what we missed in the configurator on Monday, or
Cyril can if you see him before then.

Cheers,
Conor.

--46hh1M94wZx3zWh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpAKAQAKCRB4tDGHoIJi
0seiAP4il8T3aKRrsUvp/JEd1zwkEZsueHFdOCksvfA3m0mBeAD+N+60ES0F4Gdc
DJOApB7LWS5aU3t46wlPTu8y7HQE3AI=
=tLP7
-----END PGP SIGNATURE-----

--46hh1M94wZx3zWh6--


--===============4282716658152156351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4282716658152156351==--

