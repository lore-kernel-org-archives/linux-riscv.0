Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04060C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7D189b5vEdTxRRsh77A4CWEWuAYksy5hCWxuUGdhK+M=; b=ECmW0IOOqMIRFf
	KziXsAs/sa8Okmv+7FL2B4xiVa7aB+GULmQaVglmE8ZK7WE7Q46xP1wFDJ0Zn1msOjc6g6JzZ3aBe
	UIj6uYGMXmWiA4n9hO8IzXwc7qjPQJUBUQRbEXd6iPEbVHIXNoV4Snh3HaGG1p5lt7P5jJx2c6QkL
	2/3K4Qs8Vje5ozTXw5LidWFHCZncsSHBfI3xtt6iPilBXoBiE8C5G8JsN9F3v8iEN02skfYOJWeEw
	2RmWXeFBKj3bw2lR0EV75bnStDFOOsXihzoZkJJ7S/fXfiexidAUVvCaRqkIsm7wLvmbEN8WHJjwo
	NsxLu5CC/ggsXjIE7qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQDX-0000000DEV8-2stq;
	Wed, 12 Jun 2024 15:48:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQDU-0000000DEUL-3ACe
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 15:48:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7033614D1;
	Wed, 12 Jun 2024 15:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4F4C116B1;
	Wed, 12 Jun 2024 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718207331;
	bh=Zv5RO+ev5GfuXBQM8OVvJacsGQmGXoAme99ziwuiEck=;
	h=From:To:Cc:Subject:Date:From;
	b=BX7YQziIjwMZfXU0YaZomh/upatYQYZUGXQ/gieuDsa9lHHH6IXuLe5CWwi8zvEiO
	 4MVnoIG7zXqf/0d24cWmZHPf3kTevU7tUBOj26/3MnuklimKVGk5huSRgKYwztRmu/
	 GgkcV19g3+RW982sqldDpHHAyHvbiGqO4/GwXUcplKhwhc1jhFSXMOFwjOAeS/uY2g
	 UURuFkVVoi6LncNTPzj390R3bL4rqB7DQ5N9JiXHB2HBpnNkuAw2AP6yUK23Mddplw
	 L+GDRo7hirnaWDCQs9G5tvMOJL78qu04pnRH/U7EWVNQWmfqsfvDi7Kk7dRbB9Dxri
	 UMWjj3YilADrw==
From: Conor Dooley <conor@kernel.org>
To: linux-mmc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	cyril.jean@microchip.com,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [RFC v1 0/3] mmc-spi - support controllers incapable of getting as low as 400KHz
Date: Wed, 12 Jun 2024 16:48:30 +0100
Message-ID: <20240612-brigade-shell-1f626e7e592f@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jUBdCKFRhPbdoAZJHxpB1biK3nMfNT3Pp93RB7R03bE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmZh31+Pm/g6ohf0duw6nVeD9Per0uMtwtxV56d+SrMv b92nZBlRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbytpbhr8Bf9Si3ZXVFdZVd x49dWL3xPsN13mz1GY8DrmmEx8WwlTL8L+kS/R9c+YftQeCvP85rHr7O8L3xseH8jP878tVe9mf sZAMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_084852_887349_218DB203 
X-CRM114-Status: GOOD (  11.62  )
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

Yo,

RFC for some stuff that I've got in-progress for a customer's board
where they want to use mmc-spi-slot with a QSPI controller that is
incapable of getting as low as 400KHz with the way clocks have been
configured on the system. At the moment, if a controller cannot get that
low, linux continuously reports that queuing a transfer fails. The first
couple of transfers will complete on this system, until mmc_start_host()
kicks in and clamps the frequency to the larger of host->f_min and 400
KHz.
Doing something like patch 1 of this set would allow the mmc-spi-slot to
function for some sd cards, an improvement on the current none. I don't
have any sd cards on hand that don't support the 5 MHz minimum frequency
that this controller is limited to, so I amn't sure at what point this
will blow up if such a card was used.

Is this sort of change something that would fly?

Patches 2 & 3 are just here b/c without #3 the qspi driver for this
platform doesn't support anything other than mem ops and #2 is required
to set the minimum frequency for mmc_spi to pick up.

Cheers,
Conor.

CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: cyril.jean@microchip.com
CC: Mark Brown <broonie@kernel.org>
CC: linux-mmc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-spi@vger.kernel.org

Conor Dooley (2):
  mmc: mmc_spi: allow for spi controllers incapable of getting as low as
    400k
  spi: microchip-core-qspi: set min_speed_hz during probe

Cyril Jean (1):
  spi: microchip-core-qspi: Add regular transfers

 drivers/mmc/host/mmc_spi.c            |   5 +-
 drivers/spi/spi-microchip-core-qspi.c | 224 +++++++++++++++++++++++++-
 2 files changed, 226 insertions(+), 3 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
