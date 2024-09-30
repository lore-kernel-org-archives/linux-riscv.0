Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C26CE834B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBXvN5j7ZvPSsUFWORICGGmjoddL/6vXAtlCP0OeT3M=; b=EHjTTGZKdcdA32JwlBSpQnJ4ri
	ZD+/+xNlUYRUrdcr4U6d9FQ7Z6AMKQ492e2Vsb59pNSTLzsNzXsao96sxKlwl0RktBdY9wy0U1z32
	qVK3c22rUCGu0DATmvDohL79++CyFZ98qlKLSPkjFhBkQezXdQ56i5Hl5eDiF6PYG8DDxqbEsmgi3
	KBjYIk68g+mSUDhleD5NKEPz30tyowfk84z1uXBwvAbWn+zvIIPcuhm/MlhhU5mr6upbm10kYiLCW
	fj1et7XCyXo27iNeTE91bEVb190Aa0PWA3Bh3f5NU4GUG50HudpRVNtdb7eTVmyFvEjkKjUqnAKaS
	SR4pyKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAH-0000000HSyh-2Pt1;
	Mon, 30 Sep 2024 14:14:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGlG-0000000HNJu-1m1V
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D36EA42556;
	Mon, 30 Sep 2024 13:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E9AC4CEC7;
	Mon, 30 Sep 2024 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704105;
	bh=WktLtpIrIbL+8YQi45Eu421zppugfrAet1EeAKU5Yek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2cyVsTNf4bbUUD18lBqL3KujTz48JtFWJHEqtKTtGkfCid+6N/bTN/kFdnx1cqh0
	 Ugd0tHZaz5dYUs3FB4SfqDfW5p+/pyeb2WLgSXmybF3eHyFD4joBmRKnjxOGDw9oyx
	 Zr91TvNGJRU5sU8P97Dxmk7le3N1Mkvk4ZbZrgCISBpw/ubfFfBLRaTp7lxPfwYjVw
	 ENQbIqCb2udkvnBXjMqr0cbhCMgAtAL0+++wNBcBB8z/fnjEq+UkERh841oNvJCBk/
	 kYViHx9Uz0VBs//snbktFr04trOnr0s38BJU93Yjjrg5ONhfaPqjNBKt3bbYcdQszW
	 QleBtjmL4EiwA==
Date: Mon, 30 Sep 2024 14:48:20 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Green Wan <green.wan@sifive.com>,
	Palmer Debbelt <palmer@sifive.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 09/20] dt-bindings: dma: sifive pdma: Add
 PIC64GX to compatibles
Message-ID: <20240930-mammogram-prison-d87615f0d05a@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-10-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-10-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064826_617236_9A8C3F4E 
X-CRM114-Status: GOOD (  16.28  )
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
Content-Type: multipart/mixed; boundary="===============3307996151922476647=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3307996151922476647==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kqrZppaxEGOPTo9H"
Content-Disposition: inline


--kqrZppaxEGOPTo9H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:38AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX is compatible as out of order DMA capable, just like the MPFS
> version, therefore we add it with microchip,mpfs-pdma as a fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml      | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma=
=2Eyaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> index 3b22183a1a37..609e38901434 100644
> --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -27,11 +27,16 @@ allOf:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - microchip,mpfs-pdma
> -          - sifive,fu540-c000-pdma
> -      - const: sifive,pdma0
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-pdma
> +          - const: microchip,mpfs-pdma
> +          - const: sifive,pdma0
> +      - items:
> +          - enum:
> +              - microchip,mpfs-pdma
> +              - sifive,fu540-c000-pdma
> +          - const: sifive,pdma0
>      description:
>        Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
>        Supported compatible strings are -
> --=20
> 2.30.2
>=20

--kqrZppaxEGOPTo9H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqsJAAKCRB4tDGHoIJi
0q4lAQDZPsQK4xWA8TDpp1IyybDgTSbASEUfhv0mp/GHVtbjPgEAs01gUWp4evXk
RGUyGxzDcN6h/L65uyGvteqNXGG5lwM=
=6KCM
-----END PGP SIGNATURE-----

--kqrZppaxEGOPTo9H--


--===============3307996151922476647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3307996151922476647==--

