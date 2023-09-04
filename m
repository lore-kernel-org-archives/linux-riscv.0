Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA7AC71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+MQiA73DKyI6gq8wV69V2NXUxt5PkL6howGMMDdv2I=; b=fRqBaSHRgRwFAK
	6d78c7I6isIAs/IfsoqeeOv3DYa/AZnwscTXmpr4ERiqF1Ite5QAg/h5P2Gvf6yqMhF1/EVrRcm36
	OmrUlv6kKDszskCptjw5pUm6jPfIVppMFKmr99Ah/XwuG7cdZedEudAQ48aupqjEpVCPITmhmPXhh
	9GOm8PWlgxOzLXMLTmBwb0AebLEMqT2w+ZhUBSHp+J/CN1m+AJmJssVdUJ+moMJ8/tT7tKBzzmZMh
	WvJ6QyQkPKCCZ2B/BNnzP/nluYTQCBj7u8imi8YSTJFL4IRJivCCyVcQs7yEFso/qtWnb/NExOVl5
	7ZNPVKAtNSSsodkGMQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy7-004UUf-09;
	Mon, 04 Sep 2023 17:02:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy3-004UTM-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 17:02:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5256d74dab9so2250203a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 10:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693846945; x=1694451745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GomRqmNGuEDeReLi63/1CkM4sqbT6L1V9gvpuGBNAgo=;
        b=iXSd7OOI8TPzyN1g8+DIHFh/kXRBwv1c0K/wKmsPVcY4yGFL3gq9uwJhiFYiuF/H4M
         XKc6aonQKMPTyWzNFRE1fLjzGLsfEhh+jS4ruJSdbX0xv42JLx0zXFm2S1hxKOXnqftg
         ti+nSPoZP2qbxFoUi8Dw2gk0PVFcrU9kdG1JtOQVKEjd0tX6DUSrDCN/Oscgu8fUWnw6
         fQb/+1xcd+x5su6vQAoyHqw1RuOIZ8woH6SySJyXXrnmhUni9he2psnZo5k1o35QyVr3
         jCAr03RxLnEoXjImtpFlRFqH982DDo9zzvuSz7SCNkqrAkhEh0AgnN2+kDV1efe0Gly9
         1/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846945; x=1694451745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GomRqmNGuEDeReLi63/1CkM4sqbT6L1V9gvpuGBNAgo=;
        b=eRQOQnVpkeQrQmIfHzXHu14a8/wnCGbThOZX95XR1ivX4FVkEgYV+Q25YH/M+/2zDR
         8Uk9Nq5AD4Fsfd9C0a2qTCQ+Dp8uf+I00+VFKu+4HmJi/EXR0HaI0XU2z+OeIV5TiCwl
         R+Zw2FMVZLT6Tz4QoT40VKnxCoNYZeGCoFomvmZuRbn5ZZGOyIMNzdvJV/QZezABDzie
         7uoAujQJ0iW+R3nVhKOAgJ9FPc6JPYyL2t5Ko7iRpM66EsuUcwWA8YLU0HC37NEjmkM+
         H0v2qz2fpRbxdXtTJ2VakopHBL/751NbG+7tBv4ZMsxeRHy1cZ/xRg04QzLr49oGXgII
         ANGQ==
X-Gm-Message-State: AOJu0YybjQy6+8acYrrRWl4kMvtFgDw1XcKalHFsFEYRPzcQSHSlRHWE
	iYFlWrotGcsTndGiz1FkkVeKd4uAo8kw9D6fupgJQw==
X-Google-Smtp-Source: AGHT+IEBbKBeXDleljZScumlQ2xXJrc9dpSG3/Oy8YCskShW4xyjCRmR242ikl2xVLhUqv0V6REdXA==
X-Received: by 2002:a17:907:7750:b0:9a1:f4e8:87b9 with SMTP id kx16-20020a170907775000b009a1f4e887b9mr8130178ejc.45.1693846944938;
        Mon, 04 Sep 2023 10:02:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j26-20020a1709064b5a00b00988be3c1d87sm6443692ejv.116.2023.09.04.10.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 10:02:24 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 2/6] RISC-V: Enable cbo.zero in usermode
Date: Mon,  4 Sep 2023 19:02:23 +0200
Message-ID: <20230904170220.167816-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904170220.167816-8-ajones@ventanamicro.com>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_100227_830830_AC5B84B3 
X-CRM114-Status: GOOD (  18.17  )
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
index 32c2e1eb71bd..7b796f5f7dad 100644
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
@@ -313,10 +314,13 @@ void __init setup_arch(char **cmdline_p)
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
