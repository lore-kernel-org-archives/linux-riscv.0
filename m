Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DC5C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Katz2wNCs7/GeYbX2EWyKr/73gXLyEJKhswwGtP8D4=; b=wdjLL1MmMAWjuk
	ikJ/viNf45LUNYkCQaEaPEF6h0laIP26Z3ozXufGNYcmdEbK3O1vfZ/hyPpFjgw2ob0qs4zROHscC
	MY9mnAoizIW2zjay5kZ26Hy6VuDMR8JcDkM4iCyLIt4lvww1uACVUJXK1gGCXVQEnLL7W2lUXbICq
	Kk69HOm/GhSvlLb23gbtcx/gFUTaPXVlqW9vlrvMnutZgTB014u89bdve/6YduOpP+dNv9Al4rfvB
	CBkpIVPDRxQnR3RS8I8wRezsUC2CDlQPkJfVYXQuFSlnfmTXyZ8eql4ndTGcT3yxlYDDayticVZzD
	OjfpUSDDxrfv25zxphgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkf4-003BrT-8i; Tue, 03 Jan 2023 17:01:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi0o-001q3w-Pp
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:11:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so31181122pjj.4
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVqqR8oYcz8ddBS+TT8ZlpXaMsGagFVr9rYdfxP/rIg=;
        b=kW8IcmMw6snEgGMOnD3J92gTuk6kXiuNTjEsajrxn76hj89qmb0gT/j1/qFeeaZcTK
         J7LFnoEKURv0KZL/X29slpZTSrySPN5sRBqG+GbClcwUnXFtzoS6NbTHnUJ8vGga4irf
         9lxRXfjRRUsTze6dbDeO3NxWQPkVIvEoltyCBU1H9fZNrbEqGBmVyV/XBJpp3FSgVUTH
         Yil5BTK+LuQ0bQZ80GE9sQ//XmF1G1yIs+uwTCzAZyhAXRaLkvK+gWt2lO/sVASuB8KD
         qTS7RFi9IQW6i5O1skxC9zShTpxzBKgZj+Y6P81xB5o6I+lZJxTCH2jgccHosXEmTglz
         TJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVqqR8oYcz8ddBS+TT8ZlpXaMsGagFVr9rYdfxP/rIg=;
        b=XAGTblQ/oT1l27MzePTnLibAxCtZYesNrvUuLduNLMu+bv7A68xHoZp08iwXcUXNCx
         WdmqgYZbB/IqLI23hwUmoc490ma4Ha58oOuHttvjMsiVlnpX/CVFYSvrBQydWVjWvZxy
         qBxlpvVypF5wDivRn/hJPlv7npFlsM97xd/VlFyL/eFrYDUbKnSVMVzVqI7BryObbJe1
         ysiBp4PDS+29iM533sy1lCvyy+xP5OkbcJ+t3NDNV6YfNAJaYS7kXcs1QKlSThwnBnTp
         em+gLCwB2yn2/H3UUgbhOOVKwLE40wwrEWCYTUCpPjIxKvTr4bWkrS8QeVCuHUIOW7MI
         lhkg==
X-Gm-Message-State: AFqh2koWnEpTe3mJuZNRyln5Q3o2HQZJogN3wo+sZg/JgfaGDOIZRkrl
	jp9MY7il7wW10WX7t0GJRCr/dw==
X-Google-Smtp-Source: AMrXdXvHiZ2mubjd6ktVYDES2Wzs1jni6FSXsvkL3Z/HXI4YqE6gXpPnnbII14HUfEZDsTFUbo5JNw==
X-Received: by 2002:a17:902:7610:b0:192:751d:b2e4 with SMTP id k16-20020a170902761000b00192751db2e4mr28680533pll.48.1672755088680;
        Tue, 03 Jan 2023 06:11:28 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id l3-20020a170902e2c300b00192bf7eaf28sm6146117plc.286.2023.01.03.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:11:28 -0800 (PST)
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
Subject: [PATCH v6 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT
Date: Tue,  3 Jan 2023 19:41:02 +0530
Message-Id: <20230103141102.772228-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141102.772228-1-apatel@ventanamicro.com>
References: <20230103141102.772228-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061130_897372_0B11863B 
X-CRM114-Status: GOOD (  11.55  )
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
 drivers/clocksource/timer-riscv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index a0d66fabf073..1b4b36df5484 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -28,6 +28,7 @@
 #include <asm/timex.h>
 
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+static bool riscv_timer_cannot_wake_cpu;
 
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
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
