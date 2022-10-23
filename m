Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81C7ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AdD6v4NWIWjbU/XzUnGxvs4qzLg1nl+TMc0HQA+CuUM=; b=g3L4P8dEjs31fM
	WpxSVOG+jrb1y36Mgyebt6jagAxKQ4FxXG8xZbClcEF11ewXT+zJivhzRu6dRo25DocTZXo0vNw4x
	bepOtbnMX0cq0x+UsFlWSCLDXQckQmWrR7HeVlsr7wkKIAcpoh8l9eGu0/LikDgXtS49sSkgQHbNl
	yie8c+4l+pEOMiv52RXfhpb65zgJ50907OIHchUWdBP9niTkW+/e2+7rQy6aTxq4CCSOY5t8pDzSb
	glLSXGw0MGAkHAQJ9A+tvVsx4CppcJ16L0+NyZaX8mudENQJIZt596PtCC2OxHJJu1/wuSlUVKMuw
	g8C2tBpMbSR28FlAvlOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omg7u-00G2Aj-DP; Sun, 23 Oct 2022 18:55:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omg7q-00G2A8-Tv
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 18:55:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E73E460F16;
	Sun, 23 Oct 2022 18:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86E8C433D6;
	Sun, 23 Oct 2022 18:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666551309;
	bh=b1OgIjfo/vN3Wzi1YZhctjiBYrxk8+3C/gbHYBJY808=;
	h=From:To:Cc:Subject:Date:From;
	b=QfBjm4lHPb4x8RrylH9Jgg4rhZi6CVodwyBLeUo1tSsU6v9D9ruBRJGNdKWCyyoXD
	 C1OPkW/WZTBgkz77qmI1xzKUFVh0GjwMXNGrd6f9ypF9rXwk5WbTiZFRGu9NYP8s73
	 sjw+wvVM3a2p0xOILeA4C42ZplfMB+gUWnlKkkq6x3EvTCcCMeQxeW+STbgRyNe34p
	 4iHGAc6lfrWQpJQ3O/cgoS7gSmOj/7NWoB8APxdmfZY/L+SQsuMd6T6q8hFxbROAMl
	 /HNzZzxjYlrKtSKzu5dfldfYNaLQ6RnIdrgnOigOQvcG4/6DaSAOu81rEWejrSO2Fy
	 5guuKCk5zctjQ==
From: Conor Dooley <conor@kernel.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Conor Dooley <conor.dooley@microchip.com>,
	samuel@sholland.org,
	aou@eecs.berkeley.edu,
	atishp@atishpatra.org,
	dmitriy@oss-tech.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: [PATCH] Revert "clocksource/drivers/riscv: Events are stopped during CPU suspend"
Date: Sun, 23 Oct 2022 19:54:44 +0100
Message-Id: <20221023185444.678573-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_115511_068116_853973AC 
X-CRM114-Status: GOOD (  13.52  )
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

From: Conor Dooley <conor.dooley@microchip.com>

This reverts commit 232ccac1bd9b5bfe73895f527c08623e7fa0752d.
If an AXI read to the PCIe controller on PolarFire SoC times out, the
system will stall, with an expected:
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
	 Freeing initrd memory: 7336K
	 mc_event_handler: 667402 callbacks suppressed
	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	 microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	 mc_event_handler: 666588 callbacks suppressed
<truncated>
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	mc_event_handler: 666748 callbacks suppressed
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: sec error in pcie2axi buffer
	microchip-pcie 2000000000.pcie: ded error in pcie2axi buffer
	rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
	rcu: 	0-...0: (1 GPs behind) idle=19f/1/0x4000000000000002 softirq=34/36 fqs=2626
		(detected by 1, t=5256 jiffies, g=-1151, q=1143 ncpus=4)
	Task dump for CPU 0:
	task:swapper/0       state:R  running task     stack:    0 pid:    1 ppid:     0 flags:0x00000008
	Call Trace:
	mc_event_handler: 666648 callbacks suppressed

 With this patch applied, the system just locks up without RCU stalling:
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

Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I don't really want to post a revert, but it's been nearly a month since
I posted about my issue initially & 2 weeks without a reply to Palmer's
comments.
CC: samuel@sholland.org
CC: aou@eecs.berkeley.edu
CC: atishp@atishpatra.org
CC: daniel.lezcano@linaro.org
CC: dmitriy@oss-tech.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: palmer@dabbelt.com
CC: paul.walmsley@sifive.com
CC: tglx@linutronix.de
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
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
