Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2194C32792
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EpDJjPWi0DeIg1BiRllY/kEtwFW/yjLmS3IWXtU5T5c=; b=cw+3y9Ury/bzHd
	WBYvnjDz/op+DyK60s/Qrwd3fjwtxkbeQc/cEICFGvq55UL0aZJTK+o0RdS0MWoHyeANCfeWkPffv
	Em/MkTpeI3yvqnSBhY4LDmKMaD6WsswA15tFjSISE2ink3QG6C4dANAft8ez3bmiBwYbGi0tayNCN
	wcZxRueaP1VSHf7//JnE3JNZNq4uQWUJmRDCLXo8e1a99cUkfqLxjWTYfcFctyqESC3w3FcZXqnLD
	afFLL0qZd4Uzp4OGgkfCMrtJu2kSvi9qKlCMupS8o3fExHzOqwW2Wb+SUOf4+pYWO9K8Acrs/THjc
	5uk1Tc6H7/qfCom63Bcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmRQ-00BgL9-3L; Wed, 24 Aug 2022 09:12:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmRJ-00BgE3-8D
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 09:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661332365; x=1692868365;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9fafva9EHYgPDg83m0+eFLxNaYkygx9GqvZsKYBV8ow=;
  b=ZJwDPBqTpprwQghvb0BieycOba66IYW+la9B/q3qHWhuqcY/UHUPr2HH
   ehCQVo7EQ4Z8Q2+XI9m+AA5a8PTcoFTT3qqeLkfG6Lt/ZG5T9dzoxPCLz
   uRvZSMhZJ6MDMtyV9VvI0cDhSI/h4+5cKu4yvsAujLcTvXbmMqlMPjqLm
   TFBb4y3Cd4pzHfow0rrTYACFMN26dFDKKZ9It9kXH1Xwl5Z1dsZB8ipKk
   aSyhHJhBJVquD08F06tCF65ju7wHCChMl4eDgtt3X4+Mkh2FvHjB0Fx13
   dsWDOpavcuzkNQHjolGEupDcUZAUE+tT6rxQRiyYwOG778VJBACU80hSL
   w==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="110471365"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 02:12:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 02:12:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 02:12:34 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v10 0/4] Microchip soft ip corePWM driver
Date: Wed, 24 Aug 2022 10:12:11 +0100
Message-ID: <20220824091215.141577-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_021245_418937_65F267BD 
X-CRM114-Status: GOOD (  17.29  )
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

Hey Uwe, all,

6.0-rc1 has rolled around so here is the ~promised v8~~v9~ v10.
The pre 6.0-rc1 cover letter/series is here:
https://lore.kernel.org/linux-pwm/20220721172109.941900-1-mail@conchuod.ie
I'll take the dts change myself once the rest is merged.

There is one change here that is not directly from your feedback, I
added a test for invalid PERIOD_STEPS values, in which case we abort if
the period is locked and cannot be fixed. Hopefully the rounding is not
ruined..

Thanks,
Conor.

Changes since v9:
- added the missing unlock that Dan reported

Changes since v8:
- fixed a(nother) raw 64 bit division (& built it for riscv32!)
- added a check to make sure we don't try to sleep for 0 us

Changes since v7:
- rebased on 6.0-rc1
- reworded comments you highlighted in v7
- fixed the overkill sleeping
- removed the unused variables in calc_duty
- added some extra comments to explain behaviours you questioned in v7
- make the mutexes un-interruptible
- fixed added the 1s you suggested for the if(period_locked) logic
- added setup of the channel_enabled shadowing
- fixed the period reporting for the negedge == posedge case in
  get_state() I had to add the enabled check, as otherwise it broke
  setting the period for the first time out of reset.
- added a test for invalid PERIOD_STEPS values, in which case we abort
  if we cannot fix the period

Changes from v6:
- Dropped an unused variable that I'd missed
- Actually check the return values of the mutex lock()s
- Re-rebased on -next for the MAINTAINERS patch (again...)

Changes from v5:
- switched to a mutex b/c we must sleep with the lock taken
- simplified the locking in apply() and added locking to get_state()
- reworked apply() as requested
- removed the loop in the period calculation (thanks Uwe!)
- add a copy of the enable registers in the driver to save on reads.
- remove the second (useless) write to sync_update
- added some missing rounding in get_state()
- couple other minor cleanups as requested in:
https://lore.kernel.org/linux-riscv/20220709160206.cw5luo7kxdshoiua@pengutronix.de/

Changes from v4:
- dropped some accidentally added files

Conor Dooley (4):
  dt-bindings: pwm: fix microchip corePWM's pwm-cells
  riscv: dts: fix the icicle's #pwm-cells
  pwm: add microchip soft ip corePWM driver
  MAINTAINERS: add pwm to PolarFire SoC entry

 .../bindings/pwm/microchip,corepwm.yaml       |   4 +-
 MAINTAINERS                                   |   1 +
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |   2 +-
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-microchip-core.c              | 402 ++++++++++++++++++
 6 files changed, 418 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pwm/pwm-microchip-core.c


base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
