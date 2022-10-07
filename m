Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F46C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8NfjZJad3sLRvuUDBrmLpWPt/b4CgpvdU1tCrwB7/TE=; b=hpXLvs4SN5B4OJ
	A31QtN4H0ps1UG47aRSiRTSKXABS4+jCXrMHGXqSeWlxphezFjVBW1VPv2OjWcrMi4Enkb2Y0HFgm
	R8GttTMiyEqIXKUuxFdySlRyGfydcUxBsZmvD9cwNFbaGNuo53k/YS3YAFKoJyV37IDupFERLMFZx
	mMFt6dDGnZscCK+373TqP49uGoR3U2tsL3GbT9v6CSZF9MymR/bg+FtiJMV3skGWFLJJrSjh9t0K/
	PCej5wceJeoGqKpFsYNLbXeMAEx23iOtwXkiRiA/4N0CPjH1sb4ssAFoKapYaCuYgTCkY9xXgEPXy
	9SaWeLrrg1bx05+chgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogldx-008hnS-Kr; Fri, 07 Oct 2022 11:35:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogldt-008hlO-2G
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 11:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665142549; x=1696678549;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G0k6HXyKErdXpe9iENG5f0HsOKE3k5MB9zO9d5XHLlQ=;
  b=c5hIs1FoJ9sfR41mvo7t+rzyogzBxJBR4hkos4GeuhGS48aFHy2BWjq3
   MMvEBl0xP5uEIu1TO0iOspwxvzzNKvalF8H2ViK3iXbhsTGKjzxybuois
   XybEpX3w3R8TMMaC6+5UBQVs145s+uiEzEjeKL4TfBrzRZ3oYDAJhIdXg
   zSekqmJT/IaJWYDve6Sczrshi5u40orbTYJmSmMyWxVAI+H6+u0c9+/OF
   K+J6CXL5pHZ2BDBMJQJ2cm+jenkve9gx/InWx9x8QiQUH99c+y7Onnb6X
   FA1YDZgaXSZQhv3V2lLMQnr3/e6Ox6sy3QO80EMxAM/QbE9rHiBXlGAf1
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="177501333"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2022 04:35:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 7 Oct 2022 04:35:42 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 7 Oct 2022 04:35:40 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v11 0/4] Microchip soft ip corePWM driver
Date: Fri, 7 Oct 2022 12:35:09 +0100
Message-ID: <20221007113512.91501-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_043549_192154_DC0FA3D2 
X-CRM114-Status: GOOD (  20.80  )
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

~6.0-rc1 has rolled around so here is the promised v8v9~.
v11 is based on 6.0 stuff still & there will be a change to the dts
patch in v6.1, but I did a test merge and there was nothing to resolve.
I'll take the dts change myself just to be on the safe side.

The pre 6.0-rc1 cover letter/series is here:
https://lore.kernel.org/linux-pwm/20220721172109.941900-1-mail@conchuod.ie


Thanks,
Conor.

Changes since v10:
- reword some comments
- try to assign the period if a disable is requested
- drop a cast around a u8 -> u16 conversion
- fix a check on period_steps that should be on the hw_ variant
- split up the period calculation in get_state() to fix the result on
  32 bit
- add a rate variable in get_state() to only call get_rate() once.
- redo the locking as suggested to make it more straightforward.
- stop checking for enablement in get_state() that was working around
 intended behaviour of the sysfs interface

Changes since v9:
- fixed the missing unlock that Dan reported

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
 drivers/pwm/pwm-microchip-core.c              | 397 ++++++++++++++++++
 6 files changed, 413 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pwm/pwm-microchip-core.c

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
