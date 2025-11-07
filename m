Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387AACCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1vpO3rtcCzlN6/UGyy3gMD9yIIx4szXKOWDERZv8a0=; b=0CY1LnRTLjOE+O5h2YjwfDfKkK
	mUYi5X3+Gwuug6CIq/9mkllHjKdhPH24cQ9BbpR8cQTx5v5DJO85zooPN4aQwlvOmeCzw6Ql9pg1Z
	JTmYeeMMOWT7m/zT1fIrZ0LRSWh+IepG/rygWAfWu/p3gT3TzqvK3/YQPFjkCgmN2t3pes+ZRt2+D
	x2lp5UA9ZTv6GXEGs8AcU5x4IL3kG+BIiZCfVDQr9hzrPw06W4BLWQdSlNqlzbzOm9+8GZsEqyRoO
	RRrl6g9ex04bUQ0ovJvZ82lhcjeaBfl5RIqLGFK2FFpIiD/aUmwQyqeoOwCYJoi+p8ThedqFSNLG+
	ZTKUxFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQ8R-00000000EZz-2CM6;
	Fri, 07 Nov 2025 17:20:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQ8Q-00000000EZg-1ZqF
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 17:20:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 852B061913;
	Fri,  7 Nov 2025 17:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F5DC4CEF7;
	Fri,  7 Nov 2025 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762536025;
	bh=oxDwYCkrdj5zrZ8eK9rx/ixf+coTfobB+mmKr0plunM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5DqYg68rq3zVGZMHb1G+n9EpqbvDQKJrpFVNHiVJLLFbZ5pY6AViB9hzMd9VqC5M
	 mGKjRFnWZnyQf3T+SFj/OvyzEJ8mg297kyCDFXE8zqDRflD3BtHcB9pBRu9hxSBaOr
	 pHXELra7/krwGXctjJ24pwXMVHH+dquYdiHz56qvXcVCJQhbVCxGqNnlFaBZ/EItv7
	 DWCCMZrrJnLsBlmLOUdloFLYrlZ5bzI+xKmCmxRnQeEsPMZPlfpEBGYLMliTYsQVI8
	 NNolAV9+5w7V/+MtAMJ8LA6bjUaFChAq1Lk/AtvtxGz+llwFdFOxuOBd0wZKT3M1T4
	 t1NH4Y2MCHWAA==
Date: Fri, 7 Nov 2025 17:20:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Message-ID: <20251107-frenzy-cloning-4b279cfe932c@spud>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <c05d8bcc-3024-45cd-8630-b0595682e778@freeshell.de>
 <6d0fb6aa-6d88-4069-a5e5-9e910523888e@canonical.com>
MIME-Version: 1.0
In-Reply-To: <6d0fb6aa-6d88-4069-a5e5-9e910523888e@canonical.com>
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
Content-Type: multipart/mixed; boundary="===============5788802025745887042=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5788802025745887042==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="98XJ8Lpr/rFGdbIm"
Content-Disposition: inline


--98XJ8Lpr/rFGdbIm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 12:21:46PM +0100, Heinrich Schuchardt wrote:
> On 11/7/25 12:11, E Shattow wrote:
> >=20
> >=20
> > On 11/7/25 01:55, Hal Feng wrote:
> > > VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S industr=
ial
> > > SoC which can run at -40~85 degrees centigrade and up to 1.25GHz.
> > >=20
> > > Board features:
> > > - JH7110S SoC
> > > - 4/8 GiB LPDDR4 DRAM
> > > - AXP15060 PMIC
> > > - 40 pin GPIO header
> > > - 1x USB 3.0 host port
> > > - 3x USB 2.0 host port
> > > - 1x M.2 M-Key (size: 2242)
> > > - 1x MicroSD slot (optional non-removable 64GiB eMMC)
> > > - 1x QSPI Flash
> > > - 1x I2C EEPROM
> > > - 1x 1Gbps Ethernet port
> > > - SDIO-based Wi-Fi & UART-based Bluetooth
> > > - 1x HDMI port
> > > - 1x 2-lane DSI
> > > - 1x 2-lane CSI
> > >=20
> > > VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2L=
ite/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
> > > VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/Visio=
nFive2Lite/VisionFive2LiteQSG/index.html
> > > More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_li=
te.html
> > >=20
> > > Changes since v1:
> > > - Drop patch 1 because it is applied.
> > > - Rename jh7110.dtsi to jh711x.dtsi.
> > > - Move the content of jh7110-common.dtsi to the new file
> > >    jh711x-common.dtsi and move opp table to jh7110-common.dtsi.
> > > patch 4:
> > > - Move the uncommon nodes to jh7110-common.dtsi instead of board dts.
> > > patch 5:
> > > - Add jh7110s-common.dtsi and include it in jh7110s-starfive-visionfi=
ve-2-lite.dtsi.
> > >=20
> > > Changes since RFC:
> > > - Add jh7110s compatible to the generic cpufreq driver.
> > > - Fix the dtbs_check error by adding the missing "enable-gpios" prope=
rty
> > >    in jh7110 pcie dt-bindings.
> > > - Rebase on the latest mainline.
> > > - Add VisionFive 2 Lite eMMC board device tree and add a common board=
 dtsi
