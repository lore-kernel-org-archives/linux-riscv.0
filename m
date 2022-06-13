Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315D5C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ilTWl0pcV7KfiH4MJK6lVOrzCgP8BKi2glQ4leOxcI=; b=aA5R4WFpVcG7OV
	sqvlbgH/bigDpRgzrq/peCowNoN/66s262GQEMKONjP79kyWYg1LGwQbyMSS4sRCt0HWKit8qIH68
	BqpRO+19wXekrd6FTu2mrDY8QVa2g3FNxqydnHPuILH5HkaBp0N+Ar6qkJeGaLXjn9GE8VtzPqheR
	xpidLnp8ajjEe9L1ftwAYu1f5hYhU86LOV+nXDAQwmlSBKr8yJnMorho/5xRJLhZlmCeFSe6VuhvC
	UfWcon3xBBvVFM9hQxsIyMrXr4UMAOJMbMPu/Y4Dr7GUtZT4UfeoLorR6TjdV7WTDekKed4riVdxX
	S83POaLmh8/QZ0IZSwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iDi-003DPe-UR; Mon, 13 Jun 2022 11:26:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i75-0039y6-4A
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 11:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655119207; x=1686655207;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Z7LwiQq63QPFqjyunT+jVzk6Ngr6unTuvtymNkZK5w=;
  b=vtjqxbZ8uCRgskShCXDtfJAtSWevJk9wHUKuDGMJCUbIXHfJs7zPdtOn
   bZtW/9lq3p2g2K+GAHxtxmwWqFiaxlYBJibgOJezFJgWEJG9Wxj6CyNfL
   YCefhLP46QDmoeD8TNqFwEGprg7QMMuDv+8tMvtRPNehZE8NPg8S7cVce
   U1MMbXaXSAx9Mw8DlNaGrPVBPQDCNveNWycOIOM81fWcpVuEdmhqyrWFP
   5EEckgo6O/yYU6UGCx0+bfyrjUvuBFsSeErFB71vUXoh5XQW50WEc7Hfs
   y7duV+4qdSWkCo19BUn+hw99dctiB0Ztxyk/7fj8jMPEVHszYkBKnaJGL
   w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="163066291"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2022 04:20:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Jun 2022 04:20:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 13 Jun 2022 04:19:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 0/2] Add support for Microchip's pwm fpga core
Date: Mon, 13 Jun 2022 12:17:58 +0100
Message-ID: <20220613111759.1550578-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_042007_332773_39418F58 
X-CRM114-Status: GOOD (  12.45  )
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

Hey Uwe,
Got a v2 for you...
I added some comments explaining the calculations and a documentation link
so hopefully things are a bit easier to follow.

Code wise, I went through and sorted out a bunch of issues that cycling
through the different periods/duties threw up. Along the way I found
some other problems - especially with the longer periods which I have
fixed. I also added a write to the sync register in the apply function,
which will resolve to a NOP for channels without "shadow registers".

Other than that, I managed to ditch the mchp_core_pwm_registers struct
entirely but had to add a short delay before reading back the registers
in order to compute the duty.

Thanks,
Conor.

Changes from v1:
- account for edge "quirk" while inverted
- block changing enabled channels' period
- document the hardware/driver limitations
- rearrange get_state() more logically
- fix cast sizes in get_state()
- fix remove() and probe error paths
- delete mchp_core_pwm_registers
- simplify .apply() logic
- don't warn in calculate_base()
- fix period calculation
- fix duty cycle calculation
- add COREPWM prefix to defines
- add a documentation link

Conor Dooley (2):
  pwm: add microchip soft ip corePWM driver
  MAINTAINERS: add pwm to PolarFire SoC entry

 MAINTAINERS                      |   1 +
 drivers/pwm/Kconfig              |  10 +
 drivers/pwm/Makefile             |   1 +
 drivers/pwm/pwm-microchip-core.c | 310 +++++++++++++++++++++++++++++++
 4 files changed, 322 insertions(+)
 create mode 100644 drivers/pwm/pwm-microchip-core.c


base-commit: 61114e734ccb804bc12561ab4020745e02c468c2
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
