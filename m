Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C17CC001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 13:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sGOuwJ3GkQlGfY4VhSBXAld5MiwCzrOsAGVL6b87ng=; b=rMlF+qeqXmaro/mF8E8iwC1nEi
	GN1F6uR4A09va6diPIv6nY8TTl+1+HLagOsFF6+jWFVabpfZ1tlEAJ9Z6uCs5VIS95MXABVBN6jM2
	3G9W0Ysnd7i/ycc26a7/+t04aRQ0EKqYDl5t7hJBR+98g+Jp+BcO25QyDKHZyWJHoKkilOgariamA
	3huKax6cqOnCS4ks7aTbtyrIXvU6/BewG9/0lB6dzbpZuRwIXKeAK/s1BvI+j8qV5ndlqPgZUoD8K
	/ZNkwKrfQAJzB/LicDvjhMA9zacm4Cg+xo9ayMFOaYm2fDYzG9erX6fDaufU1YN7qVMVuwFk2DQ1w
	hyOgP3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP18y-00Ebt1-2W;
	Thu, 27 Jul 2023 13:35:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP18v-00EbpN-06
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 13:35:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75C9561E87;
	Thu, 27 Jul 2023 13:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81350C433C7;
	Thu, 27 Jul 2023 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690464899;
	bh=ub3Ru2u4FgF2jnEfV/jZZTeojhMCgK49KeNRHdZNOKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAwT2d+6QEh1uThhtytBrxaplR7FnJdX/sXrZSJqKtD7dRNrWiNH2GeWvawbV/Z6T
	 TbY7CIM/qsmty0CsyxLJMqCnjTrigwVs/gz7GfE58diVZY7BZ6sH83ldTRzlz9Myb2
	 4XPsEVfqvRGdC1e59nU5OPvfLxgYT6/lNpEegceNyvwIuCEB6sBH8hWIzFn9m5TDoi
	 S9y5bex7BMe9x57sNiBQwD8VltG9uZ6dkh0rf1xyCG8RLjWTv2H1B0/kc7kcs0kkK4
	 vnmMkuk6EQx2omfloK6fSOmmo6CYWheeC2lzcID0ya3yi1OX24xPkM0rvYAaoWFoEU
	 PjBcoo3sW1fCw==
Date: Thu, 27 Jul 2023 14:34:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Jiahao <chenjiahao16@huawei.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	broonie@kernel.org, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH -next] spi: microchip-core: Clean up redundant
 dev_err_probe()
Message-ID: <20230727-curvature-register-6eb0a2c60a8b@spud>
References: <20230727130049.2810959-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230727130049.2810959-1-chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_063501_126045_6AE502C0 
X-CRM114-Status: GOOD (  18.74  )
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
Content-Type: multipart/mixed; boundary="===============1317806251050017598=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1317806251050017598==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pCz3CLMzY8Oet4m5"
Content-Disposition: inline


--pCz3CLMzY8Oet4m5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 09:00:49PM +0800, Chen Jiahao wrote:
> Refering to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant.
>=20
> Furthermore, platform_get_irq() will never return irq equals 0,
> removing spi->irq =3D=3D 0 checking to clean it up.
>=20
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  drivers/spi/spi-microchip-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip=
-core.c
> index b59e8a0c5b97..ac3b7b163db4 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -530,10 +530,8 @@ static int mchp_corespi_probe(struct platform_device=
 *pdev)
>  		return PTR_ERR(spi->regs);
> =20
>  	spi->irq =3D platform_get_irq(pdev, 0);
> -	if (spi->irq <=3D 0)
> -		return dev_err_probe(&pdev->dev, -ENXIO,
> -				     "invalid IRQ %d for SPI controller\n",
> -				     spi->irq);
> +	if (spi->irq < 0)
> +		return -ENXIO;

platform_get_irq() returns an ERRNO that can now be propagated since
the special case for 0 no longer requires handling, no?

> =20
>  	ret =3D devm_request_irq(&pdev->dev, spi->irq, mchp_corespi_interrupt,
>  			       IRQF_SHARED, dev_name(&pdev->dev), master);
> --=20
> 2.34.1
>=20

--pCz3CLMzY8Oet4m5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMJycQAKCRB4tDGHoIJi
0vbKAQDMIGi7PA8ESbPR70ip9vtX/4dk1Xr2XaPRMdGNy4cXggEA8+0oD8meN1hd
QVSVVnCn0vufkZQ9aTOA4rvJIa9OFgk=
=jbY1
-----END PGP SIGNATURE-----

--pCz3CLMzY8Oet4m5--


--===============1317806251050017598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1317806251050017598==--

