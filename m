Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3D6FF886F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 02:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhDheDqgexRx7e5gdWoeyw3x6OZXjH77q1wm3UQvhkE=; b=WDdpHMADaPvlJW/8LDiHQYIszI
	TblQRseLlCxsq/KvAQW+iSZC1QUq5TV/bJVfpzMujQB0IxrvDU7edc2zzn670tDQ/skHbeSWnySo7
	q2c6v56pGdAsK+IptqWuhV5b2LGIo02xGHLcCQgLz0AE+LzMthl3K04YsYdizA4sdWpdu+l5+BAkb
	9ypI89sd7joXDiJQWaOoUV+1mCnVfPOtV+pHuPG8KL2Q5FrZS8Y0eDpxf5WEuq/evmuozY5Em8x8O
	rK4msQj4kE6gOlgDDhXk3V96cplIvLnc2ly1P0eypxXEXsScc45J3Uu5o3Y9xvkKxfQz5Lc92dHMl
	fGKnPncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHuKt-00000002lHU-3ZEZ;
	Wed, 29 Apr 2026 02:07:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHuKs-00000002lHL-0V57
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 02:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B95296015B;
	Wed, 29 Apr 2026 02:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3E0C2BCB7;
	Wed, 29 Apr 2026 02:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777428452;
	bh=2Q7QJmrzfUIV3u6Q2zRjAHkmQNZQ8sJEgfn9JuqHxgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhPYOZIQAnuZtUFkLvJrZ7l+TPAXd2qjCLVO9KP2r/PXHAFC26WmyAbtAtk75WWQs
	 9Dxtp2yJ22noHN0fbOf8OkzxyxpnfGzG7JOwdi/JJcByAsYYJt6KgDE6EkTd0+cKCu
	 q8TpzhJDscvnZ1ODOhQ6X33U5hGwrfJrG73h/nmpNExRSHz3WF3mnAysVN73z46Lhh
	 bf/e5l9QcivI6Z9ari4t2W1CGVsWM9y+gAUja+cxwHJTGRMqX19aHpjuoHBjHmdeBg
	 B36O5o3+3+5pngIpfpRsnON56vcKy/3s0tx5NhzRV6TA2BHwW5JtLIq6XVyns7XIMQ
	 ejAH54h+jggkQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0BC121AC584A; Wed, 29 Apr 2026 03:07:29 +0100 (BST)
Date: Wed, 29 Apr 2026 11:07:29 +0900
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] spi: microchip-core-qspi: control built-in cs
 manually
Message-ID: <afFn4dAm3QTzzsAl@sirena.co.uk>
References: <20260428-plexiglas-smith-6ae4e9ba8abd@spud>
 <20260428-perceive-kettle-d42b33eb62bc@spud>
MIME-Version: 1.0
In-Reply-To: <20260428-perceive-kettle-d42b33eb62bc@spud>
X-Cookie: 667:
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
Content-Type: multipart/mixed; boundary="===============2634366282653775752=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2634366282653775752==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6VbyOw/cB43uFUpm"
Content-Disposition: inline


--6VbyOw/cB43uFUpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 05:12:05PM +0100, Conor Dooley wrote:

> +static void mchp_coreqspi_set_cs(struct spi_device *spi, bool enable)
> +{
> +	struct mchp_coreqspi *qspi = spi_controller_get_devdata(spi->controller);
> +	u32 val;
> +
> +	val = readl(qspi->regs + REG_DIRECT_ACCESS);
> +
> +	val &= ~BIT(1);
> +	if (spi->mode & SPI_CS_HIGH)

The core already has handling for SPI_CS_HIGH, you shouldn't need to do
it in your driver.

--6VbyOw/cB43uFUpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxZ+AACgkQJNaLcl1U
h9BMkgf4rRJKK0zLNNtQw9r3kGLLSH3POxNR2BF05mdDucmpDiazwWYzPjHPW19c
VGVyV8GO+x2SjLk56XWUqxk4k0KmMfstb6J6LAz0VEc21KVq24iX9LtUYADtOoUL
ilgtlJ4BMIY8Kj9X5rii4bI9YGUzfQIyEbe3DXKTzXVqx4HJVuhHjjsvmJNgxoZy
d0HWsup0k47uP2MzQTuUgRgZ8Sx0VopoJ6KZdbNS3zQv4+CpCEQzwVtN39UP4gcf
XyJMDWXLFGZLQM+ytda+LiMobyFh0FFxIpdJ+agFTyqLc8bhidiaGd7yi2HuoAo+
M94znkBDEaeqAZLm7Oq6LpkYC3sw
=txPY
-----END PGP SIGNATURE-----

--6VbyOw/cB43uFUpm--


--===============2634366282653775752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2634366282653775752==--

