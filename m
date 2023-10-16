Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008D5CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/icbkc5B+e+vy3R67IRrqfn+bN+qHuLQY8oS8mN+9Kc=; b=Tna
	41XTaQ7ilKq1ythvN6BNmZYxBPHMEkBgWTTOzQ1h7CaDdJ4+lj8gXNsHiBsC5mJdS3D73cha/8yE3
	2GkTAv/P8xA1cjLgl/NGV2FFteRabQ8Qk+H300x0UEWVJdiqfgF2K1joiSNIWH7tUZnn815QbiPwN
	J/rDizCkIkVUcUHVBLyftiYK9Ap+Tldx+LEz+8eiDh3IMf1BX9qhSXT07/Wqa+V9Dcl+mpJFeQJbV
	AE6+VvKl/3NAh1kSzwKBPMT+jvmihb16HO7Sanrn7ZRefnUdVOQNDBMBBLA9RpULa5F4OI2Om6Bpu
	rsOEH473XPwcILRGqlgWFEDf1wbLTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPcD-009zrj-1K;
	Mon, 16 Oct 2023 15:34:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPc9-009zqR-1p
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 15:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B3D65CE111C;
	Mon, 16 Oct 2023 15:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B41C433C7;
	Mon, 16 Oct 2023 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697470479;
	bh=Ds2WuOyqBFCFrqImUDhA0B8esqx1tka+afIYJqOBYFk=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=UzsPx/REdzv6JkEKi9DXyPFhVIhwfFDi4JSi40RDrHfxkuRiUoYaC7X8EMIIIY36g
	 wEB7/JKPVr4D1FNMZOe9s+6Aof4MRNcUAMaTEK4PEAuWOcWNiD27KpFsQvbufrj/WO
	 kO+66Td4m1JQAYrWVE1IZml85WHCNtR7HUHTEq4njf8oHys/kIHrh+3ICNOi9BaJYh
	 +NuBrvZu+PGHCzyg80+8n6p+8/bw0BjFmGEiP7x7O3fvBEX/rZU00tPdTu9pUMOsF+
	 FHSvFbGFmfN83GTXnSFgfgAOvaUW+7E+/JDO3KgDGR+XpkRoByyttLbX7aCS1+m0BJ
	 ygIzL3z3Qx5oQ==
Date: Mon, 16 Oct 2023 16:34:34 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.7
Message-ID: <20231016-filing-payroll-7aca51b8f1a3@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_083441_958306_290F612B 
X-CRM114-Status: GOOD (  16.49  )
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
Content-Type: multipart/mixed; boundary="===============0644551745920325834=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0644551745920325834==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bU7VBiKcanaboKPm"
Content-Disposition: inline


--bU7VBiKcanaboKPm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some DT bits for 6.7, summary in the tag and all that jazz.

Thanks,
Conor.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.7

for you to fetch changes up to 81b5948cf1a7ad49ba72fa0674710bd3f44deb9e:

  riscv: dts: starfive: convert isa detection to new properties (2023-10-15 13:16:05 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.7

StarFive:
Things are a bit slower for StarFive this window, there's only the
addition of audio related DT nodes to speak of here.

Generic:
The SiFive, StarFive and Microchip devicetrees have had my replacement
ISA extension detection properties added. Unfortunately, the old
"riscv,isa" property never defined exactly what the extensions it
contained meant, and people were want to fill it in incorrectly (and
call upstream kernel devs idiots for not doing the same). The new
properties have explicit definitions and hopefully will stand up better
to some of the variation from RVI.

Sophgo:
Two new SoCs, one is probably the first of several with up/down tuned
variants, that have a pair of T-Head c906 cores and appear aimed at the
IP camera, smart <insert whatever> etc markets. They are intended to run
in AMP mode, with an RTOS on the less powerful core. The other is far
more interesting to kernel developers however, the 64-core SG2042, with
more recent c920 cores from T-Head at 2 GHz. For both, support is at a
very basic stage - some of the same developers are working on them as
other T-Head powered SoCs, but hopefully things will move beyond a basic
console boot. The goal is for Chen Wang to take over maintaining the
Sophgo support once they have some more experience with the process.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Chen Wang (8):
      riscv: Add SOPHGO SOC family Kconfig support
      dt-bindings: vendor-prefixes: add milkv/sophgo
      dt-bindings: riscv: add sophgo sg2042 bindings
      dt-bindings: riscv: Add T-HEAD C920 compatibles
      dt-bindings: interrupt-controller: Add Sophgo SG2042 PLIC
      riscv: dts: add initial Sophgo SG2042 SoC device tree
      riscv: dts: sophgo: add Milk-V Pioneer board device tree
      riscv: defconfig: enable SOPHGO SoC

Conor Dooley (4):
      Merge initial Sophgo patches into riscv-dt-for-next
      riscv: dts: microchip: convert isa detection to new properties
      riscv: dts: sifive: convert isa detection to new properties
      riscv: dts: starfive: convert isa detection to new properties

Hal Feng (1):
      riscv: dts: starfive: Add JH7110 PWM-DAC support

Inochi Amaoto (2):
      dt-bindings: timer: Add Sophgo sg2042 CLINT timer
      dt-bindings: interrupt-controller: Add Sophgo sg2042 CLINT mswi

Jisheng Zhang (5):
      dt-bindings: interrupt-controller: Add SOPHGO CV1800B plic
      dt-bindings: timer: Add SOPHGO CV1800B clint
      dt-bindings: riscv: Add Milk-V Duo board compatibles
      riscv: dts: sophgo: add initial CV1800B SoC device tree
      riscv: dts: sophgo: add Milk-V Duo board device tree

William Qiu (1):
      riscv: dts: starfive: add assigned-clock* to limit frquency

Xingyu Wu (2):
      riscv: dts: starfive: pinfunc: Fix the pins name of I2STX1
      riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    2 +
 .../thead,c900-aclint-mswi.yaml                    |   43 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |    1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |   32 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |   43 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 MAINTAINERS                                        |    7 +
 arch/riscv/Kconfig.socs                            |    5 +
 arch/riscv/boot/dts/Makefile                       |    1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |   15 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi         |   15 +
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi         |   15 +
 arch/riscv/boot/dts/sophgo/Makefile                |    3 +
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts   |   38 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi            |  123 ++
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi        | 2000 ++++++++++++++++++++
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |   19 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             |  325 ++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |    6 +
 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h      |    4 +-
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |  111 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |   93 +
 arch/riscv/configs/defconfig                       |    3 +-
 24 files changed, 2906 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
 create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi

--bU7VBiKcanaboKPm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS1YCgAKCRB4tDGHoIJi
0jULAP0WfmBzAx+f+DyqWrl1al+TlXz8VuYZNzRQp/7KcGFI9wD7BwO7rLm830Ds
cIlPNfyB99JRj+fEwLe1MDxpPIou8g0=
=nmgQ
-----END PGP SIGNATURE-----

--bU7VBiKcanaboKPm--


--===============0644551745920325834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0644551745920325834==--

