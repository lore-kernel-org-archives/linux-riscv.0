Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B9C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70V6ipo/xlNKO2DpPW1I3pfy+BITPhKs6u5a4mYN1II=; b=Mg1+aFHGrE8Dekzm6J1+8RuAjF
	BUSFwU7YlZeymehDJzz9BdUpMOFI8vclN+XUWso5nz08Jp3A3U7U1+MygSShtPOrXez95F37v0uAT
	HQs4sTnRE6ywIiG6IX93OTJMSJhibgmMX1ejFWxEQn86ggLocQsrHMJ7+Luk0rSOO6n+SuNAJ8sSA
	+1vkffooBaQFWCBuHvuqoZntEBKDvUSmnPZf/FJpFnCcmRC3WS2RQZTV6cH8GQyaZuJps+8SjE66q
	6CPa1H2qSuVVhogRoJFtUmwFd7THSSFMzNIMs9pWuomEZ95hr/nQtnvSwByPrRkvXpFVILUno4gFS
	BREcruog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUT7K-0000000DAxc-0F3z;
	Mon, 29 Jan 2024 15:00:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUT7I-0000000DAxA-0Jqx
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:00:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AC556211A;
	Mon, 29 Jan 2024 14:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB376C433F1;
	Mon, 29 Jan 2024 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706540377;
	bh=3l8vvbKif7wVC7bMTkrcO4TBaNj6h0QNy/ZaLjauggs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdHsffo5LUizRilMlDjB1Uv2hRYUcIxYkrso2AOiHRmM0i3yI39QhMvvxkv3UQQdN
	 RBsKGPDjuExrtQHT6Z1wAJadW+tSKB+hlfufpA9RunqHTE2pVfQGlG92hl65fbH+lL
	 81wM8rhC2dvaJ9GR47tng6u1VMDeBXY4+52D859SzGMSaYobiIH8/aJjrQxmnHpwO4
	 +lN63QzEjpsW/1TZK4uEsBGHH8/dazlH7OC7g77K26aDvm1kKSczNuzADp6WwcrjCj
	 fQk2AxtQCTMe0XrJEjyV7nxbEraMsi1rXYoKHEGIy+SV8bln2uSby2RIYu7h+hiH4K
	 8Kr7MZB9RWhEA==
Date: Mon, 29 Jan 2024 14:59:31 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-can@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 1/4] dt-bindings: vendor-prefixes: Add cast vendor
 prefix
Message-ID: <20240129-pavement-fondue-31f29ac2033c@spud>
References: <20240129031239.17037-1-william.qiu@starfivetech.com>
 <20240129031239.17037-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240129031239.17037-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_070008_178284_A0340630 
X-CRM114-Status: GOOD (  14.34  )
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
Content-Type: multipart/mixed; boundary="===============6423782429780840374=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6423782429780840374==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cogiGBIc/MCqykSX"
Content-Disposition: inline


--cogiGBIc/MCqykSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 11:12:36AM +0800, William Qiu wrote:
> Add prefix for Computer-Aided Software Technologies, Inc.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 1a0dc04f1db4..b9c6ce99d24d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -242,6 +242,8 @@ patternProperties:
>      description: Capella Microsystems, Inc
>    "^cascoda,.*":
>      description: Cascoda, Ltd.
> +  "^cast,.*":
> +    description: Computer-Aided Software Technologies, Inc.
>    "^catalyst,.*":
>      description: Catalyst Semiconductor, Inc.
>    "^cavium,.*":
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--cogiGBIc/MCqykSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbe9UwAKCRB4tDGHoIJi
0vnBAP4h9TeV8gpl0bK+1Wd48qmmmXDASj7WbF2vhDFdPDrdXgEArDrOKaRpACUE
s0brDp0M/KU4k7zpGc/9tpYV64sqgg8=
=vPXn
-----END PGP SIGNATURE-----

--cogiGBIc/MCqykSX--


--===============6423782429780840374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6423782429780840374==--

