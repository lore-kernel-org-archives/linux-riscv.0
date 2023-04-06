Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A9DC76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 20:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qOJK6b8yJP89VmZ+2tKAwh1aZwTIqi7wJef6YJq2zkY=; b=V4H
	sNwhE3x9FiI7gWbRvyq7MTUf7k192abHrQX5ZWaYCmJioeImLO9Ltru5t4p6to9LJrdJmK1lJof65
	TRzoZhDj2jLdCJg9bd35fcAWgSfZl5LIyw0agRaS8aTTeR7EV1pM+1nugaSmcFaYq6tebuaK1FKJ6
	Ut9EyBlG4f86kq/cI9UuE/qso3dsaTqinn732YvsYAD/DTB2O9Jwgal8aBhWlTFyy5So4yX4Z7vWm
	MMUgWC7/dCxIMcNvaMAVyC0QMcTcoUg3mHGXK42IqJXxRqWdgIuB6UyliHy9GKd5Ws4lDAnSNMFsx
	f/Gv7R5d5Ef1P3x/wk2CezcGY1pCB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkVxE-008UFc-08;
	Thu, 06 Apr 2023 20:11:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkVxA-008UEL-2d
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 20:11:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 440C564BF6;
	Thu,  6 Apr 2023 20:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78143C433EF;
	Thu,  6 Apr 2023 20:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680811887;
	bh=RG0+qH0bHgBw6z23tjhDO+t3nbzJJKefNMSC7QzCp8k=;
	h=Date:From:To:List-Id:Cc:Subject:From;
	b=KUdisQZQ4Ri7N9ofNoSule7tMwdz4oVZtIrT/r2rHBqMhFGVEZRj7QISH2IsH50ga
	 N7fCCv6X8g15yq+hbd+ZYOkktMS6SX9bryAmJ+tADY/iCuFu5L33rbnMh0yHBBT2qT
	 T8qVB0e86XM40h8UYs8d4Wf0gfIs0f5Cjj5pdy27rsjCcri9/wKqo/c2jBRWmNyGqI
	 xEni9Nnc5ZyLsDPlQGY5xQgduff+Jgt9gzMt9Y8ovDw3tEGeci90paykp74Jo+nN13
	 QAVy9taWLBfBFHgqd5/QF5aU9Nb4SRtANIsqwSVxqGseqjlVDcuGuQMEXZtmKqJ2rk
	 lRMh1o4rOf6ug==
Date: Thu, 6 Apr 2023 21:11:23 +0100
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.4
Message-ID: <20230406-islamist-mop-81d651b8830d@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_131128_939136_20F1B69C 
X-CRM114-Status: GOOD (  15.24  )
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
Content-Type: multipart/mixed; boundary="===============3573548942076775370=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3573548942076775370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MG9SQdyiof7sCpeZ"
Content-Disposition: inline


--MG9SQdyiof7sCpeZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some updates for the "otherwise unloved" RISC-V SoC drivers
for v6.4! The bulk of this is my fixing my own driver, and there's a fix
in here to make sure that we don't hit randconfig build issues once !MMU
is enabled for 32-bit kernels.

Thanks,
Conor.

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-for-v6.4

for you to fetch changes up to 4dd472bdafcb660bea17bc63a97d06e24fcb36ed:

  soc: microchip: mpfs: add a prefix to rx_callback() (2023-04-03 20:32:43 +0100)

----------------------------------------------------------------
RISC-V SoC drivers for v6.4

Microchip:
Mailbox controller & client changes for the system controller on
PolarFire SoC. The controller bits have been acked by Jassi.
Primarily the changes work around a "hardware" bug (really the system
controller's software, but it may as well be hardware as customers
cannot change it) where interrupts are not generated if a service fails.
The mailbox controller driver is tweaked to use polling, rather than
interrupt, mode and there are some changes to timeout code required in
the client driver as a result. There's some opportunistic cleanup that I
performed while doing the swap too.

Canaan:
A single fix for some randconfig issues that crop up when !mmu is
enabled for 32-bit kernels, due to my changes in a previous release that
swapped out select based entablement of the driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (10):
      mailbox: mpfs: fix an incorrect mask width
      mailbox: mpfs: switch to txdone_poll
      mailbox: mpfs: ditch a useless busy check
      mailbox: mpfs: check the service status in .tx_done()
      soc: microchip: mpfs: fix some horrible alignment
      soc: microchip: mpfs: use a consistent completion timeout
      soc: microchip: mpfs: simplify error handling in mpfs_blocking_transaction()
      soc: microchip: mpfs: handle timeouts and failed services differently
      Merge patch series "mailbox,soc: mpfs: add support for fallible services"
      soc: microchip: mpfs: add a prefix to rx_callback()

Jesse Taube (1):
      soc: canaan: Make K210_SYSCTL depend on CLK_K210

 drivers/mailbox/mailbox-mpfs.c              | 55 +++++++++++++++-------------
 drivers/soc/canaan/Kconfig                  |  5 +--
 drivers/soc/microchip/mpfs-sys-controller.c | 56 +++++++++++++++++++----------
 3 files changed, 72 insertions(+), 44 deletions(-)

--MG9SQdyiof7sCpeZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC8nawAKCRB4tDGHoIJi
0jpvAPsG/NvFHWbivVqaIaLXBOhx1O24bkBks+fD9Tjcj93OTAEAlfjInam2orOU
RLfmeEtVNnF8u+KCbf4ioD2F1H6YOwA=
=tcys
-----END PGP SIGNATURE-----

--MG9SQdyiof7sCpeZ--


--===============3573548942076775370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3573548942076775370==--

