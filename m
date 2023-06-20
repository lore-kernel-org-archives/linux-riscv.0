Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE51EEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=TLQh8HyYo362djKUDCgNhCLMoBA03Vz8qK4pQIVA+T4=; b=ntA
	yudc/DZjfz172udNrnV0W8+69qGoEaHZ9aOZEnDqSZO8BClpLV1w+SLOdo2sVPVO3IG+S/roOzABg
	r5FS6/cyK3rwlklYirzX/ASmmqFcKTxO8e7g79VESyHgYZuLYfuQVEQCS86XI7bBqICpcF/TXKVgY
	GhTzMCoI/iQA2IxgOxmqH6R/zhDfKY06yUZEVW9tG59h0xC0OWWqrzcK4t4PeAll1fvV8hNfnxNRA
	3iy+/6duZc0y72YOgc1gf1gTFZ+nRnHCMj73keU9v4mPrTGMcP95ibibMAmPknPhs6yb5mRpejdlc
	hudbfOX4lyGxcR/k6HnW9gUTIcXPnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBcW6-00BYTO-2K;
	Tue, 20 Jun 2023 14:39:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBcW3-00BYRo-22
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 14:39:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29E1261224;
	Tue, 20 Jun 2023 14:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3811AC433C0;
	Tue, 20 Jun 2023 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687271970;
	bh=483rgJWufwUZthFQMx8FoiEndVtGS5f9KFQddxBKW6k=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=RpZ6XxUnhz3XOt/EcnByZFM4QAAWPdxjpCoEYKYANnPRLPsBO88+BV6E4ICeByZlf
	 0FXz8hEHii5QxuR/sIW+H46sTyqwQpbwXtnTiUldVGnxQY98E7Y7GYKOIrpflF516s
	 PG6EOubswE5L+vM16d730XXWCYn45Y8a/C85BukLL+oTmpVZVjqigrZKyg9J2g90+R
	 bx7Owndkz1HEIVoFf5pckYHa8eGQUTfElOIyKRZpVDeUmw1R1wadEqhlPnwqo3m+6v
	 ois52iveOiq8x+y9WYRpdmWJoaeoQynqMysc7Gs0uuLkoBnbYRnBAZT7lFyQ/og3DT
	 XzPF4J0h2eOJQ==
Date: Tue, 20 Jun 2023 15:39:26 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
	linux-riscv@lists.infradead.org, soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.5 Part 2
Message-ID: <20230620-fidelity-variety-60b47c889e31@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_073931_762743_F2EC31A4 
X-CRM114-Status: GOOD (  17.29  )
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
Content-Type: multipart/mixed; boundary="===============2993829886491476506=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2993829886491476506==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oS7TAHuOOQKrAvJd"
Content-Disposition: inline


--oS7TAHuOOQKrAvJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a second part, if it is not too late for v6.5.
This lot is based on top of v6.4-rc2, because Randy & Linus did a rejig
of the MAINTAINERS file. As a result, the diff below includes what was
in the previous PR. Wasn't sure if there was a request-pull incantation
to exclude what was in PR #1 (I guess I'd have to do a local merge of my
first PR & then use that as the base for the request-pull command?)

If not too late, please pull :)

Cheers,
Conor.

The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.5-pt2

for you to fetch changes up to 2bd9e07140ae7b22b5d049b1dde0449b2f2a28f8:

  riscv: dts: sort makefile entries by directory (2023-06-19 07:59:36 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.5 Part 2

T-Head:
Add a basic dtsi, Kconfig bits & trivial binding additions for the T-Head
1520 SoC (codename "light"). This SoC can be found on the Lichee Pi 4a,
for which a minimal dts is added.

Misc:
Re-sort the dts Makefile to be in alphanumerical order by directory.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (3):
      MAINTAINERS: exclude maintained subdirs in RISC-V misc DT entry
      Merge patch series "Add Sipeed Lichee Pi 4A RISC-V board support"
      riscv: dts: sort makefile entries by directory

Geert Uytterhoeven (2):
      dt-bindings: timer: sifive,clint: Clean up compatible value section
      dt-bindings: interrupt-controller: sifive,plic: Sort compatible values

Jisheng Zhang (8):
      dt-bindings: interrupt-controller: Add T-HEAD's TH1520 PLIC
      dt-bindings: timer: Add T-HEAD TH1520 clint
      dt-bindings: riscv: Add T-HEAD TH1520 board compatibles
      riscv: Add the T-HEAD SoC family Kconfig option
      riscv: dts: add initial T-HEAD TH1520 SoC device tree
      riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
      MAINTAINERS: add entry for T-HEAD RISC-V SoC
      riscv: defconfig: enable T-HEAD SoC

Mason Huo (2):
      riscv: dts: starfive: Enable axp15060 pmic for cpufreq
      riscv: dts: starfive: Add cpu scaling for JH7110 SoC

Walker Chen (1):
      riscv: dts: starfive: Add PMU controller node

Xingyu Wu (2):
      riscv: dts: starfive: jh7100: Add watchdog node
      riscv: dts: starfive: jh7110: Add watchdog node

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   3 +-
 Documentation/devicetree/bindings/riscv/thead.yaml |  29 ++
 .../devicetree/bindings/timer/sifive,clint.yaml    |  22 +-
 MAINTAINERS                                        |  10 +
 arch/riscv/Kconfig.socs                            |   6 +
 arch/riscv/boot/dts/Makefile                       |   5 +-
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |  10 +
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |  33 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  50 +++
 arch/riscv/boot/dts/thead/Makefile                 |   2 +
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  38 ++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  32 ++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 422 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 14 files changed, 647 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/thead.yaml
 create mode 100644 arch/riscv/boot/dts/thead/Makefile
 create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
 create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
 create mode 100644 arch/riscv/boot/dts/thead/th1520.dtsi

--oS7TAHuOOQKrAvJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJG6GgAKCRB4tDGHoIJi
0oE0AQCZZlODNlBOOG0iXlT6F6xkBpf3UVrZyShqLwmGG/LtPAD+KNmf+mN06JdO
nWZHK2Or1dYBdnqq3ngtgn0+iBcUBAg=
=53zv
-----END PGP SIGNATURE-----

--oS7TAHuOOQKrAvJd--


--===============2993829886491476506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2993829886491476506==--

