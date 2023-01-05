Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D428C4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOUoPJrMMuLxVe+JharLfg9Dutry+Fa4zU2rRCiy2Rs=; b=X1QrflEYea+tHidTmHra3lD8nQ
	5xPimVI35OsDTRAGfeja250Z4SlmsYi/lSm8LqrpuZRQx0MLUrxBUT9ucG8SEd+b9G/NPEIo19qY0
	+jlqoDR8IXznQh+F90sOEK8VP1PoiRtNZq5Y2UhI43Winoni1q5ch2hF+MKDTbdFGUsHIJCY1wxbs
	RaP5fvLpAVWEVeg2nLj6+2e0we5jUaTCfs8StmJDjNPK+/Qu8v6DiNuTgg375cJSBUMVrfZy5BLbx
	8c55x5WLIQxF997A7/ptH1i3GGrw9NMaXinXrrOwUFN8uFyBN9fB35c+W+cXK8tUE8sckDZqq6q/C
	q0Jj1/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWWQ-00ENn4-Cc; Thu, 05 Jan 2023 20:07:30 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDN4o-00AAJz-N9; Thu, 05 Jan 2023 10:02:24 +0000
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2EF42E000E;
	Thu,  5 Jan 2023 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672912937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZFL3qyTfHdN27paTVk6oqvr7A5Y7FRlExyKi8NGY5A=;
	b=o4lTnWDk/szT4G1LfYqkSGS/fTFhsasemGRIT4uKl+cIl4ndNTOnOPODlQma6sxBn/SJdb
	08+0rToEL+FASQlNczHSf/1WUG4hz1DtEu1/DU8vNgmtk0j5WnhFdrDWpsV8huqsTBk0yj
	npDIoEJCvzLHraUFlV4XvQCDsYlPVStQSiRFFF+4M+DF9w6rdTjjVHFSR89IwCoKn6rf6F
	t5MiJ5qpno8DJMczerKiyshDJ1lcuwEWPhxtGQREq5kdu5s0hShD3qicJ9CwhNAfRkZHP3
	zE0pbq8+87tEUeKEmscQ5nfAPD1HNcLYZ88iZFFp5HT/egQnJgo8z/7T+viUYw==
Date: Thu, 5 Jan 2023 11:02:12 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] media: cedrus: Make SRAM section claiming optional
Message-ID: <Y7agJBFqcvqyLNhK@aptenodytes>
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-4-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20221231164628.19688-4-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_020223_079885_53AF6F23 
X-CRM114-Status: GOOD (  19.76  )
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
Content-Type: multipart/mixed; boundary="===============4378132310740290833=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4378132310740290833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8/6s3dcqSbgka7v/"
Content-Disposition: inline


--8/6s3dcqSbgka7v/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sat 31 Dec 22, 10:46, Samuel Holland wrote:
> The video engine in the D1 family of SoCs does not have a switchable
> SRAM section. Allow the driver to probe even when the SRAM section
> reference is missing.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Looks good, I've also just checked that calling sunxi_sram_release with no
reference to the SRAM held is fine (maybe a word about it in the commit log
would be nice, but probably not worth making a v2 just for that).

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>=20
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index fa86a658fdc6..11e859617932 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -257,7 +257,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>  	}
> =20
>  	ret =3D sunxi_sram_claim(dev->dev);
> -	if (ret) {
> +	if (ret && ret !=3D -ENOENT) {
>  		dev_err(dev->dev, "Failed to claim SRAM\n");
> =20
>  		goto err_mem;
> --=20
> 2.37.4
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--8/6s3dcqSbgka7v/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmO2oCQACgkQ3cLmz3+f
v9GdzQf7BBo2ZY1agypl/4WFck7Oxw+wz2H294juvEYfBbZWII+esDVDHiBUiZaw
+iQVeT7ZGMum5E0Mvg+oaLduGhB271eZKHNY/YnEM3NHlwwUvy9TUJhR0iuKrX1H
rLf4NGQrmXAfBVnrnlW2ROIC3kz9DcRwC/busmLyMk025CMM54AlmY0Y8XaiMThq
ic6BTgL9b8a17lwg5G66A9OMNB8ee4WCfssFQ7kriVmFH644tTgtrFS8azGBCsI1
cxA7JGvZJWuJEm9L8PDMDvOm3IAC0djIgJ9gqkbJdCaJqW9H5c6iJBoFOJID6g2l
1SmqmlYcNehm79PXDFiAc9Xpq+Brfw==
=2Hd+
-----END PGP SIGNATURE-----

--8/6s3dcqSbgka7v/--


--===============4378132310740290833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4378132310740290833==--

