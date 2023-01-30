Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B6C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyQCUyd8AN4vSFFYW/t5bGKvtEBYBUpOkxi8dwo7Ojk=; b=CIrJarQFVNQJTc
	ImzuNZYs4AHrNMZ4soZSwuTer/JM+yOCI7Y8Vq73/Ha0dFDFhMmQR+eajmygmNKmP9HWRRP1AwbmJ
	hHJFR6kV9z9auTv9G/Gqz04yt6JeAlPe7AP6Zj3n4Gqfw7uarJLyhYeV0MlXcj9hFik56rc/zDduM
	Su182D3NFymlG+G6a2jlZkkezKxs90Zm1jO3l/zQIgzfUvXCcUakgR1wjLUq7pofbwKybTPBZ29UC
	LJWxGcQ1AjhrRpP6PmdjS3KVSmQB8H0iWvQzxrW39cfG7+etbEoZpRVkBxTNeLj45sURUYPPxozWt
	d+Na682/Yg+VEen29cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYsH-004zQn-3H; Mon, 30 Jan 2023 18:27:25 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYp4-004xOy-Ke
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:24:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso16397715pjj.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLT6YVjIMhggeUGxbDKRIEVD6SSgY7IRMPNBstFbaBA=;
        b=M1QDDILcAog1w3pkeRDILsJlkHNAkEovkLKmqgFMVaps8Cs6u32gIaQ4jXpF54kr3e
         /idr6inoUm4ymQXW925LUn0a+drjUAueo6ZnYTxeP51jwjtrT7UYHw0Ewrj0wRhh9278
         zJBen3mN417wHhDdSuG8+HATLZq/PCHVZq4vgxFEPai5RppQWR+MM9RJ6ZD1TT6LsDbJ
         juLg2Rm+I0D4+woO6y3c3YPydLtB1urRROE06sSTT9am5BMtM36Se7kFFl/AVmbPaO3N
         BCmm+TruD8JNnHLfSHQXgtSZmcRtMxuvikBSlSRSCep3yX3boFA5NpgbHpJt9Z1XdzGa
         wKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLT6YVjIMhggeUGxbDKRIEVD6SSgY7IRMPNBstFbaBA=;
        b=ig3LS11AOHA5x7/1j+T72xZCUyiHtq7O0yDuaomunARvCnLzYBXNZUccbtjU4/OjwA
         JcWBZHAPLYofikek4h4ZSjK8n5SToH7jZ+AOKm13wMczuK7RUFjjYH7Mk7OJWwgZ9iH+
         hfFebA/KXmWPescSansOcg0GHe4U/P0A5C5/uMgM3yX2HT36Hqo1XqOulIQciKZaQkXa
         LSVGUPSpPNDDsw7Srztny7ui/aBThU3jXrnhelIXozxXMoL1me9kB7eFxGZsnjvll1OW
         Cp4ZNxgjeMj+X/qkBbgLh5Hq1f70E6xzIN08pIjGat461PLcNpNRul3qhLYqkZBswsPd
         XaiA==
X-Gm-Message-State: AO0yUKWOO5evDwmXwh5PeVS+3mgWDVLIc6JtywFGKzJC5NXEiNaIPVzl
	klTFqR/DZ4ZYkWZPSxFH8dIi3w==
X-Google-Smtp-Source: AK7set+q8NH+Tb7GA3eRxftTVuw+3Bfi6WQ7oDY9dijCptCPEskC/PHo2lUMMlO+rpQ0YAIRD29A+A==
X-Received: by 2002:a05:6a21:789a:b0:be:9fff:48d8 with SMTP id bf26-20020a056a21789a00b000be9fff48d8mr2772632pzc.49.1675103045999;
        Mon, 30 Jan 2023 10:24:05 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:24:05 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 20/24] RISC-V: ACPI: cpu: Enable cpuinfo for ACPI systems
Date: Mon, 30 Jan 2023 23:52:21 +0530
Message-Id: <20230130182225.2471414-21-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102406_742754_18F2136C 
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On ACPI based platforms, few details like ISA need to be read
from the ACPI table. Enable cpuinfo on ACPI based systems.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/cpu.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..bd6c0fcfe4ce 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
@@ -256,26 +257,47 @@ static void c_stop(struct seq_file *m, void *v)
 {
 }
 
+#ifdef CONFIG_ACPI
+void acpi_print_hart_info(struct seq_file *m,
+			  unsigned long cpu)
+{
+	const char *isa;
+
+	if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
+		print_isa(m, isa);
+
+}
+#endif
+
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
+
+	if (acpi_disabled) {
+		node = of_get_cpu_node(cpu_id, NULL);
+		if (!of_property_read_string(node, "riscv,isa", &isa))
+			print_isa(m, isa);
+		if (!of_property_read_string(node, "compatible", &compat)
+		    && strcmp(compat, "riscv"))
+			seq_printf(m, "uarch\t\t: %s\n", compat);
+		of_node_put(node);
+	}
+#ifdef CONFIG_ACPI
+	else
+		acpi_print_hart_info(m, cpu_id);
+#endif
+
 	print_mmu(m);
-	if (!of_property_read_string(node, "compatible", &compat)
-	    && strcmp(compat, "riscv"))
-		seq_printf(m, "uarch\t\t: %s\n", compat);
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 	seq_puts(m, "\n");
-	of_node_put(node);
 
 	return 0;
 }
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
