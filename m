Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D2C04A94
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIrD5vy2oZQmHVprP52dh7v3+IvuE3XTHWO65rhhmhY=; b=AMPhDD9/OPL8MG
	HrxobVE5ozovsiFe8zkXV14IBLgz7UnS8RmCwExuePo41kPTVrOqdKSFujjk/eb0YiqCrV7PqOe0e
	EhZlIR1YSYhpTT1xWqO2OJ7vK6dKXXezGBjR/ymY37Mib1sO1V0pqiNGgRZZqginiMPLFD7ljzgZG
	t5eaAX/L7bpRfTw5q6IdZK7AwbM4hu4JqDYlJsZ8o3YLsI9cNlBFTadAdWdlacmPHkga+IHWu1Gjw
	L/jYfPzY5mvzPZbL1/9Mwfw0Z+/fDsYPLOMXJf1CF2nHwImZe7CLfOQ8hpKhY30mxggM3hzCii2Pf
	LJY7pD2By6rXr3+wfZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmh-004pbT-0W;
	Wed, 09 Aug 2023 11:55:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmc-004pYM-1c
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:55:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-522ab557632so8988940a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691582120; x=1692186920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q86/J9ygU9Mygo4dhyh+BR9pTnBKbpoD6ByYiXk+KKs=;
        b=bphwVPRdkvuicuO22fjlSimOIYV7U4HOsL0h8ORZG8lvDXeG8OrnsGmSzTq0XEDdEZ
         eYc63t5fb30OG9wwkw0ZVNxoUE5nRpwRjzzxRIBwfguwkP6YpJHc2YUyBrysbf63hbBf
         o/oTkb9RP9ghVnau9iNgwQs8Zc0BJTKGCia5gPPHXTyOWo8nLD0h2vEA1o2QOKKgLjMk
         V+3GPR3fJGu3LyifgA00jZsRZkjcrr3P7JLo+kqNkyhFlEIsyQZz15ZpaDaJC3qH4ETl
         PIU2PNcXny+CfBP0hTL98V9nQfOk08P4L2oh0d5R3Cj83HmZL0GU+ro8TKZ2FViFi8T3
         dXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582120; x=1692186920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q86/J9ygU9Mygo4dhyh+BR9pTnBKbpoD6ByYiXk+KKs=;
        b=R79Xx9Jbm+zEgDRZQlfOfztQ4MjxSaR7cKIiVnuSXOee1lQMJQO279lJM81BPx31O4
         L8MZ4Xsf0E0OQlNlhKcGulxd9XFQbD5888BMZRTmP2tXvpIZ1cg1wAmFD5TLWX3B9P2e
         gxM8ZiSzt9/4zOYgBKM8vkLlvW7EKU7jNYICEgJzFCpVk2lkoBSFhruyW1Got9VxPDSD
         UTKl1C5tPt1ZkJNEENWuxH0zKCyrrMpK6r7YQmyzYUfNBzg/7EtVkAlOtpvAAnJEBslv
         KBNaUz5qocQpSUjbYHY9KlA6Rw+zYZk3GhxwTOzgaLQd6qwXkqxt50PHB7963zKVYGkS
         siOw==
X-Gm-Message-State: AOJu0YzAKh0+V6KtLfEIu3bdD7/Mcdby4yEne2nWz44+KQ+U+7N0mSea
	uncm1p0VfEQj9M70/Znt240lsI4p27KJFrE0mMdTBJ+m
X-Google-Smtp-Source: AGHT+IGPv9Uk1ve4XQWkbqHNrBDjjJg2mqO4TpJGIHOeRpY2dTefwbeuhdH6N530N7S20TnERt8uiQ==
X-Received: by 2002:a17:906:1c7:b0:997:c377:b41f with SMTP id 7-20020a17090601c700b00997c377b41fmr2149403ejj.64.1691582120259;
        Wed, 09 Aug 2023 04:55:20 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z5-20020a170906434500b00977cad140a8sm7886248ejm.218.2023.08.09.04.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:55:19 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
Date: Wed,  9 Aug 2023 13:55:19 +0200
Message-ID: <20230809115516.214537-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809115516.214537-8-ajones@ventanamicro.com>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_045522_542395_6195E9DD 
X-CRM114-Status: GOOD (  12.61  )
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
index f041bfa7f6a0..4929faecb75f 100644
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
 
+static __always_inline bool riscv_this_cpu_has_extension_likely(const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
+		return true;
+
+	return __riscv_isa_extension_available(hart_isa[smp_processor_id()].isa, ext);
+}
+
+static __always_inline bool riscv_this_cpu_has_extension_unlikely(const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
+		return true;
+
+	return __riscv_isa_extension_available(hart_isa[smp_processor_id()].isa, ext);
+}
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 31843e9cc80c..fc0bf300acc7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -391,6 +391,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
+void riscv_user_isa_enable(void)
+{
+	if (riscv_this_cpu_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
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
