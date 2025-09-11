Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0C9CAC587
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ob1emCIePaHXkRsPnVZqY47n7O7YW+0xEDXc50I/ks=; b=Vu7KaCmRe0ce1MqXrlgK3bKVLc
	urmXkHXS8oYAuz7IxUlk7K4FyrGYEHAr0kKYsx+r1ZATF47VwImgHVuANVkVOIR6tjIhJGQhM1New
	r+iufI4z/vCqbUTILQ7dEJ01xgXfJdu8SmjsfMK588aUti0+JWHp4L/GuuLzDSmLzVlt7X3fSBPRG
	y0bAJ+sL5TcfWOoq3S6tjOdup/JEgurujY5n3NTTOobrb1ny77AcLvmYkybIvSPVPIb+QLbc/Z2Ko
	kjatF1a9k5V6DyKXS8hQKFQVjJmOuImO9CiJBKxq5NiPWls9zO5saJjOUoGWEhdWXTTLH7+AgtGGp
	6gVBAsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlhV-00000004dOe-36cq;
	Thu, 11 Sep 2025 18:07:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlhU-00000004dNU-0mhC
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 18:07:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92AB460249;
	Thu, 11 Sep 2025 18:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B3CC4CEF9;
	Thu, 11 Sep 2025 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757614035;
	bh=KpmAWMFxiOXu0TDDYDSlxIlbky8ODpeK2vXhN2ICIQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INoe1vRnK5LM4Wp7u1tuOus/4QP7QQGPulXi98gRJy9dJrY7QndKrpX9oFtdF3cYs
	 MlydeLOMWEjbnjmtejdp22i8iCvRSLg8IlMmSPaZ7dABNJy5ACkCpDbL42DyKLz1jM
	 gW9wkS09ibGCB6+752U+KXbGnBRYusk2Z6tO9aMhPsB7BB1wEsJVuWYhtCpYSFyoks
	 3DbO018CcwtJJ/VnC7+0M5H4IXGs5UfxUaB0w/OqqEfoUQeJfgvq+W9ug75T2DcoeO
	 czRFrmkOUo1WhCzYBGKR6RQH4k+Cen+ofyBGohViVHrQxAM31/Su8SbuFhYRkbsbMA
	 4Ox2AKhBAFyVQ==
Date: Thu, 11 Sep 2025 19:07:10 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v3 0/5] riscv: dts: starfive: Add Milk-V Mars CM (Lite)
 SoM
Message-ID: <20250911-smoked-aviation-b514261e547e@spud>
References: <20250905144011.928332-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250905144011.928332-1-e@freeshell.de>
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
Content-Type: multipart/mixed; boundary="===============6879198086859988894=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6879198086859988894==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QvKMfygXrttvtNJv"
Content-Disposition: inline


--QvKMfygXrttvtNJv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil, This look okay to take?

On Fri, Sep 05, 2025 at 07:39:38AM -0700, E Shattow wrote:
> Milk-V Mars CM and Mars CM Lite System-on-Module both are based on the
> StarFive JH7110 SoC and compatible with the Raspberry Pi CM4IO Classic IO
> Board carrier. Mars CM Lite is Mars CM without the eMMC storage component
> on mmc0 and the mmc0 interface configured instead for SD Card use. The
> optional WiFi+BT chipset is connected via SDIO on the mmc1 interface that
> would otherwise be connected to an SD Card slot on the StarFive
> VisionFive2 reference design.
>=20
> Add the related devicetree files for both Milk-V Mars CM and Milk-V Mars
> CM Lite describing the currently supported features, namely PMIC, UART,
> I2C, GPIO, eMMC or SD Card, WiFi+BT, QSPI Flash, and Ethernet.
>=20
> Caveat with vendor AP6256 firmware files present the firmware loading is
> successful but subsequently fails IRQ wake initialization. Common GPIO
> conflicts for "WiFi" optioned boards having this module:
>=20
> pwmdac_pins:
>  - AP6256: WL_REG_ON>>WIFI_REG_ON_H_GPIO33
>  - AP6256: WL_HOST_WAKE>>WIFI_WAKE_HOST_H_GPIO34
>=20
> i2c2_pins:
>  - AP6256: UART_CTS_N<<UART1_RTSn_GPIO2
>  - AP6256: UART_RTS_N>>UART1_CTSn_GPIO3
>=20
> i2c6_pins:
>  - AP6256: UART_RXD<<UART_TX_GPIO16
>  - AP6256: UART_TXD>>UART_RX_GPIO17
>=20
> Tested successfully for basic mmc0 storage, USB, and network functionalit=
y on:
> - Milk-V Mars CM 8GB
> - Milk-V Mars CM Lite 4GB
> - Milk-V Mars CM Lite WiFi 8GB
>=20
> Changes since v2:
> - PATCH 3/5 delete newline at end of file
> - PATCH 5/5 delete newline at end of file
>=20
> Link to v2:
> https://lore.kernel.org/lkml/20250831225959.531393-1-e@freeshell.de/
>=20
> E Shattow (5):
>   riscv: dts: starfive: add common board dtsi for Milk-V Mars CM
>     variants
>   dt-bindings: riscv: starfive: add milkv,marscm-emmc
>   riscv: dts: starfive: add Milk-V Mars CM system-on-module
>   dt-bindings: riscv: starfive: add milkv,marscm-lite
>   riscv: dts: starfive: add Milk-V Mars CM Lite system-on-module
>=20
>  .../devicetree/bindings/riscv/starfive.yaml   |   2 +
>  arch/riscv/boot/dts/starfive/Makefile         |   2 +
>  .../dts/starfive/jh7110-milkv-marscm-emmc.dts |  12 ++
>  .../dts/starfive/jh7110-milkv-marscm-lite.dts |  25 +++
>  .../dts/starfive/jh7110-milkv-marscm.dtsi     | 159 ++++++++++++++++++
>  5 files changed, 200 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc=
=2Edts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite=
=2Edts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
>=20
>=20
> base-commit: 8181cc2f3f21657392da912eb20ee17514c87828
> --=20
> 2.50.0
>=20

--QvKMfygXrttvtNJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMMPzgAKCRB4tDGHoIJi
0ltQAQDslWMe1fZ4Ww+Wl/yFLRedP+OoXPGPYVU5av62ToVj7wEAs25kRtwxXFFV
17/h/NQnlcQRfNI3GHeBydWBbnX6ugA=
=+/UZ
-----END PGP SIGNATURE-----

--QvKMfygXrttvtNJv--


--===============6879198086859988894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6879198086859988894==--

