Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301BCC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJwF/fSiRGMOvLgmCN11f1IFMjTDneZJRfiq17KVc9I=; b=z2dZaTPwM/d3OB
	rzGWBxfeN9mi6OIPatgfYRVKJEz/YjeIJLRfQ6eTB/JprKTAv0g7WYwZ3LV+RAMAS4oPgoNSM3NqB
	j8PyDOgx+hKW8NpYLgt2KQV71WWr59yMYfD+531inXwNB0GpANsjhfmx4mmGGqE246Mt6WyLz62/e
	8XQHdBtpnSyXacFVHr9GpcaGFWl5nEj+2MU5BZUFNvGSgXvtQeYS1FJzswpNTzrzep7B2/LzQkbmL
	P7m95aA816CdMRfKHNGkjLwp716pT1Hn7+2MSa42vv0KPa0fR5S7n7Bxpz/0qC7FAwqNT8OPKO+qZ
	h4hxbBBxNgczFLYrF06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrPG-00GmMX-21;
	Thu, 11 Jan 2024 09:31:22 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrPC-00GmJ5-2x
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 09:31:20 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6d9c2db82b0so2793499b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 01:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704965477; x=1705570277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUtZ/fl35OGrV0n4xrT7BhxLu5Q7HTfNcZ5vLHqEvsY=;
        b=jvsOKaW2rsU0Z+L2T33VphYlDgDyEVEoEYofJPiMMz1uEU7e//DpLAS9BiUkBVV2Cx
         K3yIHaxFMz6S7HjBGNIzU9sPlKBwxrO3WsGAK/oL1D2EVzxZvkwPi/ZSuT2KCCORVg37
         tiygikcmOOI2XV1bJQ2mdZAoKsiwnxNgPGHvTE8emDPVXGCDq2idcOyo6XtjUXuEnAnW
         /waKLF2ZonR2i+Erv+7TWiYBAFRujFFZMmyRteVJHqBUwZQadu48KwW380sCzCC/Nik5
         fdFYf7rGVPbIX8cGHH+BAop2yaOdNoUl089ziVAJPXsVGXgOJ8g2LY5ZwxjVzQmc0xi/
         +W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704965477; x=1705570277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUtZ/fl35OGrV0n4xrT7BhxLu5Q7HTfNcZ5vLHqEvsY=;
        b=VPetgwXd3Kh5t+rRi93W2DgoFPgDMrTHIsqBs6/mJhSWaTQ706XQdRRrSDinkNsuk4
         FFjqNDzD4m3ufINObEQJDmXyeTtZDgiv8RnbIi8T0CAXQZs22w3tWZdMzxljqh5Aemdj
         9IDr9bAcjbVIhTzxudEJLG4oj+1OR0G7z2aoIfgG08p7seSZo85XOLyPQTZlwSGYcDB2
         vYJKJgrSLwH/Gf7pGFdtMis0lJ8UdQN/cmJWu/Kke1BC+eUPMNzpXMsjnI55gqyYvzU5
         tNhrS5ChUM0ajqw5FmmozWltxzUR+RO+AGc3T4y7ifCK3bBHYshFFBg3TBs807z6Kpa6
         QEiA==
X-Gm-Message-State: AOJu0YyT8FuY6ZBhibxq2m2bm3xr0JDEaZxf+KCZAXbgXPhr99m1BMpJ
	t7JhWW9v2HCeBpe3M41FUh1MNQTNBg1KJg==
X-Google-Smtp-Source: AGHT+IF4264zzKBNpeub4VH/x1A2zu/MAt7+saMEpmuhHRaKZH8w152mN6eN2xwM9KYg/qXnJMYHcw==
X-Received: by 2002:a05:6a21:32aa:b0:19a:1719:8cd4 with SMTP id yt42-20020a056a2132aa00b0019a17198cd4mr595390pzb.107.1704965476861;
        Thu, 11 Jan 2024 01:31:16 -0800 (PST)
Received: from sunil-laptop.. ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id jd2-20020a170903260200b001d4a7cf0673sm730566plb.117.2024.01.11.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 01:31:16 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next 2/2] cpuidle: RISC-V: Add ACPI LPI support
Date: Thu, 11 Jan 2024 15:00:58 +0530
Message-Id: <20240111093058.121838-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240111093058.121838-1-sunilvl@ventanamicro.com>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_013118_954248_EF5AD177 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add required callbacks to support Low Power Idle (LPI) on ACPI based
RISC-V platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 78 +++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index e8094fc92491..cea67a54ab39 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -632,3 +632,81 @@ static int __init sbi_cpuidle_init(void)
 	return 0;
 }
 device_initcall(sbi_cpuidle_init);
+
+#ifdef CONFIG_ACPI_PROCESSOR_IDLE
+
+#include <linux/acpi.h>
+#include <acpi/processor.h>
+
+#define RISCV_FFH_LPI_TYPE_MASK		0x1000000000000000ULL
+#define RISCV_FFH_LPI_RSVD_MASK		0x0FFFFFFF00000000ULL
+
+static int acpi_cpu_init_idle(unsigned int cpu)
+{
+	int i;
+	struct acpi_lpi_state *lpi;
+	struct acpi_processor *pr = per_cpu(processors, cpu);
+
+	if (unlikely(!pr || !pr->flags.has_lpi))
+		return -EINVAL;
+
+	/*
+	 * The SBI HSM suspend function is only available when:
+	 * 1) SBI version is 0.3 or higher
+	 * 2) SBI HSM extension is available
+	 */
+	if (sbi_spec_version < sbi_mk_version(0, 3) ||
+	    !sbi_probe_extension(SBI_EXT_HSM)) {
+		pr_warn("HSM suspend not available\n");
+		return -EINVAL;
+	}
+
+	if (pr->power.count <= 1)
+		return -ENODEV;
+
+	for (i = 1; i < pr->power.count; i++) {
+		u32 state;
+
+		lpi = &pr->power.lpi_states[i];
+
+		/* Validate Entry Method as per FFH spec.
+		 * bits[63:60] should be 0x1
+		 * bits[59:32] should be 0x0
+		 * bits[31:0] represent a SBI power_state
+		 */
+		if (!(lpi->address & RISCV_FFH_LPI_TYPE_MASK) ||
+		    (lpi->address & RISCV_FFH_LPI_RSVD_MASK)) {
+			pr_warn("Invalid LPI entry method %#llx\n", lpi->address);
+			return -EINVAL;
+		}
+
+		state = lpi->address;
+		if (!sbi_suspend_state_is_valid(state)) {
+			pr_warn("Invalid SBI power state %#x\n", state);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int acpi_processor_ffh_lpi_probe(unsigned int cpu)
+{
+	return acpi_cpu_init_idle(cpu);
+}
+
+int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
+{
+	u32 state = lpi->address;
+
+	if (state & SBI_HSM_SUSP_NON_RET_BIT)
+		return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend,
+						   lpi->index,
+						   state);
+	else
+		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
+							     lpi->index,
+							     state);
+}
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
