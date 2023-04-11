Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE777C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A86+DgLT8cmumWP59JVVT+Qc6Vta+Mb4MkHUd8g7p3E=; b=1IcbLiKYq6AQcJ
	4vVoNaypxhTFEJI2UtYXbVmZBMd/EkvDV2TdOcJUP+r/bO3nDBLzyIJNuCbHu3nwuClf2p8NLFQA/
	U7iJeA9q7rL/19Ii6OixBlZkVbV0fCspKNe0C9hqU0x4OxkWgcU2fIMk6gTxGYyWRJTZbELlApD4j
	pIf0oc48B5U40v/DtGjbdsIfv/cqZoWO7vqYzNcMN3HDiMlzADPGVBgp1guEt27RgA2LXIJeX/Xs3
	FgEwGKypzlrmgKGhc8+Q6etCNI1QhRCBG5muByHTv7OMsCDAwrTGGKYrnnzxcxIVdkq3KVaLwAuTP
	6B0hMslp2ElSkrw0YoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9oS-00GyF8-2n;
	Tue, 11 Apr 2023 08:57:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9oN-00GyDi-1W
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 08:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681203432; x=1712739432;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WocyDYqP8aO6wX0kDfztKAcX1uvZMqbLfMBeCWVGOzg=;
  b=j3g06rj+hosYZlGge0Q1M71cO15of+5LIG2TeM6hH47ZEH9yf2qOHolG
   5TwAKO2FIKJAjZg6ja9ELT8usF9R2/jKJ6YKKt4lBv+fZjCtT6VsFljal
   WmsddzY3bfqRB745V9Y4uI7FGsLWjHXJBGhCDk1NHYaoexhKRa0Ne1ZlT
   HhZX0t/up/cCLM+tLh2YgF9tQ1vmG8CgIchyaB2V2RLmyHcv3Fnz42i4m
   sWqaxOdHohhX9yPSHlcGbYGlYlmE8taIzUTPwMpYkKnXqSKuWWLXUqByw
   T5SVXWBi/9G7zsiuhaAgXXrV315pmrsgKPphHxNCKQwOXO54NqBOtB4Yz
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673938800"; 
   d="scan'208";a="209011350"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 01:57:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 01:57:05 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 01:57:04 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v16 0/2] Microchip Soft IP corePWM driver
Date: Tue, 11 Apr 2023 09:56:33 +0100
Message-ID: <20230411-wizard-cautious-3c048db6b4d2@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5172; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=WocyDYqP8aO6wX0kDfztKAcX1uvZMqbLfMBeCWVGOzg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmmCgeP/fyuHSW5bdIe2di4yOXaiQ8Ku+uq9ip2rGBapHTn uZJFRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACby5zjDHx6dVjUWLamWhj9Vz85U9B 3p0j70m33r8Ytqew7P+xEgvpjhf5Ghd9rsZPH7Uz5HCUpyvA9zDouW+luZ7ZdYddnV+rY8FwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_015711_588326_565A6A28 
X-CRM114-Status: GOOD (  26.66  )
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

Uwe & I had a long back and forth about period calculations on v13,
my ultimate conclusion being that, after some testing of the "corrected"
calculation in hardware, the original calculation was correct.
I think we had gotten sucked into discussion the calculation of the
period itself, when we were in fact trying to calculate a bound on the
period instead. That discussion is here:
https://lore.kernel.org/linux-pwm/Y+ow8tfAHo1yv1XL@wendy/

There was, of course, another chat about the niche bits of this
calculation on v14 too:
https://lore.kernel.org/linux-pwm/20230322105536.kgt3ffowefqlg6eu@pengutronix.de/

Thanks,
Conor.

Changes since v15:
- calculate prescale modulus without using %

Changes since v14:
- change period_steps calculation logic to correctly handle the cases
  where tmp % (254 + 1) == 0, by swapping implicit truncation for
  explicit rounding upwards and subtracting zero
- special case periods < 1/clk_rate & add a note in limitations about
  this, although I think this issue wasn't present prior to v15's
  changes
- check for smaller suitable values of prescale, which picks the "more
  correct" value in about half of all cases, particularly those where
  tmp is large.
- explain what I mean by the "optimal" values for prescale/period steps
  re-fix use of defines
- add a comment about how sync_upd mode works
- make the use of period_steps and prescale consistently refer to the
  register values rather than, in comments, using these to mean the
  resulting values after 1 has been added
- drop the PREG_TO_VAL() macro, as most of its users are now gone & it
  only added to the register value versus "real" value problem
- report pwmchip_add() failures

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
 drivers/pwm/pwm-microchip-core.c | 509 +++++++++++++++++++++++++++++++
 4 files changed, 521 insertions(+)
 create mode 100644 drivers/pwm/pwm-microchip-core.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
