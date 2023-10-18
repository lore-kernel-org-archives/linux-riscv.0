Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBE2CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Zb5JH13ue6ojOnAY253+jWFHES8+sYgYdB6cz0Sk9E=; b=tnK6rGLAlwttXD
	dCn5JsB2R9MA9W+Fe2t2wqKjU6wq/PlS+RY5v2JnOoBCkObU79am0c5Qfvq+ovjW+wo6J5RZ6vSPQ
	ZEN6LaJWGnmb2qufSHkNWQEnvcRJQBfMfKL5kzmGdKGGLiTBi6LwH88wWVVpOKAy3zzBTbXcSXWrC
	GW5bnyN37zt+REj9THMU3cQ2TcyAxAfYSua89cwAhaVUxJahlqYZTsyj9F/M3KuCzuQO2TNRwk2Zo
	xdmV6yn98csmMtKvneAqRCMfRq2u26mx2ikS3N48Verzc//fqyQbQsf8gD2ZyKO0tv5NczPg9o18I
	JWVxPAlGrKRzrzQd1yMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5qk-00EgcI-1V;
	Wed, 18 Oct 2023 12:40:34 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5qh-00EgaH-21
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 12:40:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso3377486b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697632829; x=1698237629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2bhvVS+iGlODYrs0fN0iTmfeOWSVXnmMmj0GHdCTAk=;
        b=oOhtCNG7dQTZPVJLQc8EAtIfKo6BoEhJwcgpTUKZC5dvewirusBZZjq1RyQAaFLONL
         NCgI7RKz64vkBjN0uVXeZXNlskQvn6Iha1yv+sFs9ds7IyTUpvtYGW6rl2/I7C2D40uN
         os18fcy6B99ymOjN/wdFJgbkqTzXvqIrFTdC24Hmh3BvF/Jv0vXdhc6VVPXVVOYZ6FOZ
         BIhEFA/mDZYb9PeN72YN7rYZK0MyzMp93Ty+kqgWIwF1g828BsTuQWfWJ5YhznGNJodu
         1Nh9XihlG2B7l289Os1HduF7zZMf/c5BNxn5SFGIvDBqfd5hJvoQrKOYFsNvpvzngoFF
         hGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697632829; x=1698237629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2bhvVS+iGlODYrs0fN0iTmfeOWSVXnmMmj0GHdCTAk=;
        b=rdZ4gGsfrSf7EAaDG2utT3OZbYddi3bri0Xys8BZF9GEh6mrcKT1DMvA1yEkMGm5b1
         o14jQgafCXbdaHDnn3NnoLucsue6uQH5uxkTrfx4IbsxpUzblC/1R9jz+KIxkmF4kTYo
         Xug+Sj65T6Rt9sPVlmPELxdxrlppMtEujQBbU/K9Mb72GOFF1HZh6eb/odtQTH6PsKOJ
         n2Psc+gQ0IcUAnCJ9AdRXpxB/4KSQLW6eNGQGOfXjfCEQwciSL3bGA3V0HzX4ATBkxUp
         VsAqkGwcJv/dbcUQGpnCKKaWz7xul+OP9GDKlOpOCAddIwIQUbL6Buhgjk+7dw0p60xN
         LmrA==
X-Gm-Message-State: AOJu0YwO8FMWSfBdyiRM6rP1YLWFX8dUxMO8+EIIOAzrQYIlKor6fTC2
	YxPchZF5ydukAKRL8FOLsCYt6W/m50+I28URjSE=
X-Google-Smtp-Source: AGHT+IFX5lHsddVHnrml5UqaK+P/TAYVDKZO5+Nh2aDb58jEp+tdc2ugg5iW4fHN20LrYBuh7yZ22g==
X-Received: by 2002:a05:6a21:6da8:b0:17b:4b61:a907 with SMTP id wl40-20020a056a216da800b0017b4b61a907mr1493643pzb.50.1697632829272;
        Wed, 18 Oct 2023 05:40:29 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id w190-20020a6382c7000000b005891f3af36asm1599267pgd.87.2023.10.18.05.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:40:28 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 -next 4/4] RISC-V: cacheflush: Initialize CBO variables on ACPI systems
Date: Wed, 18 Oct 2023 18:10:07 +0530
Message-Id: <20231018124007.1306159-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018124007.1306159-1-sunilvl@ventanamicro.com>
References: <20231018124007.1306159-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_054031_682824_CCDF5CC9 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Initialize the CBO variables on ACPI based systems using information in
RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
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
