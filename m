Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1568C88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 18:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYDEcEOaU2YQf3R0sCqTDSp3UESMVis1jQEfADqyRnY=; b=trtrgRsyWcEQIoAsrbjAyIlZFa
	6hZfsS/gT1xRPcVUCBN0W4YZFnszRBfPpBdz71GMTMXvYkKiJp39jxiibukJCebdznJoO+CnU87zP
	rY1O3qKCQ1lhtYEYrUrKN7D+irs+7pRpnAj6hRWRzEDkszoZTLPPQuwFl7+dJZuvhY/ZgNyguSff0
	3K06xbJIwBpvQGsk7uQbMRmSNwj4W/gBlcT7UAy1FlczxONC1YIlP5A3xNTxVZAf4FTy6jXPNYImd
	aI+hP2WNzZu+74oDqf/Lj0wPgYM3S7SN0ynq9pKilbXEl9CyFv1CNISUJdOccKPvwtxd7tTLBLOaC
	Lqw62QSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XjV-00000007j8v-05gx;
	Tue, 15 Sep 2026 18:18:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XjT-00000007j8h-2Yoh
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 18:18:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3029600CB;
	Tue, 15 Sep 2026 18:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4471F000FF;
	Tue, 15 Sep 2026 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496294;
	bh=BpClQT0zCeCXtjisazYcuc12ibPIv46iStzvnhCCz7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H6QGL+fxIBdSLfi18x9otVp2GlzWnoj34tAVhQ5OHS6udBG+ash4zn8gW5a9T2y9c
	 NXoXQ6rkAdp0t5AeVfylCNja2r9poCjwdPsRQJMAbTfS3Ftc8yh8gLnGt3zzfpCIwC
	 WUwmRMml4frM2vQMukd0oqD/ftVwwrlOo61AtTwUhqavtsf6zdQjTGQbxfioZT0H0U
	 pgu0AfFwblooaBqCuxOb30iz1PrDv5NHWaKqLtlM1t0lriJzrFm6AtVtoogDdg3jhN
	 AtokW5Dlt/+tI8AktDCea7jz0yljDw6jM0oFKOvelikMc1DgPfK3/ibD03Res7m2W7
	 v8W1fzLozIE3g==
Date: Tue, 15 Sep 2026 19:18:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: mpfs: fix phy unregister in remove()
Message-ID: <20260915-dragonfly-turret-edc08c3d9244@spud>
References: <20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3016561661323880141=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3016561661323880141==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="omVCae4kjxR9wWO+"
Content-Disposition: inline

--omVCae4kjxR9wWO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 07:09:13PM +0800, Felix Gu wrote:
> mpfs_remove() passed the glue platform device instead of the
> registered generic PHY to usb_phy_generic_unregister(). This
> unregistered the glue device from within its own remove
> callback and leaked glue->phy.
>=20
> Pass glue->phy instead.
>=20
> Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb con=
troller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

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
>=20
> ---
> base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
> change-id: 20260914-mpfs-086b7d22f8e5
>=20
> Best regards,
> -- =20
> Felix Gu <ustc.gu@gmail.com>
>=20

--omVCae4kjxR9wWO+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmL4gAKCRB4tDGHoIJi
0uV9AP96ayAyrTG/Lj+N9KOKFiwtwjRumNI9HBvLYBmXJRfa/AEAttLq9LKtHoE2
xrvnORw6kw9TqE6ShAhLMwXnjUhpWQw=
=EbnR
-----END PGP SIGNATURE-----

--omVCae4kjxR9wWO+--


--===============3016561661323880141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3016561661323880141==--

