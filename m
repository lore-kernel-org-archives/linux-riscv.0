Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD8C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TPuPrbTh5xFLqLspN0XNAn6Qw9TwrLbLf6xi2maHPVg=; b=uuajU89Adkav9h
	TSTIDTcxmYfFJeZrTysGE/rx2RBNo6IANX1/geDBnNP+gpWeB1ZnoJcUxOrpF9TFHHt+Wgmw3WQyc
	9LoheUiwKpGs5Nnq2kY8E5A8AAqcfpumzHFjvc601HG+1zOKrm3cIn4J11nx61B9Xt7/jzRYwfsTA
	yeMo7vnHNSjAk0fpeITGh1RCz7R53GJrX5Y+gcZO1+wjgNfdFiWQ/R3xMzD7M5QYME537c0hgdkc1
	9niXIAEQVLFcRyONOX0Q7+ZUdj8WDcFJfkexV9uMLqjE0ZkwarF294Ogqrh8hNxrINlxLkDKboKtV
	Rb4I81qTStY38U9r+awA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7Tt-00CA9v-UM; Mon, 06 Mar 2023 09:50:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7Tp-00CA79-TZ
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 09:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678096205; x=1709632205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0SyElCUWTlCle3k2VOdcQEbG3TLOBs5Dv4yCPL7zPl8=;
  b=Axxc/C3Kub4WA28Wed3VFF25exidU08MEs4cHpNVWgDSYWmhOabOyr5H
   20n3JOBZ5y5zMt3OJbK3brfYKYHpVpv5LfjjnWFRqXmieSHd1NKm1Dejv
   SJ1+1nNlRNHSH71Rr4oKODdk5eDQe33mrP1BR7WX7o38XOnJ3m2mh9gzd
   9LDgL2bMYJzzAVDW4+O+oUS1o3W8kgI25JR8xBrboXCHvUKlh91sFfwR5
   k6LiEzBFx4xkuiZWL7lyBjhUMe2dgW8iGd11l7iG0sKN2jHdvVYdAHX8K
   dPXk7olSw3zO2W91jWgXheVPVBESeilUggqb8g715oDttWzQ8XGJRdHbp
   g==;
X-IronPort-AV: E=Sophos;i="5.98,236,1673938800"; 
   d="scan'208";a="203807069"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Mar 2023 02:49:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Mar 2023 02:49:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Mon, 6 Mar 2023 02:49:55 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v14 0/2] Microchip Soft IP corePWM driver
Date: Mon, 6 Mar 2023 09:48:57 +0000
Message-ID: <20230306094858.1614819-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3956; i=conor.dooley@microchip.com; h=from:subject; bh=0SyElCUWTlCle3k2VOdcQEbG3TLOBs5Dv4yCPL7zPl8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCms21lM7Kw27U24bxQnd9xa5Ou7rd314v/LJ63fN3HmzWoT YYP5HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIbi2Gv8K1C5+sutZ/+fCF9uao9e XxPV3/Lt3Yd9gzZ3mDt+a5ghCG/yH2/Bf3LZjiw3fHa46D0VtbrsptW85k7k7erbT0cFCxKzMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_015006_090624_36C18EF4 
X-CRM114-Status: GOOD (  20.66  )
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

v14 is rebased on top of v6.3-rc1.

Uwe & I had a long back and forth about period calculations on v13,
my ultimate conclusion being that, after some testing of the "corrected"
calculation in hardware, the original calculation was correct.
I think we had gotten sucked into discussion the calculation of the
period itself, when we were in fact trying to calculate a bound on the
period instead. That discussion is here:
https://lore.kernel.org/linux-pwm/Y+ow8tfAHo1yv1XL@wendy/

Thanks,
Conor.

Changes since v13:
- couple bits of cleanup to apply_locked(), suggested by Uwe
- move the overhead waiting for a change to be applied, for channels
  with shadow registers, to subsequent calls to apply(). This has the
  benefit of only waiting when two calls to apply() are close in time
  rather than eating the delay in every call.

Changes since v11:
- swap a "bare" multiply & divide for the corresponding helper to
  prevent overflow
- factor out duplicate clk rate acquisition & period calculation
- make the period calculation return void by checking the validity of
  the clock rate in the caller
- drop the binding & dt patch, they're on-track for v6.2 via my tree

Changes since v10:
- reword some comments
- try to assign the period if a disable is requested
- drop a cast around a u8 -> u16 conversion
- fix a check on period_steps that should be on the hw_ variant
- split up the period calculation in get_state() to fix the result on
  32 bit
- add a rate variable in get_state() to only call get_rate() once
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

Changes before v4:
https://lore.kernel.org/linux-pwm/20220721172109.941900-1-mail@conchuod.ie

Conor Dooley (2):
  pwm: add microchip soft ip corePWM driver
  MAINTAINERS: add pwm to PolarFire SoC entry

 MAINTAINERS                      |   1 +
 drivers/pwm/Kconfig              |  10 +
 drivers/pwm/Makefile             |   1 +
 drivers/pwm/pwm-microchip-core.c | 441 +++++++++++++++++++++++++++++++
 4 files changed, 453 insertions(+)
 create mode 100644 drivers/pwm/pwm-microchip-core.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
