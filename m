Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60583C61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrE7H4kPEMHOEI/2qON+x+yC3+O/4dfunm5BLXbs/LU=; b=CkdqNdcLk9o8M5hQQhyyKxlmgo
	Jexc/6E72E4X13R3fb5iQxAtBdmPHaayztUKU7yJV+fGjzkR/Of6fu9sJ6M0obHCYyyxjYSTPnPhH
	OeBAdSxH79XhbHHQDTHZLGT1FvJXcymTL+CSEekpVVDcXam4sHhcaEj85jEU/FVN9eDWEh1GUfKrN
	x2TKi5burfArAX/YFneYTZwAuj9ogDugSJzWpia1A7A3+opG7VB6G3K2kKF4zlWq8QdNv/GXccM4/
	awWSFkKmqoBlL8peZfG69pFPL+ed0mtoDLOXz4wLZUm56ADso3UUKpyV5sxTriEaGxD5CHVuxeyr3
	MEulxg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG3yX-00Goge-0w; Thu, 12 Jan 2023 20:15:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG3HA-00GVNp-T8
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 19:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30190B81FF6;
	Thu, 12 Jan 2023 19:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFDEC433D2;
	Thu, 12 Jan 2023 19:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673551809;
	bh=9M4Qgev96bLgOABkSP/gBl9aDcrGQTN4+95208uj1t4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfxDrEYPeDGPKgPehnJzyQ/y3i7IsLzKtBWdZUwhXi7BIEgHs6V9M3ddKqHvF4qxW
	 hGlRhZTaReK4hRo+hMYWObxByFEizEHlO05g7Vi6JszUa2zMVaBdVuKqg6uByCEnCl
	 0MNj5a+cKbJstCy5F0Dn3kxjetHurTj3yMjHJxdnCqgZmsfKG1FR8GIzy5ocfWZjL1
	 DNE3lpMupnlTugpkRCzVLkqy3ZdDdbX1fND7shU0BWMRjijHL90DmRhlzm3WoC6iU1
	 6IqBowE1fGWu2C+4JhA3tdSp++bgp0PKyEcRtkzreeIcL6B00m36wBmiaI3X8rJKv7
	 5k1zKZh47MFGw==
Date: Thu, 12 Jan 2023 19:30:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Basic pinctrl support for StarFive JH7110 RISC-V
 SoC
Message-ID: <Y8BfvQCFNz9KNrDY@spud>
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220005529.34744-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_113013_283277_3B0ACA10 
X-CRM114-Status: GOOD (  26.45  )
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
Content-Type: multipart/mixed; boundary="===============3720383543246739560=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3720383543246739560==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+7GE2eStfBy4cbGi"
Content-Disposition: inline


--+7GE2eStfBy4cbGi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Hal Feng,

On Tue, Dec 20, 2022 at 08:55:24AM +0800, Hal Feng wrote:
> This patch series adds basic pinctrl support for StarFive JH7110 SoC.
> You can simply get or review the patches at the link [1].

> [1]: https://github.com/hal-feng/linux/commits/visionfive2-minimal

Do you intend submitting a new version of the patchset to address the
comments about the bindings, or are you waiting for comments on the
code?

Thanks,
Conor.

