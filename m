Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E494CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgQpXwu/RrPcZqnF063TRC7I+8lI3S1UzjPT7JQF5Wg=; b=p1h4ChMwS38d87rPynr2c+RZ8t
	FtXDj1FEF3n6/VEvrRcEV/Ov8r2MQksUtrbLGG3TvMiCmjfLTCmKA83b/I8F2Hf3GmhH3CJ77PTEV
	qgC/4G6O0RYzw+EFckDqKtDvg8m7t3PO7K+jl9rimsp8Fz618dzW9mZGlVlTZkf5llXjoTv+DaKp5
	VxDdlcBYo4cEMzTHPXl6dZg+TV7lC+S2v7XOAYJtxSSo8qdj6K0qHJMqB9ADqatXeQtP+15HPRWaI
	JPPejyfKGYUp0kfks/F6zGyEJF46cZ/Ibl87LBZknevNK/iIyr7pW6O5XzIk50lxNeko2wDLGxhLk
	EZLWh3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChN4-0000000CDoe-35Me;
	Fri, 02 Oct 2026 17:48:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChN2-0000000CDoX-426o
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 17:48:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0797660A52;
	Fri,  2 Oct 2026 17:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE511F000FF;
	Fri,  2 Oct 2026 17:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790963311;
	bh=ykPG4LTazY7mEGUpCqq30LX7Z/QJVbAjnGxXM3vIyyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J7tgbc9gdAobHCnQwaLwlrM+iOu4owVdRLFlB7mQn/Lkg8d0FAo0jhN2r3gvia8Yr
	 eRfrceZztwtDFCOrV7us2JN3oKx9mO4x3/rODjyLaPiTEGooUEHKONN/brg3bJzQZe
	 3j7RLIn9ppKNzux/JSkJX9w8Imu1yZhGTWR66IKkPTN6F0Ke/NexI1w+Y8wkK5Dohm
	 1GVetnxB7iOSMBiKvPuvvU7wyHvrw3FXSBSrb63OkVjF3Nlg9a0NJyRoP/wD26zg1F
	 AkxhfM20LAG0RvS1OWYpm7D6YaSj3CWfklrU/mvj7kvgobuWDcTobUmD2q81KFs8zg
	 eZwScsgPdgp0A==
Date: Fri, 2 Oct 2026 18:48:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: microchip: mpfs: Fix flash leak in
 mpfs_sys_controller_probe()
Message-ID: <20261002-garnish-president-6e8abfdacf4c@spud>
References: <20260917153550.2160672-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260917153550.2160672-1-vulab@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============7655146170207532922=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7655146170207532922==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AeA2r8DeWrkmCnTz"
Content-Disposition: inline

--AeA2r8DeWrkmCnTz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 03:35:50PM +0000, Wentao Liang wrote:
> of_get_mtd_device_by_node() returns an MTD device reference that the
> caller has to drop with put_mtd_device().  The probe error paths return
> without releasing it, and the reference stored in sys_controller->flash
> is never dropped when the controller is destroyed either.
>=20
> Release the flash on the probe error paths and in
> mpfs_sys_controller_delete(), so the reference is always put.

Is this diff sufficient?
If probe passes, shouldn't the driver also call this during removal?

Removal here just decrements the refcount, so the delete function is
where the call would have to go. Another patch for this driver pointed
out that the teardown code should actually call mpfs_sys_controller_put()
https://patchwork.kernel.org/project/lei-conor/patch/20260924110054.1553880=
-1-lgs201920130244@gmail.com/
so the right thing to do here is probably a mix of what you've got here
and what was done in that patch?

I note that the other user of this function, u-boot-env.c, doesn't call
this either.

Cheers,
Conor.

>=20
> Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system c=
ontroller's flash")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/microchip/mpfs-sys-controller.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/mi=
crochip/mpfs-sys-controller.c
> index 92d1142a59e6..ad57b09e5807 100644
> --- a/drivers/soc/microchip/mpfs-sys-controller.c
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -98,6 +98,8 @@ static void mpfs_sys_controller_delete(struct kref *kre=
f)
>  	struct mpfs_sys_controller *sys_controller =3D
>  		container_of(kref, struct mpfs_sys_controller, consumers);
> =20
> +	if (sys_controller->flash)
> +		put_mtd_device(sys_controller->flash);
>  	mbox_free_channel(sys_controller->chan);
>  	kfree(sys_controller);
>  }
> @@ -159,7 +161,8 @@ static int mpfs_sys_controller_probe(struct platform_=
device *pdev)
>  	of_data =3D (struct mpfs_syscon_config *) device_get_match_data(dev);
>  	if (!of_data) {
>  		dev_err(dev, "Error getting match data\n");
> -		return -EINVAL;
> +		ret =3D -EINVAL;
> +		goto out_free;
>  	}
> =20
>  	for (i =3D 0; i < of_data->nb_subdevs; i++) {
> @@ -174,6 +177,10 @@ static int mpfs_sys_controller_probe(struct platform=
_device *pdev)
>  	return 0;
> =20
>  out_free:
> +	if (!IS_ERR_OR_NULL(sys_controller->flash))
> +		put_mtd_device(sys_controller->flash);
> +	if (!IS_ERR_OR_NULL(sys_controller->chan))
> +		mbox_free_channel(sys_controller->chan);
>  	kfree(sys_controller);
>  	return ret;
>  }
> --=20
> 2.34.1
>=20

--AeA2r8DeWrkmCnTz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/ubAAKCRB4tDGHoIJi
0q9gAPwOqw6b+rPa2O3uY3QDQsysyaypgaQIPm3etHg877e13QEAyW0l4YP6uI2r
ExrwZKUFMctUPZcDqWEQsuHc3TJFQQk=
=7bV1
-----END PGP SIGNATURE-----

--AeA2r8DeWrkmCnTz--


--===============7655146170207532922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7655146170207532922==--

