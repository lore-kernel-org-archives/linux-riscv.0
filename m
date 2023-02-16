Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBC2C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjjVZdq0RhImMLo70MsAME1bw8j2km9mjZzwkFD4P8I=; b=jlpKFIE6FMAgu0
	En+7okLaT+RG8GbVB4LfzyX3pZrQOfX0RDnSrCCqKQ8WNhZGpXk/CWgT8ks8mBAa2fN8+U5ALYhiu
	O6WT+XMCVlSjH/TD3Yu3/Ihp0WrvXzUUd0M6luzsTOj2xF8mJoI1Vb0TVlUPTIMSOANk+nvbzZzw0
	ra5b7rPq1hspn2N847PtNLfXCooi9eXs0esJwoR/uq+1wXNzvO21YxtdwGcjapn5Pxsro1rO1eiF6
	BixYOXxMrav7BoNdjS4aZJBoNyOv12PbkH9Z5vmxcdtTeFlBAl9AshhBPBXZRmzyEFVCzKnyW9yfc
	sQmChmNIuArEvVqse2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSite-00BUIl-9D; Thu, 16 Feb 2023 18:22:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSita-00BU6y-9r
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:22:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id i15so138295plr.8
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjXwYmjlb4qLXAQKk4p+crKVMVgfMLiURDuGCOAQBXo=;
        b=V1EWcSn7s/zB5yoo0RZlAv/kS8CPk7pGWmyW8MmvfWwyIqESMo1MjwuqWg/GrXiycT
         IRlhq2vH4TRPjqX7MhEUvuxf2HAMFxTno3nTwzqLN7Hys2vkxT4VnLIRWoCjpgFE0OGJ
         eZNi5pce+I9VZkznd7sJnnhv14NvLcNNVkclgh3iyop6uIXFFD2lUYXuJWfNeZ2TEHfF
         lCb0ifNzr28mTfFrREt2B20mnaE0wHeFTC18v0zervqlQypET2v2Y6LCXohFYiPAjlyX
         CjBcMaogRlRp7aF3LrWJxWmuaT3vZhVsKyUcOAkehGm6q4i6NVgluPC6KGFe+nedMJnn
         9I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjXwYmjlb4qLXAQKk4p+crKVMVgfMLiURDuGCOAQBXo=;
        b=60nKRf6gnHZZ7GN9mWUZBny7NM7IQrLDAKGyQAblP55/lSALNeBLHAb3K/NYGmjYjN
         7zdO6R7ilBMLXJHZQFgCjOVR9WZDW4yeyPcxsuemW+61wQV+PscvYR19P5XvgKDfS3Ya
         Z3jxkXm6oaCaNpz2a5xpHGpYp/O+oYKvivrWA6o2opYYtFgsfc1rEE2s11q5G4oxv4vs
         e1Stlf2/WhJPogTUptTmGqsYJHVUuvW27aul4eJR/ZDs+J7vK3zKJ+g/tDNcPdBnMBu9
         sDVh0A5r0LQUpjyHatJ+FweCfMWbkc4Q64XoUWyP99W9YMq8SoKOZaPDoYXax/5f/OlJ
         ScDg==
X-Gm-Message-State: AO0yUKWwtK+dejo1nyiv4YPbW0nNYOtyGUVctbdU4AoyFLMhTV4jnXmr
	eDvOkvOEz8z9NXfO6ndTFhZkAA==
X-Google-Smtp-Source: AK7set9LxgFkAVbnm8jngPBu3SiXgJ9hu19zG34UJQxj6MufVqIhqHqG5LXGm9234ApK0t9Yz/YDOQ==
X-Received: by 2002:a17:90b:3852:b0:234:7ccf:3c7c with SMTP id nl18-20020a17090b385200b002347ccf3c7cmr3048070pjb.9.1676571733991;
        Thu, 16 Feb 2023 10:22:13 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:13 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 17/21] RISC-V: time.c: Add ACPI support for time_init()
Date: Thu, 16 Feb 2023 23:50:39 +0530
Message-Id: <20230216182043.1946553-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102214_386685_6F4A69F6 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On ACPI based platforms, timer related information is
available in RHCT. Add ACPI based probe support to the
timer initialization.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/kernel/time.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1cf21db4fcc7..e49b897fc657 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/of_clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
@@ -18,17 +19,29 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
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
+	} else {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
+		if (ACPI_FAILURE(status))
+			panic("RISC-V ACPI system with no RHCT table\n");
+		riscv_timebase = rhct->time_base_freq;
+		acpi_put_table((struct acpi_table_header *)rhct);
+	}
 
 	lpj_fine = riscv_timebase / HZ;
 
-	of_clk_init(NULL);
+	if (acpi_disabled)
+		of_clk_init(NULL);
+
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
