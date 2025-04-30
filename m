Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F47DC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFNAjwZIaFCbmcvdyCg6iyPyNdniyWuCxu1+cYia5DM=; b=Fr2+vQZVNdA7t+DsVh9AKGoW1r
	fq0Ut8PLEdI3uG/7Ns7IVCA1IfVH2/o3UlgspLQw7UYpZcMaUWg60TZLvuaUQwth7z/NeAGQbcbg2
	k/FQ0DoE4w9K9RMkaIavDzssYtsR26/SLVwnWlJiDbEWZSmWlffoKd1wqni89bQ7AZPfMC9EeMyo7
	3AnzMF945YXYD8D4eb8dUg3l0fbPFPwX7ADQZLhcL7SnJe1Jrw75PJGqZVS6ZvEDBrgDH/NhcIycu
	75/47ihbimpwtnxWckDVXvLjtiRoMu7Lr9P+VC0SCFdNsrbcNQVO+KT1XpHTlhfxrMXBA4dHn6vNr
	pp8K+mJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9SN-0000000DIZ0-0sE0;
	Wed, 30 Apr 2025 15:34:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9RT-0000000DIQM-0UxL
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 15:33:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6643DA4AFAA;
	Wed, 30 Apr 2025 15:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4915C4CEE7;
	Wed, 30 Apr 2025 15:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027225;
	bh=GHWKyQrFtLFEsAd9D7tQib4YQeKEyzwclNeqeYd5kDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlCi7ebiNQ2BeVFzNkiHJCVx2MJpTnsEJyICSPJLgM37NV9QR6HzhAOKxILNrsyBU
	 23bQE9a1E3Wtqkv5QqeIX9Ie6gp/+w1qVmuI+6vPSpvYJf+cCFAEVwBkg4UOdj4Ve6
	 1dTWm+j9zifDYh0uPTZev0uqikTu4AmG5UoCSmWDhuoq1Qn2CQ9Zn8Y+UQ+Z+KiLID
	 2JMle4z70AZRD3IDR9ZwGWLgKU12xysOE9QxCG4kMJ4W1upVvzbMcXwv5NALZyQ5x4
	 PGAfvELPB89tzkjbmB0Ttw9kDAwAZ6rdrUkvS+tCXzj95WXihFKS9xqmklDV/3Wu4x
	 AcEKRHaBrmj1w==
Date: Wed, 30 Apr 2025 16:33:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <20250430-radiance-rebuilt-2caa906d5e6f@spud>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250430020932.307198-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_083347_224008_752809C8 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Type: multipart/mixed; boundary="===============2818303210332858715=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2818303210332858715==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sMKL3DI6Jh6onOT5"
Content-Disposition: inline


--sMKL3DI6Jh6onOT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> Add of device id definition for newly added precise compatible.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/clk/sophgo/clk-cv1800.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1=
800.c
> index e0c4dc347579..e10221df6385 100644
> --- a/drivers/clk/sophgo/clk-cv1800.c
> +++ b/drivers/clk/sophgo/clk-cv1800.c
> @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device=
 *pdev)
> =20
>  static const struct of_device_id cv1800_clk_ids[] =3D {
>  	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },

Given the same data is used here, should there not be fallbacks in the
dt for some of these? For example, 1812 to 1800? Or is that not okay,
because 1800 is not a real device id?

>  	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1800_desc },
>  	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> +	{ .compatible =3D "sophgo,sg2002-clk", .data =3D &sg2000_desc },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
> --=20
> 2.49.0
>=20

--sMKL3DI6Jh6onOT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBJC0wAKCRB4tDGHoIJi
0kMAAP9ZKNc6a0xYBkYr8oqooliJY8N3PWy3hSRIU/+E2sr52AEAjzrVNBdoDTN3
S37PalSpc7ohjoXJsyX87gDgmKv1kwE=
=EuHX
-----END PGP SIGNATURE-----

--sMKL3DI6Jh6onOT5--


--===============2818303210332858715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2818303210332858715==--

