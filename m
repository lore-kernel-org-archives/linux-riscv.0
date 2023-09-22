Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FF5CD4F45
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gbmciclj6gC2m01UipCrjFFPHfPgR3RxGcaloLCPiB8=; b=zdR7P93+aYpZaj+fk6dtVTzEXE
	0LG5F2N2S3AU6hY56oLxKzwn+1NkYMncQlfT1IY9idhNgail5rTfUnPVZPvSvhOWMi0p0dsHkGuYC
	nPdRBZQSqZvnNoxs4224JNdHr4bPco13rMOJYNiQv0sPFzlDsT+NfA0SGjXbWGOKQEeMqYFbmMZQP
	yEaenudwkxsb3L46PyuLH3eEKFEAX45dyKhQzDtHpsYNVXPHRvO+ij8+9SKlsfGx59MiT7z8fB4Dr
	a9Y/2WozgmyR+gHXdHwd0JciDhEITlacLYiAqkHHm78T8/2RA54ZnpwIzJTppnLBgQxdTtmsaz+9S
	qwxIpb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcx8-008f8t-08;
	Fri, 22 Sep 2023 10:00:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcx4-008f6k-2v
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:00:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B6F362191;
	Fri, 22 Sep 2023 09:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A961DC433C8;
	Fri, 22 Sep 2023 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695376797;
	bh=Rmbwnfy/2jfDt6etmwMj6pRES6Qp/FcaWgWrT8xRulQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mw1vZL+iRdVdZLIzYj9igp3k9yg7oXHD4JzzSXuD4hY3XJRDU6thvQcwYcW2hoEme
	 Ol1W9cMUVlfw7qW8LMI83PivEgj+cOpdSv0DTkoKAN9lDYgY/AtQRGy0cm/he3eyB2
	 2Mcu5jtXms7IBzBE9oPKkmlKDTvcknmyu/efrFcWtFMMFx5FH1MLY9TzLVy2Aujnsk
	 7TcTkEjdS1JF71KqHiCIwlDhSCw7+Cvty2sGgYx9+hMcVaCZcJvbhS34J1zF8VhSqK
	 C9pqpiDIhkC3bxWxjL6kjIxrP3mlHgqPckTIpT3CsWUj0rx38f9Co7f2URmDB3Tlwu
	 xnljFyl4KAc6w==
Date: Fri, 22 Sep 2023 10:59:52 +0100
From: Conor Dooley <conor@kernel.org>
To: shravan chippa <shravan.chippa@microchip.com>
Cc: green.wan@sifive.com, vkoul@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, conor+dt@kernel.org, palmer@sifive.com,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	nagasuresh.relli@microchip.com, praveen.kumar@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: dma: sf-pdma: add new compatible name
Message-ID: <20230922-gray-zebra-a0ea451cc5cc@spud>
References: <20230922095039.74878-1-shravan.chippa@microchip.com>
 <20230922095039.74878-3-shravan.chippa@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230922095039.74878-3-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025959_047061_F181FBB8 
X-CRM114-Status: GOOD (  15.27  )
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
Content-Type: multipart/mixed; boundary="===============8188303892594480347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8188303892594480347==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aMX1ax+XegASzcpP"
Content-Disposition: inline


--aMX1ax+XegASzcpP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Shravan,

On Fri, Sep 22, 2023 at 03:20:38PM +0530, shravan chippa wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> add new compatible name microchip,mpfs-pdma to support out of order dma
> transfers this will improve the dma throughput for mem-to-mem transfer
>=20
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

I would appreciate if you would drop any vendor tree related tags when
submitting patches upstream, especially for dt-bindings where it
actually means something to have my R-b on them.

Cheers,
Conor.

> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml         | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma=
=2Eyaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> index a1af0b906365..974467c4bacb 100644
> --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -27,10 +27,14 @@ allOf:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - sifive,fu540-c000-pdma
> -      - const: sifive,pdma0
> +    oneOf:
> +      - items:
> +          - const: microchip,mpfs-pdma # Microchip out of order DMA tran=
sfer
> +          - const: sifive,fu540-c000-pdma # Sifive in-order DMA transfer
> +      - items:
> +          - enum:
> +              - sifive,fu540-c000-pdma
> +          - const: sifive,pdma0
>      description:
>        Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
>        Supported compatible strings are -
> --=20
> 2.34.1
>=20

--aMX1ax+XegASzcpP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1lmAAKCRB4tDGHoIJi
0pXbAP0UtoRGkkj5hBqOaT63U8Em3NH+kiUFeZ/HgkF8mLKhdQEA48b4gMC9cPIS
e5Clll7FoZlKKL8d+LNM/uuMmpUvvQ0=
=6kQe
-----END PGP SIGNATURE-----

--aMX1ax+XegASzcpP--


--===============8188303892594480347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8188303892594480347==--

