Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CEFC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwnY1CE6oi42/BRjoR4ocLDXhKsUh2jHUtlW0PlxRTU=; b=z5jLTS3tvPClod
	wVvp5aOoC0jL4jZRhizFVgbbKGpex7MjPxnA6/01EyCJfUn04jHqWi+IOMQJ1PALlhRJ4mMSIC8IO
	pTFRnswUjadItBtxzvdPv5K24xFXgSEZJsUlopekAd6PWsjFGqyb/468VgvVID4Ha08dWjVP0kHAd
	2Avl0mvCH9lCKMFwj9v8GusrH/1MImxwW0D7kvVkH3QI23WLQqMIEJnEu9z/Dm0m2hMKJx3baYePq
	XXESgYjMiKd1g3pAJf1UCNwz8EK8hLNzlZEBmHm/daIoR45/mVpdLTT/rOIjQ/iC9NDm6S6Nh7HB+
	m/2qgKLJ8pqboldKe1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5c5-006Ts4-3M; Fri, 03 Mar 2023 13:38:21 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5c1-006TpQ-QS
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:38:19 +0000
Received: by mail-pj1-x1035.google.com with SMTP id bo22so2516132pjb.4
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUObxxi7Z2aUmCgcrqeWxF5lW/0L9jWTmCmlO9qrT1Q=;
        b=h9zxegf87/P6gRuaxexokAH8RlgQHTW9aNEdi0Cc5LWaIyJtjQufDamIzXWLLGiZF3
         USifV6YhmXfljWtfCtKoVzDSaMAlIMQl8P8W9iYkW9P1yN2X8mEbmYGh8JZAoaZt2kTe
         6LrgQhXh/gipg4ttInSYviVS133KQF2VIbLtkmOl8ztATlVtPeHdNKbw+uVMmcYZMdWZ
         5wMIv3VXRo46RR68LWy/VuxQFPl/DB83K6saS8aEZgnky6OIH2/ZZHTA1GVb9Z0Tz7AB
         uHHajGWlsqLl7rPfxfnmyX69OHuMKHkv8cWtHqUv5ZTl8j8X2nXZ8H6CiBIv6v5bjJQY
         21VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUObxxi7Z2aUmCgcrqeWxF5lW/0L9jWTmCmlO9qrT1Q=;
        b=uIvcpZuVRfZUPktlL9dyGGCyzluEP3845rMC3dIcPtOlDOFR8I/hJEmThglNl4qD2t
         iX9jCWcmPMyAhY7tqfcqax/ksiF4/y/fz1N7j9dOvdu2zl95Jpuz1GtzC3KE8G6ZDs/p
         xYtnby86flHFHNSyEPoc3MfPNaMBNIaxwS9tRkUk3MZI4A2FuFiKRwCnNMVFCtqla3vu
         KGNkvwppCvjxm7zUI72+w6W4TYi1DA0C2FS8vHX5zQeW+1FVHAUuWAZjE6IUs430ByPO
         6xmow0CoiN+8ZZ3HEC29/I2PMPiKdDLbOru+oZiSasil85dJvlGB8Fa2tFb3ofxXSbCs
         TlvA==
X-Gm-Message-State: AO0yUKX5AQPq0vGVQXBRBL4lpg2PX15gFTiHFxfhR/+YUcTamHy0pLW3
	7dhlQQURvGeWwVZuIAL2uCqX+aVO2H5ofotL
X-Google-Smtp-Source: AK7set9gzoFIZC/HHEQx2LoQ3xzYrgQmu1P8bhxmtZ9aRi/3fg7y+mEkZR5AU726XemKhjVyaS6WEQ==
X-Received: by 2002:a17:903:1c1:b0:19e:72c5:34df with SMTP id e1-20020a17090301c100b0019e72c534dfmr2360125plh.52.1677850697136;
        Fri, 03 Mar 2023 05:38:17 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:16 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 17/20] RISC-V: time.c: Add ACPI support for time_init()
Date: Fri,  3 Mar 2023 19:06:44 +0530
Message-Id: <20230303133647.845095-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053817_879328_7D86D3C4 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On ACPI based platforms, timer related information is
available in RHCT. Add ACPI based probe support to the
timer initialization.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/time.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index babaf3b48ba8..2c29543549c3 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/of_clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
@@ -18,17 +19,27 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
 void __init time_init(void)
 {
 	struct device_node *cpu;
+	struct acpi_table_rhct *rhct;
+	acpi_status status;
 	u32 prop;
 
-	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	of_node_put(cpu);
-	riscv_timebase = prop;
+	if (acpi_disabled) {
+		cpu = of_find_node_by_path("/cpus");
+		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
+			panic("RISC-V system with no 'timebase-frequency' in DTS\n");
+		of_node_put(cpu);
+		riscv_timebase = prop;
+		of_clk_init(NULL);
+	} else {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
+		if (ACPI_FAILURE(status))
+			panic("RISC-V ACPI system with no RHCT table\n");
+		riscv_timebase = rhct->time_base_freq;
+		acpi_put_table((struct acpi_table_header *)rhct);
+	}
 
 	lpj_fine = riscv_timebase / HZ;
 
-	of_clk_init(NULL);
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
