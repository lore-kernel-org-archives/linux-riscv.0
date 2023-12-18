Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F1FC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0s96Yqy1iw6ObTdia/HVujiWpYi7WKgZ78wUkQEarbA=; b=CBphwqMd0sZRjNaUSaroEIAyz9
	OPNqnlQz4lt6lhOCoQ5TBBbGGrCY/zFVEKTDxosZp1M1lqZECbsnrHBC3tL+CjWIyvjtTetUOzHiM
	Qc/gzopLH3lclDiQIXKrd5T+JevL+PnCpKZvEzuab5EDVMND6sGtN9kz+Q5E9u90tlLo1Op6RVMLD
	I4fqUXwAfqG1+Nxy7ue2+wRceV7kr3VoFDn+qRd0Ws02QbUPx2QYiwUQghvd9j/qbXu7OIqIp2xiR
	kYfD1YysPRuGOPvO5fMnd4FJ1WR6jFWz2Jnoucc1S8fodZjzuLlIifWwVzW5bUWZbq3Q3HgbRCvCx
	ybGYAXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFF19-00B6lf-30;
	Mon, 18 Dec 2023 14:54:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFF16-00B6jh-04;
	Mon, 18 Dec 2023 14:54:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D7CD4CE0B2A;
	Mon, 18 Dec 2023 14:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC24EC433C8;
	Mon, 18 Dec 2023 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702911282;
	bh=s3iiGBDd0jsA5GpHn3zZNS/JFO1WQ8YGurgE+GdbYWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GbhPZ5JZK5Kof/4b0TzkfXcc3GHerqi+g8NhBJJCURhWt72q2okrrd66eYS0Wp66H
	 Sgjg6D5TbW0P96ptKmP0zlENg771eNxAaTBswnZOX3S1Kpk6aCK3lJ/0RqPvNn9vve
	 GAvF/kt8TvnBYGB2KREHF74mcav2vVQArDGCXoABjheuzszRK7k7Ucm9D+8i/gVr4V
	 NIt0yngV6Kh5XUuchlMK/TLveHl7U+I+F/tTaNcHJncwYWdXtIBGyq30P3AO/0RvJn
	 wT/RYSJ8cBLmhF1Dy+YUmUlRR5RTnYrOu4+qb3+XYRdxuuI3G0hgfHP/k5uLxt4Trz
	 1hlo72yV1x6EA==
Date: Mon, 18 Dec 2023 14:54:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/5] dt-bindings: opp: sun50i: Add binding for D1 CPUs
Message-ID: <20231218-disprove-judgingly-ee54d39474a7@spud>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218110543.64044-3-fusibrandon13@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231218110543.64044-3-fusibrandon13@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_065448_297072_898E772F 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Type: multipart/mixed; boundary="===============8279101956861133309=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8279101956861133309==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ex3+7jnV//1NaCLU"
Content-Disposition: inline


--Ex3+7jnV//1NaCLU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 12:05:40PM +0100, Brandon Cheo Fusi wrote:
> Add binding for D1 CPU OPPs.
>=20
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-op=
erating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50=
i-h6-operating-points.yaml
> index 51f62c3ae..fddaa3216 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating=
-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating=
-points.yaml
> @@ -23,7 +23,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: allwinner,sun50i-h6-operating-points
> +    enum:
> +      - allwinner,sun50i-h6-operating-points
> +      - allwinner,sun20i-d1-operating-points

This doesn't match what you have in your devicetree.

> =20
>    nvmem-cells:
>      description: |
> --=20
> 2.30.2
>=20

--Ex3+7jnV//1NaCLU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYBdKwAKCRB4tDGHoIJi
0lyiAP9BYEhi78cgiuyY4EJyb87Pi/R3VwKDPk6tN/UiBYxD8QD7BdhHh5jX6e51
xmsnQRqdYF7y1UNW76jBO9VI4GrG/w0=
=i83T
-----END PGP SIGNATURE-----

--Ex3+7jnV//1NaCLU--


--===============8279101956861133309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8279101956861133309==--

