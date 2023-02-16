Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8240DC636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LX4qXplkVQLryxYDAGE4mRYAfQwMVcz9U4k3dlOx3mU=; b=3scZHOJrr38MQK
	SWaLMcLrxmbcCDOnfsBknMLSAcu8WhOVCCjYaDv2RN/FwRqNEn95cDh2+bIPba0ekuUZSBdETDFH6
	DGPPS2avAUT1JzM74eXmSWovJELPxQ+jbC1/Qih8rx/DNRiM0LUhduNDSo+T5HsohxdX70aO217aD
	mx7bMW0a+3WbV5wZB8pNumQdnk+Wd6j/WO2XFoyn9BWXaCkKwxxnXDB/njpo9tXWMk4aoCggUXMz2
	sZ15T8N/a8JTBHlOW4DrV0WOctdu00GtZTQxIcD6jNjA6Jh7U0Gi3hW1G0+fnD8h7f+OC9hqU4zAT
	M0duSEFW+I+TfVGqeHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitL-00BU1u-2k; Thu, 16 Feb 2023 18:21:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitH-00BTz2-MT
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:57 +0000
Received: by mail-pj1-x1030.google.com with SMTP id r9-20020a17090a2e8900b00233ba727724so6449355pjd.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/B7oU0oZMzvSlnZ6Slk2M4LeGqm6SOf/DwHx2JHpN8=;
        b=JhzKrMk2y0c0UJJY9R3LAeDqup2Vy26n7fKJF2EJ8p9IKFWGnI1YedBoBhqO8F3LkM
         tVZ+fGNaffll2OfDmYRq+19mu8tuigJ54kj92JxCQHc1ux9gKkHGlD6/60HYZK/ZNGTo
         M3kerTUxSK6phuUl/DKNjGQyHWtPG5QMv4mHhe3+juD7WJQynDSgsNO+hKRxoKLPXcyg
         fk5/451Gdasyf10nauCTje7081IndfdWP2CXIZbgriIouer1UlPFOB6pBqXuYsTQcSO9
         xbPXfLEPHK2SFHFpnQZA7O6nt+QPejZjwMal7uNgk+Hakcw4VJJ7MArqKBxLJzJHHUF0
         L2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/B7oU0oZMzvSlnZ6Slk2M4LeGqm6SOf/DwHx2JHpN8=;
        b=hqgrlXEm2F6MTGqnCHZTt0dUWXC2pN0h4qJpAlysq4HW6baDvAXtMyc9KOOSiHqzJP
         ZzRtoxyUn9x7dnondkAy7pAdkfwHUHRmXjHtbwK6cg1ZzGTPhSorWMhopfpbhTTKCME0
         +WRtC0wSPAO0KbwIlv7Jvjm0X8x9h9BYKawud1eTLl9tE1BV8HhjkCWmb03wQaBiBYrY
         Js2C1aAlnyk9jocYjcTyShWlHqS4fF9RolEOhPh9S1TmyE6gq7AzyeBIUfF0Yy696cuD
         C3lLr5QKumKMO47IkKLUaQGoHcV3jay1jGubA77AXWL6rORsWJJqI1Flx1eY3Za+BUXJ
         I25A==
X-Gm-Message-State: AO0yUKVBxCpUkBfAKQmLbSrOyaAkDy/UR+rcwMDo5WeA96yAPTocBbTN
	QT1+sXRs00TcyybLwC+4wEY9wKWEEFiyrG8k
X-Google-Smtp-Source: AK7set+UGGwky0KcCyPjol1FGoQkgy43ytFVLWD+NpcOvsVqZI0SmSkUdXxAOwokXN5tYcdCUF81Bw==
X-Received: by 2002:a05:6a20:8e16:b0:c6:dfe3:8663 with SMTP id y22-20020a056a208e1600b000c6dfe38663mr6729908pzj.9.1676571715195;
        Thu, 16 Feb 2023 10:21:55 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:54 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 13/21] RISC-V: cpu: Enable cpuinfo for ACPI systems
Date: Thu, 16 Feb 2023 23:50:35 +0530
Message-Id: <20230216182043.1946553-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102155_763272_800B6233 
X-CRM114-Status: GOOD (  11.65  )
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

On ACPI based platforms, few details like ISA need to be read
from the ACPI table. Enable cpuinfo on ACPI based systems.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/kernel/cpu.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..a227c0661b19 100644
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
@@ -256,26 +258,41 @@ static void c_stop(struct seq_file *m, void *v)
 {
 }
 
+static void acpi_print_hart_info(struct seq_file *m, unsigned long cpu)
+{
+	const char *isa;
+
+	if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
+		print_isa(m, isa);
+}
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
+		if (!of_property_read_string(node, "compatible", &compat) &&
+		    strcmp(compat, "riscv"))
+			seq_printf(m, "uarch\t\t: %s\n", compat);
+		of_node_put(node);
+	} else {
+		acpi_print_hart_info(m, cpu_id);
+	}
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
