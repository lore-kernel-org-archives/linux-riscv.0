Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999A8C83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2J8Gu3WutQXguYRw260LBSaDrBSkZ0Q/OMm0wzxrcWw=; b=UCbYAl8L6BWXACav3r54R+uBR3
	Ss6eaMVLz21OfRgMTfC8cgoAJrrzKYHxvn60LEs8d1SLREFuCCnXBytEuEtBFHlrpgEgaOLrpjTuz
	2rJXqN4CcPuxlojFvTl+AJGhIgM/KwswzTaPKd5ZqI0c4+ko+DouUxi+fm+ex5bbg3sagRYuo9rLX
	xRTEZfFXS6lC7NEiqQhAli+yR07HIwnYUv47jZhp38+hCP+NH+oR0aawRMcJQlw8YYBNUO92ifoRS
	VoybqJpdrQ6y1KOoZk7QeVwqKo3DtYHLQKMir8uL4Jxw7JDE1DU0VsDneaD2z0VdL9B6Bm8pwf/2t
	LjdPefsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaa3H-009Tc9-15;
	Mon, 28 Aug 2023 11:04:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaa3D-009TbB-1B
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 11:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693220695; x=1724756695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ri/l6M8mpTkwkRbAXaHeiv8dKUXmvnnn0gDOniLyOtY=;
  b=yYtQ0rdXGnEn+1Fw+EoKGLiXdLFFATnlOLxxWvoEdfxKkVNZ24lRqK/d
   0sngcYdHNHsl70qr01jkYwfEYg0rJX/CKejNmFHHHJIjiamKqBA1A/9kt
   8yDRsJf9BOsmFspSiPax8qBaBqywVl5hR4toJqRPTMYKmibPfYJcxvcj1
   vP9fS+psLXKSW1hk+RzOw8OgzB2npvcTymr7EORslmlaPBAgN569NcO6X
   Bbe5bbZV9IG4Sf1jTUpuFfV/5S+0NfTdXFJXxNvt39Zs3lLO7zfSj0vrj
   jKZ509lqtXY+VnC+KKaqTsk49HXwfsRWSuhMCTRgeZ2Bkw9hhs4s8+G1X
   w==;
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="asc'?scan'208";a="232063736"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Aug 2023 04:04:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 28 Aug 2023 04:04:11 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 28 Aug 2023 04:04:10 -0700
Date: Mon, 28 Aug 2023 12:03:28 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrei Coardos <aboutphysycs@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <alex@shruggie.ro>,
	<herbert@gondor.apana.org.au>, <olivia@selenic.com>,
	<daire.mcnamara@microchip.com>
Subject: Re: [PATCH] char: hw_random: mpfs-rng: removed unneeded call to
 platform_set_drvdata()
Message-ID: <20230828-citable-superjet-d235f036be99@wendy>
References: <20230828101757.9724-1-aboutphysycs@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230828101757.9724-1-aboutphysycs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_040455_427149_4E790AE1 
X-CRM114-Status: GOOD (  19.28  )
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
Content-Type: multipart/mixed; boundary="===============1542627956720903871=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1542627956720903871==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ybobh3J4aOaUG3ga"
Content-Disposition: inline

--ybobh3J4aOaUG3ga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 01:17:57PM +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.

I think Greg previously pointed out to you that is it not sufficient to
check for platform_get_drvdata() alone, because the information could be
accessed without going through that helper. That's not the case here,
but it could be true elsewhere.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/char/hw_random/mpfs-rng.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/char/hw_random/mpfs-rng.c b/drivers/char/hw_random/m=
pfs-rng.c
> index c6972734ae62..0994024daa70 100644
> --- a/drivers/char/hw_random/mpfs-rng.c
> +++ b/drivers/char/hw_random/mpfs-rng.c
> @@ -79,8 +79,6 @@ static int mpfs_rng_probe(struct platform_device *pdev)
>  	rng_priv->rng.read =3D mpfs_rng_read;
>  	rng_priv->rng.name =3D pdev->name;
> =20
> -	platform_set_drvdata(pdev, rng_priv);
> -
>  	ret =3D devm_hwrng_register(&pdev->dev, &rng_priv->rng);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Failed to register MPFS hwrng\n=
");
> --=20
> 2.34.1
>=20

--ybobh3J4aOaUG3ga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOx/AAAKCRB4tDGHoIJi
0phKAQCmLUMIMFTcDFBxCWk4kaHBl9Ujv1n4I9MDnQh4EmQD6AEAj4EuDnlW9UJf
RLVsSRWf8o2NQmLHWByqDCzAnhbTngY=
=ZYKd
-----END PGP SIGNATURE-----

--ybobh3J4aOaUG3ga--


--===============1542627956720903871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1542627956720903871==--

