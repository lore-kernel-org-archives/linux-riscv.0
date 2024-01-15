Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1F8C4707C
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 10:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Id8ZYrIn+MbeiteU/gqnEn9rsFIuhgvsa2GjK+FN3pM=; b=UtofpHyz69pOg0
	zw8HTvn5jvA2n44iEX9CHVNiGJPPytikVpCqIs6mNpg9f2qFqrpqhrI4TbwNjFkmpDA9P9NpWi6t/
	DhR7JvdI2Jj+ZG8pjkwcb+RfvjalcbwgCkHbYzbKEFi1VGEJVz181d/wIgbSpHRiqC0cwXSzQekXb
	cciYTV8t6UMns7bHXChlsnQfJEXDguBbFi9P8VkveTUBXpuxlF+r6Hx9dyKVe0EWxDlJ+mxrozsih
	xLmdaJ09WOZzsokjcyj/pcbv94k91/VXXvXXGr73X//owtNCY/y+C7DW1EEaQUPrQGGo/O8OSFDhX
	YIE522CYnn66am2iN9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJw7-008XUc-0B;
	Mon, 15 Jan 2024 10:11:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJw4-008XTt-0f
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 10:11:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so7153518b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 02:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705313471; x=1705918271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFE4MaRUUDjQZfE2dmgya8wKXtM/DMaoZewAWiQUHuY=;
        b=TOSk94gwyyXA3XgzeiNck0yq9gpx83DTcH4nWIcu1ysd59N87VO6T/EKzSPKJiGzgy
         UsCzZ/qYwUWDLOWONjfl9hYRE4i4pi1n9LqFA9Db/V0c+wUg8uP7zQ3r5PDl4TE7cJJU
         JGhgfmcU1Xy/kc5bWqr9errySLiwIFyUG9ZfiKkGjNpIgZJoGFd8u0wT4KB7xAMXex/n
         QDsym2YHp97jJNJlhc893ILay5QdsVRSwt8U0yMZm98ShR1ma9h2ymglrmJRARtrzidF
         zBrIBqSIUCUAUyDCxzk2TBEjW/r0oLz9tPbvv5zekjvcXW8cmvsyF7FrbYmAC+CVdw5j
         zlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313471; x=1705918271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFE4MaRUUDjQZfE2dmgya8wKXtM/DMaoZewAWiQUHuY=;
        b=Hl6h/H323F4sQDUTfOHZSVz1MJesJnwOZ/bMNApNxdby0tzoeHaQjL7BQuev6TtbZE
         HS4UKo41rvK/Dtbd6Kju11kZ/rsw+raVb/gU0hABMvzoljAX3KYTAm4V6+6gGBReHnPo
         PQCx3/KRMX26uZoiZV8FexxFFdzhgyGSSWgth0Yq19/JDDjxoVZp48V9QigI8pWZFUar
         Oa9sn7H0LK66YydUBblsdKct8dkamjq5czK96Zv+bUO0ShAXr2PkHe4LWiM4T4z31hAa
         qpqjXaAM3vZv58EtPh+lHyGBib8rB0cY84xxBb8JHy8iyCHGl6+DRRkoupfNrXJzLhcw
         3uJQ==
X-Gm-Message-State: AOJu0YxUsX78xdtQvdWQNzdVi780GEwNQY3cWZ9IXUbhgDJswvTChDpm
	ccImYJ86QP7vLqjltq+LygSWPHWPL66Ma0evujjl4MEqhHlvLQ==
X-Google-Smtp-Source: AGHT+IGwU6QEd/xe6D6PNl/zIoj9NPbivgiVZqhkEXmbNsIyplJguIzU6puQpGtsO9MGyB06M5Jzrg==
X-Received: by 2002:a05:6a00:ace:b0:6da:c623:f054 with SMTP id c14-20020a056a000ace00b006dac623f054mr7200673pfl.15.1705313471628;
        Mon, 15 Jan 2024 02:11:11 -0800 (PST)
