Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2B6C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgjwGt3Stw7eE50PVthIQULf8FHsG0MMJcAWAjGBPho=; b=JIOHyMO+4MclKg
	W7xCB0J/ytn9FGSEVzhve4vuOGNLyOR6HFeKaYfo2pyGHCWcY2aK8wfR05kMWdCdYl0WFokZF/F9N
	IlkxXWAaHUD1jWPyTNnz6bYFfqj4/myF52sGthc6P/zdQ5ext8sIKr2WfgkSgkEBnuj+l1EZlCdWG
	bdeEjAi2/kItyOfokyc/UO54/W13TqmqAKk8BQHaCCfuZtmLJmwbf2s80NudB8Rg+UT806u/N//Up
	93Q0l/Gys3bB2ESEh8b8otXkJidRl0gBiDs2aLSQklwbfyyYQg3Iux4tZaJJKVbj7Hh/B5iXjQaxC
	0HLv+M5ZQ7n1q/72QOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWoU-00G42t-Ge; Fri, 25 Nov 2022 11:24:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWmB-00G2YC-BR
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:21:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id b29so3866031pfp.13
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1ogE3iUjoMSXzLx1NgTul4M3E0f5R6SeuN3d1g+xHg=;
        b=dnGJBUNJQl0wlLkoDF9rV+Fk3ir0Zo+py6y4hjjjRZOAZtMja3aUacpgOypb2+kVaV
         vWx9m4ZldeFz7buRLSRXiO6zWXZHVO7qb/W3+16VJYNsrHugMitE3+gm2kfEYXOgPHbU
         ha8hl0o+yScSTJMIzLFEiSyQxYkm3nGkb0XxrAFOMnKQCoiliUYCmd55WEB1JOQncxyD
         zbKbRaXkmOgPTlan7WsKeVocPRH3frnEaCQour6xMZkDnmUo2qtI/c540HD6YkmKIrcI
         5TsL8g+hAUgRELJp7kqSgLCFEobVRwZEM4QCbadzTFtfcA775XB3Ov3JZlFI9W2NtpXi
         6Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1ogE3iUjoMSXzLx1NgTul4M3E0f5R6SeuN3d1g+xHg=;
        b=y4AiRUX+xQVbmfKF9X39BNiuoZWJ2uyFwCnBOa3lXzm+4aBiBbRiiNbwbI79U5NdOE
         YmDgKBNXDPeb9+YSGBbCZ0naYfMEhiyNiWnKqnrGh1uTxotUfdA/LPS5RMBXMQnQCNxj
         uv7A260ce6f10qN0kb7goA6ayB+LlHVpmPavfybRA7KzUI0O9sUUJiVkGoBEmHei8WTQ
         8RV/80AG+R17U4TMSbm3Cjc0LIuuXmfPAEP465IMChcIaDMycG/ACBNjWC47BXFdAogC
         M6O70rtoLjyuVKBlHM+E65zxQiPf09g8aazlsA9hAIl/2HNYmJ2BdqFjPvYbkt5wkAD5
         VPPA==
X-Gm-Message-State: ANoB5pnMHufI8kBFA694uAp8eO4SpJ5yed5DI1tWVnrux0dob+LgfYIn
	P0VeUcGDSwhePtf2AFmbcjN11g==
X-Google-Smtp-Source: AA0mqf50JFV3DpRNLPvltimF6u0clZODoD326IHS8ZXlmnfKizp7cVe3f93LKwRBF7JH++67Ge7yEQ==
X-Received: by 2002:a63:dc45:0:b0:44e:46f9:7eeb with SMTP id f5-20020a63dc45000000b0044e46f97eebmr16133001pgj.3.1669375304115;
        Fri, 25 Nov 2022 03:21:44 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id e66-20020a621e45000000b0057488230704sm2834335pfe.219.2022.11.25.03.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:21:43 -0800 (PST)
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
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT
Date: Fri, 25 Nov 2022 16:51:05 +0530
Message-Id: <20221125112105.427045-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125112105.427045-1-apatel@ventanamicro.com>
References: <20221125112105.427045-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_032147_440944_54B57E43 
X-CRM114-Status: GOOD (  11.42  )
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
 drivers/clocksource/timer-riscv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index a0d66fabf073..0c8bdd168a45 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -28,6 +28,7 @@
 #include <asm/timex.h>
 
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+static bool riscv_timer_cant_wake_cpu;
 
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
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
