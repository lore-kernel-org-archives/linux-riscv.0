Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3146CC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzapOYFGo/bEbwV5tQWdqS6BNK8mwvxHXSo7+GFtdVM=; b=KPRcRMuYW2wcPi
	ulMZtcmqZCji/grcdp+xx8vOTdmz6f/E5QVRtS3Bzv6dv8/Rt5LRoMV5DCpdbNJZtId5QlGO1JyB+
	fTjNo8ikW01B4nKrvHhdWVCZDWuNmyDvrQD/PuRclqZHBV0HYaqDO8+Uv5cL+fyAJR51RDeU81/rB
	dCYbFyB/SDCdcsCj/W7bkFmwsUzqPYjYoiO7NwbtcNqPpk1CShHbzV+RuWnM6WaFJXXCf1fFONGWq
	Gl5/sCyLXhONUW/rglSBBMhQ1uYhZagtaGhYHB5x7RdRw/hotLp+2UV/t18XWnttzD6q4eEPO+0sj
	YJ3akNbM8rlGX+shclcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYsP-004zW4-Hq; Mon, 30 Jan 2023 18:27:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYp9-004xRZ-9E
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:24:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id e6so4320465plg.12
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oZQ53k8sDIi9jBLs3iLBCqJLG9S0A73uETYb1fJYlI=;
        b=RORdYgIqpJhiT2xO57x39JpRwK2+L1YP/j8KtHmtUDhwVGOrsKIXsmHiJaCq2vsK7S
         Ma5JepDyFdyQh5oTKjKKlD2acJeJBcX2qUr3Vq5PyGBgmPi21mpCYwdgJD6T8LMrBURs
         Svuobo44XBMVzKF75A/b7L+pBRHseeTYQkNrXfauxnDQ/8FP56BcIB6AhsncH2NEAv/A
         cSpICfZhxgL/74xGDxqe/H2GAftpoPX5+9CG+6XCY9rNzu3P88VjuGKbVg4bETIITD+G
         LQd3QGvZmt6k07JYum1fb52IRLn7lnOdhszfFh87aXmh6rmq5TNFz/wFMOAPpPtM0fwg
         RQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oZQ53k8sDIi9jBLs3iLBCqJLG9S0A73uETYb1fJYlI=;
        b=TdrbRpX/eglQHlVkrBaMKHyG6w/izNMtb9gbkIfrps1XfJtGXaJmQq5l7AOcPqSe8H
         nnhhcch1HtLafByrstzyuM21aEQnETWTK7MIXulRso7IGMzD6dZKTcYp9mqFGBq6kd0/
         aFztDlf7oEgshiJ3DzBCT/l0r5WWw7nJJCLndHHOtxhSLRM/XwNDiOSmvTObqiXqK0Nx
         rKGkCtciEh4Q9b2Ihkns+ZLHM6jLcQWASKJYbcIaVd9gpOXGqfyB8S1Z86ikn7PRTejk
         JF2+i7Xnq+wVOqHR5jDBlkoRj5t8K+WU6D9VKDcxnIhDcQuzxOzWZD9lTHMsGHBn2/88
         gUGQ==
X-Gm-Message-State: AO0yUKVH/hulpNVf5ub/0sI+YxxM24jgsVGTMeKufTpQtSWyMhmgnJZs
	k/XGdVztwqxkAubc+DPexgZigg==
X-Google-Smtp-Source: AK7set9y+8gc1j7btVH3pLsk5baTgirNZhG6cKTLz7X/bnmrD8N8A0A22p9fmsha2Zc63KuBgHho2Q==
X-Received: by 2002:a05:6a20:d49b:b0:bc:c663:41b6 with SMTP id im27-20020a056a20d49b00b000bcc66341b6mr7187379pzb.28.1675103050552;
        Mon, 30 Jan 2023 10:24:10 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:24:10 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 21/24] RISC-V: ACPI: Add ACPI initialization in setup_arch()
Date: Mon, 30 Jan 2023 23:52:22 +0530
Message-Id: <20230130182225.2471414-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102411_372857_08887962 
X-CRM114-Status: GOOD (  10.88  )
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

Initialize ACPI tables for RISC-V during boot.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/setup.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 4335f08ffaf2..5b4ad1baf664 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -8,6 +8,7 @@
  *  Nick Kossifidis <mick@ics.forth.gr>
  */
 
+#include <linux/acpi.h>
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
@@ -276,14 +277,22 @@ void __init setup_arch(char **cmdline_p)
 
 	efi_init();
 	paging_init();
+
+	/* Parse the ACPI tables for possible boot-time configuration */
+	acpi_boot_table_init();
+	if (acpi_disabled) {
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
-	unflatten_and_copy_device_tree();
+		unflatten_and_copy_device_tree();
 #else
-	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
-		unflatten_device_tree();
-	else
-		pr_err("No DTB found in kernel mappings\n");
+		if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
+			unflatten_device_tree();
+		else
+			pr_err("No DTB found in kernel mappings\n");
 #endif
+	} else {
+		early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa)));
+	}
+
 	early_init_fdt_scan_reserved_mem();
 	misc_mem_init();
 
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
