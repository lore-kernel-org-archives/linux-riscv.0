Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD715C47DB1
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8P5os02ETILKBzVxeJjmZpm6Ylb1GkfBrgSynLw4iE=; b=Wd73R/Bp8HSark
	9mnYopvhDqGQui0GmAhvkjviRb/5dMRYfRfoMLfZZrswcn8Iq/YXCf+2V4B36udZ8IgOVsTZR5t1Q
	qy/ZN/1E64EuFf6n0/konUIqdzTnm453up6vnLgn5UAxWWr25Eskml9/m6PiS7i9mKGkf26+WZ4qM
	fk77aSP1aTHS8UncWpyP+E3nM88KN7+mP+zxjemAWqZbtOEva3wVE6KiqpFJEl0Y0fe5uswzjOGGh
	PBHL2UCxfL43QfGaUJjvtwBIhrIf4RZhuZ1y2k9FfMhjQkQVhcmXJn3C7TeAKPbjiJpVG8hUshb66
	ApFrTMZmdnvCdJiO5ppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLuQ-001nFR-12;
	Thu, 18 Jan 2024 06:29:50 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLuN-001nEw-0b
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 06:29:48 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36199ab6e68so1092225ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 22:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705559386; x=1706164186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVSbOzgJs1igIWqQu9lDLW42aL5tdwTQfAgqMSjQkJE=;
        b=isfwnz5urmCTJ3BfRM3ZF3bVc6kboT+6UJPzkVKLFpgN3oDYMN4NNHlmG1qpO1Vtxz
         jUNJwCaK04sxfG5I5UfSqBqDCO+8h+D8JeXqbtbJkxDDkYV0QB7Vs9RqlCd/Tn4o3M9w
         E28xUBjocoKbroaMulNGICMVXUQIEyJ13hqYlPeDJbt0Yc4cuHORllqAorcsntEOauuI
         //kBRvaBBoSoCYAXFkfslSfoJ3jUiH16iyM2tBxogVXBUGYhqrfBMQmgYTFkZ0E6Xel4
         ySSg8IldguxURJhEF8hbMuPvh88CEF1jCVQG84otR4boLUr0lRZUU2GQp7OTxhglxFpV
         37NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705559386; x=1706164186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVSbOzgJs1igIWqQu9lDLW42aL5tdwTQfAgqMSjQkJE=;
        b=aTMoJFrP0uzFjCY6ytOPfIUgd0sX7WG2kiJOSpbqrWo1yfxIc0pDaMdi4a3aRTjbF5
         p+d80UYGag2HVjCGxY7Pr6jNxHonrkFu5fSiOe0Wiw8edf29kTMkxRlqDAPVX80c+rDd
         X29zthhEE27TrLhmIvvmpGzOWgqlnStgdXBspXGnf4kpPKbxtUAO8flbYn2B8aZL/4yA
         ePpmGhMiBnDBCGbqVrjBQMpZMCB/J2VG34rF+RK9LfDeJG4BvGvUluSjBUS61wTYdaqC
         fJONXoofvStleG2eEmG0ENmvuRg/OfFgFjExF3886nouIwYntGHzvRH5xn92Tx9o9/ga
         jbKw==
X-Gm-Message-State: AOJu0YytHahJ/fiBRUOZZN2xcJSGImPg4CYDY/7LN0+3UxI2FF3hFVxk
	pW2vXVhxgDl5icDtfgvCZxDwGkoQFx5qfcP/s7InMbiBl26vpGHPV/rb3bP6ptM=
X-Google-Smtp-Source: AGHT+IHGQHjpLDXAypTn1Zx6QEntcYHv7EtMpW/QZNfiHZ98kua3F5Js0zUATDQyTIczTGIi34cWCA==
X-Received: by 2002:a05:6e02:18cc:b0:35d:6be7:55d9 with SMTP id s12-20020a056e0218cc00b0035d6be755d9mr1647457ilu.0.1705559386085;
        Wed, 17 Jan 2024 22:29:46 -0800 (PST)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id bn28-20020a056e02339c00b0035fec699584sm4663269ilb.13.2024.01.17.22.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 22:29:45 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 -next 1/3] cpuidle: RISC-V: Move few functions to arch/riscv
Date: Thu, 18 Jan 2024 11:59:28 +0530
Message-Id: <20240118062930.245937-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240118062930.245937-1-sunilvl@ventanamicro.com>
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_222947_225360_1AB7B46C 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To support ACPI Low Power Idle (LPI), few functions are required which
are currently static functions in the DT based cpuidle driver. Hence,
move them under arch/riscv so that ACPI driver also can use them. Since
they are no longer static functions, append "riscv_" prefix to the
function name.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/suspend.h    |  3 ++
 arch/riscv/kernel/suspend.c         | 49 +++++++++++++++++++++++++++++
 drivers/cpuidle/cpuidle-riscv-sbi.c | 49 +++--------------------------
 3 files changed, 57 insertions(+), 44 deletions(-)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 02f87867389a..076f8a9437cf 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -55,4 +55,7 @@ int hibernate_resume_nonboot_cpu_disable(void);
 asmlinkage void hibernate_restore_image(unsigned long resume_satp, unsigned long satp_temp,
 					unsigned long cpu_resume);
 asmlinkage int hibernate_core_restore_code(void);
+bool riscv_sbi_hsm_is_supported(void);
+bool riscv_sbi_suspend_state_is_valid(u32 state);
+int riscv_sbi_hart_suspend(u32 state);
 #endif
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 239509367e42..b20f2cb5879f 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -128,4 +128,53 @@ static int __init sbi_system_suspend_init(void)
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
+int riscv_sbi_hart_suspend(u32 state)
+{
+	if (state & SBI_HSM_SUSP_NON_RET_BIT)
+		return cpu_suspend(state, sbi_suspend_finisher);
+	else
+		return sbi_suspend_finisher(state, 0, 0);
+}
+
+bool riscv_sbi_suspend_state_is_valid(u32 state)
+{
+	if (state > SBI_HSM_SUSPEND_RET_DEFAULT &&
+	    state < SBI_HSM_SUSPEND_RET_PLATFORM)
+		return false;
+
+	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
+	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
+		return false;
+
+	return true;
+}
+
+bool riscv_sbi_hsm_is_supported(void)
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
index e8094fc92491..a6e123dfe394 100644
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
@@ -100,9 +80,9 @@ static __cpuidle int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
 	u32 state = states[idx];
 
 	if (state & SBI_HSM_SUSP_NON_RET_BIT)
-		return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, state);
+		return CPU_PM_CPU_IDLE_ENTER_PARAM(riscv_sbi_hart_suspend, idx, state);
 	else
-		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
+		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(riscv_sbi_hart_suspend,
 							     idx, state);
 }
 
@@ -133,7 +113,7 @@ static __cpuidle int __sbi_enter_domain_idle_state(struct cpuidle_device *dev,
 	else
 		state = states[idx];
 
-	ret = sbi_suspend(state) ? -1 : idx;
+	ret = riscv_sbi_hart_suspend(state) ? -1 : idx;
 
 	ct_cpuidle_exit();
 
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
@@ -226,7 +195,7 @@ static int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
 		return err;
 	}
 
-	if (!sbi_suspend_state_is_valid(*state)) {
+	if (!riscv_sbi_suspend_state_is_valid(*state)) {
 		pr_warn("Invalid SBI suspend state %#x\n", *state);
 		return -EINVAL;
 	}
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
+	if (!riscv_sbi_hsm_is_supported())
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