Received: from localhost.localdomain ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id u5-20020aa78385000000b006d9b8572e77sm7348256pfm.120.2024.01.15.02.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 02:11:11 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 -next 1/3] cpuidle: RISC-V: Move few functions to arch/riscv
Date: Mon, 15 Jan 2024 15:40:54 +0530
Message-Id: <20240115101056.429471-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115101056.429471-1-sunilvl@ventanamicro.com>
References: <20240115101056.429471-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_021116_245402_4115D0B3 
X-CRM114-Status: GOOD (  16.36  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To support ACPI Low Power Idle (LPI), few functions are required which
are currently static functions in the DT based cpuidle driver. Hence,
move them under arch/riscv so that ACPI driver also can use them.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/suspend.h    |  3 ++
 arch/riscv/kernel/suspend.c         | 47 +++++++++++++++++++++++++++++
 drivers/cpuidle/cpuidle-riscv-sbi.c | 41 +------------------------
 3 files changed, 51 insertions(+), 40 deletions(-)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 02f87867389a..5c7df5ab7a16 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -55,4 +55,7 @@ int hibernate_resume_nonboot_cpu_disable(void);
 asmlinkage void hibernate_restore_image(unsigned long resume_satp, unsigned long satp_temp,
 					unsigned long cpu_resume);
 asmlinkage int hibernate_core_restore_code(void);
+bool is_sbi_hsm_supported(void);
+bool sbi_suspend_state_is_valid(u32 state);
+int sbi_suspend(u32 state);
 #endif
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 239509367e42..a3b2e7e16a98 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -128,4 +128,51 @@ static int __init sbi_system_suspend_init(void)
 }
 
 arch_initcall(sbi_system_suspend_init);
+
+static int sbi_suspend_finisher(unsigned long suspend_type,
+				unsigned long resume_addr,
+				unsigned long opaque)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND,
+			suspend_type, resume_addr, opaque, 0, 0, 0);
+
+	return (ret.error) ? sbi_err_map_linux_errno(ret.error) : 0;
+}
+
+int sbi_suspend(u32 state)
+{
+	if (state & SBI_HSM_SUSP_NON_RET_BIT)
+		return cpu_suspend(state, sbi_suspend_finisher);
+	else
+		return sbi_suspend_finisher(state, 0, 0);
+}
+
+bool sbi_suspend_state_is_valid(u32 state)
+{
+	if (state > SBI_HSM_SUSPEND_RET_DEFAULT &&
+	    state < SBI_HSM_SUSPEND_RET_PLATFORM)
+		return false;
+	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
+	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
+		return false;
+	return true;
+}
+
+bool is_sbi_hsm_supported(void)
+{
+	/*
+	 * The SBI HSM suspend function is only available when:
+	 * 1) SBI version is 0.3 or higher
+	 * 2) SBI HSM extension is available
+	 */
+	if (sbi_spec_version < sbi_mk_version(0, 3) ||
+	    !sbi_probe_extension(SBI_EXT_HSM)) {
+		pr_info("HSM suspend not available\n");
+		return false;
+	}
+
+	return true;
+}
 #endif /* CONFIG_RISCV_SBI */
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index e8094fc92491..a7f06242f67b 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -73,26 +73,6 @@ static inline bool sbi_is_domain_state_available(void)
 	return data->available;
 }
 
-static int sbi_suspend_finisher(unsigned long suspend_type,
-				unsigned long resume_addr,
-				unsigned long opaque)
-{
-	struct sbiret ret;
-
-	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND,
-			suspend_type, resume_addr, opaque, 0, 0, 0);
-
-	return (ret.error) ? sbi_err_map_linux_errno(ret.error) : 0;
-}
-
-static int sbi_suspend(u32 state)
-{
-	if (state & SBI_HSM_SUSP_NON_RET_BIT)
-		return cpu_suspend(state, sbi_suspend_finisher);
-	else
-		return sbi_suspend_finisher(state, 0, 0);
-}
-
 static __cpuidle int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
 					     struct cpuidle_driver *drv, int idx)
 {
@@ -206,17 +186,6 @@ static const struct of_device_id sbi_cpuidle_state_match[] = {
 	{ },
 };
 
-static bool sbi_suspend_state_is_valid(u32 state)
-{
-	if (state > SBI_HSM_SUSPEND_RET_DEFAULT &&
-	    state < SBI_HSM_SUSPEND_RET_PLATFORM)
-		return false;
-	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
-	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
-		return false;
-	return true;
-}
-
 static int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
 {
 	int err = of_property_read_u32(np, "riscv,sbi-suspend-param", state);
@@ -607,16 +576,8 @@ static int __init sbi_cpuidle_init(void)
 	int ret;
 	struct platform_device *pdev;
 
-	/*
-	 * The SBI HSM suspend function is only available when:
-	 * 1) SBI version is 0.3 or higher
-	 * 2) SBI HSM extension is available
-	 */
-	if ((sbi_spec_version < sbi_mk_version(0, 3)) ||
-	    !sbi_probe_extension(SBI_EXT_HSM)) {
-		pr_info("HSM suspend not available\n");
+	if (!is_sbi_hsm_supported())
 		return 0;
-	}
 
 	ret = platform_driver_register(&sbi_cpuidle_driver);
 	if (ret)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
