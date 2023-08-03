Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32445EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUnRAHDtePRT9vXuF3rLFR0WP1QHK1pBjkWqkTpdaUc=; b=PS/bG4pVIceATm
	Lcuh/a/AfftcECuKtWq6GmV/Ob0fA7R3Cm2Ajq24Qf4YEu4ztwyFrx20jFcicVddBOzDMMqOwB3W9
	Ut+rjKfN1Es+h859o1wlXJ4v7fzrIq22QDF1BwGt0i/DAIGlIqZSWZ2B9dqyGRemuFJnRM7QcwTJP
	z7uaD6GiDZoLN+KneonUEcpHjFEeTGWEgPX0jGESmyyjvtATYWZKwoZsfnJGLCdjSW1uS0tNhCVwi
	LDY5Nvoh2s0H7xD2IYhdZ82xZMJtI2IxprulYOcji8QPrGIfnzGgzphF6olTgPHobjfbnabYkcDiL
	Yeaos37weCObQBpS5HSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccx-00AV68-20;
	Thu, 03 Aug 2023 18:00:47 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccs-00AV1B-0V
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:00:45 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso893199b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085641; x=1691690441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVaxSLrcyWrDv537p1b6trWUWlm89roci1AhpEn7YYs=;
        b=fYo/3hatpzRNQHoHD581iWzQIHlOzusgQsa6qibNN0GLNn1R7S4p/XTrzg4lClBc1p
         lJKgy1mbJhBtdMSWvCGh9zo1ep2Gb3uA2P3XQbn7aI/LMI4bTDshu3hqT/1QFrqsfu7m
         TIdcKLkqWqqkK/tNhUcjdcoUPhpOgQm7R1QCCvGw5YQNWhSTvYAfTTAX+lJGELc3ARqy
         uX+JaTHismEAtWt+icKb9NzCOg5nBT52EbnylGIEAzjm2gWGkCHux7TB4Bi59RFPoIqH
         3R5ZRXHZLPpTl5R/PsHSm82EmxC7TCybtefpHDuU1MaqhlgUMegZvF1tMLSTrgHDefTg
         PaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085641; x=1691690441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVaxSLrcyWrDv537p1b6trWUWlm89roci1AhpEn7YYs=;
        b=igIGaD1y5ccU43wkjTQlToK1t3meCUSGRc/UFvWl6ww7iVSyzHLhbm9aWgE44WbpWs
         xmcHOWY+hz4AqGd6gWilE1D6X8QTvjVBKv+fNcA95rknuNiGTFW2JojXmymKFzYPagi3
         05hj2bbw/BlsAgD2ruE42+6jrRwYr19+gjL5fcn7uvbS2WeJ0alKWJZ0rDfzEraSQ9ch
         X7+Zm6FDMoSV63f4Rb6sL4WVGO2h7TkPF6VzhL2QkqBB0u9EQFzX5yfqR/TxB8uTO1Ti
         rAOQAKceLH0i64lR/sDTUa4Pxs+F1ZX5NZ3GYEUZNuP8b2yKp7t5gZUutFQ/CvB5z0xu
         K+vg==
X-Gm-Message-State: ABy/qLZUC0kXeGBZg4QHELcQ4wlodz4b6Qkw2qdI4t5JIuvJHiV4Q+X+
	Dbyxfu17kA275Rep57ds/ix1VA==
X-Google-Smtp-Source: APBJJlHyvV2fJJK5WcdXx6lc335tSDfrb26H7EK1vwao55qh/vVoaQmFBsBegHbsIEKiaSY6OFT3ZQ==
X-Received: by 2002:a05:6a21:6da1:b0:13d:82eb:795a with SMTP id wl33-20020a056a216da100b0013d82eb795amr13802350pzb.56.1691085641397;
        Thu, 03 Aug 2023 11:00:41 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:00:41 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 09/21] RISC-V: cacheflush: Initialize CBO variables on ACPI systems
Date: Thu,  3 Aug 2023 23:29:04 +0530
Message-Id: <20230803175916.3174453-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110042_212030_A403BC80 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Using new interface to get the CBO block size information in
RHCT, initialize the variables on ACPI platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index fbc59b3f69f2..63bb56819b37 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/of.h>
+#include <linux/acpi.h>
+#include <asm/acpi.h>
 #include <asm/cacheflush.h>
 
 #ifdef CONFIG_SMP
@@ -131,15 +133,38 @@ void __init riscv_init_cbo_blocksizes(void)
 	unsigned long cbom_hartid, cboz_hartid;
 	u32 cbom_block_size = 0, cboz_block_size = 0;
 	struct device_node *node;
+	struct acpi_table_header *rhct;
+	acpi_status status;
+	unsigned int cpu;
+
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			return;
+	}
 
-	for_each_of_cpu_node(node) {
-		/* set block-size for cbom and/or cboz extension if available */
-		cbo_get_block_size(node, "riscv,cbom-block-size",
-				   &cbom_block_size, &cbom_hartid);
-		cbo_get_block_size(node, "riscv,cboz-block-size",
-				   &cboz_block_size, &cboz_hartid);
+	for_each_possible_cpu(cpu) {
+		if (acpi_disabled) {
+			node = of_cpu_device_node_get(cpu);
+			if (!node) {
+				pr_warn("Unable to find cpu node\n");
+				continue;
+			}
+
+			/* set block-size for cbom and/or cboz extension if available */
+			cbo_get_block_size(node, "riscv,cbom-block-size",
+					   &cbom_block_size, &cbom_hartid);
+			cbo_get_block_size(node, "riscv,cboz-block-size",
+					   &cboz_block_size, &cboz_hartid);
+		} else {
+			acpi_get_cbo_block_size(rhct, cpu, &cbom_block_size,
+						&cboz_block_size, NULL);
+		}
 	}
 
+	if (!acpi_disabled && rhct)
+		acpi_put_table((struct acpi_table_header *)rhct);
+
 	if (cbom_block_size)
 		riscv_cbom_block_size = cbom_block_size;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
