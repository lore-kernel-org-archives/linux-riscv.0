Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6D8C3DA44
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 17:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=I2GfJtoaErlZMmQiK6O6wmWH7e2FF3F+SqPUcyub7ew=; b=g3a
	NKxP5+h0TKHdS1xGgUgeMmTELX8sw6MbvN/THXcFyLHV4zhlHQEoPvYOepWLXCzuzyqvCjhdRrBgJ
	sFxt0ZJg3j3pvfpmkooZA3tOo4gECZo59IufEPoNWoXVtVCDrNK8bBN1zlnsrhkr4WLXgpv1/VPq5
	4z59t68yV28Cbzpap8MJwokUiX92kdU/NV/flmonOPGFqUDuTT+UH3ClRXc8yichMxboApqhHYwMz
	ggFL4j6tGqYF6piIIk1Tg7qkw1byywJ4w201GeodgBAVky0oUnVCROZiW3Scy8QqMax8pDN9MD7T1
	99fG9fdjtLevzCbZi/63+dcrfmv8g1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVcD-0000000241U-1m9u;
	Sun, 07 Jul 2024 17:23:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVc8-0000000240q-0dQ6
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 17:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15212CE0987
	for <linux-riscv@lists.infradead.org>; Sun,  7 Jul 2024 17:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACB6C3277B;
	Sun,  7 Jul 2024 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720373028;
	bh=4r/fjz6JfKzrR0LEZ5O0zQ+ECsAhunRdItLDMwFHRgM=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=NDchqJFaFhYl/dU7GlLYcrZrzJK6tMHMISW5qLAVysVM7cN5MuLuWexuuosk33ReC
	 Ddg5AtkFSkBB3KpgxbV0ROBgWLjtVgeB0VQ6LZbqUcivsLqq2UeTuMlY2a2d4YnvJx
	 9AhSxUiPbdEaKI1L2014W4psY4MRVkJf5R1RBld1l9vbtUHhYnzxUnmI4jZbLSU8wz
	 JxDBYyjeTV9jV5wN7jGoQnnjuoIWzAepzmcqWqJVGUi3/JtpldJRhjskb2mdQXr1ty
	 Z7OGOJJKsGYt6FiGUIlTBqr48ujHExZZwEVmFqPfHV77OAv9BORhzQIoowA7R2Ojko
	 BP3Vcg5qvz21w==
Date: Sun, 7 Jul 2024 18:23:45 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V firmware drivers for v6.11
Message-ID: <20240707-lukewarm-film-8a9da40a1c27@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_102354_242934_4A88CD26 
X-CRM114-Status: UNSURE (   9.44  )
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
Content-Type: multipart/mixed; boundary="===============0060219649721656974=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0060219649721656974==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dzNMppHeLU5ud5xK"
Content-Disposition: inline


--dzNMppHeLU5ud5xK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Attempt 2 with a fixed $subject. I blame being sick for missing that..

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

--dzNMppHeLU5ud5xK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorPIQAKCRB4tDGHoIJi
0sANAP9bG1K7y/ld1oIlIANO1X2CSkjouvdLAZI4cGnCvgF5NgD9HFkF+Ehehl9b
9cDjuyr0WS+aDzXGGqwTqrGeDuaQrQE=
=XXpr
-----END PGP SIGNATURE-----

--dzNMppHeLU5ud5xK--


--===============0060219649721656974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0060219649721656974==--

