Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFA7C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H45Tzb7GjL+g9Yvls3Hz68AhzSv2ECB5FjEQP3U7ABA=; b=ruQ1TdM1z5nQ69
	e8/Pbu02adLpwuUhYPpJnvi10lCkQ9Hugm29NvEnG/9Tcy0RNA0G2SC6gu1DfCKeb66x/0RK+y7RD
	/TKQhMNod0y2GJU4LJi7ujvFoA0Ru9Oi+Hy4/GRmU8g3g03/TvDibK2OeiKkgwtsxGWcJ51KSmVEI
	/gWHrIDFkYj3uWzXjBTicnX5aBLbCWfHbPHhkuR1lUOcArbKOveofoqIZtN+EhiOfXnZh60plM3o2
	Afcga1w2RGgQUPXZmyPVXFAR3miYl/WcKessSKydN/nuQXXf1KGq/AnVbTuACwF6WKAMFa9SlTIWb
	yKudib+VDgeoSS2BJ3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxSDS-008wMp-9N; Tue, 22 Nov 2022 12:17:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxSDL-008w66-BK
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 12:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669119443; x=1700655443;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RzUAmT+mOx/mY30QUVZdyICgGAvt8beLzIIw/PvKyEU=;
  b=FMwRf2U+cKsCvI6/Q7YuKjHwRMsq293jFHp/U+rniJyo4IhLj/BAmQhh
   vNUg2fvhgnYo3q5EXosKjCXXTNDh/iSJ9TXnjFUucaTh63nxIX1Ft2AFp
   BuKieXEkgGwsBJZBT99pXBLMM1NVwV0eanW7MxzMdcXr6ZJDPY4f2KJaN
   lNNOtIrJuzznvLyokxAZnnpP+8X7LIXt+TC9WxxqtotD4RRM8XM44AJV0
   4d/H7eV2d9xGLW3cfA3aYx6DPMnaIFahdplWpNF9r9wNtYyDKccrqzW9a
   S7kcGca29S9Gq3G2jE68yvHMX3eo9tJRND0YIIt8GpUj/gcl2VT4bqjHS
   A==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="200899064"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 05:17:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 05:17:05 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 05:17:03 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: Conor Dooley <conor.dooley@microchip.com>, Samuel Holland
	<samuel@sholland.org>, Anup Patel <anup@brainfault.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <atishp@atishpatra.org>, <dmitriy@oss-tech.org>,
	<paul.walmsley@sifive.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2] Revert "clocksource/drivers/riscv: Events are stopped during CPU suspend"
Date: Tue, 22 Nov 2022 12:16:21 +0000
Message-ID: <20221122121620.3522431-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_041723_448318_8FB8C4C5 
X-CRM114-Status: GOOD (  18.71  )
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

This reverts commit 232ccac1bd9b5bfe73895f527c08623e7fa0752d.

On the subject of suspend, the RISC-V SBI spec states:
> Request the SBI implementation to put the calling hart in a platform
> specific suspend (or low power) state specified by the suspend_type
> parameter. The hart will automatically come out of suspended state and
> resume normal execution when it receives an interrupt or platform
> specific hardware event.

This does not cover whether any given events actually reach the hart or
not, just what the hart will do if it receives an event. On PolarFire
SoC, and potentially other SiFive based implementations, events from the
RISC-V timer do reach a hart during suspend. This is not the case for
the implementation on the Allwinner D1 - there timer events are not
received during suspend.

To fix this, the x86 C3STOP feature was enabled for the timer driver -
but this has broken both RCU stall detection and timers generally on
PolarFire SoC (and potentially other SiFive based implementations).

If an AXI read to the PCIe controller on PolarFire SoC times out, the
system will stall, however, with this patch applied, the system just
locks up without RCU stalling:
	io scheduler mq-deadline registered
	io scheduler kyber registered
	microchip-pcie 2000000000.pcie: host bridge /soc/pcie@2000000000 ranges:
	microchip-pcie 2000000000.pcie:      MEM 0x2008000000..0x2087ffffff -> 0x0008000000
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: axi read request error
	microchip-pcie 2000000000.pcie: axi read timeout
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	Freeing initrd memory: 7332K

Similarly issues were reported with clock_nanosleep() - with a test app
that sleeps each cpu for 6, 5, 4, 3 ms respectively, HZ=250 & the blamed
commit in place, the sleep times are rounded up to the next jiffy:

== CPU: 1 ==      == CPU: 2 ==      == CPU: 3 ==      == CPU: 4 ==
Mean: 7.974992    Mean: 7.976534    Mean: 7.962591    Mean: 3.952179
Std Dev: 0.154374 Std Dev: 0.156082 Std Dev: 0.171018 Std Dev: 0.076193
Hi: 9.472000      Hi: 10.495000     Hi: 8.864000      Hi: 4.736000
Lo: 6.087000      Lo: 6.380000      Lo: 4.872000      Lo: 3.403000
Samples: 521      Samples: 521      Samples: 521      Samples: 521

Fortunately, the D1 has a second timer, which is "currently used in
preference to the RISC-V/SBI timer driver" so a revert here does not
hurt operation of D1 in it's current form.

Ultimately, a DeviceTree property (or node) will be added to encode the
behaviour of the timers, but until then revert the addition of
CLOCK_EVT_FEAT_C3STOP.

Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98/
Link: https://lore.kernel.org/linux-riscv/bf6d3b1f-f703-4a25-833e-972a44a04114@sholland.org/
Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
CC: Samuel Holland <samuel@sholland.org>
CC: Anup Patel <anup@brainfault.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

For v2, I have re-worked the commit message to (hopefully) add improved
context.

CC: aou@eecs.berkeley.edu
CC: atishp@atishpatra.org
CC: daniel.lezcano@linaro.org
CC: dmitriy@oss-tech.org
CC: paul.walmsley@sifive.com
CC: tglx@linutronix.de
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
---
 drivers/clocksource/timer-riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 969a552da8d2..a0d66fabf073 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -51,7 +51,7 @@ static int riscv_clock_next_event(unsigned long delta,
 static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
-	.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
+	.features		= CLOCK_EVT_FEAT_ONESHOT,
 	.rating			= 100,
 	.set_next_event		= riscv_clock_next_event,
 };
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
