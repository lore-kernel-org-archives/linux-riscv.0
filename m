Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D63FC77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dALZU4Ko37QSSc7Y99mrpGyywhPdYEKGEkkV3Rl4YvA=; b=OXPg84aq2eglT14aK3Mwdpjnzd
	YOQHsYsalpNfW57mhGsfWl7UnuhSp2ntqBuBWZgm7btQ/HuTtoipN63JnG3Co+gXoFPV36XeCIXsy
	gm0nju6R/SlplQN7HJdVzduaZyMFcVR0URMkf6Fi1lCxFDXiC/l0HiMeLcG59vRm8n31Y5l33Y9BU
	UDltRnKEzMWOswwvX2lPev8yAbHAHrKLjrhBu5O42J/ZgTG7YcU4N5mOs3H4YSJ/0sW2rx/v7cYXV
	Wo0TaMVSTVDZQtRI7oA3y27pC0zlujczACumFPRk0H+2f6ISj/6Jiua/B4wH+l0Fae5gXhgnNB4GA
	h6zQdf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvFU4-00D80x-1x;
	Sat, 06 May 2023 10:49:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvFU0-00D7xd-0S;
	Sat, 06 May 2023 10:49:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 260D261450;
	Sat,  6 May 2023 10:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E23DC433EF;
	Sat,  6 May 2023 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683370181;
	bh=OlQOxYKW4SXZYcXypb34XxCl3+X160znYrTJbr+qWUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLl1/gdKFqK8ElwObuC+WmydhWi4GpDT7ht6fPKxoC6hAUDlfnZwMPHHpmiEKs0fx
	 qsR6Wu5FitpadgxOoLkKSwVGXv7vEPiGm/tYXDQx2+cap8x77SaAZQFnmC5kJqUTrk
	 54Br4GZfN6uo1v7JlHDWpBYqWbFBVpUqJtVWQKQRJAoLZDmQtkaP7AJa8bZFFQybge
	 lBgOTEj82f2x0u2Ib0GpPib75XdT58vynnHnbbUY9Mt8SP3/lb050p+UvpQY/tf/kX
	 NcPAyrhuNBcH0XoxXkAcS+/yLhROBcJgr+MFxaKMvBJ2w9uecCttj0VXZMLK/xnfGO
	 y5lvhkTp5vC5Q==
Date: Sat, 6 May 2023 11:49:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner D1/R528/T113s SPI
Message-ID: <20230506-unfixable-lavish-eb7907a1a887@spud>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-6-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230506073018.1411583-6-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_034944_232411_9A22F002 
X-CRM114-Status: GOOD (  16.79  )
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
Content-Type: multipart/mixed; boundary="===============8517322173767455530=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8517322173767455530==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5lAUstyTyaabrUyb"
Content-Disposition: inline


--5lAUstyTyaabrUyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 10:30:13AM +0300, Maksim Kiselev wrote:
> Allwinner D1/R528/T113s SPI has the same as R329 controllers
>=20
> Add compatible string for this controller
>=20
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-sp=
i.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index 2c1b8da35339..164bd6af9299 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -30,6 +30,10 @@ properties:
>                - allwinner,sun50i-h616-spi
>                - allwinner,suniv-f1c100s-spi
>            - const: allwinner,sun8i-h3-spi
> +      - items:
> +          - enum:
> +              - allwinner,sun20i-d1-spi

Yah, this one is more like it. The "allwinner,sun50i-r329-spi-dbi" one
should be done in the way too.

Cheers,
Conor.

> +          - const: allwinner,sun50i-r329-spi
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.39.2
>=20

--5lAUstyTyaabrUyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFYwvwAKCRB4tDGHoIJi
0kJmAQDqt8aTRyBU1JudXMxWI7MO+3HuHjTKN+FXiHOxoEwPRAEA9d6bTe/01zz2
D1porgB5E8jZK3nBcEWbGNZ04hDmaQk=
=RXB8
-----END PGP SIGNATURE-----

--5lAUstyTyaabrUyb--


--===============8517322173767455530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8517322173767455530==--

