Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A6ACA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqMLewtdOftOlthhQLrT/WyaDnOjBFXiTeKsI2a3SsU=; b=Gyqn7TySwBr51AbKHpE6EYhllo
	MMtMd8PLVhPAU7tv5FG5GrgX+EVaEclDYDz7JIFBs8YLEJHTLFRL4B1K7+jmNv6E49GAwaAETWOuI
	MgDPwBzF6TrY/j2Yrd8tcLbyw5i1vpqFzOeYFX9izN9fqEbrisFn+5mKkGSlTtfoPjJ5B9H90eKV6
	D5yFRNtYgPuRb48ZsUkCQPdUuQgsjRwtWr55MNtRyF873BsM4/Vr7fvKsEwlG6Tu00xIiXX3lmqHA
	rAMSyJmD0ge0Ud1XQwpDJ2fHkJzjP5lsN31v9fxxzK3W/e/DiLI2M23m05KgI4vJPcdx9G0uN7iPe
	Kno7OslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6B4-003p4K-0n;
	Tue, 12 Sep 2023 16:23:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6B1-003p3e-0F
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 16:23:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62B4D61470;
	Tue, 12 Sep 2023 16:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0E8C433C8;
	Tue, 12 Sep 2023 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694535825;
	bh=biFFduZ1C4O3DX/VQihj7MaVYd4W5bX5wM/9wVdt810=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eR0fW+KyZ9Eq2rtV2L9yQcFxmU2NXDiOo79n6SCdi990t7zSmCIuZG918ca0p7ABi
	 HNNtw2azE5jJFXaLQaX22cYrcDsAyq+PAys56QZSxuMgDCNUc9UB0PYSJkWwTwpM85
	 VkOij5Kmo8l/L4TZP2XDxPEf/EWijK9XazVq7Zl83wawhRvW8GZ4zByo3/vY/nycSe
	 TMPznE7kLaojYC4zRmND6QhDly+vTyOKMu/pUzMCey8iwzfRWT3JyYPU7dstmUSFul
	 c/929Q+Ghwm2xBQUsYb1z+bhz+S3RyEU7ezTkcAFrHMJuaS/KW0BJP6RuQ+wsesqRu
	 0iEJuyxKDEJTA==
Date: Tue, 12 Sep 2023 17:23:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Jinyu Tang <tangjinyu@tinylab.org>
Cc: william.qiu@starfivetech.com, hal.feng@starfivetech.com,
	conor.dooley@microchip.com, palmer@dabbelt.com,
	apatel@ventanamicro.com, ttjjyystupid@163.com, falcon@tinylab.org,
	wangjiexun@tinylab.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: defconfig : add CONFIG_MMC_DW for starfive
Message-ID: <20230912-breeching-zealous-84c859e90eb7@spud>
References: <20230912133128.5247-1-tangjinyu@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230912133128.5247-1-tangjinyu@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_092347_176111_56B457F9 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Type: multipart/mixed; boundary="===============5295068787481577209=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5295068787481577209==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tOfKvfF/NMI329BY"
Content-Disposition: inline


--tOfKvfF/NMI329BY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 09:31:28PM +0800, Jinyu Tang wrote:
> If these config not set, mmc can't run for jh7110, rootfs can't
> be found when using SD card. So set CONFIG_MMC_DW=3Dy like arm64
> defconfig, and set CONFIG_MMC_DW_STARFIVE=3Dy for starfive. Then
> starfive vf2 board can start SD card rootfs with mainline defconfig
> and dtb.
>=20
> Signed-off-by: Jinyu Tang <tangjinyu@tinylab.org>


Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> v1 -> v2:
> Change the order of these by using savedefconfig, thanks to
> Conor Dooley.
>=20
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ab86ec3b9..76c43a532 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -169,6 +169,8 @@ CONFIG_MMC_SDHCI=3Dy
>  CONFIG_MMC_SDHCI_PLTFM=3Dy
>  CONFIG_MMC_SDHCI_CADENCE=3Dy
>  CONFIG_MMC_SPI=3Dy
> +CONFIG_MMC_DW=3Dy
> +CONFIG_MMC_DW_STARFIVE=3Dy
>  CONFIG_MMC_SUNXI=3Dy
>  CONFIG_RTC_CLASS=3Dy
>  CONFIG_RTC_DRV_SUN6I=3Dy
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--tOfKvfF/NMI329BY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCQjQAKCRB4tDGHoIJi
0unBAQDNHlf3rnnuIDjF1ENKvc6GsCR/WCMXJ+6S2YLmJ5M8QQD9HQzsZqQnlVZc
fOvWx1ylOXG7jDJHiIh+c39+luEFBAY=
=6mo+
-----END PGP SIGNATURE-----

--tOfKvfF/NMI329BY--


--===============5295068787481577209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5295068787481577209==--

