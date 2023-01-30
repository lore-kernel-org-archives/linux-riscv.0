Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE4FC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCPfN8C6hkMkEk+kkx59cfjxg50R0JvZpCPbyYSvDYY=; b=HxFZC2L4yenbBu
	zTgGLUElYlJ05ZgAzIkqQkbmkzD/8m1/AykuEuxYtU1oNFWt5wX3Jw/yBOwVPlob9RZH+4kAUnGeT
	xIsTzgOkWtQqgqYM3+W7E0CqhQfjYyDErAmiePGPI6S5ODSMr5gI4/vW0et7BadGnMSBQ5d3D3jhr
	bOhuVS5cILrR08Lx6G4dL+W7m5AY9v0BRplBY9bZ2QR3I1F/5ZZgewT/UU6MH+S3XgZ0Nnwe2tAyn
	sSPVpjJp6I+qau4qUodBdwLlYJYkKqqFbCNDpcBgzwTyZrOlQdZQqtmCWLU1fFawEDC8Tp2FvOjcn
	QXN9y5laxj3q9YU3BRYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYs6-004zJW-Hg; Mon, 30 Jan 2023 18:27:14 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYp1-004xMJ-5Y
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:24:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id k13so12604148plg.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhwY+WHgnWrppFtmwiM46uOiQrz563HB2faXGIghFSU=;
        b=iInNpQ7clh9Xhn73EhLGThPE3LzvgxolaEMcMBFaNQcU0FyFUCrytg1AoN6qx54NGV
         tuUi0Rpk82IhdjSzcQlpvC9xnBE8caYnPCYVgCWf12zwykeR0GLxp2+KWVUsIC5wYGG2
         tIgSyV5SLs+I8l5zLzzXHedeWug+DUd9Q8tzkSIlVrVJ06ujBh1K6SVIw96N8Y0dsUhg
         hjXwJr155I9BE2EEWoGASofgJkoKIEKq285EiImlHB3RMkZ2n/U553ecRygzNNXMdV/i
         YyYa8Vk40KYiz1AMOsip0jMKX+M0e/Sr5ZJ+HUXowwqIp+//AZjG/e3HW9jpCtLgRF/y
         9oVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhwY+WHgnWrppFtmwiM46uOiQrz563HB2faXGIghFSU=;
        b=OlW/1sukHUW6pG9jZlYPzik9FTNDAp4buGnUgQOscVMiwTg2mFJuF9uCiPw2GycfaI
         WYKpDL5ffy8oGtGN8TyZ+3BxrEZpEKmSFlGXyhUboSLoBZp9Mj+XOk8lo2Roj8npWsbk
         a/z0kmb734n3YooILL2mu0ecCiTFJiK9cFK9by3in1SXkgE8sxXhNukomPDaQNZejA1c
         EvC3JW7AYn9THmrhzRYMf/oF3XsLRjxKhvzaX55Rq0SokBnwD0Xh/rhpfoMVkOqSyo6O
         /AzEKVF2DqsSX7hSPfjVMp6YNFPTHjdlFHv1ykGM/sx7IwLgvZdxu6+LzErNPzxmGFKU
         BVQw==
X-Gm-Message-State: AO0yUKWHwNfcG+rDYZQPG1mbp4gJuRgCYIr0pK95puxbnPZUj6ujFKvE
	UFPw1XmC91P2o145IDyXiJyrsA==
X-Google-Smtp-Source: AK7set8OI+5RJViJJd8quwMebJkruqM9mvugGA8nhl7tcJy8x2139ul4d8jSgUZ1k15UpaedB8w/4w==
X-Received: by 2002:a05:6a20:9387:b0:b0:3329:c395 with SMTP id x7-20020a056a20938700b000b03329c395mr13317445pzh.30.1675103041308;
        Mon, 30 Jan 2023 10:24:01 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:24:00 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 19/24] RISC-V: ACPI: cpufeature: Add ACPI support in riscv_fill_hwcap()
Date: Mon, 30 Jan 2023 23:52:20 +0530
Message-Id: <20230130182225.2471414-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102403_247877_855F3FF5 
X-CRM114-Status: GOOD (  14.86  )
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

On ACPI based systems, the information about the hart
like ISA, extesions supported are defined in RISC-V Hart
Capabilities Table (RHCT). Enable filling up hwcap structure
based on the information in RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 45 ++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..c10177c608f8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -6,12 +6,14 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/libfdt.h>
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/errata_list.h>
@@ -21,6 +23,7 @@
 #include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/switch_to.h>
+#include <linux/of_device.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -93,7 +96,10 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
+	struct acpi_table_header *rhct;
+	acpi_status status;
 	unsigned long hartid;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -106,18 +112,38 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
-	for_each_of_cpu_node(node) {
+	if (!acpi_disabled) {
+
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			return;
+	}
+
+	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		rc = riscv_of_processor_hartid(node, &hartid);
-		if (rc < 0)
-			continue;
+		if (acpi_disabled) {
+			node = of_cpu_device_node_get(cpu);
+			if (node) {
+				rc = riscv_of_processor_hartid(node, &hartid);
+				if (rc < 0)
+					continue;
 
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
-			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
-			continue;
+				if (of_property_read_string(node, "riscv,isa", &isa)) {
+					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
+					continue;
+				}
+				of_node_put(node);
+			}
+		} else {
+			rc = acpi_get_riscv_isa(rhct, get_acpi_id_for_cpu(cpu), &isa);
+			if (rc < 0) {
+				pr_warn("Unable to get ISA for the hart - %d\n",
+						cpu);
+				continue;
+			}
 		}
 
 		temp = isa;
@@ -248,6 +274,11 @@ void __init riscv_fill_hwcap(void)
 			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 	}
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_put_table((struct acpi_table_header *)rhct);
+#endif
+
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
