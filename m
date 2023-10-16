Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FFFCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/outUctel0In722/mgL3L0D/PZI0fR7Xeg9g8R7kj/I=; b=4CLagGEfe4fj/z
	Hbd8t1Zoc6UdWqVrbCgGi/cRllHLZ2+pRhtsiZbEq2WE84Nrr12n7mpWY7xlPx1JY5uIgBeOOBBvy
	wGto1/od/fD7AIYSOQr7zYrYWuD9Ofno0Dzt86gUn3onXd/qdrcoZ325YGRuW39nws0Ps/X8rtYrN
	OVBwlFuDwkjrIaSsSyY3FAxqHzcUiJ7i6oJRdonEn7QHalLG4hW6jo7rJXOiN7d5VmoNoagOgwD+o
	Xs4iSgw0hWueP20hNZ7zx0Kc903UrBn5iBQfukggPy0kH5P4aksA3t4caNVlj4qQ+u5SEOfUZPmAG
	5QprTT6l8jZCrj9tq38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQnQ-00AB1X-1z;
	Mon, 16 Oct 2023 16:50:24 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQnO-00AB0Q-0a
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 16:50:23 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6c4b9e09528so3241755a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697475019; x=1698079819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ0vGD2+BKy40gDZpkmDGFYSfDE+/JpanTOV3I4/UO0=;
        b=YFssB+PdL68ekLwqtw0HghuuQpaN5Wl9/HboWZtNh+kw+OTiKvjECzfk6LhvigHiSc
         1T2EZNIPFN8Sy3+DCg6UsiwG9qPCbRhTHZylEZm/lcpNAbiTRAqlHwKxZ+Xik5j5gdia
         Fr0OuZrJHV7AyFcLPPgKZOjG33PEFfZYqIc5k70LzZZqXYOkIWirJVvCHwws6Oop7hHn
         Dt9mnrIa8IC5J/+ygwTdyrVZMZqgDTb8NqMAZcgCB/OavCUvPso1P5NO4Fqe3qqfKaPQ
         RwLK1rU4XUIBM/P84t4Y7pxYxHdfyS+n7sb5sXYRQ2fECazeFCcAWVS/g63GVLyQ4PA3
         ZCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475019; x=1698079819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZ0vGD2+BKy40gDZpkmDGFYSfDE+/JpanTOV3I4/UO0=;
        b=YhZvzWoPx7A9a5ixdeCokKt//4osRljjFJJAyLbdviPahWZrWODs4nHrU3wSeTkdan
         iGMQQT8Nmn+a0abSdjvGUu/ItYuRvWmE0tcyM7f1HWKSakhrTg9AY2M2bgnISneTZULC
         1j4LokmduKlzzJVl7XykwviQuA4cZ0UkMkKG9OXXY5cHERgV6upwodw44ZE2lrsFzMxo
         AJYl4Vq6LrvtRjj+qalH7RlHZTU/UzkgdT90xm/RIkANYIBCXYZaSlQvPZIbp+eXj67X
         2v5najKZeu3lYUszKmPWe2crURpd9SuLRhcvogRytuYv92t7W9F77PQDMWxmzcZDvmNA
         dRcA==
X-Gm-Message-State: AOJu0YwpnviBBkInONUFemEMXJB2OEolpCXvxWIr1YDNqEPVblp8aVBa
	/PLtk13CA3fT9ZHqyipI4Ex2iZpHXereaqD35LI=
X-Google-Smtp-Source: AGHT+IHqliXUJFOJEhcrG6Kun9snmsLpe7mNtDv2ZFSs1vqugxC/0ZpQcV+6xbYVXPNJauOh7+BCtw==
X-Received: by 2002:a05:6830:4ae:b0:6c4:9ca1:f13a with SMTP id l14-20020a05683004ae00b006c49ca1f13amr35003337otd.35.1697475019591;
        Mon, 16 Oct 2023 09:50:19 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id t21-20020a056a0021d500b006b1e8f17b85sm111252pfj.201.2023.10.16.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:50:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 -next 3/3] RISC-V: cacheflush: Initialize CBO variables on ACPI systems
Date: Mon, 16 Oct 2023 22:19:58 +0530
Message-Id: <20231016164958.1191529-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
References: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_095022_220167_0993DEE9 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Initialize the CBO variables on ACPI based systems using information in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index f1387272a551..55a34f2020a8 100644
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
@@ -124,13 +126,24 @@ void __init riscv_init_cbo_blocksizes(void)
 	unsigned long cbom_hartid, cboz_hartid;
 	u32 cbom_block_size = 0, cboz_block_size = 0;
 	struct device_node *node;
+	struct acpi_table_header *rhct;
+	acpi_status status;
+
+	if (acpi_disabled) {
+		for_each_of_cpu_node(node) {
+			/* set block-size for cbom and/or cboz extension if available */
+			cbo_get_block_size(node, "riscv,cbom-block-size",
+					   &cbom_block_size, &cbom_hartid);
+			cbo_get_block_size(node, "riscv,cboz-block-size",
+					   &cboz_block_size, &cboz_hartid);
+		}
+	} else {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			return;
 
-	for_each_of_cpu_node(node) {
-		/* set block-size for cbom and/or cboz extension if available */
-		cbo_get_block_size(node, "riscv,cbom-block-size",
-				   &cbom_block_size, &cbom_hartid);
-		cbo_get_block_size(node, "riscv,cboz-block-size",
-				   &cboz_block_size, &cboz_hartid);
+		acpi_get_cbo_block_size(rhct, &cbom_block_size, &cboz_block_size, NULL);
+		acpi_put_table((struct acpi_table_header *)rhct);
 	}
 
 	if (cbom_block_size)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
