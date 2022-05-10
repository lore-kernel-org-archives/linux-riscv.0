Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1DEC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 13:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YekiNVvHxq4FqpuEDWw+BeMgYIRMwlL7+gF7Cw+Fr0I=; b=h4WDhxowaeHEgC
	UUGJ3VVAYGp7xoab/YSQlPIUrGHyWb5aNb3zWmdebuIP4zYa3jdXJXxg1a1u9jpAOM0TH6e6IFz7V
	AVpCIoCGLSG+r8+5sxpKOAoAjCAloivmF4uQj02a6/v3Z0XJ6ENHFEuFzBWpZUygGeaJqCxXV2/3n
	frNM9q/Gmt2pcJCaUzy4F8y9OUl0UD/YU8j6QN6Lth+JbvnblHPIthvsWP8aQ+jZXSi/C2KgfpHz5
	rnqjcChWns9a9y5KkI35mDAwBFuOsehc0eHHADAsKbuiwbcYUvfFWufP76vwuINdssx/9uiXD6itc
	hnCFxR3O7yPgeLI5nX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noPjN-002Atr-Va; Tue, 10 May 2022 13:16:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noPjK-002Ar6-GO
 for linux-riscv@lists.infradead.org; Tue, 10 May 2022 13:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652188606; x=1683724606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cJFpqELHzhKnktUrPZO/GTJ1OjcJc3cKHEtNthHeXRo=;
 b=hCzGVJjN6Hs2tIuvXevjxB3WgApXv5RNBWzt5m8QiKTu0lLWzmidbquS
 6nciisunfe9Bg/zIRZZ3M6epKpi5BoMuhGUqbbAEC5UecfthOIvKqW1sw
 oCVBU6DDGO6SinzHw/Yy9qvm/vT/zXdhUEJKRj3r4+O7BX4hnWTpSW0qb
 iDo3JyCeb6R1OxlCxJlYS++83tFgucwrwcstRsoUVSBSeZDHoILNeS3/e
 aHRj4BRyl5+uFBq1xTSZzDXyy32X3K8pU25NlJlhQYzXb/kUdcDyEbcxw
 kJVNS/bmjQ6Tu1cfYNXJY6aY/yTIRPCL4n2bzQ8nV3h9CL/qWdANgGf4g Q==;
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="158457294"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 May 2022 06:16:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 10 May 2022 06:16:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 10 May 2022 06:16:39 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/2] rtc: microchip: Add driver for PolarFire SoC
Date: Tue, 10 May 2022 14:21:15 +0100
Message-ID: <20220510132116.506572-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_061646_724877_2E1FD7FB 
X-CRM114-Status: GOOD (  13.08  )
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
This is technically a v2 of [0], although a fair bit of time has
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


base-commit: c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
