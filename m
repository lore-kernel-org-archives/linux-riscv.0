Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04290EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzJc0wd2uEUjVAC3aYKtxL/Xt5VSowReSmB+fZeGFj0=; b=ojGFXNunDShk6f
	pHZSpxCShjVzQzvjXuGGoiFSteQj815hID8kwdI92EX7ulJ3co6P+F/fvBFbyC99T/GdsjfoLvdvc
	btxxSSHI9MCzRvaIvFL+XmY14sB7Ser2HWtk4QmCUF9Hjl3hkFfsTJ9PbC1HCx+9MeDpHcO8vcFF8
	Z77SGdMGGnq+EMD8bAPEkhO3kZwp26DWI43fAOJ6taPJKiNcG4MeVfjlPeWctGQzgAExCUW7NoSWh
	hqTHmma6ISHCQlPQvMb+D/9OyjGr+WCnng/452CYEbd2ApMkNGj8gY+LCjr7eEzVSp/V1W+JOYkFs
	VfnLw4NR0IMIptWfdUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqnV-00BjUr-2K;
	Mon, 10 Jul 2023 13:19:25 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqnT-00BjTg-1D
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 13:19:24 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-78625caa702so142887539f.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688995160; x=1691587160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/mpcltcpfYZvMxozrUvDAlbbzSsEYse6Dp8FAFYE/Y=;
        b=pRM4SRhC4BcC6WvkfHp+9VQNMx6pEMQAigYEXFZhUYg/EBNumEgM1yRXhES0h3SB1x
         LFG9Pl70z8JZfd9PsuS/fPLoS0eYU/K2qveVgJ7alZOH58YAEyKLaguGygZVvOXsg9JC
         gBxXoKeHRtQ6KoWEM6zIz9zS+GvY//ChCT/Ugwf0WgFoD/qNI7rAAefnCkPODN0qAiBL
         kZdsp3E8MYdIskT5ybqqiKd/VZcOun+x5+MjXxII6cd0l308e3pwsGyKOQCQGSs/MTCV
         TcNWuw150Dv3iwE+djEW2gNS8O2vCt9wwhWTQt2mlfFgopnH342mqUw5XotHgy2g/2jp
         zymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688995160; x=1691587160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/mpcltcpfYZvMxozrUvDAlbbzSsEYse6Dp8FAFYE/Y=;
        b=AQqkv7oEmrnKrLMBifz0H//PRdTG8uo3Fk/5YfpI51OB28ntS8vF1EmASEhuYKGxTD
         GdbTu8SEWoYnIbCuBU1/wTv4SuJ2HJBe9YS+5fPLx9mZJl8U3OpaJu6Sp81ZGFX2JoS4
         Ni3jwFl/4ozabHP/xdMrOo92LD1vOhytSQLUrm6WtKEB/X0dgHaOijdnKBU9oSDCPLu8
         20b7BEwL5lBDH/E1OV6OfaW0heNe1SX4vNEw5IRS2eaZLjKG272L8BICiv8rZYs0coz9
         IreysJH1mBcfuzDAHUXWk4EDndYHq3l9jfAHPIMzPVwfH4TtGAw4XaAJurCN9sz/irCG
         v9XA==
X-Gm-Message-State: ABy/qLby/ExB7126Ylsg1Ia5fjtTsiZpH3rLcMjLHQMLO3cIOAgk+XW0
	fnKOW6DKUJ4CFk8gGgyio9kRmA==
X-Google-Smtp-Source: APBJJlHEKKAe5FMXwjfaffR8jMAuyuZBXmIS2Nm5cTFlKw8kRCpjNg3NP95fiNXB9KaNPlz5bW1Itg==
X-Received: by 2002:a6b:dc16:0:b0:786:2c7d:dd19 with SMTP id s22-20020a6bdc16000000b007862c7ddd19mr12338002ioc.17.1688995160268;
        Mon, 10 Jul 2023 06:19:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id q14-20020a5d9f0e000000b0077a1b6f73b9sm3643242iot.41.2023.07.10.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 06:19:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/2] clocksource: timer-riscv: Don't enable/disable timer interrupt
Date: Mon, 10 Jul 2023 18:49:01 +0530
Message-Id: <20230710131902.1459180-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710131902.1459180-1-apatel@ventanamicro.com>
References: <20230710131902.1459180-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_061923_417203_8109A3C7 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we enable/disable timer interrupt at runtime to start/stop
timer events. This makes timer interrupt state go out-of-sync with
the Linux interrupt subsystem.

To address the above issue, we can stop a per-HART timer interrupt
by setting U64_MAX in timecmp CSR (or sbi_set_timer()) at the time
of handling timer interrupt.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index da3071b387eb..f2ea2b3d2d43 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -22,6 +22,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
+#include <linux/limits.h>
 #include <clocksource/timer-riscv.h>
 #include <asm/smp.h>
 #include <asm/hwcap.h>
@@ -31,12 +32,22 @@
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
 static bool riscv_timer_cannot_wake_cpu;
 
+static void riscv_clock_event_stop(void)
+{
+	if (static_branch_likely(&riscv_sstc_available)) {
+		csr_write(CSR_STIMECMP, ULONG_MAX);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_write(CSR_STIMECMPH, ULONG_MAX);
+	} else {
+		sbi_set_timer(U64_MAX);
+	}
+}
+
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
 {
 	u64 next_tval = get_cycles64() + delta;
 
-	csr_set(CSR_IE, IE_TIE);
 	if (static_branch_likely(&riscv_sstc_available)) {
 #if defined(CONFIG_32BIT)
 		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
@@ -119,7 +130,7 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
 
-	csr_clear(CSR_IE, IE_TIE);
+	riscv_clock_event_stop();
 	evdev->event_handler(evdev);
 
 	return IRQ_HANDLED;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
