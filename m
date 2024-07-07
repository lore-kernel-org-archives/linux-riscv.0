Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9D8C3DA44
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oDmmggm3R01biak3GmXybGhykJ2RhEO2rJMAU2G689U=; b=oIS
	uekOIVTc9wUUih1PrxUiWAwJ9dhwuQuB2tRcC4uGqC4WavOR1GElgknb7frUEZXNCcx+qm4AIPbg/
	Nt1AFe3U+WZHNNH8CnZbx64QXk7XgYzF17nH8qL3CAwJLb24UDl35JTKXR2T+FexiEZ6tQQcUjhEt
	7HWEDY2+WgSP+p5xj6mHPEV+fKy7twmLpoa/+3KK1uJS9hRQYPnDrB4XWOYUeP/riRlWtX2TA1Wy4
	VC15lEDqhzYIYgoTXqdLUosrCIE4XohE0GF87bWvWHR2z8U9A5LeUJfklmhrx+ZY67aj70LdPiycH
	d/H3JDe06T8DCnm10I4vGTJtpcNxZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVYj-000000023lC-1SUd;
	Sun, 07 Jul 2024 17:20:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVYg-000000023kK-13kN
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 17:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D065602E2
	for <linux-riscv@lists.infradead.org>; Sun,  7 Jul 2024 17:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1D7C3277B;
	Sun,  7 Jul 2024 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720372817;
	bh=MX4MNKSjeZRri9K3RjooKv2nOI0XPcRzj3ZqAlyamO0=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=bnLhkqPpzfdD1frBb3MQJClmhauzeLIeXftUr/2dTp9x5vtp0rPAzsw093oYyyc2Z
	 +x9JVMoQysPDvHnpUZGA8COlYUQMyAcOAik+q4N4AOnHzC8igsB8q2Ob7PpomIz6bq
	 VrvgstLtUuSbdj69fnzBeZjEC4CiEoI3ZQQhw4zw7QRb3Gj6kM1zv+lxeaP0XsKVx8
	 p+e7EwZsf3n6iCchw0qphwshQ+KUebY7KLsuCz6uZnZxx+otsn7WB8kJHXq65IJLS9
	 ZRR1dLGMvsZLq1JSE8+qvNMD1rM2DiU67wcMQ9WNGo8kAYtuBAxw8S8CFjAdY3v8j6
	 n2ppJPOda4Iyw==
Date: Sun, 7 Jul 2024 18:20:14 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.11
Message-ID: <20240707-renovator-coat-bfb979436bcd@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_102018_378270_4B12B94E 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5575354421330108465=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5575354421330108465==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LQbIIb9DOF9VsMd1"
Content-Disposition: inline


--LQbIIb9DOF9VsMd1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a handful of changes to the Auto Update driver.

Cheers,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-firmware-for-v6.11

for you to fetch changes up to d930eb4fdfee32e0a3e9a5c9c2af8d65857ac4de:

  firmware: microchip: use scope-based cleanup where possible (2024-06-05 19:36:17 +0100)

----------------------------------------------------------------
RISC-V firmware drivers for v6.11

Microchip:
Support for writing "bitstream info" to the flash using the auto-update
driver. At this point the "bitstream info" is a glorified dtbo wrapper,
but there's plans to add more info there in the future. Additionally,
rework some allocations in the driver and use scope-based cleanup on
them.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (3):
      firmware: microchip: support writing bitstream info to flash
      firmware: microchip: move buffer allocation into mpfs_auto_update_set_image_address()
      firmware: microchip: use scope-based cleanup where possible

 drivers/firmware/microchip/mpfs-auto-update.c | 136 +++++++++++++-------------
 1 file changed, 67 insertions(+), 69 deletions(-)

--LQbIIb9DOF9VsMd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorOTgAKCRB4tDGHoIJi
0tU8APsG402BUKYU4sG18yezDQxes03LamExL1FEzqwjP2oZWAD9G5L3ffXIX15a
Wegp/0q9sPUgmCjM4DKjGhY+sSRHUAM=
=JcM2
-----END PGP SIGNATURE-----

--LQbIIb9DOF9VsMd1--


--===============5575354421330108465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5575354421330108465==--

