Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC720C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JQOHIoOE6JI3JGLq5tjzKdN4f19Ss3RBKi44Trlv2WU=; b=ioeXrdGy/DA3Ed
	9rBTqIaA6o3GHlceUhc95MthGQBHWNrx08RyzcUYXRQg44buX/vesuNzZOrTek2S5UsM8LgofHmMe
	zBftsvo6Ag1/BxUzaya33iGG49pytLTvtbzoNHxOe8QPAI0lvNs06cjG1Ch+Ga6LJ06OJS8+2Wnfp
	+YW6uHirJur3lVGjCoYlseM7xdpMJHKSO1Fa1Q4/f1MmAySzz+P7yJL8HJwek6PMnauVknkRyVb3j
	NM0XODC/HWvb5BHeseInWKnBZPT17I15Tf0IVfwkTKQKAeGdx4q2Ya2b82I4p/qhF0o0Wa7iwTUO8
	v8d1r/W10rNuy+mI0z0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqW7j-006ere-FL; Mon, 16 May 2022 08:30:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqW7e-006epL-5p
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 08:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652689833; x=1684225833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VvJjr690n6NIuV5mJlZ/HRr9WDfpHhSY6OIBTkSDkfI=;
 b=ZVFaCyFES8OkLxLqdAEYGhZZn0vmeqJQZBi4aAKplIoEFBag90lSPB+Z
 8LnHxKKgTiHtn11di0/XpqMJ3VPNyH2bST7MnnCmTKAcybbrru3ldM9E0
 hPIEuX+jQmpoDa4QBemY94eSvjQzIbInWVAAk5GqLPqZOXQltJX9kOx55
 PS1DgxqNqqr+ZxxwSmrmyFx/vSctU4CWLqtpQ8r0sDmdfjZtezloOHZ1z
 jGbR6qQ7WuoZN+4qwDL+jpmGwzyZQ9L129VQr6vijbQU9V2dX3flslQ1G
 3HPwGVEDzHjBcb8wx6TdafTUnT3hTmGT9MYGthJmKGIW+v6tmFBsRuX/1 w==;
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="164190089"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 May 2022 01:30:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 16 May 2022 01:30:28 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 16 May 2022 01:30:27 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 0/2] rtc: microchip: Add driver for PolarFire SoC
Date: Mon, 16 May 2022 09:28:37 +0100
Message-ID: <20220516082838.3717982-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_013034_291670_6153C46F 
X-CRM114-Status: GOOD (  13.30  )
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
This is technically a v3 of [0], although a fair bit of time has
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
 drivers/rtc/rtc-mpfs.c | 328 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 drivers/rtc/rtc-mpfs.c

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
