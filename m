Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8ADC83F18
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khUQkC1hu6/bUPk6SR7w10HSs+B9LaIbsBjYHqPRuxk=; b=RvghFZdsRRHcFX
	L3soO9sw2wY0rm6kR/qgNq0Nf9GrS+8RvmGkp3UGnQEVn4H0owPa2gB8Hnt9UFm1BF81wwVp15DF6
	Tr3SHuUluF+qcQOiEK+lX3IQ2ccaUnFl0ZvV6NL08+as9lRAiDSV/PkRud0FBcJxRHhc1E/mQFoup
	Ufc+x6n3OD17+Ql4ErLuQ9eMQLxtUSn3hzco8p+YHfU6Qf7VaV4s7NLbwrsHXuwxTtYNRdmvsK9L8
	4Xij2G7HGNVciAdVh/jobQw0zW5or5ymHx4wuy2vPRMgyK2V2JNDscSxseb/2ycDmDRab64Dwbk0P
	yUbzK6Qm2lq3+UyS7Hcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOL-00DsXM-0f;
	Wed, 30 Aug 2023 16:50:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOG-00DsVQ-1l
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:50:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31c73c21113so5156124f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693414199; x=1694018999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N3ruhim6r/BO/zy6HkOkDR76NAdcbWyIoV4JSW1jnI=;
        b=X4H1RFhAsoyJBuH9eaSDCX4RCZoAaQT6nt36FWjkB+jAD74E+E7SpL7nb0maTlKZ+U
         E66Ywfr857g1EEc0uJBFKj8YKhsmV9uImGH7jVm06S0v3TzmiG3BlcomgBlWOpnVa8Sf
         h1OPu+cl+07QrZorC3/OHvMARAWQGD4bEpndtczP2hvfkZXDMRU5t4xfZfREZG789Juq
         7ALcjc5uLClbChxrd33pl84OUR2WzIObRK/ciV3+4njFHJJBrXsKHq5Sg8f5ClxGdYaB
         Hjy4uH8CjgTcvNJrYDjOE4xM4iSaDMfRw0CQIASBNW7WSMFdgtadft0htJBhqsH4g77p
         krGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414199; x=1694018999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N3ruhim6r/BO/zy6HkOkDR76NAdcbWyIoV4JSW1jnI=;
        b=ULysB9EHZQpVJ73igsgwbgAaUOiIs0RNk1yz7t2ZHnkpvdwe04HtuCDuERPPAokoDY
         RWqAMuvTRqDdIWpdSqgLprygtO4zpltSVrYDB1NR6p+Ri1ZZcBZ66KOc4ZV1QCvX5fUr
         yeyKNMB/ufxaB3J0A/QMBpl0RQTICRfF6GqefPGlMrRwDn0He1GHzUkQGLBaLezF9aR5
         iDi6RRYiG9KMUIv6i11PLSdn8uHNZGJd+BonPgw42QVS01qbEDdbqoV7YZ+jl4RZCbPH
         WyAwILIiLTJGO0CxOqHpVzuL0uj728S4tMWwskGbzensvHcjc/TS5Xl7aC+O2gRXv19t
         D9XQ==
X-Gm-Message-State: AOJu0YxYfHrGGjtJQlb9SFQ0N+K4hXt92vWWKa9nY31AkXlQHH0NljPH
	ayfwKWoPemNHtGhjoCM8tneRcl0Man23EeJc+6UO2A==
X-Google-Smtp-Source: AGHT+IHoQd+VoJSFj7uZHGuunum+RENg/E87YxvQ9251pYTkVWu8WqcNDECuii3CtqiH+jcrj1RN5w==
X-Received: by 2002:adf:f3cd:0:b0:31c:8257:2c78 with SMTP id g13-20020adff3cd000000b0031c82572c78mr1918437wrp.52.1693414198849;
        Wed, 30 Aug 2023 09:49:58 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a12-20020adfe5cc000000b0030ada01ca78sm17147931wrn.10.2023.08.30.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:49:58 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 2/6] RISC-V: Enable cbo.zero in usermode
Date: Wed, 30 Aug 2023 18:49:57 +0200
Message-ID: <20230830164954.91987-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830164954.91987-8-ajones@ventanamicro.com>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_095000_584994_D656F84F 
X-CRM114-Status: GOOD (  12.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When Zicboz is present, enable its instruction (cbo.zero) in
usermode by setting its respective senvcfg bit. We don't bother
trying to set this bit per-task, which would also require an
interface for tasks to request enabling and/or disabling. Instead,
permanently set the bit for each hart which has the extension when
bringing it online.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/include/asm/csr.h        |  1 +
 arch/riscv/include/asm/hwcap.h      | 16 ++++++++++++++++
 arch/riscv/kernel/cpufeature.c      |  6 ++++++
 arch/riscv/kernel/setup.c           |  4 ++++
 arch/riscv/kernel/smpboot.c         |  4 ++++
 6 files changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 23fed53b8815..788fd575c21a 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -30,4 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+void riscv_user_isa_enable(void);
+
 #endif
diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 7bac43a3176e..e187e76e3df4 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -273,6 +273,7 @@
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
 #define CSR_SCOUNTEREN		0x106
+#define CSR_SENVCFG		0x10a
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f041bfa7f6a0..66178dbd0045 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -66,6 +66,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/jump_label.h>
+#include <asm/cpufeature.h>
 
 unsigned long riscv_get_elf_hwcap(void);
 
@@ -130,6 +131,21 @@ riscv_has_extension_unlikely(const unsigned long ext)
 	return true;
 }
 
+static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
+		return true;
+
+	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+}
+
+static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
+		return true;
+
+	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+}
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 31843e9cc80c..a33cf7c89d9e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -391,6 +391,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
+void riscv_user_isa_enable(void)
+{
+	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
+		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
+}
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 971fe776e2f8..2f053f0763a1 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -25,6 +25,7 @@
 #include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
 #include <asm/pgtable.h>
@@ -308,9 +309,12 @@ void __init setup_arch(char **cmdline_p)
 	riscv_fill_hwcap();
 	init_rt_signal_env();
 	apply_boot_alternatives();
+
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
 		riscv_noncoherent_supported();
+
+	riscv_user_isa_enable();
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f4d6acb38dd0..502b04abda0b 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -25,6 +25,8 @@
 #include <linux/of.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
+
+#include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
@@ -252,6 +254,8 @@ asmlinkage __visible void smp_callin(void)
 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
 	}
 
+	riscv_user_isa_enable();
+
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
 	 * a local TLB flush right now just in case.
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
