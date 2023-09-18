Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E365DCD13D2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 13:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ts0mGMLfB1EX4WQwlfTwXeucDUHFthWUeQ/RM04lAPc=; b=jJlKQu+reThWIT
	iHwke5kZIcknxqfxL9Kx0IERH00M5ixHrgLbbNb3obB4HEkp0eqJmnwSkniIWE37rmMEe+as+M2S8
	Zc8hrHr1Xd9qEPLEmcYJAA+HEAAtp2fSwXv8eBFrfByljzDmP47ClVx4cVLyKNF6wOvf2JkFKT5lR
	Jm8uW9ObmVTl5d02v3Qeff+85nn22m83HwiN1ezKLJNhf0HIRLsKWLRbcW09wqkUFwORt7TgjR1gk
	n3vqUllc4yufE46gJ5fKas4s48p2kGgzUU/Dj3+RZeZXaa9W8IdaNpmnrwjAsZO4U/IsfG79bZ3F0
	aV6riVuoJWCEIjZJCZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE63-00FVkY-1N;
	Mon, 18 Sep 2023 13:15:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE60-00FVin-13
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 13:15:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52a39a1c4d5so5527302a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695042922; x=1695647722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsZRtUh4qk088++R7VgYrPCijHAh8P5AlGmexFz8Gz0=;
        b=pCFzSewnH6+uwv+TdDGgUHI8jBiXUHp12vPFiKPk2GIQBQ8VCCRID8fqms2XZmWKN7
         LHA7k3dtbE/bffXoFsPPGlysIx/g5rYiJ/2pfSxafQzWRgF9XDMrLxaOxaUHpX2i1Ppn
         2cdscqQS0i0MpmxsnmJwtA/CiTGUUeOEBTMXGuFI3ucMhBmBpJUMci3c6eUShBLnoEEM
         nOsL3ETL9JJrDcw30RCkb54IITqNd8qTLyaCsk7gao6w+7sqOVDjMMlXLB/OotyXUYcC
         qA+rLPY3tQ0N7y81G3fyWbgtPjFcNBEiZMCxxqy7MJ5P1ybcEsu6X/a1jHUxg5H/kY6R
         qj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695042922; x=1695647722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsZRtUh4qk088++R7VgYrPCijHAh8P5AlGmexFz8Gz0=;
        b=YO07zNCT19AAWWusR38KjW1nn8YOlRbKMi/Zq5cM8n1W6HydZ1aaIx6mN0d3x/HcQK
         gJnoWiWHv8u+carVND/zJjE9smmuzpxs1q7NCyDWjre+lGNCG6OoA1OUH6LaHIXBvm5A
         zlTzEew15PwhIBp2awC4jUQyNhdnlQp6nA7w46K2WciOw0TwcqVVLoViCPcOPQ/PBjgW
         uRYOtjZaJBwCrOS+YTWg3MqgqzsTkQeC1rQ3t+Re6HdXZokEBqV9Ga8RG6dPetQOVNA9
         ecYjQC9tms+un5GzuCvnnoNOdIKu+GDLf4vwPlx0/zdnHsPvVNObUypHYqADmi8bwNZN
         Ikmg==
X-Gm-Message-State: AOJu0YxceF3DPLizSwkxS0YKQg6BL7aeXpLSxPZjRgfzQ5w7O1BPh1AV
	TZvR5HKxZJpudUlmiwXhcKolTCZUVBod8FNmMQc=
X-Google-Smtp-Source: AGHT+IGTOyYt8EnsnV3VrcUK6joTXivzwJiosKKxznTsBnIxAkPoolWauImqqEBZ1A55QpwTFXOCJQ==
X-Received: by 2002:a05:6402:2c2:b0:530:8801:47aa with SMTP id b2-20020a05640202c200b00530880147aamr7832625edx.19.1695042922474;
        Mon, 18 Sep 2023 06:15:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v15-20020a056402348f00b005308a170845sm4604794edc.29.2023.09.18.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 06:15:22 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	xiao.w.wang@intel.com
Subject: [PATCH v4 2/6] RISC-V: Enable cbo.zero in usermode
Date: Mon, 18 Sep 2023 15:15:21 +0200
Message-ID: <20230918131518.56803-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918131518.56803-8-ajones@ventanamicro.com>
References: <20230918131518.56803-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061524_367781_7447A20F 
X-CRM114-Status: GOOD (  17.61  )
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

This patch also introduces riscv_cpu_has_extension_[un]likely()
functions to check a specific hart's ISA bitmap for extensions.
Prior to checking the specific hart's bitmap in these functions
we try the bitmap which represents the LCD of extensions, but only
when we know it will use its optimized, alternatives path by gating
its call on CONFIG_RISCV_ALTERNATIVE. When alternatives are used, the
compiler ensures that the invocation of the LCD search becomes a
constant true or false. When it's true, even the new functions will
completely vanish from their callsites. OTOH, when the LCD check is
false, we need to do a search of the hart's ISA bitmap. Had we also
checked the LCD bitmap without the use of alternatives, then we would
have ended up with two bitmap searches instead of one.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cpufeature.h |  1 +
 arch/riscv/include/asm/csr.h        |  1 +
 arch/riscv/include/asm/hwcap.h      | 16 ++++++++++++++++
 arch/riscv/kernel/cpufeature.c      |  6 ++++++
 arch/riscv/kernel/setup.c           |  4 ++++
 arch/riscv/kernel/smpboot.c         |  4 ++++
 6 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index d0345bd659c9..13b7d35648a9 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,5 +31,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
 void check_unaligned_access(int cpu);
+void riscv_user_isa_enable(void);
 
 #endif
diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 777cb8299551..5fba25db82d2 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -275,6 +275,7 @@
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
 #define CSR_SCOUNTEREN		0x106
+#define CSR_SENVCFG		0x10a
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b7b58258f6c7..31774bcdf1c6 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -70,6 +70,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/jump_label.h>
+#include <asm/cpufeature.h>
 
 unsigned long riscv_get_elf_hwcap(void);
 
@@ -137,6 +138,21 @@ riscv_has_extension_unlikely(const unsigned long ext)
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
index f9ac2717bc7d..8ad6da03ee34 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -653,6 +653,12 @@ static int check_unaligned_access_boot_cpu(void)
 
 arch_initcall(check_unaligned_access_boot_cpu);
 
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
index e600aab116a4..8fd6c02353d4 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -26,6 +26,7 @@
 #include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
 #include <asm/pgtable.h>
@@ -314,10 +315,13 @@ void __init setup_arch(char **cmdline_p)
 	riscv_fill_hwcap();
 	init_rt_signal_env();
 	apply_boot_alternatives();
+
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
 		riscv_noncoherent_supported();
 	riscv_set_dma_cache_alignment();
+
+	riscv_user_isa_enable();
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 1b8da4e40a4d..d1b0a6fc3adf 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -25,6 +25,8 @@
 #include <linux/of.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
+
+#include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
 #include <asm/cpufeature.h>
 #include <asm/irq.h>
@@ -253,6 +255,8 @@ asmlinkage __visible void smp_callin(void)
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
