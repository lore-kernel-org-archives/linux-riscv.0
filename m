Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1051DE82CAE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNWiolktSATaNgv2VA2QgkR1vE5fgsQsNPGRyvqeElo=; b=o6nn5FgWmypI/o
	rGwpBB6ZCRCfzQ+4TtIse3enObzFFno+3cy3QjALRa/oR5smM9paOtSacO894hj9hg86lnZ+ZWayO
	VUiRRKrOdveFH2/m+LebRZcoPznIHQYpwMjQ6lLHlf8a6UyjORQrGF+fp6tvijy1I3Ktf64y8FE6B
	HbvUgRALlJ15qICYZZLGF6RIRralhonba8ocnw5aCB6nVCI8Tmo6PLjgSyyRZbrLVWxeLnDH6P2hR
	ruBa9gkZnA/ivI8/YnSu4fiS6PuY9IbtEOqIhUUOP5xmilZqYjhqlvpU71lTouywmhoQm4BisyjKC
	cjhoGbu6r0z+gt7nHMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXu4-001TGw-2A;
	Wed, 27 Sep 2023 17:00:48 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXtz-001TDg-0Z
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 17:00:47 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d89ba259964so3510784276.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695834038; x=1696438838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMRAaYbpAL9AMr/u9386eJc3P6IZIKKW5n+xTVSQNsU=;
        b=AdJGnMZLW3mtC9qLaqh6vfcIuXhHcoWS0l8480yZSuCZBxp4RhXA5/ClgDLdqS7Ex/
         EftcwD/6Auz+TGzNdCKqR6OE5fIoalBBdRbwWKOZxiA1QNAfNXdTGeUItk92igZfVoup
         aSgl/Dz+lOlZuKCoJa74S5XLSHGV6xz4Ne1MTZpebf9ziWXkrsCmbRUtBV0jodMUMxMY
         KtKpxq4fcSXwZx4/fnzFX/6YWZdKyeOi5Nme+f7FNpXsQMD4LUdqixtCsOl21SqhI659
         2L9qxW4eac4EdIjgtyJqAQdXMPtGAKO11P5v6ULSGU2MJD3xJZuEXXXajJgOWHgiBndU
         je7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695834038; x=1696438838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMRAaYbpAL9AMr/u9386eJc3P6IZIKKW5n+xTVSQNsU=;
        b=ZZ7z+0nvNPUFYngFE/MP/nUuvOovxrrlkeWTlNegmg0Ctf8HouAVLuzRHK6467yYsD
         DKEhpHN0ZCOFgd32AVaBpliEejPyvlQR/ExBH9ksrO/7A2vvEuNVY7rK3epvH1iiUcSK
         E4uqls1lIwfovZnvm99fm3ckJW4SWU56/WfziNZoSszac1dVNuybJq14P0FJT8TdpPFh
         4Hv686REF/omgSohUjh6UohMvNYaMnV/qxrA35OPmDyguJJZmeNpj+DR5bc39BLMxo/S
         RDabXtzkaBVEuIkAjKw6Gw3Lf7gxSzJu/X7yWS3j8IHOPTmpwgREAeGPeWU22hVctLa6
         KfUw==
X-Gm-Message-State: AOJu0YwnoMyUKMit5quYK/GVcyZFEJCCb2qMvKYQnzDj+fgBhqtvuhZo
	asTbhkXqXnOpxKTM40etOJz7531V2lYY3UHDH/c=
X-Google-Smtp-Source: AGHT+IGIJjabTi91p7r9FbrKe/nbsuosloqVsE93l/TK2lD4q6KXezQH+Jjl+BXIXV4t5YLkLYlm6A==
X-Received: by 2002:a25:6b4e:0:b0:d86:a964:a47e with SMTP id o14-20020a256b4e000000b00d86a964a47emr2382069ybm.63.1695834038194;
        Wed, 27 Sep 2023 10:00:38 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.42])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm3279396pgc.80.2023.09.27.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 10:00:37 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 -next 3/4] RISC-V: cacheflush: Initialize CBO variables on ACPI systems
Date: Wed, 27 Sep 2023 22:30:14 +0530
Message-Id: <20230927170015.295232-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927170015.295232-1-sunilvl@ventanamicro.com>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_100043_215730_1AA35798 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Using new interface to get the CBO block size information in RHCT,
initialize the variables on ACPI platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index f1387272a551..8e59644e473c 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -3,7 +3,9 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/of.h>
+#include <asm/acpi.h>
 #include <asm/cacheflush.h>
 
 #ifdef CONFIG_SMP
@@ -124,15 +126,38 @@ void __init riscv_init_cbo_blocksizes(void)
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
