Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ED9C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OMOGQweJuHkaCk0JF/knlThRpdS+4Z5JCVJPJjfDvM=; b=lma4UboUaPqJUU
	SZJVbvPqE3HhmSj2ZvLQE6JR5UBBz2PAcsvZQXDnjInYqeVMda6MNaSEcY9Aakyf2m63Yc/qDbGwX
	sq+4VKlhPFdkxagj2VmVwTJ0CkxEb8V1kFV5TU41TamIIG9uetBMdclgnxAt0ozbrlM9Ybz8uMXsL
	YYNEma8/kOFvkRWI5UlCsX0nZdHdQY4GL89EnTMm6fBZRaFW7UsCQIRc7euuADr7S6TrMQMejXwuu
	7SptM7zsZ6uy/c9NR7vEd8Pq4p6xOkvnPzGQ9/4/riNPULihopNfJyYEtmevP0AZJZbx0ediUXixR
	VLQH1w2E/6vkYkADZSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6X-000zzB-00;
	Mon, 15 May 2023 05:50:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6U-000zxM-2o
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:50:40 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1aae46e62e9so87324445ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129838; x=1686721838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v2bs5xTQyOuSGvIvmLXVuNSftw7ZeZMht4+ShyVipQ=;
        b=RmaB51MYWIpBQA9mV7M5FUd4YH/0UJaKlKCItuTXiTL5VeyNVqOvTaTWlOWnjARNp2
         LQ4dkHBB+AbxDs6LRKiAm9mhsP/s1fUelzbMpB0vY45D0FWIEdeNffHHtJRm3MfdYbXr
         EDe1K0YRtLY2d+yUk5W13m/bj+EkrGrW4KIuaH7q0koJQh2GacV+2HzlZBFCVGIsIGje
         1z7VIAXxRNhYX76BX2LRGp1g+qFEins09NK/j4rIQy0qMFwUrYeTKmgfgamGmZnE6YSp
         8Q+NNIpN6w9s/SMsvLqsbNn23he6cHTE6ip1X60ON/CcMxEaUiCabT2aEtA2Uk0wgN45
         mhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129838; x=1686721838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3v2bs5xTQyOuSGvIvmLXVuNSftw7ZeZMht4+ShyVipQ=;
        b=epAO49YNtG8TS63imMECcNCjZtLzSkU/0nzlyBAgjZ/Rk10rMq3giXjMWxUZ6KhA43
         crS6EiYmw0+f/Qq6IMXJnC9tgEddOQYAV1M+12HBkMwruvyIkHJDmF8s0ke56ZC/+9Ol
         RK/wcik97lwVVCVHn4c31VluVs7to7u3+0zuWqAr2S0C1JcYzAxSHJ4ia5iA9Oew3pH7
         vkl/aR0w5cxma4TAxV6YsJb+gvSWzMVztjneXhWVGnhv5skN6mqqKTiiQdsxLRmeq0t9
         nCDbJDJ+AQYQO7nOLHbZIIACEt3+VeGcvlzbBkQMePH+vRm0blEkbUW5bT2gZnn90NFd
         K6kQ==
X-Gm-Message-State: AC+VfDzbICrjBvm0DYITERvtaio5ao9i7c4vdzu9L9CEXQZTGClRx14n
	ZDB1KP0nrLMX+j5oFmMuQRZP9Q==
X-Google-Smtp-Source: ACHHUZ4FCJbXEF7jGJtfVFATqqrI7NRHNm2vMCppVSOYxho2mMsZFQvzi5wvH17RLX0iWlIACxrEWw==
X-Received: by 2002:a17:903:32c7:b0:1ac:820e:c348 with SMTP id i7-20020a17090332c700b001ac820ec348mr34619195plr.0.1684129837705;
        Sun, 14 May 2023 22:50:37 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:50:37 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 09/21] RISC-V: ACPI: Cache and retrieve the RINTC structure
Date: Mon, 15 May 2023 11:19:16 +0530
Message-Id: <20230515054928.2079268-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225038_908849_9F5D54AE 
X-CRM114-Status: GOOD (  17.52  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RINTC structures in the MADT provide mapping between the hartid
and the CPU. This is required many times even at run time like
cpuinfo. So, instead of parsing the ACPI table every time, cache
the RINTC structures and provide a function to get the correct
RINTC structure for a given cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/include/asm/acpi.h | 10 ++++++++
 arch/riscv/kernel/acpi.c      | 45 +++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |  4 ++++
 3 files changed, 59 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 9be52b6ffae1..6519529c8bdf 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -59,6 +59,16 @@ static inline bool acpi_has_cpu_in_madt(void)
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
+void acpi_init_rintc_map(void);
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
+u32 get_acpi_id_for_cpu(int cpu);
+#else
+static inline void acpi_init_rintc_map(void) { }
+static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 7c080c8cbccf..df5a45a2eb93 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -29,6 +29,8 @@ static bool param_acpi_off __initdata;
 static bool param_acpi_on __initdata;
 static bool param_acpi_force __initdata;
 
+static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
+
 static int __init parse_acpi(char *arg)
 {
 	if (!arg)
@@ -150,6 +152,49 @@ void __init acpi_boot_table_init(void)
 	}
 }
 
+static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
+{
+	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
+	int cpuid;
+
+	if (!(rintc->flags & ACPI_MADT_ENABLED))
+		return 0;
+
+	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
+	/*
+	 * When CONFIG_SMP is disabled, mapping won't be created for
+	 * all cpus.
+	 * CPUs more than num_possible_cpus, will be ignored.
+	 */
+	if (cpuid >= 0 && cpuid < num_possible_cpus())
+		cpu_madt_rintc[cpuid] = *rintc;
+
+	return 0;
+}
+
+/*
+ * Instead of parsing (and freeing) the ACPI table, cache
+ * the RINTC structures since they are frequently used
+ * like in  cpuinfo.
+ */
+void __init acpi_init_rintc_map(void)
+{
+	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) <= 0) {
+		pr_err("No valid RINTC entries exist\n");
+		BUG();
+	}
+}
+
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	return &cpu_madt_rintc[cpu];
+}
+
+u32 get_acpi_id_for_cpu(int cpu)
+{
+	return acpi_cpu_get_madt_rintc(cpu)->uid;
+}
+
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 45df7cc88b19..2ab4cdaa2e68 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -22,6 +22,7 @@
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
 
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
@@ -298,6 +299,9 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
+	if (!acpi_disabled)
+		acpi_init_rintc_map();
+
 	riscv_init_cbo_blocksizes();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
