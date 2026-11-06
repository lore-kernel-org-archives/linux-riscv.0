Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5AC606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OHZSI9yO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8j21BF6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bvCZ6nvz96GIrqQEhPHCxmp0WT4Jh95ZIc4+IvxN+YY=; b=OHZSI9yOyPrUWh8QPn+tS3MWvU
	PQ+XgwrUhjPWbKFgfza2iGe8BUGCehBSL+j0YHXeOSS7abnFhiykxXqgFWgRTTWu/OOLB4WeHKNMU
	lbIhL4uRduijd4cuHwzSVkG2LK3erFwJzPkFm8Zo37XZEuJDFViKgz5hkAwGT6e5bCFNhKBLCEUmD
	uUuhds3JrP8qbfRYRZ8/J9BO73NvQ1DAhB+EwLNwPdJsuidscJfqW4yznUGLiOQJRT6+SOLtv+4VB
	CkY3UlKoRuig/iY6b8xtP5ud14XrHKmLYxD7ikiNj8DRcsp+sr/uGyUNiUKe+eQSTl6ildpFihO4f
	7Ci5SWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPI4-0000000DUn3-0Djn;
	Fri, 06 Nov 2026 19:07:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPI2-0000000DUme-23G3
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 19:07:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A7F660052;
	Fri,  6 Nov 2026 19:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642431F0089F;
	Fri,  6 Nov 2026 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793992073;
	bh=P07fX1QRePkjwdoUnrLtLEnGh491BsMLz2o8OoxavkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8j21BF6e2+02oNscQMK3XQRbTjU2v33Z2XkNaeBIsLq9wnPDR8ZB2bFRWbRT4h+y
	 07PDjK87xueR4EGOjtaseEX2KwgBim9ZpGNHVPifIa0glUPq66KuM/PDTfIsl4Kzsx
	 8NZhSHvdbOYKyTRw9z6w92eHpJxEqmZJLjgkU1HrFDSiaxLsttCTEC0Cw3htaFASQA
	 kewE7EIQQsswqKeoW7+eOap+gMizpaLBnTtVdjaesTZM2AWf6uI8COxZGMTIgC3BkA
	 buUAtJdjjZvEXgrbc4jBYvaz0TMeJnP6YIfN/9TBj9TgBesVe+qYS+Jb3TGfwLzOZ6
	 aTyHWv3XKTJxg==
Date: Fri, 6 Nov 2026 19:07:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: mpfs: unregister the generic PHY device on
 remove
Message-ID: <20261106-coveting-unclip-525e1e9dec65@spud>
References: <20261104021522.1468663-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261104021522.1468663-1-vulab@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1107389556208988414=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1107389556208988414==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jVM147u5aDo92KWD"
Content-Disposition: inline

--jVM147u5aDo92KWD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:15:22AM +0000, Wentao Liang wrote:
> mpfs_probe() creates the "usb_phy_generic" platform device with
> usb_phy_generic_register() and keeps it in glue->phy, but mpfs_remove()
> hands the controller's own platform device to
> usb_phy_generic_unregister().  The generic PHY device is therefore never
> unregistered and its reference is leaked, while the controller device,
> which the driver core is in the middle of removing, is torn down a
> second time.
>=20
> Pass glue->phy, as the probe error path already does.
>=20
> Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb con=
troller")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Isn't this a duplicate? I'd swear I acked a patch like this from a Felix
Guo months ago.

> ---
>  drivers/usb/musb/mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index 587127abd30a..6cc2909b8ae3 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -357,7 +357,7 @@ static void mpfs_remove(struct platform_device *pdev)
> =20
>  	clk_disable_unprepare(glue->clk);
>  	platform_device_unregister(glue->musb);
> -	usb_phy_generic_unregister(pdev);
> +	usb_phy_generic_unregister(glue->phy);
>  }
> =20
>  #ifdef CONFIG_OF
> --=20
> 2.34.1
>=20

--jVM147u5aDo92KWD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4lhQAKCRB4tDGHoIJi
0ixKAQC00+LKzozTo9PiPnk6ZQjCO/7J5xZlVgKbknNlG1wGGgD+NFBS8GaX6DBT
2OkMIvmdC7qEmK7VA2z6es6e+g/xEA8=
=0xFQ
-----END PGP SIGNATURE-----

--jVM147u5aDo92KWD--


--===============1107389556208988414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1107389556208988414==--

