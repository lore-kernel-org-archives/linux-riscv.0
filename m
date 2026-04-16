Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD85F8A171
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFoV+R+75q+zLj5d5wtb6epAQw7g3174C3V/o6TWl0M=; b=0HRXNbKRXG717wyjF0koVRONn7
	otAETjBZpZgKBCqJZFvgxRPN8D4GWdR8U0csc76sWT1SPFlZCv2o/8NzvgTB4Dk6Ocxu0TQ3Tvrnt
	CdYKwgJRAQVwg48BgmP55B2tyHPowcTHbOOeWvcjGVjlbXmGjWa+uDUjuzwbw8wh3CmzPFbexfXHn
	4NgDItuo3S4zX+xBJm+5fY2Ob9jUSYNYmSzUUnOr4iTiD0Law27FDBTs5glsg3Ei1stDBHOK2MlC+
	pSNvwFaaDF3lvs73mW2RargP5LfMWCveERc3HaZkPD3yKMHwkVtf7rBVltmDNu6DOfNXB2137Lz/y
	7X1qnVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMpO-00000002VKb-41tS;
	Thu, 16 Apr 2026 13:32:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMpO-00000002VKU-0qNi
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 13:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55BAB60127;
	Thu, 16 Apr 2026 13:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93233C2BCAF;
	Thu, 16 Apr 2026 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776346337;
	bh=5jsNdZAvPN/aQ7v/9RuVBlZFv683BHPvvfUu6mF73hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jN5L9trElGou4obH5qOghM3n6P7ClcTzG3YlITNqughPsg6inyd+UhrYDn6V0Tt7A
	 wwI1iFhkAym3xTYfgJVeISrLNtYzfsVxvitCY51WeF7sUCLBvSm0RTCorAzpXBNtjx
	 HXInbIbidFRVsuKMclvwIFQqbCGjN0k2m8f2JJYuRFcyu5UaJpUYNaucQ3rUCgz0n8
	 ikzATsi+Fc3vLWEnpOn1vQ9n4KPm3IsYuwgfTST9Kc2mt6p+JBclpX9Jo8VBQlyB0S
	 XQ/cffFP6xgQnN7dByUI0DW0ByPq1D/wm3DMmeOmO+5TnkepuhiOs7jymCa+2XoAga
	 rKPpNITXZoIWg==
Date: Thu, 16 Apr 2026 14:32:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: microchip: mpfs-sys-controller: fix reference leak
 on failed device registration
Message-ID: <20260416-wish-impatient-f69a28478f89@spud>
References: <20260415181635.3699592-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260415181635.3699592-1-lgs201920130244@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2184396793300403411=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2184396793300403411==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FonTAm9wP9KVSW0Z"
Content-Disposition: inline


--FonTAm9wP9KVSW0Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 02:16:35AM +0800, Guangshuo Li wrote:
> When platform_device_register() fails in mpfs_sys_controller_probe(),
> the embedded struct device in subdevs[i] has already been initialized by
> device_initialize(), but the failure path only reports the error and
> does not drop the device reference for the current platform device:

Patch looks reasonable, but not urgent so I will pick it up after -rc1.
Looking around it doesn't look like this will be a unique patch, so for
other I would suggest that...

>   mpfs_sys_controller_probe()
>     -> platform_device_register(&subdevs[i])
>        -> device_initialize(&subdevs[i].dev)
>        -> setup_pdev_dma_masks(&subdevs[i])
>        -> platform_device_add(&subdevs[i])

=2E..you redo this section, as it's not clear to me what this actually
is trying to communicate. AFAIU, what's wrong here is that
device_initialize() calls kobject_init(), which needs a kobject_put()
to clean up after it on failure. But this code snippet doesn't tell me
that, I had to go look for where the reference count was actually
incremented.

>=20
> This leads to a reference leak when platform_device_register() fails.
> Fix this by calling platform_device_put() after reporting the error.
>=20
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>=20
> Fixes: d0054a470c339 ("soc: add microchip polarfire soc system controller=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/soc/microchip/mpfs-sys-controller.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/mi=
crochip/mpfs-sys-controller.c
> index 10b2fc39da66..404c31daf459 100644
> --- a/drivers/soc/microchip/mpfs-sys-controller.c
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -168,8 +168,10 @@ static int mpfs_sys_controller_probe(struct platform=
_device *pdev)
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(subdevs); i++) {
>  		subdevs[i].dev.parent =3D dev;
> -		if (platform_device_register(&subdevs[i]))
> +		if (platform_device_register(&subdevs[i])) {
>  			dev_warn(dev, "Error registering sub device %s\n", subdevs[i].name);
> +			platform_device_put(&subdevs[i]);
> +		}
>  	}
> =20
>  	dev_info(&pdev->dev, "Registered MPFS system controller\n");
> --=20
> 2.43.0
>=20

--FonTAm9wP9KVSW0Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeDk2QAKCRB4tDGHoIJi
0uYlAP9jlC5TikxBBsshD3f6NCvCqkS5wpSKKXQ+4PDgxaTRsQEAmdxEMQNOD5Rz
WSFeZN4GxrQyxQZbhSI/TV4vWuk9UA0=
=cUvj
-----END PGP SIGNATURE-----

--FonTAm9wP9KVSW0Z--


--===============2184396793300403411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2184396793300403411==--

