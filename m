Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9188C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r0HWN6ZRzHf2wIKQUBWplJLLjcFmAKyDHYy6aDGv0us=; b=unqT7+uwkKwoiP
	PJ3sjFUcMc5GCZzn6o1OVFAAkCnvZj9xO+O2MOiAqR107jXydlfo5XhCIODyG4zMV33A1frQoD85+
	6CxjuVKKTzxujqgfLoQFMtyVqQQWub6YK3Y3LvVTIKip+be6prvDv1/z4WteXJV68scT7oWhvlrdE
	MyOwuEHiNdRTac0EHtcHgXMYOsjQm0MtHGADd0QSlu6xgNyQhpD669tsdNT2qCdQzGB0bcpke4dN0
	17CCw08QQHo4Jg+eOeTrTZ5udFQLdbvR88s+DWKkbtm+A/UxytLVdxSs0JnBWgaYXK8Dx/1QfpITW
	BwENH7Tra2QD/2D7xnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNZ7-00G3ZJ-9A; Wed, 01 Jun 2022 12:35:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNZ4-00G3Xx-3I
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 12:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654086906; x=1685622906;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KaYR/blB8zGHDSr0CLcv5ju+jN5gMeOimUNbfTUhUQs=;
  b=DESPtUJN5ek3haw7NaJRXQEVa1R8kCebr10VLYhu0Kc3tO3PgJhIAC70
   LO6uT+Cx2C0LKyRU73q5VagkKHw9NlWVHiBeNgh9zCcQ8QC+OfTt5vrZq
   +AuhLpwkEMQefAFl588Ay7IqEQ9C8slx16FFuPTJeJQ39QqTkZ6/uirUZ
   9+TuMVWqcIv24Gz0Hp4LNEjzdPo9exskejPrFhpQVxL2PainQtbJOU6F3
   0XKorkeSNNFEBI7g7RN+uswpogIl/NiPqlsHjue2SQPssZAPPr+3gAeZy
   Xwmv+5wz09C3tF88M+kyeVKa1yxUJ4ET+THrOpnIVY2VB9j5KzBgZOP+h
   g==;
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="176039617"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jun 2022 05:35:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 1 Jun 2022 05:35:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 1 Jun 2022 05:35:00 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>,
	<conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v5 0/2] rtc: microchip: Add driver for PolarFire SoC
Date: Wed, 1 Jun 2022 13:33:19 +0100
Message-ID: <20220601123320.2861043-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_053506_256110_45611022 
X-CRM114-Status: GOOD (  15.57  )
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

Hey all,
This is technically a v5 of [0], although a fair bit of time has
passed since then. In the meantime I upstreamed the dt-binding, which
was in the v1, and this patch depends on the fixes to the dt-binding
and device tree etc which landed in v5.18-rc5.

The driver is quite substantially rewritten from the v1, as you wanted
it to be switched to "binary" rather than calendar mode - so hopefully I
have satisfied your concerns with the original driver. Specifically you
had an significant issue with the counter being reset on startup & that
is no longer the case.

Thanks,
Conor.

Changes since v4:
- replace duplicate define of BIT(6) with the missing BIT(7) define
- remove duplicate read of the mode register in mpfs_rtc_readalarm()
- simplify if (mode & MODE_WAKE_EN) to an assignment
- replace (potentially) infinite wait with read_poll_timeout

Changes since v3:
- invert read order of datetime registers so that they are properly
  aligned. reads of the upper register are aligned to the last read
  of the lower register
- move wakeup_irq out of mpfs_rtc_dev & into probe
- removed range_min since it is not set & implicity zero anyway
- rewrote the remove function to not call mpfs_rtc_alarm_irq_enable(,0)

Changes from v2:
- move prescaler out of mpfs_rtc_dev & into probe

Changes from v1:
- remove duplicate and unused defines
- remove oneline mpfs_rtc_set_prescaler function
- dont unconditionally turn off the rtc in the init function
- dont reset the rtc when init is run.
- dont disable the alarm when we boot
- use binary, not calendar mode
- delete mpfs_rtc_init & set prescale in probe
- use dev_pm_set_wake_irq rather than writing suspend/resume functions
- delete calendar mode only register defines
- since using binary mode, set range min to zero
- set range max to max alarm value (is this acceptable?)
- added a MAINTAINERS entry: when v1 was submitted there was nothing to
  add to, but there is now.

[0] https://lore.kernel.org/linux-rtc/20210512111133.1650740-1-daire.mcnamara@microchip.com/


Conor Dooley (2):
  rtc: Add driver for Microchip PolarFire SoC
  MAINTAINERS: add PolarFire SoC's RTC

 MAINTAINERS            |   1 +
 drivers/rtc/Kconfig    |  10 ++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-mpfs.c | 326 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 338 insertions(+)
 create mode 100644 drivers/rtc/rtc-mpfs.c


base-commit: c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
