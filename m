Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60630C54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=txP8Z9Qp7Q207RI8VKhRbnv3B/PIQcpjLM3zpy5moN4=; b=W6ABnEss/iyT//
	QpXVgVMaFZPexwbNgucX1SuiiuZ08+vSH+sukR+FgMU+5EA5do0RSVwx78c9O7uf1rlQrMZ59FsKr
	16BFvAH3qpEOU2eDg8V052uK0YNllBg+1QgCDFHO11u7RMsEJkmMLEiXW+fbpNT3R8GRlkrCk1s45
	wsVm/dhicyC+uvfUD2G3gYRkAS51N6gdyW4RjCeecYODHsSFIKwK7QbD9SEN6CaSS1KKXERBKUk/Y
	MDAxIfygkhFE004irjDX3iQMeL2xYJSfJhcj+PWB9sDdaqJCh6QnHoH6UGB4TXazh5EVovlRGHduX
	tkGwlsFyccor8d5RU8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQW-00BesS-Od; Wed, 11 Jan 2023 13:46:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQQ-00Beog-CC
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673444754; x=1704980754;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cj51biXqNN12jpI5oZaHKJtZe5Iy0G7zG7Vac+F++n0=;
  b=AlGX9cIjT9NngfMbsE0YavebZZ3NfJUNfgmFOehjbB28mSQHSF+NXXP5
   Cf3pZtgtFoixb/dmWWHgN2IFVl3v6c/AYaJa3FT38pibaHvUDeXhFyrlW
   ISKSJbLkKWn/yGkqASSSTkzgvEgO3DCF9mEpmvejTIkEDoqPumcXVgKBE
   f+4aLXzl7cjzjvFC3wovGKQ2tFNGqz+wCshEwA2h2y16Ce9nqUi71P97z
   oofr8PlN46m1LWzQj4aENa6qKjIk8Boz+LFocLpg2uBmf/Viq3Ii1KuKn
   kLVSWtgreWjrt5uNAmO210jPP1HILtfCa3dNdJFe96md+JBQNVzUSP2j7
   g==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="196344616"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 06:45:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 06:45:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 06:45:47 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/7] MPFS system controller/mailbox fixes
Date: Wed, 11 Jan 2023 13:45:06 +0000
Message-ID: <20230111134513.2495510-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_054554_587394_301CA673 
X-CRM114-Status: GOOD (  26.14  )
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

Hey Jassi, all,

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

Secondly, I have a question about what to do if a service does fail, but
not due to a timeout - eg the above example where the "new" image for
the FPGA is actually older than the one that currently exists.
Ideally, if a service fails due to something other than the transaction
timing out, I would go and read the status registers to see what the
cause of failure was.
I could not find a function in the mailbox framework that allows the
client to request that sort of information from the client. Trying to
do something with the auxiliary bus, or exporting some function to a
device specific header seemed like a circumvention of the mailbox
framework.
Do you think it would be a good idea to implement something like
mbox_client_peek_status(struct mbox_chan *chan, void *data) to allow
clients to request this type of information?

It'd certainly allow me to report the actual errors to the drivers
implementing the service & make better decisions there about how to
proceed.
Perhaps I have missed some way of doing this kind of thing that (should
have been) staring me in the face!

Thanks,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (7):
  mailbox: mpfs: fix an incorrect mask width
  mailbox: mpfs: switch to txdone_poll
  mailbox: mpfs: ditch a useless busy check
  soc: microchip: mpfs: fix some horrible alignment
  soc: microchip: mpfs: use a consistent completion timeout
  soc: microchip: mpfs: simplify error handling in
    mpfs_blocking_transaction()
  soc: microchip: mpfs: handle timeouts and failed services differently

 drivers/mailbox/mailbox-mpfs.c              | 25 +++++++----
 drivers/soc/microchip/mpfs-sys-controller.c | 48 +++++++++++++--------
 2 files changed, 47 insertions(+), 26 deletions(-)


base-commit: 88603b6dc419445847923fcb7fe5080067a30f98
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