> Changes since v2:
> - Rebased on tag v6.1.
> Patch 1:
> - Renamed pinctrl-starfive-jh7110.h to
>   starfive,jh7110-pinctrl.h. (by Krzysztof)
> - Separated the register values in the binding header and stored them in
>   a new file arch/riscv/boot/dts/starfive/jh7110-pinfunc.h. (by Krzysztof)
> - Split patch 1 into sys part and aon part. Merged them into patch 2
>   and patch 3 respectively.
> Patch 2 & 3:
> - Dropped "reg-names" and the description of "interrupts". Dropped quotes
>   behind "$ref" and kept consisitent quotes. (by Krzysztof)
> - Moved gpio properties behind interrupt properties.
> - Moved "required" behind "patternProperties". (by Krzysztof)
> - Rewrote the examples of bindings. (by Krzysztof and Emil)
> - Added Co-developed-by tag for Emil.
> - Dropped unused "clocks" property in patch 3.
> Patch 4 & 5:
> - Renamed "pinctrl-starfive.*" to "pinctrl-starfive-jh7110.*" and replaced
>   all "starfive_" prefix with "jh7110_" in these files. (by Emil)
> - Dropped macro GPIO_NUM_PER_WORD. (by Emil)
> - Dropped unused flag member in starfive_pinctrl_soc_info structure. (by =
Emil)
> - Renamed "pinctrl-jh7110-sys.c" to "pinctrl-starfive-jh7110-sys.c".
>   Renamed "pinctrl-jh7110-aon.c" to "pinctrl-starfive-jh7110-aon.c". (by =
Emil)
> - Added individual Kconfig options for sys and aon pinctrl drivers. (by E=
mil)
> - Made the sys and aon pinctrl drivers be modules. (by Emil)
> - Added "JH7110_" prefix for macro SYS_GPO_PDA_0_74_CFG,
>   SYS_GPO_PDA_89_94_CFG and AON_GPO_PDA_0_5_CFG. (by Emil)
> - Dropped jh7110_sys_pinctrl_probe() and jh7110_aon_pinctrl_probe().
>   Got the match data in the common jh7110_pinctrl_probe() and used it
>   to probe. (by Emil)
> - Dropped the of_match_ptr macro(). (by Emil)
> - Set the MODULE_LICENSE as "GPL" according to commit bf7fbeeae6db.
>=20
>   v2: https://lore.kernel.org/all/20221118011108.70715-1-hal.feng@starfiv=
etech.com/
>=20
> Changes since v1:
> - Rebased on tag v6.1-rc5.
> - Dropped patch 22 and 23 since they were merged in v6.1-rc1.
> - Removed some unused macros and register values which do not belong to
>   bindings. Simplified pinctrl definitions in patch 24. (by Krzysztof)
> - Split the bindings into sys pinctrl bindings and aon pinctrl bindings,
>   and split patch 25 into two patches.
> - Made the bindings follow generic pinctrl bindings. (by Krzysztof)
> - Fixed some wrong indentation in bindings, and checked it with
>   `make dt_binding_check`.
> - Split the patch 26 into two patches which added sys and aon pinctrl
>   driver respectively.
> - Restructured the pinctrl drivers so made them follow generic pinctrl
>   bindings. Rewrote `dt_node_to_map` and extracted the public code to make
>   it clearer.
>=20
>   v1: https://lore.kernel.org/all/20220929143225.17907-1-hal.feng@linux.s=
tarfivetech.com/
>=20
> Jianlong Huang (5):
>   riscv: dts: starfive: Add StarFive JH7110 pin function definitions
>   dt-bindings: pinctrl: Add StarFive JH7110 sys pinctrl
>   dt-bindings: pinctrl: Add StarFive JH7110 aon pinctrl
>   pinctrl: starfive: Add StarFive JH7110 sys controller driver
>   pinctrl: starfive: Add StarFive JH7110 aon controller driver
>=20
>  .../pinctrl/starfive,jh7110-aon-pinctrl.yaml  | 126 +++
>  .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 142 +++
>  MAINTAINERS                                   |   9 +-
>  arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 308 ++++++
>  drivers/pinctrl/starfive/Kconfig              |  33 +
>  drivers/pinctrl/starfive/Makefile             |   4 +
>  .../starfive/pinctrl-starfive-jh7110-aon.c    | 177 ++++
>  .../starfive/pinctrl-starfive-jh7110-sys.c    | 449 ++++++++
>  .../starfive/pinctrl-starfive-jh7110.c        | 979 ++++++++++++++++++
>  .../starfive/pinctrl-starfive-jh7110.h        |  70 ++
>  .../pinctrl/starfive,jh7110-pinctrl.h         | 137 +++
>  11 files changed, 2431 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh=
7110-aon-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh=
7110-sys-pinctrl.yaml
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
>  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.h
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
>=20
>=20
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
> --=20
> 2.38.1
>=20

--+7GE2eStfBy4cbGi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8BfvQAKCRB4tDGHoIJi
0jicAQDpd58lcug0jLR0d3ZBCfGJREtWqXWojElhKKTnaBVt/wD/fEJEOoEDLicn
rE8j7Kiv1yzRhnRxiQU5zZqRlLGFiAg=
=MdQF
-----END PGP SIGNATURE-----

--+7GE2eStfBy4cbGi--


--===============3720383543246739560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3720383543246739560==--

