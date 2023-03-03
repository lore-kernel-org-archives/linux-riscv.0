Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1EDC678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VYM3uBPNTxXJ214O1uT1/qNlTVN+jfkmAaHX+urXY4=; b=nu9GvluQbGxxvY
	VEbDm99Y04r5Es85x0p09R3lSL6sp0izCbofirr/sY/cMEGSsUUapYYjJDa4eyEeTiSlspF4EUpBh
	q8E8DxjBR4W1I3rc1XyV1AY1bZWoLQjTv03rHe7EEtMfwS9TPIYiyUVVkBLFrv6IF+bFxCZoWBOdE
	htBo63pB5dPJxxTmQBN/VzJNCWYUk+T0Lg1gnIiHnpILGS32CiobTaea4VpmriINWXpsV7yd8Yz/8
	RhP4eHC99BLt1HQuh/7zVUbgDEU7zIrtL4HtbpErIfuh94W0lcf7tSeryM+nB/kMa0qYcUAE/i2VW
	EmcdS9/X8cPPAlRnY2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bm-006Tco-90; Fri, 03 Mar 2023 13:38:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bj-006TZT-EJ
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:38:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id n6so2679474plf.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcUANUnPmLAEK+XIpTGTIqkpKyb9BeUNqm/80XJY5vg=;
        b=XkUA56V6OSWXY471GkW4kVLn1PNkoP0yegLGy0Ue3fMxWyv3Opt/TrgEQ89v+uhM5l
         xzycoQ6aJh4rQndCAbi5StOxCsNhC1uLkGzrJVH8fQPAEE+dgI/RtCyFiTGLib8ygx8w
         me0SrFzXYuI3HmvPpXntl50OPSz36mtIOsoJdtYLB/bNvK8pCgnri3yMkGigOjoGdQta
         AuHx3b9azP0+z8OziaCUVR/bKUnsoshjlUEK/fsjgkv9UMbuuqzHJQDaSVb1wd59ogKx
         rGOlklA8Z5aWjEue6ZiIAkU6tT/BVcFOCZVMlp01uiSnAg/H8H06icOR3G0H8dgPPdTK
         ogmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcUANUnPmLAEK+XIpTGTIqkpKyb9BeUNqm/80XJY5vg=;
        b=lIgQBzTuN6nINXB9tOarWtMvywh4+OHTtT75rOgGrwujxPASiQr3kneuXGKYaNOZVe
         YxTReqrGnyvwGBUcCDbRKkhwJpqweqCAih7eOjLmy4vu8VDi/oyomKwCLYSjcTcYcvA4
         r4fZ9P2YfvqSThrznQgTAQ5dmDhtqU45dS+wz3HwGEBx0xqAbz0P/8SzijUSgVwglvTo
         EnZt9ndZTUYw4TNSNm0g6SPWYLXaEx6uK1X+1tnO8LULG/QD088H4xsBPPsnCLeziu+0
         rwjGZ575Qy7OgG5FYSY2BzGBlBLDevi7tOfsRNemdc4+sEjnWdb0W2/uuwOohWxYKtbi
         dtFQ==
X-Gm-Message-State: AO0yUKUv6wswyCAkhKxcXmE8rL7Q08C/PWvPjWqz3a68ljRaNVgeqDSZ
	ROlzvX59+UfXNd1THRJLYrDFiVtqVFZBWmPB
X-Google-Smtp-Source: AK7set8dJdlMTzofbwwc2OpZqHZJ+omJqGrix56MsJz7IW6hYJ/YKtw8q16TCcLJYH60qn735r1Dgw==
X-Received: by 2002:a17:903:8cb:b0:19e:8e73:e977 with SMTP id lk11-20020a17090308cb00b0019e8e73e977mr2051813plb.67.1677850677984;
        Fri, 03 Mar 2023 05:37:57 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:57 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 13/20] RISC-V: cpu: Enable cpuinfo for ACPI systems
Date: Fri,  3 Mar 2023 19:06:40 +0530
Message-Id: <20230303133647.845095-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053759_553738_A92F453D 
X-CRM114-Status: GOOD (  12.02  )
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

On ACPI based platforms, few details like ISA need to be read
from the ACPI table. Enable cpuinfo on ACPI based systems.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/kernel/cpu.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 8400f0cc9704..80101bf77dab 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -3,10 +3,12 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/acpi.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
@@ -283,23 +285,32 @@ static void c_stop(struct seq_file *m, void *v)
 static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
-	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
 	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
+	struct device_node *node;
 	const char *compat, *isa;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
-	if (!of_property_read_string(node, "riscv,isa", &isa))
-		print_isa(m, isa);
-	print_mmu(m);
-	if (!of_property_read_string(node, "compatible", &compat)
-	    && strcmp(compat, "riscv"))
-		seq_printf(m, "uarch\t\t: %s\n", compat);
+
+	if (acpi_disabled) {
+		node = of_get_cpu_node(cpu_id, NULL);
+		if (!of_property_read_string(node, "riscv,isa", &isa))
+			print_isa(m, isa);
+		print_mmu(m);
+		if (!of_property_read_string(node, "compatible", &compat) &&
+		    strcmp(compat, "riscv"))
+			seq_printf(m, "uarch\t\t: %s\n", compat);
+		of_node_put(node);
+	} else {
+		if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu_id), &isa))
+			print_isa(m, isa);
+		print_mmu(m);
+	}
+
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 	seq_puts(m, "\n");
-	of_node_put(node);
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
