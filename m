Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863A8C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3DhlBu+YJ591V3zqGf++KxMUglNWiasyp8cH8Q4dYA=; b=NI7iYHuKMtvhEBaUv0qYRo83OZ
	yZpLp3gxMzH+A3P+8zUEXTb7x1X61oP8Bd9Cl/RtAycQZh0vFa/dPIl3YYSiRvcJ7lsDpGornrmWu
	7gBKZbOBVm7SzirZqMfsZv2Ynbi8MYqwulN4VJ7I977o8BT6CZyM+lRqGxlzOjRmpr5gCRS76AOaQ
	r21N3n/v5gZXvZdxxSciFKc9l+KPkKzEfKmmzZqFw8oUoB+9vb3kEDLlwwVQ3ONQWG16UpenjyqCE
	CzlJFob9ovJqH/ByyNjY97pjRB/BmWTa3i4YwToYavFL9panTgYeD3WgRPPQtrR9Qo7Ug2Ta8QAb2
	bk6RDBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVttr-001fvz-2A;
	Tue, 15 Aug 2023 13:15:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVttp-001fvK-0m
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 13:15:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9593629AF;
	Tue, 15 Aug 2023 13:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60FEC433C8;
	Tue, 15 Aug 2023 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692105352;
	bh=6FTVwttGp7chwo11oWnhEZ9wZckkKOHug2miCE397ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbI0HlXQewxzvJ6YTJQuikwBHTi36gjuGbWFdSTFVusa8Ef6yDdYddu+OBeo69n0A
	 ACq0jUo9Ql6ZDSYQL3DTFKZHW3+6hfz5PMv7KiR7Nmlm0PGWIYBIMEITJshC08f9Up
	 zYWn9LTS5LdGdzcDVZfKYCNnlPQNZr9WmSGfJU+AD09U6QI9SkWNGdRJoImUmthQxX
	 hkLC0zEmjdp1+GR3hlErUaAaSmDp5nrS0oBljKRzG6G/KzLrDSkQkDxnFt79+szoLu
	 cVz/rq2K/PFOIwEHH+pAbi72ziZdkfvEohKcRkfJ745cs6cf06NdEk9LlCE0HKsp7B
	 a29yV1t20pyZg==
Date: Tue, 15 Aug 2023 14:15:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/2] riscv: Add BeagleV Ahead board support
Message-ID: <20230815-aroma-graveyard-f1fcc61e5030@spud>
References: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_061553_359585_F937F629 
X-CRM114-Status: GOOD (  21.06  )
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
Content-Type: multipart/mixed; boundary="===============6293360418449025123=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6293360418449025123==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gZHHsx5XRZBY8TJZ"
Content-Disposition: inline


--gZHHsx5XRZBY8TJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Fri, Aug 11, 2023 at 05:47:15PM -0700, Drew Fustini wrote:
> The BeagleV Ahead single board computer [1] features the T-Head TH1520
> SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
> minimal device tree file to support booting to a basic shell [3].

Am I supposed to take this, or will you? I still don't know where I
stand with any of this and will default to assuming things are for me
to take in the absence of clarity.

Thanks,
Conor.

>=20
> Changes since v2:
> - Drop the MAINTAINERS patch as it is not important and I want this
>   patch series to make it into the next PR
> - Add Conor's R-b
>=20
> Changes since v1:
> - Add dual license to dts file as Conor noted this is typical
> - Reorder new entry in thead.yaml to maintain alphabetical order per
>   suggestion by Krzysztof
> - Add A-b's and R-b's from v1
>=20
> [1] https://beagleboard.org/beaglev-ahead
> [2] https://lore.kernel.org/linux-riscv/20230617161529.2092-1-jszhang@ker=
nel.org/
> [3] https://gist.github.com/pdp7/91b98f5b8a632802e669d8c359f4f498
>=20
> To: Jisheng Zhang <jszhang@kernel.org>
> To: Guo Ren <guoren@kernel.org>
> To: Fu Wei <wefu@redhat.com>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Paul Walmsley <paul.walmsley@sifive.com>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Conor Dooley <conor@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Robert Nelson <robertcnelson@beagleboard.org>
> Cc: Jason Kridner <jkridner@beagleboard.org>
>=20
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
> Drew Fustini (2):
>       dt-bindings: riscv: Add BeagleV Ahead board compatibles
>       riscv: dts: thead: add BeagleV Ahead board device tree
>=20
>  Documentation/devicetree/bindings/riscv/thead.yaml |  4 ++
>  arch/riscv/boot/dts/thead/Makefile                 |  2 +-
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 61 ++++++++++++++++=
++++++
>  3 files changed, 66 insertions(+), 1 deletion(-)
> ---
> base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
> change-id: 20230811-ahead-dt-v3-1d7e85fce20f
>=20
> Best regards,
> --=20
> Drew Fustini <dfustini@baylibre.com>
>=20

--gZHHsx5XRZBY8TJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNt6ggAKCRB4tDGHoIJi
0iJzAQDJ+f5M3D8HQ7Py0wvo08R6+GUN8qw1shNg6Qg89SJ+2AD/UK4zthaeE8OO
XrUhvFuiqFQV6Lk40KCdbMc+d3ZQNQg=
=JfDz
-----END PGP SIGNATURE-----

--gZHHsx5XRZBY8TJZ--


--===============6293360418449025123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6293360418449025123==--

