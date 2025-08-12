Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01438CA0EE0
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JI31Tts1ULGPVqmEiixcwG/tn6aJTUPeH6X+/Q/UBxs=; b=Um7qmGV3ifg2uz6WoZcA9TsQDT
	Lz+y6tHkvtdPFa2U735OJECL/8doDIWq+l/z0NyYpwangP93qaufbPV0t0t3ER9tqGdM8AXCZn3ab
	3BV3u9KZc6JNIhbJhI5hTC6Y2j79CK8PNPb72nPfjULqLYK09/S8cba3NoYvY/W3L8uBk7nN+xoGV
	QFF3i3vjqr+XPBkNplnCWtTPpeR0KoFF01mTm50PvenZ607OGVsEowlzWYwDflJnwAvKN/DVDTB6z
	iq0Cj6NPRg27ZvuAZbuAN5MQecnq1HrDu2tButmiTeSljyW/MXYNoxFjYreRBZ6nOLGQcj4xLPRf5
	bYJqkd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgX-0000000BwvW-17Ix;
	Tue, 12 Aug 2025 20:33:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultNb-0000000BgBg-3cIU
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 18:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28C4441776;
	Tue, 12 Aug 2025 18:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC6AC4CEF7;
	Tue, 12 Aug 2025 18:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755021947;
	bh=e3EDHnAFkz3QLkH+KgtO1Kl2ullAWwjFOAAK/h5xPg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oN3GYcG5xbqMEl3xbOxlWXUfZBRNMAsF4EOO8Wl0vAPU5N9K8r974nrhqoupCuUnP
	 Q0c3R9HtlQk0VkthCCTjdraVvC7T6Zs3TqpWbOQbBm9ZlX2s5CjRsieCb+qTon3Cpy
	 WWJZCg8EvQfUdBEB1ruT9SgSdNONTGKytytzIWKTJhc15T6iMhQxziSpe3aiAa9n4P
	 4na2p5qoUbZCReUFAiMN7TplxzYslKnpwwXpjWKzqBuGJfQovIsZin1rmq5M6eNc3v
	 GqJsKTsB3/aWdaQUdvQPl41eOVnSvEOKXtokqjjj2DwCJsuUtfmJUpnN8nMhfLPxDM
	 w6UFHiURvluzA==
Date: Tue, 12 Aug 2025 19:05:43 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/4] riscv: dts: starfive: Add Milk-V Mars CM (Lite)
 SoM
Message-ID: <20250812-endearing-spiral-4c0713898043@spud>
References: <20250724094912.253723-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250724094912.253723-1-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_110547_938498_8F248A29 
X-CRM114-Status: GOOD (  14.79  )
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
Content-Type: multipart/mixed; boundary="===============5879451817445898056=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5879451817445898056==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xCkINtjzkvJccMuz"
Content-Disposition: inline


--xCkINtjzkvJccMuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil,

Could you take a look at this please?

Cheers,
Conor.

On Thu, Jul 24, 2025 at 02:48:43AM -0700, E Shattow wrote:
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
> E Shattow (4):
>   dt-bindings: riscv: starfive: add milkv,marscm-emmc
>   riscv: dts: starfive: add Milk-V Mars CM system-on-module
>   dt-bindings: riscv: starfive: add milkv,marscm-lite
>   riscv: dts: starfive: add Milk-V Mars CM Lite system-on-module
>=20
>  .../devicetree/bindings/riscv/starfive.yaml   |   2 +
>  arch/riscv/boot/dts/starfive/Makefile         |   2 +
>  .../dts/starfive/jh7110-milkv-marscm-emmc.dts | 163 ++++++++++++++++
>  .../dts/starfive/jh7110-milkv-marscm-lite.dts | 176 ++++++++++++++++++
>  4 files changed, 343 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc=
=2Edts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite=
=2Edts
>=20
>=20
> base-commit: 28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1
> --=20
> 2.50.0
>=20
>=20

--xCkINtjzkvJccMuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJuCdgAKCRB4tDGHoIJi
0iEIAP9iINxEHNz2vUO3m9MHWmMibxNgbu5H96ZP510+7QAtBQEArtm65fL7XQ7+
2MV1EPWNefABocjC97GUCOTzB1t4gAk=
=J96J
-----END PGP SIGNATURE-----

--xCkINtjzkvJccMuz--


--===============5879451817445898056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5879451817445898056==--

