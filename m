Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4BEC4708C
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85tMBJsP2MeQs48ywdM0CtPqcFWV392XkJbXZW4UPAg=; b=ZaG/dbXDdPD1CI
	sRF+kgLaSj4HhM/rmf9dSxWfkycOna1Bu2uCVWc+UauEE5pO+r9wWkGyoo2ZrbvBrueLAyVgcCgaM
	oD4OnG+rgI+EQTEcjV18GU1ij0nsqyAhgAivMb8l3gP1gz8OHCLZhi2QI/ZmqM9OM4vg4wys5L959
	ifjFm+Waetmdh9nVP0+6LI04hOVqhQQVa2b8lTS7zCaEYeKzHgtPXSautXvXfg+YuLE8T4LPXPkEE
	KzWBj1ryYMvAF013DXq5PeZRO20m5w5Kri6sFKLmuvaoSYmzfOBqz20h1Fv/hiuyPBusdPNpgc2QU
	yG49LgXmBd8adTcvGQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0irb-007LUL-3q; Thu, 01 Dec 2022 12:40:27 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0irW-007LRd-6a
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 12:40:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o12so1730420pjo.4
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 04:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S7naxVeL+Tq1XdOeQt8X5QpTYGWrVZhiHOlENIaVW4=;
        b=ODFqGsjSBR77IhnwGSMqT5Cedqv+o+83HTdoL9r+54VqgGotTXmXpohITgE49F7wSd
         Tkur0/NYoqgk92i4gk54CRC/pqYBBmM2Zbo6r10FLJYhD2qqf8jup2GHELUwP4gwflmR
         zHYM7ShhCJW76jq1Qu2vQBginDdz04Pbwt71TzSOIEVOWuPV44OgVizwpklWWnB7e+Y5
         D4+z2VkQ+x3EEWAciK1knsKdG5FhwxYEmrPWeSjvn7rHX4xtesNCG3kcL9kYwyxbC5ya
         FHhXlzp0mt54IMjKmv9qfrLyPhAifG9KdRWdez3fjVDG0RQP0zP5aj9Gdf9VUb814ry7
         1cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6S7naxVeL+Tq1XdOeQt8X5QpTYGWrVZhiHOlENIaVW4=;
        b=uxOeTSxyvfwHgFIDisvjZIlEq8r/E7F4fbwzLnsacri0rcttb3tSiWossZhSrrnOQk
         HXmWHVv+Vyp6ObQXAAfdHHFOs3UckeeLcIbsu5zwyfLQh+cyYiKcxoyWgjItdcWLDcpT
         cXm7vDr67DCpIHSuegBzIF+DJCthn6rOF0ozWi9oUnvJqBoNpUD6HiZf+WUFraO9GW7w
         ic1ZFoA6EXlbD81sJ8jx0XrElZxU2MRUqUbMrf4uq4LJdruIY290PdGaxA9wBSCT+AFS
         K1VhwRip6qcHs0LAhirzPvXLq75+pJ+yKtrc8+4sCc+w1SAIUI+qv0wWRqG9G3LIfaSa
         6ZNQ==
X-Gm-Message-State: ANoB5plVD7wdPwQjFpRA0R+LbA/YpX9W04xCpIX3EP4DqeRR/L6qTU9Q
	v+H2FQN6oVj9b09SGMoWlZgtTA==
X-Google-Smtp-Source: AA0mqf6acwWia0+L1cEYLvnWvOdyNLyE2K918tcmbn+t7myfCn9EV5mMEmTTmBYN843Wow+kKCJ09g==
X-Received: by 2002:a17:902:ec01:b0:186:878e:3b0d with SMTP id l1-20020a170902ec0100b00186878e3b0dmr47042474pld.149.1669898420501;
        Thu, 01 Dec 2022 04:40:20 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0056f0753390csm3246981pfg.96.2022.12.01.04.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 04:40:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT
Date: Thu,  1 Dec 2022 18:09:54 +0530
Message-Id: <20221201123954.1111603-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201123954.1111603-1-apatel@ventanamicro.com>
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_044022_258900_3EA0FF8B 
X-CRM114-Status: GOOD (  13.27  )
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

We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
when riscv,timer-cannot-wake-cpu DT property is present in the RISC-V
timer DT node.

This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
based on RISC-V platform capabilities rather than having it set for
all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/clocksource/timer-riscv.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 969a552da8d2..1b4b36df5484 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -28,6 +28,7 @@
 #include <asm/timex.h>
 
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+static bool riscv_timer_cannot_wake_cpu;
 
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
@@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
 static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
-	.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
+	.features		= CLOCK_EVT_FEAT_ONESHOT,
 	.rating			= 100,
 	.set_next_event		= riscv_clock_next_event,
 };
@@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 
 	ce->cpumask = cpumask_of(cpu);
 	ce->irq = riscv_clock_event_irq;
+	if (riscv_timer_cannot_wake_cpu)
+		ce->features |= CLOCK_EVT_FEAT_C3STOP;
 	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
 
 	enable_percpu_irq(riscv_clock_event_irq,
@@ -139,6 +142,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
+	if (child) {
+		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
+					"riscv,timer-cannot-wake-cpu");
+		of_node_put(child);
+	}
+
 	domain = NULL;
 	child = of_get_compatible_child(n, "riscv,cpu-intc");
 	if (!child) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
