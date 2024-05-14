Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75518C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZB5Wz1g+GVqAfjDOsSh+xCGF+/NbhLmWoPFCfjuof1Y=; b=WvtM3OAGGj9kyVBnrnAUA81g26
	/+5AvO2mNaDLncYa51W/DrWyW7dmkhdtS45+vAtku5VGLT2SEiDSn6t5wtG7vqGbPL8frH3DOm/my
	W+O2hUK8c55o/EA8vsIUdCXkQXETSwDizrgYqAKGuSRZOLT9SJIq7p1NiyVVZfKqua67mmli7m80c
	Ft36LThj6UiJtQPxPjPNS+xwKPJJx/icI+8nMkXumkD7k2nll13D8DxbSDi+VzuD/c/4Gi5wLJb8/
	oKvwDiQqn7QYJr7PhOJzQjUOUkGXmBpWaieSF7A0p1hjTgxERn72FmkTHNGue9Cfbpnev32SZuBM9
	T0dFR4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wOo-0000000GkTW-31hr;
	Tue, 14 May 2024 17:57:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wOl-0000000GkSs-1zcf
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 17:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C1C7CE1267;
	Tue, 14 May 2024 17:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2288AC2BD10;
	Tue, 14 May 2024 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715709428;
	bh=L4rhaJihbyiVB4osf1uPgFvAN8dhp1LCMRxGAjsa0OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRq3zDXKfziGPndKIghDH2Ny/HCHKekmPcybt/UPF+wnk5uRbW+KxG9BFEUwdr/t5
	 03UcWVvXUHD5aGH4/2k0RLBabcigooyfR24Qoim0iKuoDkMnLWTvKxxI/j9pxKZhDp
	 TE7U4R+A/so3UmFi1JxX78NJlPikPr8Dsqv8G75blcOFXXA9g02Uf2khoZfjjAXwMR
	 yjIua2mNhCB4M53pn+/Vfk7FSG9KUkXisPp3I4rBfamcctKwN8Np8W2nA8DD5pETs1
	 NiXp78pno/+siqfjYqEj2PyXVtNyW+EOQXQ0c+lB/wZUoc1nFCSQKny/CV1/4IplR5
	 F6A3LvquuLlKw==
Date: Tue, 14 May 2024 18:57:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com
Subject: Re: [PATCH v2 3/3] spi: spi-microchip-core: Add support for GPIO
 based CS
Message-ID: <20240514-malt-diffuser-2fd207015e72@spud>
References: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
 <20240514104508.938448-4-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240514104508.938448-4-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_105712_082705_AB07BAD2 
X-CRM114-Status: GOOD (  21.29  )
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
Content-Type: multipart/mixed; boundary="===============1565393631328478604=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1565393631328478604==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y+iyNK1SdnhbDI8k"
Content-Disposition: inline


--Y+iyNK1SdnhbDI8k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Prajna, Mark,

On Tue, May 14, 2024 at 11:45:08AM +0100, Prajna Rajendra Kumar wrote:
> The SPI "hard" controller within the PolarFire SoC is capable of
> handling eight CS lines, but only one CS line is wired. Therefore, use
> GPIO descriptors to configure additional CS lines.
>=20
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>

I provided an ack on v1, so here it is again:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

In general you can keep tags between versions, if you intentionally drop
tags you should mention why you dropped them.

> ---
>  drivers/spi/spi-microchip-core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip=
-core.c
> index c10de45aa472..6246254e1dff 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -258,6 +258,9 @@ static int mchp_corespi_setup(struct spi_device *spi)
>  	struct mchp_corespi *corespi =3D spi_controller_get_devdata(spi->contro=
ller);
>  	u32 reg;
> =20
> +	if (spi_is_csgpiod(spi))
> +		return 0;

Mark,

This has no users outside of core code, but is < 6 months old. Is using
it in a driver like this okay?

Cheers,
Conor.

> +
>  	/*
>  	 * Active high targets need to be specifically set to their inactive
>  	 * states during probe by adding them to the "control group" & thus
> @@ -516,6 +519,7 @@ static int mchp_corespi_probe(struct platform_device =
*pdev)
> =20
>  	host->num_chipselect =3D num_cs;
>  	host->mode_bits =3D SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
> +	host->use_gpio_descriptors =3D true;
>  	host->setup =3D mchp_corespi_setup;
>  	host->bits_per_word_mask =3D SPI_BPW_MASK(8);
>  	host->transfer_one =3D mchp_corespi_transfer_one;
> --=20
> 2.25.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--Y+iyNK1SdnhbDI8k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkOl7wAKCRB4tDGHoIJi
0vAbAP4s3UDpCqUDZ7kvX4ikM1pgZrQjOVzd/RDR6106Rr5HdAEAsa9NZW8rS76m
pTMi3kRiV4hfKVd6W17bzh01HOJPtA8=
=Eyq7
-----END PGP SIGNATURE-----

--Y+iyNK1SdnhbDI8k--


--===============1565393631328478604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1565393631328478604==--

