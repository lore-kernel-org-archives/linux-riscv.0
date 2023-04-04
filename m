Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1188C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fElA7RkYaYH6OZCSXPIfo+JtW2v3w01Dux/Ty4OkgXc=; b=ATtDTqkOR6ac65
	JVtpoHd57/U6GysBFa2lk0inBV4+benejwQYRqN/UmbCg6tAun+T8afs6bB0xjoWNjXVRIu26z1U3
	KzjQqunVx1GeeOtXwmyy2OtIYIz4CYg9SKSMDzwFaEiUMOOoi4SbComctFVR4R4TYAluMU7ud/c6O
	J/b3ldqTQyT4KwVVsCLMhY+Bnf/0efhXiHnwc8J6i422vfNjDE4+zbSAaFgCFFhQ3oVuGII9WnGAv
	BWkKpFZ1UiLumI9rrv8C7G1rkn0ftaNKwdagZYMkZLvZ8LHH2i/brZk8sI7PT1JCvkNaWOZ33bPcx
	I9bNEKemhn+KbeD4wMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlHv-002U2G-0K;
	Tue, 04 Apr 2023 18:21:47 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlHt-002U1E-0B
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:21:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id x37so20211323pga.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK3yofAaBPCm3lmjxfNqOeEWtEi7+pbDB/M30NYTLb4=;
        b=JtyGYEmj3+3zXeCs5rBdEDlUNt6swvT2m0XrsA3IxnpAIAobJbh35p79poWYW0Y6DK
         /NatfbFv1zcZu5PtRqFFn7Bsw50dOsX/WRlTS4Oqgzyz+qtXNFGqVS6tgUfG6Givx9N2
         In/h+M3U6bNqy0rDKS7kJWHaCI5EgCPUJNoXaIZ+nQXKmfIoVE/uQZXVwLXSHJ2+wPSL
         sTJBuz6w8MHN0b+gl3Jp/kbsanaFYKHbb2MfHz4Hz/y/V++YkTeXD74E3tw48NW9w1gJ
         PSRM3VIJgLuJlkFRrz3GJC+HXFj0K9F/uZhGuFYR1Vkg91JK/xEqUbHtTgfzxNX2/ciU
         pUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK3yofAaBPCm3lmjxfNqOeEWtEi7+pbDB/M30NYTLb4=;
        b=nMUmpF7AJJGW5/bhY79881mVHBrlFCiOLaJLZvRmHjylWe1TidKY0YFY3yy3+3vHYB
         YuAXufOMg18likXMfQh3w3ppYm5bfrtoAfNClPEzh1K799xgXjcKt5Nt6gPVBhSVbjV1
         JguSy5pGs/ppKg6jtLVKz50Ox/ApDNo7eXYoFKTjlhR66nIeWSZSa2JEc1yzhEkeEXyu
         fbycsG5OX0nwf/LQN7hcfyqqPtKxMG/MZnrKyxvbh8Z1eh5JJRhMHaUKBSP2ZUfDgyZO
         Aa5KUgrXr8coX8kTFdaRIKStxqLidFfJaIpmom/dA8JVMeRYKNjT4JeRFJcgMBTNElCj
         JTEg==
X-Gm-Message-State: AAQBX9efS2c0w34FH7CISpJLzb1a5RK87b3ITvKnM2zauYLA1tlnFlgZ
	hRlobfIDTs8v2l0UoaxABqzQwQ==
X-Google-Smtp-Source: AKy350Zq77XC/3ltqtm+S71XwJcX4T+QzSOKmhTEaeBoYJGiZG4Bnpd3gPBIhVtabyUTjk5IKAo18g==
X-Received: by 2002:aa7:9793:0:b0:626:658:c998 with SMTP id o19-20020aa79793000000b006260658c998mr3204222pfp.10.1680632502984;
        Tue, 04 Apr 2023 11:21:42 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC structure
Date: Tue,  4 Apr 2023 23:50:22 +0530
Message-Id: <20230404182037.863533-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112145_093157_0521CEEA 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
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
 arch/riscv/include/asm/acpi.h |  2 ++
 arch/riscv/kernel/acpi.c      | 60 +++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 9be52b6ffae1..1606dce8992e 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -59,6 +59,8 @@ static inline bool acpi_has_cpu_in_madt(void)
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
+u32 get_acpi_id_for_cpu(int cpu);
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 81d448c41714..40ab55309c70 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -24,6 +24,66 @@ EXPORT_SYMBOL(acpi_disabled);
 int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
+static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
+
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
+	 * CPUs more than NR_CPUS, will be ignored.
+	 */
+	if (cpuid >= 0 && cpuid < NR_CPUS)
+		cpu_madt_rintc[cpuid] = *rintc;
+
+	return 0;
+}
+
+static int acpi_init_rintc_array(void)
+{
+	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
+		return 0;
+
+	return -ENODEV;
+}
+
+/*
+ * Instead of parsing (and freeing) the ACPI table, cache
+ * the RINTC structures since they are frequently used
+ * like in  cpuinfo.
+ */
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	static bool rintc_init_done;
+
+	if (!rintc_init_done) {
+		if (acpi_init_rintc_array()) {
+			pr_err("No valid RINTC entries exist\n");
+			return NULL;
+		}
+
+		rintc_init_done = true;
+	}
+
+	return &cpu_madt_rintc[cpu];
+}
+
+u32 get_acpi_id_for_cpu(int cpu)
+{
+	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
+
+	BUG_ON(!rintc);
+
+	return rintc->uid;
+}
+
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
