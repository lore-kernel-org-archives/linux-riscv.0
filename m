Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40B4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gq6mQz3KhChuk8U2it1P/sZ9LFvsPkVLdJmeTgOP0ok=; b=WUX3m38E0/zenb
	VtYg6RczvdngoCzzLnvfDQfdOCh2lxN76rB05lo0mW0QRQvgUU2ycryUfItWFV27xVHacLofhhDBl
	FA0ajLK+ZzXaoP1QXJf6SgywJKSJHtwqF7sEfJsCGLuJwssAWXeXXW8dnsXZyyKatpJG/zYMwM6/J
	Ixt+e+mT+eC1vZpVgcTJhaOQebRjGullegdz69U6C/cf/vUDVy3XqpKYcxw9H1Wrr2hGohf0mCOPf
	OqPRy2vN5Od7W81DAc7UEL8nIsnqmm6DYNYdMy159Es1cZOweAGBxnEao7aopIRxotZknuX2JcpOG
	ga6mxZG8WIKBEtS+jRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhfG-007gW4-IV; Thu, 19 May 2022 15:02:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgeF-007BZE-0Q
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 13:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652968623; x=1684504623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qHQfaI2qEG6es+WFBkybiU4w71hm7VMtmExmawIPkjc=;
 b=T82A5pXnZJo48rteCTgY8Ypj1obnChUfooyXO+CYXkOjZEmSajItG+ji
 1zC8Z5Gw1FKCXP7WHcteMGYvqMdGfQV7lTKNxK/g+/AVR5/k+0s9bgXCF
 Ra7mN3AHgT8wWUAQuySACDOQ088KrfAq9pHUDNCBPxOBrEwXOcXSmWRZv
 ADnrq+33zKVRS70m7WlXlh+ZAj2rEe8ppdwELCyZBamKXjHqoZU4BLeps
 utzAqgPYEEa6DYpAkOycdZKkL2y7EovpdOb928rQ1w9BLFCu9kFiGXdn1
 D1xsCNpO6pQgeXJqxA85sio67GDQ9yRwfGtPp54cjMkzXHNIAdtCMtL73 w==;
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="164801009"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 May 2022 06:56:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 19 May 2022 06:56:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 19 May 2022 06:56:55 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 0/2] rtc: microchip: Add driver for PolarFire SoC
Date: Thu, 19 May 2022 14:55:21 +0100
Message-ID: <20220519135523.594347-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_065703_127079_7FE08A10 
X-CRM114-Status: GOOD (  14.50  )
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
This is technically a v4 of [0], although a fair bit of time has
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
