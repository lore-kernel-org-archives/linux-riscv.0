Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC43C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EsGXkf/ZQPCZcoVKgkx/sZfx7/l/7VYNHcYaIW6GNGk=; b=k0wGSC+T7BZuWN
	k/gOU7B2w8j5cOOej9EtEXL9l4Vi1bSKHLHoPTp4PtMz0/oBvVQJxNyaz9AjqvVhKFDjDyJ2aFlEa
	Zps7x0PLv0NBzERhJuVLtppATK/aPkVIiWHf7Ms36Kk94t+sP0+2oKeHImzVL7LVc2Wksr3f8TgRY
	rk6QLSzzUxCRNvKLCYop4c8tm1hlkcDgCJ+YWkuZjVBbX3yU6yXX4jByE53NU0+W1TZaMKhpzXynH
	qJmkTP+ongP5vTtOK2xRp3i1ttiLM/k5xKo/9f4YVD6Qa+g9ZaIHMAfLBh118N9VwXMx/mB3CEXUQ
	6QwdQLzwyjY5J3DaOtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqM-002MMu-O0; Tue, 07 Mar 2023 20:23:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqI-002MLB-Rc
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2B698B819C2;
	Tue,  7 Mar 2023 20:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7BCC433EF;
	Tue,  7 Mar 2023 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220603;
	bh=aBBo7ND5PU6BMsXweP6p08wP+hF3qkanOx37NJDOja4=;
	h=From:To:Cc:Subject:Date:From;
	b=KSeZYvRchNHv7BSW0Mm9hcYhmc3FzuHKbfx+D28jey9I8MRgkVzvfOJgkGJwlYmqt
	 wzg6SgCHSlNKLPS0yds2dqAGMrnPnZBdPlwBo2oHJ5E6D1L4fnYFLfMyixIZsxHjSN
	 HVzpFE9mp6Npp3Rulv/le4qAvajfi+EFWB2zeKFNWaKLWriDocdUMJkn8dqrkppl0y
	 DS8D+2L5Yl2x90mxikE2E5jxO5Zj894Ccorz9jJ7FFbLM23lO+31k6D9zK5hL3krbS
	 03AfeqwKM8A+C5wlYyEZw7RZ308xdCozh6axITR89Um50Dn5mD9iAMjqrrdl6tWvxu
	 EKZiiUAQuztlg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] Hey Jassi, all,
Date: Tue,  7 Mar 2023 20:22:50 +0000
Message-Id: <20230307202257.1762151-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3553; i=conor.dooley@microchip.com; h=from:subject; bh=objaY8Iic30N8AZK2EQh6NRbGiNWI0wnNHpQoF1qVRg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4U8MldyXExRan+ctiQjQmdj4fSe+UyL13kHPLxQc UxqZumvjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkFDMjw/YKaY3OPz8PfumQ WmTsmS23Z3fFvPzwpk9alVPVlhuc72b478DNm/L4xft8rYpOi8jlfNyp7rt3mpgoFadZdr6cV87 PDwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122327_206938_52B2133E 
X-CRM114-Status: GOOD (  22.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Here are some fixes for the system controller on PolarFire SoC that I
ran into while implementing support for using the system controller to
re-program the FPGA. A few are just minor bits that I fixed in passing,
but the bulk of the patchset is changes to how the mailbox figures out
if a "service" has completed.

Prior to implementing this particular functionality, the services
requested from the system controller, via its mailbox interface, always
triggered an interrupt when the system controller was finished with
the service.

Unfortunately some of the services used to validate the FPGA images
before programming them do not trigger an interrupt if they fail.
For example, the service that checks whether an FPGA image is actually
a newer version than what is already programmed, does not trigger an
interrupt, unless the image is actually newer than the one currently
programmed. If it has an earlier version, no interrupt is triggered
and a status is set in the system controller's status register to
signify the reason for the failure.

In order to differentiate between the service succeeding & the system
controller being inoperative or otherwise unable to function, I had to
switch the controller to poll a busy bit in the system controller's
registers to see if it has completed a service.
This makes sense anyway, as the interrupt corresponds to "data ready"
rather than "tx done", so I have changed the mailbox controller driver
to do that & left the interrupt solely for signalling data ready.
It just so happened that all of the services that I had worked with and
tested up to this point were "infallible" & did not set a status, so the
particular code paths were never tested.

Jassi, the mailbox and soc patches depend on each other, as the change
in what the interrupt is used for requires changing the client driver's
behaviour too, as mbox_send_message() will now return when the system
controller is no longer busy rather than when the data is ready.
I'm happy to send the lot via the soc tree with your Ack and/or reivew,
if that also works you?
I've got some other bits that I'd like to change in the client driver,
so via the soc tree would suit me better.

Thanks,
Conor.

Changes in v3:
- check the service status in the .tx_done() callback rather than
  mpfs_mbox_rx_data()
- re-order the if/else bits in mpfs_blocking_transaction() to please my
  eyes a bit more
- expand on the comment in same

Changes in v2:
- up the timeout to 30 seconds, as required for services like image
  validation, which may vary significantly in execution time
- fixed a typo!

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (8):
  mailbox: mpfs: fix an incorrect mask width
  mailbox: mpfs: switch to txdone_poll
  mailbox: mpfs: ditch a useless busy check
  mailbox: mpfs: check the service status in .tx_done()
  soc: microchip: mpfs: fix some horrible alignment
  soc: microchip: mpfs: use a consistent completion timeout
  soc: microchip: mpfs: simplify error handling in
    mpfs_blocking_transaction()
  soc: microchip: mpfs: handle timeouts and failed services differently

 drivers/mailbox/mailbox-mpfs.c              | 55 ++++++++++++---------
 drivers/soc/microchip/mpfs-sys-controller.c | 52 +++++++++++++------
 2 files changed, 67 insertions(+), 40 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
