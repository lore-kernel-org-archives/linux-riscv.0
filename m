Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48F3CCA481
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 05:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUJZrkSg+1j2TlUgEJ3xCYnCFMTpvgOzj8j1ZVm0NmY=; b=hhD/seQqB5OaPY
	wmBXCkQc8TX+bfIo/3jtLtAcWYFRQEJ4IFj/LJ/jTV1k4NAjPVJv0RAvRvSlzFh+TaiuRWQjuR5iI
	thCa1eB+p8k5VSVkFhcWV7pu7PA3rraeCn0No33aWT0RT+USrKl/1TFYgNcC/MCBTtEJ244UPTDBU
	vPgBYzsaQnLhRbuKa4V+HU9+0gYetPzfUSCrmbg6a/r3Qdo6yblDdsunO6iMmpmEXxgGkCGdUeLWn
	2MVUSaJo6ahn8JM0XpE6wGkbjWmlQs4ef7sh1n9SStBNPvCLXv44TaP4L0nNXZH2Ub4pW7F1Cg3Hg
	AFuwEoyd+9X/uPuGWYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDg60-005VSc-DV; Tue, 19 Jul 2022 05:48:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDg5y-005VQG-1l
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 05:48:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id v21so11006751plo.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 22:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jlHFWO4BUKOhkSLA3ixeUG8K1wKBWBAz4fLmjE1iQBA=;
        b=ZBkkCxufH7ydH8OKvcGhQe+q/xQvww1z1TdeoI+35Id+tJRpE/dbzKRO4vJ5pWvPwZ
         p7sdoPv4pe3n1JOvVjFNLo/7AeFaoKNbq+cvIurPcAx/C7bjAjAoKL295axJKCLcrzPX
         bBulGkELrm14unIvVSkLLxfAdEGa6DDBDeeHB8NdAC8zAYqfOOaushPnMmqT7cC44Vaj
         1FM5Z76yv7FOnMOI8p801088ELpLTMTUY5r6qHN0QunIZtJebSVjCGR/gIZPVmtVMvgw
         fsVkxX56YVN4t6oXJ+kAvKHWDmvF/scTky3P6ws6shrPyGguRWvpptiBwsOjecnCoFGa
         c6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlHFWO4BUKOhkSLA3ixeUG8K1wKBWBAz4fLmjE1iQBA=;
        b=k93dQNlLpGkVjzBx3okXRxd20o7pa04KDwlSbdZEcqRZisVWUhwS7ug/M3wsUJiFL5
         CAhso4BebosSv8MzGk+sP0mLdDgQPVZzVHycbsXQZDi4Cx3glHNHtP51hmowl0NikVv0
         lYtE4rg7f/KEuMrMi1rZzRcOIb2pCrpnQUMqLnX6wRIwrb/v4zkgOHaQX0IrIw6m71w+
         VlaB0D/W+Izoz45btvXkszkHUxtStvDX2xEbuEeHtEv9CWUN+89fd9MAUZw4MuYzgh4u
         K6UJjBvLy0gpUCDztVKBXGqYiTYZ0tU+Eok/fM15O9a7I+JU8fCD9WAIiVO/2blDq0s4
         5t8g==
X-Gm-Message-State: AJIora8iLJjbUVvRoPGNUb5SDMClUhG6ZZ5HE31tIiNadofnLFb7dkow
	gxVNySupOwMPV3w9KXIdBDFyPg==
X-Google-Smtp-Source: AGRyM1tbCDz5SQoHGY0Cz35UcNtVlaAQaLE3yMTc5wyWn7kRDXfNXmJbqvJWzumgav4UYhPSSq5bfQ==
X-Received: by 2002:a17:902:ce09:b0:16c:c7b6:8b63 with SMTP id k9-20020a170902ce0900b0016cc7b68b63mr21511826plg.35.1658209709512;
        Mon, 18 Jul 2022 22:48:29 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.93.102])
        by smtp.gmail.com with ESMTPSA id o186-20020a62cdc3000000b0050dc7628171sm10374129pfg.75.2022.07.18.22.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 22:48:28 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/2] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT property
Date: Tue, 19 Jul 2022 11:17:29 +0530
Message-Id: <20220719054729.2224766-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719054729.2224766-1-apatel@ventanamicro.com>
References: <20220719054729.2224766-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_224834_111505_03D467E6 
X-CRM114-Status: GOOD (  12.74  )
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

We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only when
riscv,timer-always-on DT property is not present for the corresponding
CPU.

This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
based on RISC-V platform capabilities rather than having it set for
all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 593d5a957b69..3015324f2b59 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -34,7 +34,7 @@ static int riscv_clock_next_event(unsigned long delta,
 static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
-	.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
+	.features		= CLOCK_EVT_FEAT_ONESHOT,
 	.rating			= 100,
 	.set_next_event		= riscv_clock_next_event,
 };
@@ -65,9 +65,13 @@ static struct clocksource riscv_clocksource = {
 static int riscv_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
+	struct device_node *np = of_get_cpu_node(cpu, NULL);
 
 	ce->cpumask = cpumask_of(cpu);
 	ce->irq = riscv_clock_event_irq;
+	if (!of_property_read_bool(np, "riscv,timer-always-on"))
+		ce->features |= CLOCK_EVT_FEAT_C3STOP;
+	of_node_put(np);
 	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
 
 	enable_percpu_irq(riscv_clock_event_irq,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
