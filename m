Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA04DCD37AA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 21:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgkUwhVmC/WSH20ncgtXOXdARGH4zYYWHeUMgQNbbKg=; b=RRryoclBYP2rsSUMD/Df1fah0V
	Fj3YnmFJ23zIxVWVcpq47j5C+VyYJ8j06HrrlWHj0EEgB5+uqvG0E9zGEkQlvI+aHL5C6Qi+fc+sY
	gz0uSsESRIrvvsnbZigCgL9+aDde9KkWTgfKfX8ZWY4OnNnbM5OK5ysww6haO4GQfZHmW19NuvGIR
	0or90zuiHbRZWpP5bEM96tSLpumSY3eJmGqQBExYgajbMP403CekUSMiFl6TR8oKWt0rCTQXVXfqz
	OOQYdneOuzklJN22t5k3v06casoP2cYtIPi4bAc51USXYb1KUNaG2km37WzwzRTYikUV0feei4gCO
	N72tvRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhG2X-00BOX9-2M;
	Fri, 15 Sep 2023 21:07:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhG2V-00BOWT-1r
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 21:07:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 55720CE2D43;
	Fri, 15 Sep 2023 21:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AE6C433C8;
	Fri, 15 Sep 2023 21:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694812062;
	bh=yWUk6FUlYOLjDYbRClgivGA5rBQf/ssbmNXyCcG5dBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8q+80RgmydYetEN7N0GuV/XpsFwFSajEX0D3KmsUTxIw9rvCQcWvk0fpEBDmsEYT
	 vYIYaJV0uZ6gzsiMgLZUf9OpNnY3nMKS6M5RH2Qew5MZwU3Ksy/tuCdiyFjFhkc3mE
	 aD4pM9bDK4eEddohaQrgLBJfveET1P97K+buMbvWtcuTUYQECsjTOjK0DYOmIIiamk
	 yR9SBKszFgdOeAjPIjovoalbwt4nDjhrPu/ZUKe9rr+j6k0iiUMx1X4KGlUOrF2378
	 44fTiEFhgPC7INW74fZwPuS76j7V/G/RkyQZcGCZwl/vRofGKuZAPJlAKA+GGi1DDL
	 DU9nr+905/RsA==
Date: Fri, 15 Sep 2023 22:07:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add missing
 additionalProperties on interrupt-controller node
Message-ID: <20230915-ethanol-doorframe-f500a5d9521e@spud>
References: <20230915201946.4184468-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230915201946.4184468-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_140747_803158_ED7EB575 
X-CRM114-Status: GOOD (  15.28  )
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
Content-Type: multipart/mixed; boundary="===============7587639864749099769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7587639864749099769==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="064DYEBcFbFiNMAU"
Content-Disposition: inline


--064DYEBcFbFiNMAU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 03:19:36PM -0500, Rob Herring wrote:
> The "interrupt-controller" CPU child node is missing constraints on
> extra properties. Add "additionalProperties: false" to fix this.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Was wondering why I couldn't see this in my dt queue, guess
get_maintainer.pl struggled with the multiple claims on the file :)
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 38c0b5213736..97e8441eda1c 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -91,6 +91,7 @@ properties:
> =20
>    interrupt-controller:
>      type: object
> +    additionalProperties: false
>      description: Describes the CPU's local interrupt controller
> =20
>      properties:
> --=20
> 2.40.1
>=20

--064DYEBcFbFiNMAU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQTHmgAKCRB4tDGHoIJi
0g91AP0YiS0atHOPqWoysBPu+aFzJt8G+4W+Ng/yWcAqOg2rmAEAyWksUAWE2Blw
L+/D+8Tq4OdxCfKJjDcWuW8QGTBZZQ8=
=BkiN
-----END PGP SIGNATURE-----

--064DYEBcFbFiNMAU--


--===============7587639864749099769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7587639864749099769==--

