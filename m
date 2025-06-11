Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4AFC71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7g1ah/4SpjLBBPDDWgTZIpCypNHtaDnklvQBWIO2aVE=; b=K6THCgJRRcfLPMtG7c/EojmeTZ
	W/LdENGBUfKNMT7IHv0pMz7Xke1ISO7JxOX3wcS6f+aadhSJo/nxR6wH3704lLy+FCN6bOOT9dhtM
	Mk1IziLui3DUHXbRZtcsrUy1LGv/F1HlZgvrgP+kpMzifEyTOz7SCcQP0Udqgkhz66L2h12Clw7ji
	YtXoIVYAVwup+2DRverOTQIqLZtQPlNa9AvIxMlPpVJPYobfe7iqx18DL+/kw/dIB5v5cMguoiheo
	Xz5lCVcRQwhmUWtu/5rwxpyQgOtFuIluiyJbxMiw84MufsPc6UPVDBMbMrd5q/evcQGEtQLxo9HJW
	x6JU6+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSoI-0000000BGWj-1vTL;
	Wed, 11 Jun 2025 21:16:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOII-0000000Abxj-2XaG
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 16:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2B01A5195F;
	Wed, 11 Jun 2025 16:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA55FC4CEE3;
	Wed, 11 Jun 2025 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659237;
	bh=TtXVw+PkPXOitHU74/zipxEl0FGTF6GQcOkD9yWCbmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Of69h1moi0kvk/wUGfC8qUrYlhnSf5HEF+Y08XuY4uWhQgQIfpaKOOUbCMBEfU5Xk
	 m/JmMjypFT5H6Z6KZT9Xv21j9YKSR30BKLl/NooP9nZIhmaUOfKcyzJA2elWTRd3P9
	 hFJ624oP/nZmvLkDU/piWDaokPP0F1GVWpqbJR7jkfAplrVxOzjdVU26f2IpGcog7O
	 mg5HZ8bMfTz3ruS03ExOSyhMCWXHURuTNmaa98JNQ9U8OpEQ1m0e+kNssvJYZBijpf
	 y6GipI71Y3uYOfaC45cKAzEi5+mYe9X9xhkHHxx9GgsD0Y++ECkyvhmT32xNjnDd7H
	 EaRKgPT4P2IKA==
Date: Wed, 11 Jun 2025 17:27:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, drew@pdp7.com,
	emil.renner.berthing@canonical.com, inochiama@gmail.com,
	geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	elder@riscstar.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA
 compatibility
Message-ID: <20250611-kabob-unmindful-3b1e9728e77d@spud>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-2-guodong@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250611125723.181711-2-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_092718_778031_12349679 
X-CRM114-Status: GOOD (  20.86  )
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
Content-Type: multipart/mixed; boundary="===============3983372856045501394=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3983372856045501394==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="82h4siQLdNk8igEh"
Content-Disposition: inline


--82h4siQLdNk8igEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 08:57:16PM +0800, Guodong Xu wrote:
> Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
> controller in the Marvell MMP DMA device tree bindings. This enables:
>=20
> - Support for SpacemiT PDMA controller configuration
> - New optional properties for platform-specific integration:
>   * clocks: Clock controller for the DMA
>   * resets: Reset controller for the DMA
>=20
> Also, add explicit #dma-cells property definition to avoid
> "make dtbs_check W=3D3" warnings about unevaluated properties.
>=20
> The #dma-cells property is defined as 2 cells to maintain compatibility
> with existing ARM device trees. The first cell specifies the DMA request
> line number, while the second cell is currently unused by the driver but
> required for backward compatibility with PXA device tree files.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml b=
/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> index d447d5207be0..e117a81414bd 100644
> --- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> @@ -18,6 +18,7 @@ properties:
>        - marvell,pdma-1.0
>        - marvell,adma-1.0
>        - marvell,pxa910-squ
> +      - spacemit,pdma-1.0

You need a soc-specific compatible here.

> =20
>    reg:
>      maxItems: 1
> @@ -32,6 +33,21 @@ properties:
>        A phandle to the SRAM pool
>      $ref: /schemas/types.yaml#/definitions/phandle
> =20
> +  clocks:
> +    description: Clock for the controller
> +    maxItems: 1
> +
> +  resets:
> +    description: Reset controller for the DMA controller
> +    maxItems: 1
> +
> +  '#dma-cells':
> +    const: 2
> +    description:
> +      The first cell contains the DMA request number for the peripheral
> +      device. The second cell is currently unused but must be present for
> +      backward compatibility.

These properties are only valid for your new device, right?
If so, please restrict them to only the spacemit platform.

> +
>    '#dma-channels':
>      deprecated: true
> =20
> @@ -52,6 +68,7 @@ allOf:
>            contains:
>              enum:
>                - marvell,pdma-1.0
> +              - spacemit,pdma-1.0
>      then:
>        properties:
>          asram: false
> --=20
> 2.43.0
>=20

--82h4siQLdNk8igEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEmuXgAKCRB4tDGHoIJi
0qVeAQDGipWedss8FsQk82+JZZWNvXPOTFMRXZ9UZDbpVDtD9AD9HKL4/k0Gara+
cP7bfGhZRfjr9QcvF763N1YHTn34eg0=
=BguH
-----END PGP SIGNATURE-----

--82h4siQLdNk8igEh--


--===============3983372856045501394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3983372856045501394==--

