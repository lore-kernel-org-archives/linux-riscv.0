Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995F7C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krxY/46qAFrxEmaFsQYOjdMhPD3j64fMox/hrVpy1iI=; b=MYOuqY8hbSnXSdiLVvBoZMRzmd
	LBwsjcGUDESG4Oz9JkFNCLqZ/Iz3f4kOt9pXRhc3XzjeLpScb8sMKW64lIB4/hvVdjE6gw1kh/avI
	qXV93UVHwvfkEh6bugoxiN01yX0jFzwgMGlrlwzMzeZuo5M9qKIHTfXKR9adFUL351CAU+Vnw3Rnz
	2fWNwRd7vZkASamUvSwc/sb7r2kFjE+x7hRwiUDlEIjDryfnEjqUQIk2zI/zw40n2FdpL2axYw7QJ
	uAV1el4gTkPJQgkXqAMoBml0enmevHs+WpT2l2aFIP7gVrtErXEprYAOLtE7KZvoexBZPR4tMCmto
	iad8Hxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4Cc-004h3b-1V;
	Wed, 05 Apr 2023 14:33:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4CZ-004h30-23
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 14:33:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1515D622F9;
	Wed,  5 Apr 2023 14:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86BCC433D2;
	Wed,  5 Apr 2023 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680705210;
	bh=c5aBY2DBhngN9K4Itw2DMcABZ4sGhUw7y0a1rjyGhCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6nDCnoku17X5dklyNSz6xW16bkWkXmnbfpKD980MpDJ/g817cgLUNSgJZc+iANs0
	 aK71hhEQCZwy5aus9xDA5W6Ytu5l7EA7knJTJxu+AfPFc3BCzyGljUyHYAk4vTMHHs
	 eHZ16BNdGH9evLEYRQPhrAjA2eL9iAdGrxdoVolTnm7WMMyYFJ99ZJjPRAe78+HDGq
	 yHYxqFLMcgnVqX8qZKMZ8HyiTChdbBfiUj9mlPyLXQLgafNzCFPBx9FMSwou8UCdjd
	 TKnKqovUD0DWbgDIcMXlTJ2+3fMQeNI6mx5Ql0wH9UFnSzdA6whADbATKkJG3XKK1P
	 5JM+QvUlbjOFg==
Date: Wed, 5 Apr 2023 15:33:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 04/10] usb: musb: mpfs: Convert to platform remove
 callback returning void
Message-ID: <20230405-brought-sibling-3b0b62f953cd@spud>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
 <20230405141009.3400693-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230405141009.3400693-5-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_073331_754927_3014420C 
X-CRM114-Status: GOOD (  27.25  )
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
Content-Type: multipart/mixed; boundary="===============5877473900978460385=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5877473900978460385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wHA+4AMy4x1v1p8u"
Content-Disposition: inline


--wHA+4AMy4x1v1p8u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 04:10:03PM +0200, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  drivers/usb/musb/mpfs.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index cea2e8108867..24b98716f7fc 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -235,15 +235,13 @@ static int mpfs_probe(struct platform_device *pdev)
>  	return ret;
>  }
> =20
> -static int mpfs_remove(struct platform_device *pdev)
> +static void mpfs_remove(struct platform_device *pdev)
>  {
>  	struct mpfs_glue *glue =3D platform_get_drvdata(pdev);
> =20
>  	clk_disable_unprepare(glue->clk);
>  	platform_device_unregister(glue->musb);
>  	usb_phy_generic_unregister(pdev);
> -
> -	return 0;
>  }
> =20
>  #ifdef CONFIG_OF
> @@ -256,7 +254,7 @@ MODULE_DEVICE_TABLE(of, mpfs_id_table);
> =20
>  static struct platform_driver mpfs_musb_driver =3D {
>  	.probe =3D mpfs_probe,
> -	.remove =3D mpfs_remove,
> +	.remove_new =3D mpfs_remove,
>  	.driver =3D {
>  		.name =3D "mpfs-musb",
>  		.of_match_table =3D of_match_ptr(mpfs_id_table)
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--wHA+4AMy4x1v1p8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC2GtgAKCRB4tDGHoIJi
0qXoAP42sUj8oS+7QkVJ0H2M2QO5Qv1Ap8ibkzIMfqjUD+r4vQD/fs5ADkb3MBuJ
hN5XmCJz0ovaCWKbBWeUiAc0qPV+rwY=
=yTWQ
-----END PGP SIGNATURE-----

--wHA+4AMy4x1v1p8u--


--===============5877473900978460385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5877473900978460385==--

