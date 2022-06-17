Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F32C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rfoKd+ncobXywN1pqN8ijOWGjsGGJJqMpPATR9O3B/0=; b=Kmgr2VE/3sT9Jw
	YsXRqds70VyGe3DuXXNFvU1mJmGC2yaJqpU+jlwYKUk0eWIaaQxasKfUjX1JqGze14ziRoL7RQd/s
	QlZUExR2RJX3X4ItzLOr0BlzH99nGT/G3qSn5pP7+Fe4Xn7I1aFMHpqJ8DRvvmpsvX9lsUb9XJoPR
	nrk6iq9r+HcnTMu8nIb0x82rwF6RttAxUOScK5A2Ic0TKMEtb8Co5qiAPPoHW5QbM5CmabW0nA8A7
	jhSbkWJ7SlOS2237GxiD+9+yPa3unF7rR6uyW8FYl/yoQDEq6hzKaPxjfSYtvNybUPWb9TcZiMGMV
	UgOAVsa4Mi1/JwqZcSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Baq-007kQn-0s; Fri, 17 Jun 2022 13:00:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2AQp-007Prx-OW
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 11:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655466391; x=1687002391;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rUrUGf34kDrDC4stey+5q/ue6Jew8NaeJPenPSRedGo=;
  b=poDEku0gVLstC11mBQW/FLQ2hIjHYCPo9RB/XowAGLGqEe1PgwOe6/yZ
   KddsnninUgsaI6DThYOMnZxG3EoNK7c+Xo5qCKKhKIzacQwa4mBRev61S
   2w6vBprzg9CPqfYZF/mLzsMiGTYtj4IaMXZQQV16Uwyo0xA/sDhJrEePl
   1ebbRMoM5WnFvZLl17oRxWamZUvZIF6srpi8yeT0cQL1dBXSGZ9P2C9dO
   cfyqRpWQvFjjMGdScSvOZ4lBFLmIlJSrmh/YOZjE/DUC9bPyrBPaHMk3U
   +yadHGxCyiGMGxHLrYugBX4gjsVe8aLaN/oDYkRbbMYwOo4Hvc1rw4Gwh
   A==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="178383739"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jun 2022 04:46:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Jun 2022 04:46:26 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Jun 2022 04:46:24 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 0/2] Add support for Microchip's pwm fpga core
Date: Fri, 17 Jun 2022 12:44:41 +0100
Message-ID: <20220617114442.998357-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_044631_892708_E84F16B2 
X-CRM114-Status: GOOD (  12.38  )
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
Got a ~v2~ v3 for you...
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

Changes from v2:
- fix percieved idempotency and rounding issues when shadow registers were
  enabled
- use do_div() for divide of u64 tmp in apply_period()

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
 drivers/pwm/pwm-microchip-core.c | 325 +++++++++++++++++++++++++++++++
 4 files changed, 337 insertions(+)
 create mode 100644 drivers/pwm/pwm-microchip-core.c


base-commit: 61114e734ccb804bc12561ab4020745e02c468c2
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
