Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD83C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cHdnJHaRRWWGw183Nef2qYVPtVTP+OUy5oKg9PgkBMI=; b=thd
	APe8EyVR9Af0qPIATadRGXiJ3rU1PTJxzwhtC/e8ZHlSjO0ZcZtaDWNHVqfO5/ubQaVXkxK19qj1o
	qdFmIg8WwAz6jVMDF4pgYiD8EgRhEQq0Gnbjm/HQm1RytlnYs50QE91FbTCtATD42bzGHHhH7lAoC
	hkjRxbtQ9q31T+O8wdeT0mMMcY2jZmh19S/iBmAFWt/eRJooOIpJt8M2xgejftL0pT5bj4e1FpZJ3
	MAYyDA2nX4olQIlpRjjDOZJKoK2dJfZ6+g4N6Zr+wDf2pBpc5URF5LXEcYkSdRN+CsoH8rd4fpoCX
	FDr/medD9/GiRHzWWjrBjMYeSdl8Vfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGIJk-002ng6-04;
	Thu, 21 Dec 2023 12:38:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGIJh-002nfc-0N
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 12:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 78BEAB81F75;
	Thu, 21 Dec 2023 12:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9239C433C9;
	Thu, 21 Dec 2023 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703162298;
	bh=KKQaeH2EmDJ7mFaL5Q6gJzAHWCpUvrzqaLBg34q+1wY=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=E7C8zH+zhk4HHPrdh0XrPs09Fo0xrLRwGbuRrX/1Lj8SXVwcj1Fd9sCXPrxkwZd/Q
	 zfmW7gTodJGNazNRCsKR70oTvOzQUHZA5LEPiTkZbGSkgqbR2OAnIiSxdfE/YwoL+B
	 truvPYxeBwmNCBBnhHjMu+GOKQUTiZNb5tjac+h3oqiHANV13BCa0ISM6bTAf/YUTU
	 ksrJs0QT437ncf82BkhHBbrgcE814xqteHBe+3S6yaqBuojg2nit5qokIq/Oh4st4K
	 0Zo1pgmWAdyJyDo3LrkPiIJ1Hoa5SReadsJNS1tY46AOE/6Ht7oUcsvGf0K8Z63Spn
	 pUDDWTN70G/mA==
Date: Thu, 21 Dec 2023 12:38:15 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, arnd@arndb.de, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.8
Message-ID: <20231221-droop-unblock-81e4fe14acee@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_043821_435282_CCDA65A9 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Type: multipart/mixed; boundary="===============3926939276512534332=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3926939276512534332==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BIkMRZ8AmKuplyuY"
Content-Disposition: inline


--BIkMRZ8AmKuplyuY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

The FPGA preprogramming driver that we discussed a while back (was it
at LPC?) is in this PR. It's in the soc-drivers branch because there's
a bunch of pre-req patches to the existing soc driver that it relies on.
I'll put stuff for drivers/firmware into a separate branch in the future.

Cheers,
Conor.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v6.8

for you to fetch changes up to 0f2d06dd1910cc7f6591620a2070d44ca3f56551:

  MAINTAINERS: add auto-update driver to mpfs entry (2023-12-07 16:43:29 +0000)

----------------------------------------------------------------
RISC-V SoC drivers for v6.8

There's only one set of changes here, the addition of "Auto Update"
support for PolarFire SoC. Auto Update is one of the ways that the FPGA
bitstream can be updated, and the only one suitable for use from Linux
as it does not immediately initiate a reboot when started.
The driver was not accepted in the FPGA manager subsystem as the update
only occurs after a reboot and makes no use of the FPGA manager
framework.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (6):
      dt-bindings: soc: microchip: add a property for system controller flash
      soc: microchip: mpfs: enable access to the system controller's flash
      soc: microchip: mpfs: print service status in warning message
      soc: microchip: mpfs: add auto-update subdev to system controller
      firmware: microchip: add PolarFire SoC Auto Update support
      MAINTAINERS: add auto-update driver to mpfs entry

Kory Maincent (1):
      firmware_loader: Expand Firmware upload error codes with firmware invalid error

Rob Herring (1):
      firmware: microchip: Replace of_device.h with explicit include

 .../microchip/microchip,mpfs-sys-controller.yaml   |  10 +
 MAINTAINERS                                        |   1 +
 drivers/base/firmware_loader/sysfs_upload.c        |   1 +
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/microchip/Kconfig                 |  12 +
 drivers/firmware/microchip/Makefile                |   3 +
 drivers/firmware/microchip/mpfs-auto-update.c      | 494 +++++++++++++++++++++
 drivers/soc/microchip/Kconfig                      |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c        |  33 +-
 include/linux/firmware.h                           |   2 +
 include/soc/microchip/mpfs.h                       |   2 +
 lib/test_firmware.c                                |   1 +
 13 files changed, 559 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/microchip/Kconfig
 create mode 100644 drivers/firmware/microchip/Makefile
 create mode 100644 drivers/firmware/microchip/mpfs-auto-update.c

--BIkMRZ8AmKuplyuY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYQxtwAKCRB4tDGHoIJi
0hKhAP0YZXiDzA2aruMFCZY5ccEnrqXzUc0tTvlPw1nStC3CagD/QL2laxvZ2eu/
F2a3Gu65arDWa+4Krhai4N/ddj905Ac=
=Lir3
-----END PGP SIGNATURE-----

--BIkMRZ8AmKuplyuY--


--===============3926939276512534332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3926939276512534332==--

