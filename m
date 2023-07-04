Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C3DEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 22:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmUy5ahV2xodm2gAi9Xr32LYjfT9yPSmzD5BiHpLP3c=; b=gHkhaO33GQtZcljq4LH/AMdaUk
	NWyULCpp9wKTUYp7F1zOBuBWCkSSFpjUAOYz8z6mjxvztZpfahakhYSzzyB5yShaTjghkpKwxdtTx
	YwHWQCRPYHx2ZQ87+xvM7h/uPKwHGZh9GazR+5NGvFkwZLiMvP3W8OFIRRdZNVizJcPeHYo9+R+u/
	5ytlg9lrSCR6sfNZb0uMqeR5ofQqoAkYAOhYU4NnUNolc1/pc32jzIFhMqv0E6PSe+pl0cpmB88Yi
	sO9h/1fCROMRCWm+jRwu1ky2dEAtGHhjd5XjltEkUu6cKjb83t8fiOVY+8IReR+2wLIFiSWi4wH7Y
	Dp9IsKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGoWS-00EIda-2W;
	Tue, 04 Jul 2023 22:29:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGoWQ-00EId3-06
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 22:29:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 237D261262;
	Tue,  4 Jul 2023 22:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3F8C433C7;
	Tue,  4 Jul 2023 22:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688509760;
	bh=57MH61s73VNxciqBMQn+M7UhO6ugmNcBRA165CCsfzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaIiPRGkudpAzaPzGTlHWdc8tgQu4vsgNOvM2PlTufQe/mQQsiwP19Okf5++zEVp/
	 DHzBA/kZz2TDw5fbGo+kpFiroO9DCMdWLg1TlPD4G/v5RmC9D8Z/ONccUd1WmPRDjh
	 i8iuK1MHg171DSTCxJeeUNus/I3WvGGaBZgrE1/mNGUy/fbXA2CaZLuTWcUL+qUwLs
	 Oge47qag2/dtqlbOhYPOGs+mNbNyI5E2V8v5T+2VnVv7810N8lf+PWbqVzKSgveryg
	 IPVzqmZvISD4NEwa/dCAD+05GWUhyfMEXISsW2oEC/y/QAD6k72hVO8OejIeQSxKjR
	 lYeNcfHHbBYtA==
Date: Tue, 4 Jul 2023 23:29:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH v6 0/7] Add PLL clocks driver and syscon for
 StarFive JH7110 SoC
Message-ID: <20230704-driven-desecrate-75075ebc11a3@spud>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_152922_176608_BFBCE186 
X-CRM114-Status: GOOD (  18.57  )
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
Content-Type: multipart/mixed; boundary="===============2426466417398809008=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2426466417398809008==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hVeR+Tbp7CCet06V"
Content-Disposition: inline


--hVeR+Tbp7CCet06V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil,

On Tue, Jul 04, 2023 at 02:46:03PM +0800, Xingyu Wu wrote:
> [Resending because it has a error about examples in syscon bingdings
> and has to be fixed.]
>=20
> This patch serises are to add PLL clocks driver and providers by writing
> and reading syscon registers for the StarFive JH7110 RISC-V SoC. And add=
=20
> documentation and nodes to describe StarFive System Controller(syscon)
> Registers. This patch serises are based on Linux 6.4.

Could you take a look at this series when you get a chance, please?
Would be good to finally get it merged since the syscon bits are a dep
for a few other things :)

Thanks!

Conor.

> William Qiu (2):
>   dt-bindings: soc: starfive: Add StarFive syscon module
>   riscv: dts: starfive: jh7110: Add syscon nodes
>=20
> Xingyu Wu (5):
>   dt-bindings: clock: Add StarFive JH7110 PLL clock generator
>   dt-bindings: clock: jh7110-syscrg: Add PLL clock inputs
>   clk: starfive: Add StarFive JH7110 PLL clock driver
>   clk: starfive: jh7110-sys: Add PLL clocks source from DTS
>   riscv: dts: starfive: jh7110: Add PLL clocks source in SYSCRG node
>=20
>  .../bindings/clock/starfive,jh7110-pll.yaml   |  46 ++
>  .../clock/starfive,jh7110-syscrg.yaml         |  18 +-
>  .../soc/starfive/starfive,jh7110-syscon.yaml  |  93 ++++
>  MAINTAINERS                                   |  13 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  30 +-
>  drivers/clk/starfive/Kconfig                  |   9 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jh7110-pll.c    | 507 ++++++++++++++++++
>  .../clk/starfive/clk-starfive-jh7110-sys.c    |  45 +-
>  .../dt-bindings/clock/starfive,jh7110-crg.h   |   6 +
>  10 files changed, 746 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh71=
10-pll.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfi=
ve,jh7110-syscon.yaml
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-pll.c
>=20
> --=20
> 2.25.1
>=20

--hVeR+Tbp7CCet06V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKSdOwAKCRB4tDGHoIJi
0hnvAQCLkhD5vFq12iIYCmHzR7wCU9c4M1WnBflj69YY4Nt1wQEAhZrKHy+edzwF
uV8cREqaiwoc8aI9tSrOSrGWgreEbwM=
=wTVc
-----END PGP SIGNATURE-----

--hVeR+Tbp7CCet06V--


--===============2426466417398809008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2426466417398809008==--

