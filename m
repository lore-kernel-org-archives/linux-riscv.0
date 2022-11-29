Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC923C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUaoIvkA/vVkrgdQnFPTxbx9dZM4NvVhWXgOY2Z9+Jk=; b=qbGzLK0z4q5nVz
	W6cPe1uoS4PYfEFIWXeAI0xAsR5lqBJXcSvhZr8BvmUIZViGIQzasPhvCdEdfj2fV1KhHfN/4Xy04
	HJzRD+Bq39k1LPu8qKK4j00NJyUFCzaC8cJsYTi8VTaV8z3KMfFMFNMY6CbRoQk7FHhS8JVbK83S+
	6tlUTfccCgHo6nY/pTxMlqcuip0AU+tUH9GBfwvx1iMFCYo2X6r+huYBmdB1KFaqnG14pSUT1bqzT
	ib1Sdyx7nRNQdFreR2V0ESZMwtW4MDI1wa4hnXoWTtNsD1RRR+K78svidhgcgfZzP2OmzrPaHdrrb
	KU2wTl5V7Hf8cf6J5Ygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01DI-0093EK-ED; Tue, 29 Nov 2022 14:03:56 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01D3-00932t-S6
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:03:43 +0000
Received: by mail-pf1-x42a.google.com with SMTP id x66so13778388pfx.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNSMrXgsDIBPEX+PmJvz8brS+pMGDNnHF9xsxir/K4U=;
        b=Cb46EIpE/tkYJPACGyaHcw2+ptUE7exJNbHGl27WcXfyM1EOc3nGk+CObprwdy27ef
         U+aVJETgJ2CYDsbQ8m6siWEqZVs4s/BB0joVRVjic6sTEoRdIxqgxCXGSajLDpC/Va04
         U/46K57G2DuhVpWHU7fxamK+YHIK8zGlTJJFxCDJGaohPBIXrs2HJgQ6QF1ggb9zg/RR
         QbUXw/KPKcohgvAhol2crhcSwNF9rNlz5u5qw6V6Kw2e21MNpjs/Ftyd/7nwhS32s1cP
         NQhHUkDvzoe7X7oLw5eB7NdmVcIV3z1KScqsgrqNpHUu+j4UCPDnoUNK5Q44ftKyqiaO
         mlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNSMrXgsDIBPEX+PmJvz8brS+pMGDNnHF9xsxir/K4U=;
        b=6wVlVSiPktScA6GlDvg3ov6VJhEXndSusIB+FwqVDh4wtRnyx5rVpv91v9pos6fRe8
         NQHTpATr0kRIMTwjGRg4HqNkaGUZ7EEhjYL/wjn24su3Ybm0eJu+tymTAPKO0lITEogY
         G4Dptdd6gYLGtvE1AiE7zVWtVQluVoLvnoENEnHIGgXYnEmwokJnnRaoTRXFy8ZK/Y7n
         jWQpWjegVRe2oXcYsYdJ0m52aaxxk78FBEsdLiS/RMjqaKVvIF4RKXgxzq+oTONoOit1
         3Fm3mPQStor40ovtamLj5KVZiTZB7AXfPTW/MWeNf133IFg5NaFOCyi3CEg28viT/teo
         KZOA==
X-Gm-Message-State: ANoB5pnjUYmc5G4/wp3rMg5XcyxkgMoyPJ36QDvwpDpZ5ovqSpUNk/ow
	9beILsSL1GucqlEYKrbc7nSPEw==
X-Google-Smtp-Source: AA0mqf6wA1xMMJ+XGdsKXVP6/5eeQ/x+7jlt4ea0RqVH9dsfvmiqVWh5efps+XVqeEBt3lBauTHsUg==
X-Received: by 2002:a05:6a00:4c0b:b0:562:ebc8:6195 with SMTP id ea11-20020a056a004c0b00b00562ebc86195mr37357270pfb.38.1669730618613;
        Tue, 29 Nov 2022 06:03:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b00574f83c5d51sm6013747pfp.198.2022.11.29.06.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:03:38 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT
Date: Tue, 29 Nov 2022 19:33:13 +0530
Message-Id: <20221129140313.886192-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129140313.886192-1-apatel@ventanamicro.com>
References: <20221129140313.886192-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_060341_940969_AB4F41AE 
X-CRM114-Status: GOOD (  13.80  )
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
when riscv,timer-cant-wake-up DT property is present in the RISC-V
timer DT node.

This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
based on RISC-V platform capabilities rather than having it set for
all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 969a552da8d2..0c8bdd168a45 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -28,6 +28,7 @@
 #include <asm/timex.h>
 
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+static bool riscv_timer_cant_wake_cpu;
 
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
+	if (riscv_timer_cant_wake_cpu)
+		ce->features |= CLOCK_EVT_FEAT_C3STOP;
 	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
 
 	enable_percpu_irq(riscv_clock_event_irq,
@@ -139,6 +142,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
+	if (child) {
+		riscv_timer_cant_wake_cpu = of_property_read_bool(child,
+						"riscv,timer-cant-wake-cpu");
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
