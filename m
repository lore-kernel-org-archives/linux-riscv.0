Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B42C54755
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLF6eplY8sJIL8cew6BGsuVi7gOF5H1L2N0DFoHE3VE=; b=eDVKZXVgtbNthh8wmtWP/ZmmCN
	klfIcbEv6AzULmqmjSPJwkSTlQnKayl8LZFkpwyOs/kN62jayT32sOMcLsp6aCPtdH6nW+fpt2ZBa
	AIgb9yXSo8QGWzSVjZ5fJAUuy6akPr4sSq5I8fnNrNiUMOnHYIj+P0FtDBEYExJlTdIHjBdJGsm7g
	S8WPeXU7FF+Ux/LrhZL1wM9T9Q0fYVaPG+9xctvmHSHreoNIVYNOBvPNEhjWjmZ5BorNz/5iULlK6
	Lsc/zgUfJczRbGclXSyoxbQY3L/+JbO7MuJWwOd+xfHwcIygvSco9uD0HMeI4u4Q8nThInsenkV1V
	akG12Bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGCX-0000000FvSc-2XsU;
	Wed, 14 May 2025 17:47:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEsA-0000000FjeY-1VgJ
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 16:22:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84440A4CA90;
	Wed, 14 May 2025 16:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073E5C4CEE3;
	Wed, 14 May 2025 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239741;
	bh=mkPxsxNPjzzx9i9GVPi5vlxhW8vk9V43kD1RHRJzCCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irMGuZYDd8bvJ1e00U0sTewWC269gAOA7L2o/hmAuJ+vrDvYHWVas34bxJ93/Qexb
	 WTaZMwgP/DXON86Ph1hM8ylwVtdWksG/93craHsfcjfM0mmJjfZKGjEfVJIuYyPlZs
	 Ea3T4IavXBAv7gHBeUKuuRFepZE5pocjw8tXKJFNkWGZ6j97k/mNkHYbiUn1SI5UC2
	 BbmUJ96O06jMYw7plE9yXNpO9xTtI963QRy1qVKKfmJbscYsO9BC3vjX9Uq0uioBlC
	 Bl2s6blzkfGXlLkj+k5+GE1kMoskdPAtAF2wLtR/QFOh92Zq/Rk69najYeIArse+1g
	 qSoSE7zGYCn5Q==
Date: Wed, 14 May 2025 17:22:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X
 bindings
Message-ID: <20250514-showplace-yahoo-e3c306355288@spud>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_092222_464662_1DFB62E1 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Type: multipart/mixed; boundary="===============6191699418003042120=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6191699418003042120==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7UDxVnWJGD0g3CFl"
Content-Disposition: inline


--7UDxVnWJGD0g3CFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:08:59PM +0800, Han Gao wrote:
> Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].

1.x? Is the v1.0 something people can get their hands on, or just the
v1.1?
What differences do the boards have that are minimal enough that
specific compatibles would not be required?

>=20
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042=
-x8-EVB [1]
>=20
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docume=
ntation/devicetree/bindings/riscv/sophgo.yaml
> index a14cb10ff3f0..6c82f89b56ca 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -34,6 +34,7 @@ properties:
>        - items:
>            - enum:
>                - milkv,pioneer
> +              - sophgo,sg2042-evb-v1
>            - const: sophgo,sg2042
> =20
>  additionalProperties: true
> --=20
> 2.47.2
>=20

--7UDxVnWJGD0g3CFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCTDNwAKCRB4tDGHoIJi
0vXPAP9Ud347xUYL9mWkLJDvlSeTXN7R4fK2+cr+R2ZRLEzdBgEA5r5sTsY1liH7
8/Xr/3/P985Z4HyLF3wA7ywP/WYoiAY=
=scVY
-----END PGP SIGNATURE-----

--7UDxVnWJGD0g3CFl--


--===============6191699418003042120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6191699418003042120==--