> > >    for VisionFive 2 Lite variants.
> > > - Add usb switch pin configuration (GPIO62).
> > > - Improve the commit messages.
> > >=20
> > > History:
> > > v1: https://lore.kernel.org/all/20251016080054.12484-1-hal.feng@starf=
ivetech.com/
> > > RFC: https://lore.kernel.org/all/20250821100930.71404-1-hal.feng@star=
fivetech.com/
> > >=20
> > > Hal Feng (8):
> > >    dt-bindings: PCI: starfive,jh7110-pcie: Add enable-gpios property
> > >    dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite
> > >      board
> > >    riscv: dts: starfive: Rename jh7110.dtsi to jh711x.dtsi
> > >    riscv: dts: starfive: Split jh7110-common.dtsi and move opp table =
to
> > >      it
> > >    riscv: dts: starfive: jh711x-common: Move out some nodes to jh7110
> > >      common dtsi
> > >    riscv: dts: starfive: Add common board dtsi for JH7110s and Vision=
Five
> > >      2 Lite variants
> > >    riscv: dts: starfive: Add VisionFive 2 Lite board device tree
> > >    riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree
> > >=20
> > >   .../bindings/pci/starfive,jh7110-pcie.yaml    |   4 +
> > >   .../devicetree/bindings/riscv/starfive.yaml   |   6 +
> > >   arch/riscv/boot/dts/starfive/Makefile         |   3 +
> > >   .../boot/dts/starfive/jh7110-common.dtsi      | 653 +--------------=
--
> > >   .../boot/dts/starfive/jh7110s-common.dtsi     |  27 +
> > >   ...h7110s-starfive-visionfive-2-lite-emmc.dts |  22 +
> > >   .../jh7110s-starfive-visionfive-2-lite.dts    |  20 +
> > >   .../jh7110s-starfive-visionfive-2-lite.dtsi   | 126 ++++
> > >   .../boot/dts/starfive/jh711x-common.dtsi      | 656 +++++++++++++++=
+++
> > >   .../dts/starfive/{jh7110.dtsi =3D> jh711x.dtsi} |  16 -
> > >   10 files changed, 879 insertions(+), 654 deletions(-)
> > >   create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-common.dtsi
> > >   create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-vi=
sionfive-2-lite-emmc.dts
> > >   create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-vi=
sionfive-2-lite.dts
> > >   create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-vi=
sionfive-2-lite.dtsi
> > >   create mode 100644 arch/riscv/boot/dts/starfive/jh711x-common.dtsi
> > >   rename arch/riscv/boot/dts/starfive/{jh7110.dtsi =3D> jh711x.dtsi} =
(99%)
> > >=20
> > >=20
> > > base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> >=20
> > Small nit that "lite-emmc" is confusing together. In patches to U-Boot
> > dev mailing list the EEPROM product id is demonstrated to be with "SL"
> > suffix when compared to VisionFive 2 (JH7110) so I suggest avoid
> > confusion in upstream and use for VisionFive 2 Lite (JH7110S) these
> > compatible names:
> >=20
> > starfive,visionfive-2sl-lite
> > starfive,visionfive-2sl-emmc
> >=20
> > Also filenames:
> >=20
> > jh7110s-starfive-visionfive-2sl-lite.dts
> > jh7110s-starfive-visionfive-2sl.dtsi
> > jh7110s-starfive-visionfive-2sl-emmc.dts
> >=20
> > What do you think?
> >=20
>=20
> This is a serial number for the Lite board:
> VF7110SL-2310-D002E000-xxxxxxxx
>=20
> Here E000 encodes that we have no eMMC.
>=20
> The S is part of 7110S which we already have in 'jh7110s'. And the L is
> already decoded as 'lite' in this patch series. Duplicating this informat=
ion
> as 'sl' as you suggested provides no benefit.
>=20
> Let's just stick with Hal's suggestion.

The marketing materials etc call it the visionfive 2 lite, for example
on kickstarter: https://www.kickstarter.com/projects/starfive/visionfive-2-=
lite-unlock-risc-v-sbc-at-199
I'm happy enough with what Hal has here as a result.

--98XJ8Lpr/rFGdbIm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4qUwAKCRB4tDGHoIJi
0syIAQD+Er+PMhGz0kEbUyrWG+rkw0VQZymPYFA4k1wpI8zTpQD/c/7P+rG/2fm/
YoL8btigKOHdPBIBOGqtNCtKrN3/QAI=
=NTsO
-----END PGP SIGNATURE-----

--98XJ8Lpr/rFGdbIm--


--===============5788802025745887042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5788802025745887042==--

