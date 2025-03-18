Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78147C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 12:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+mByFuPJPNwzh/mBGe2XJSzwC6YfQ+DKnAH1mZE/jjA=; b=U7D
	v763qH22Nu0cWhV/3hHWhVGFXG0y2BVoEOW87Fqe1iKWXMg0O0Jlt+LuNam6Kb/0B6FElKTwTH/Au
	0PnlwXPR3PQKZ/n3DIOvH+nNiB9m/M/cV3Hba4Z0emFckaXR4Xe62WCwnCG2MdLfwSNG0fQV2Fxe2
	Nvp9UL0S2hC9Cl068HbGFqb1qt+JNlcTyU5GIphxzhKBlmK3/+oKXCdi0q/w/hruB/z9pR0gUHJ5w
	Gcw7mxe/AJpNiT/AxGbM6r4+ZBCjiYWgCmHlBpWiv7kQHQ4kolRbD96lr0omdK9UkzWpSzoB2Q5NL
	6USFvC7oedqh1qhlq4//pCPZG+C89Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVeH-00000005ohH-0se2;
	Tue, 18 Mar 2025 12:02:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVZf-00000005nmm-39oW
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 11:57:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 276C7A40BAC
	for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 11:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979B4C4CEE3;
	Tue, 18 Mar 2025 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742299054;
	bh=rmLMUpUg9TKlv0t12MsX0VOhIQD3OdV+vDBtl6zVpao=;
	h=Date:From:To:Cc:Subject:From;
	b=vCuGMsfMlLcLCFGPlZUXvf9LR7aFshQKJcZiZQehD5UgXl0/o6pb9iuGMQMDdNzj6
	 J5ZsJWfUNnV/YSu2kkpWd/COk11ZCXSq+n0o5Cow58rQl7UhK1m1EgiUcMPpySN0kf
	 voZ5eFSLwqfU+zwPo2dahiemJACj3UUSMws4fwBqKKSwm5RAgTkHIXL1U4NFcq49C4
	 mlLyBL6dRfSl+PTgp30GTZzX19y3BqXThX2nM+xambHFcbRCEb7tiNrZlTfvTR/YcP
	 RTNs7i5yFGQsanK+p9APHWkM/HoGwT58k/NecvGjOSoHAxg1XNQLvwa14JcmB1AEGo
	 wvXnf4FwZiAVw==
Date: Tue, 18 Mar 2025 11:57:31 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.15
Message-ID: <20250318-favorite-presuming-bf2fcf55bf6a@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_045735_859265_378C880D 
X-CRM114-Status: GOOD (  10.67  )
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
Content-Type: multipart/mixed; boundary="===============6220209905542224621=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6220209905542224621==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zkv9McmXFIblZL5Z"
Content-Disposition: inline


--Zkv9McmXFIblZL5Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Not too much this window, was hoping to get the k230 (canaan soc) this
time around, but the clock side of things was not ready.

Cheers,
Conor.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.15

for you to fetch changes up to 38818f7c9c179351334b1faffc4d40bd28cc9c72:

  riscv: dts: starfive: jh7110-pine64-star64: enable USB 3.0 port (2025-02-18 16:32:25 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.15

Starfive:
All changes for jh7110-based boards including the removal of a dac
that does not exist and the addition of usb3 support on the star64 board
and pcie on the framework mainboard.

Microchip:
Update pcie reg properties to fix a mistake originally describing them.
Here rather than in fixes, since the driver maintains support for the
old format.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      riscv: dts: microchip: update pcie reg properties to new format
      riscv: dts: starfive: remove non-existent dac from jh7110

E Shattow (2):
      riscv: dts: starfive: jh7110: pciephy0 USB 3.0 configuration registers
      riscv: dts: starfive: jh7110-pine64-star64: enable USB 3.0 port

Sandie Cao (1):
      riscv: dts: starfive: fml13v01: enable pcie1

Shengyu Qu (1):
      riscv: dts: starfive: Unify regulator naming scheme

 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi |  5 ++--
 .../boot/dts/microchip/mpfs-m100pfs-fabric.dtsi    |  5 ++--
 .../boot/dts/microchip/mpfs-polarberry-fabric.dtsi |  5 ++--
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  8 +----
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts | 34 ++++++++++++++++++++++
 .../boot/dts/starfive/jh7110-pine64-star64.dts     |  5 ++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  2 ++
 7 files changed, 51 insertions(+), 13 deletions(-)

--Zkv9McmXFIblZL5Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9lfqwAKCRB4tDGHoIJi
0gCiAPsE2utscwOvp0WzwLA3spcR3+1jORwrts/LiBGNrYQ06QD+KoBcIlha6JL2
WQMSCRpVANtjmtODfKlmlbH8BH24owY=
=0nHQ
-----END PGP SIGNATURE-----

--Zkv9McmXFIblZL5Z--


--===============6220209905542224621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6220209905542224621==--

