Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E199E748E9
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Oct 2023 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xPatdr80rpvZsKWYdzo1lLhg7vHySr7ooOGG9E0VoU=; b=UqtMbkmQ3q46mngoIicete4/Wy
	UPyANPP4waJWkuiWrfDGABUA2n23D6B50//oqhE8qw5UPI0BFBopGhqUcLkvxqj6tedjLSejbd8H7
	xGU+2lXWXQjdDbKRhO/dJzz9zHFirTvM6ENsSEC/J0/d7qxh6iriO9FUnQQzqEiiIiqTOyG60M7gO
	5YhTOUrY16U3p0fr97meEtHrsA4aJrLLrBFdPr8xUkyXHLUDPXUnYq5hivmkgWFGk6rlum7poYgwD
	YdxjRZ7zgzoPvpKVO0N8kf0VPatcU5ZBz+PR3OmJdODamFAYZqzvWkI4HCh3RXu63/xCZdeDiDE3t
	/7ac8mnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmuaX-00AzMq-0h;
	Sun, 01 Oct 2023 11:26:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmuaU-00AzLV-0K
	for linux-riscv@lists.infradead.org;
	Sun, 01 Oct 2023 11:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 44914CE0A56;
	Sun,  1 Oct 2023 11:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF49C433C7;
	Sun,  1 Oct 2023 11:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696159571;
	bh=B7ZVjsJ/a+z+gdsGax8hdRStVwE8VsOqF6CqHVUokeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2h+dRV59ESUoeRTKR6qDsECU6mB+w/yNOqG3BDan8ekizMW6st8gUoLsvT/0xfrh
	 o6fUr3fe3H7HNiUi8QrXlhMQtIPceRJJ1z57JjpFEWAF9hKo1iKQr3dNpIg2V4lcwO
	 Nw5758rVXciHSbOJ0m0+I40EA4gg2TeZyfwI9AkcG1DXkuNrYQTk5JG2hOnVJN5RAz
	 SetjURWCaYrJfFKCNq1a48QI83t7r0egiW1YoOjqu8uubbRmuZqC78N7dlq5Ir54d5
	 ukE3WRBhGzumcTd6dJF0rk3Ro48OaG/0F6lYeCkNE/MJJIaT5Moe3+Y6SqkT5cAVRe
	 nqFUjbCWC8fBA==
Date: Sun, 1 Oct 2023 12:26:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 3/5] dt-bindings: riscv: Add Milk-V Duo board compatibles
Message-ID: <20231001-sinless-evacuate-2a6dce63cb5f@spud>
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230930123937.1551-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_042614_321067_C4FB18FC 
X-CRM114-Status: GOOD (  13.66  )
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
Content-Type: multipart/mixed; boundary="===============0395653560948129210=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0395653560948129210==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gth2pD5qYnurspUN"
Content-Disposition: inline


--Gth2pD5qYnurspUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 08:39:35PM +0800, Jisheng Zhang wrote:
> Document the compatible strings for the Milk-V Duo board[1] which uses
> the SOPHGO CV1800B SoC[2].
>=20
> Link: https://milkv.io/duo [1]
> Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docume=
ntation/devicetree/bindings/riscv/sophgo.yaml
> index 4e8fd3c6a6ff..6db241c9d00c 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -18,6 +18,10 @@ properties:
>      const: '/'
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - milkv,duo
> +          - const: sophgo,cv1800b
>        - items:
>            - enum:
>                - milkv,pioneer
> --=20
> 2.40.1
>=20

--Gth2pD5qYnurspUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRlXTQAKCRB4tDGHoIJi
0ggDAQDgoXmtMxXZc8t1AfDUQJDSbmqJUw1SYpFi4+F5wv46RwEA79O2X7D+gApK
jvcw2dvS3XDf94s1yHpD0vzV2k9HAAM=
=xZ9n
-----END PGP SIGNATURE-----

--Gth2pD5qYnurspUN--


--===============0395653560948129210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0395653560948129210==--

