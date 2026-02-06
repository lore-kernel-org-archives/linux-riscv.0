Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3361EE6B4D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUxL/hmBiz5ZP5CP0oUbrYnKogCNGj2hYNOA9jC0CkE=; b=gjeR1VIRlx6AW8Wd+44MVSipu5
	9x5NnbGl906mX+pOR++GUVjWD4bep1g6holz1WwxQQpyl+e5kOnotFdJTMQpsV0d1lQbghnWuPtkA
	cfAlHaA23NJLYZSZ266gw03J8ic77cFvL3jzp4sGf7ihWWBcfyFWHcjYRRIN1whptcBfoQArY/2ef
	izi7fL6YS0C33FuB0yB7VMjEDSdDRqjewJ9EhJb0l28qg4jXbSbqZ8E8hSGxxFRmuGTbin8rLbvWp
	tnXEQdo3FqWy84r6gXMlwKrKNjmWKWHm8yo63TDIhOsF/WtNT3NgW7BslhQbY95bLBFmLglYtqI6J
	3SllYUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRsL-0000000BlPE-2RIj;
	Fri, 06 Feb 2026 19:52:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRsK-0000000BlP8-1eZA
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 19:52:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 328A8600CB;
	Fri,  6 Feb 2026 19:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD25C116C6;
	Fri,  6 Feb 2026 19:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770407538;
	bh=CJFSsWdO5Opr8LpgB3J13to1nCjR+HtWwfNjRTQ8Yw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIFXG6KH++T6V7fSAY4mYvzOkKP9bxZiq1zidtMLZdDLmfBL58dGSbwPfLzI9FaYI
	 Goceerc3EDi99VYSJ9FHJY0sPKyoZ085W2dvpusduE9QlUDe1EXT4QOU8nzryfEwdL
	 6jR7BsF4sZKNMjtNrOUBW+sxeLxlyAJcaloVZ1Voug7yA/wpY4iY/f8C7D/44JSFpC
	 8um+lwPJL+rlaTz0JoU6UmK0DKdNQ69qf+kwILlKOteQEJXNYZYLQAq8CCuJigafY5
	 Pcns0wQAmKgoEJk0YUEPl07dk5foc3cNtut5vWR5FqY/lMmNRRNSo0tCO6PU+v9Qfv
	 VPvJyteI1PfXw==
Date: Fri, 6 Feb 2026 19:52:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: microchip: mpfs: Fix a memory leak in
 mpfs_sys_controller_probe()
Message-ID: <20260206-neurosis-partner-009242f0ac16@spud>
References: <20260203-mpfs-v1-1-666b8704f8f7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260203-mpfs-v1-1-666b8704f8f7@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0904493530939966964=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0904493530939966964==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="17ifevd45IYDWzDL"
Content-Disposition: inline


--17ifevd45IYDWzDL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 09:03:52PM +0800, Felix Gu wrote:
> In mpfs_sys_controller_probe(), when of_get_mtd_device_by_node() fails,
> the previously allocated sys_controller was leaked.
>=20
> Add kfree() to fix this.
>=20
> Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system c=
ontroller's flash")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/soc/microchip/mpfs-sys-controller.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/mi=
crochip/mpfs-sys-controller.c
> index 30bc45d17d34..a7401cb79e97 100644
> --- a/drivers/soc/microchip/mpfs-sys-controller.c
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -142,8 +142,11 @@ static int mpfs_sys_controller_probe(struct platform=
_device *pdev)
> =20
>  	sys_controller->flash =3D of_get_mtd_device_by_node(np);
>  	of_node_put(np);
> -	if (IS_ERR(sys_controller->flash))
> -		return dev_err_probe(dev, PTR_ERR(sys_controller->flash), "Failed to g=
et flash\n");
> +	if (IS_ERR(sys_controller->flash)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(sys_controller->flash), "Failed to =
get flash\n");
> +		kfree(sys_controller);
> +		return ret;
> +	}
> =20
>  no_flash:
>  	sys_controller->client.dev =3D dev;

This is a duplicate of a patch in my riscv-soc-fixes branch, that for
whatever reason I forgot to push. I'll keep the original but thanks for
your patch.

--17ifevd45IYDWzDL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYZGawAKCRB4tDGHoIJi
0jPjAPoDwTApwoTXqPLgAccyGeWmdXouPdw6RxYbgSJAGbmG4wD/frfXvCbNsNRD
BFX0xlMD1pXQbUJI4Q0QCgdOQuEuNAw=
=TeL1
-----END PGP SIGNATURE-----

--17ifevd45IYDWzDL--


--===============0904493530939966964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0904493530939966964==--

