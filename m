Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B752C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdRhFwP2OFkCoFbOFF53GgcUoM9yxfEeUUNU3IITAE8=; b=eV53rpP+EvRqbL
	AhTGE98IiRtgRyRDACmdd00hbdmODPMbWcLHj/Li5dxEqsmklm1Gj6A5zUGF42+GBxo1UxG9qxKF2
	+nd1XmFUcPt2wtRHjiWomvkDCi35U01+ttWOCWTfdtTGwlo1Lo/Y2pmjvv1bQJ8tPcphmO40x5pdp
	UPGWHriDC/X/dYCuKcAJiczSmFAwXGKjg4tHt6p2jxS35jIJN1FNYhbPsh2Ub+La4hlNrmdsOOjlT
	oXahvXzJ4KhT1HOGtGG+IGL2mBl+Fn5JX+humW8utX+l+EzYElMOHcBdDUsd2haWVJukkBpnBZR1P
	I5vKryR+AM1qA9Tegi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATSn-00A5qS-SP; Thu, 20 Jan 2022 09:10:37 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATSg-00A5it-Dy
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 09:10:32 +0000
Received: by mail-oi1-x22a.google.com with SMTP id s127so8468812oig.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 01:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sFwewVM58+2tq+yTNwly9EQyDBStKSfx5R0O8a2jQ1Y=;
 b=CzLpLAPB4NhqdBGuF7ECJtJDs1om9RXn+imZtcoHIsJCsFuqMI0guCM0jO/S5nSzl4
 xQNSyJnsf2Zmfqmef8aNSoRA1kevydclZCrfiGCDhqA4RLIc5KQ1Q5ny28tnRqYQ+3F+
 RkKUXenaqsmiHEJLkP2FlahKmfMdU3hL5KY8tZTKNWaLu1hCIUxym23oJPWs322nb3sO
 D1LrtyalvBKfxf16o6CdjOWWRlMHWWlFYOWbSpy3K566GO/WXHduzZk3bZ4tQmwNwLv/
 kSroO2Jzn4+bWnM1rJ4XcqHZahUfCUBXZL0uZJXjX375UuSCA+/RXjOJk1W7UY+3sTjy
 6tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sFwewVM58+2tq+yTNwly9EQyDBStKSfx5R0O8a2jQ1Y=;
 b=1QX0vYQJB5KMVw8XyZeAhLtjdvqeapuVyp5fbiR2r7egwczGKA/X3/v5TpCiLM459T
 TF4QkTUOZb6PHIONoRFx7l1UftxXm/K+pypp1623wrw38p53ZvSSiv4vH3q+Z0T4hATg
 QCb+l0O3o6DnBmYEF+ULt36TPWfcj2CSnotElqmPI6lImkhuYvEOcprDLIiesUlTWOSe
 RkgP/aG3VkcGfgkJeK2XeoNbIdKoe6yg0SIc0cqTklpidzxXzBOPI4cNRwcmdnz8D5eU
 QQubg3XwqVLBlmx2XV5Q9HLrG2kQ/6u/GzmRcHluKLFhu0fTVzwem7x/j8xYyYPgeTvd
 yOXg==
X-Gm-Message-State: AOAM531b0Nd84XffibqRAlOqmZ97iEwYwxUtMrEDjpnJCGgYRqPiGfDG
 cCYfr319oIKcasy1+r6WYk2n7Q==
X-Google-Smtp-Source: ABdhPJxVpNOMy8G3muQ6jQB1378rRqKKtah+ir1/4ZvgG/QYQBLAi4vSNC88qHQOuTvsGtX12RiNNA==
X-Received: by 2002:a05:6808:14ca:: with SMTP id
 f10mr6766500oiw.162.1642669829575; 
 Thu, 20 Jan 2022 01:10:29 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i12sm944766oot.25.2022.01.20.01.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 01:10:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 5/6] RISC-V: Move spinwait booting method to its own config
Date: Thu, 20 Jan 2022 01:09:17 -0800
Message-Id: <20220120090918.2646626-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120090918.2646626-1-atishp@rivosinc.com>
References: <20220120090918.2646626-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_011030_531173_BA154403 
X-CRM114-Status: GOOD (  14.95  )
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

The spinwait booting method should only be used for platforms with older
firmware without SBI HSM extension or M-mode firmware because spinwait
method can't support cpu hotplug, kexec or sparse hartid. It is better
to move the entire spinwait implementation to its own config which can
be disabled if required. It is enabled by default to maintain backward
compatibility and M-mode Linux.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kconfig          | 14 ++++++++++++++
 arch/riscv/kernel/Makefile  |  3 ++-
 arch/riscv/kernel/cpu_ops.c |  8 ++++++++
 arch/riscv/kernel/head.S    |  8 ++++----
 arch/riscv/kernel/head.h    |  2 ++
 5 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4602cfe92a20..61afe4f1ad1e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -404,6 +404,20 @@ config RISCV_SBI_V01
 	  This config allows kernel to use SBI v0.1 APIs. This will be
 	  deprecated in future once legacy M-mode software are no longer in use.
 
+config RISCV_BOOT_SPINWAIT
+	bool "Spinwait booting method"
+	depends on SMP
+	default y
+	help
+	  This enables support for booting Linux via spinwait method. In the
+	  spinwait method, all cores randomly jump to Linux. One of the cores
+	  gets chosen via lottery and all other keep spinning on a percpu
+	  variable. This method cannot support CPU hotplug and sparse hartid
+	  scheme. It should be only enabled for M-mode Linux or platforms relying
+	  on older firmware without SBI HSM extension. All other platforms should
+	  rely on ordered booting via SBI HSM extension which gets chosen
+	  dynamically at runtime if the firmware supports it.
+
 config KEXEC
 	bool "Kexec system call"
 	select KEXEC_CORE
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 3397ddac1a30..612556faa527 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -43,7 +43,8 @@ obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
-obj-$(CONFIG_SMP)		+= cpu_ops_spinwait.o
+
+obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
 obj-$(CONFIG_MODULES)		+= module.o
 obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
 
diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index c1e30f403c3b..170d07e57721 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -15,7 +15,15 @@
 const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
 
 extern const struct cpu_operations cpu_ops_sbi;
+#ifdef CONFIG_RISCV_BOOT_SPINWAIT
 extern const struct cpu_operations cpu_ops_spinwait;
+#else
+const struct cpu_operations cpu_ops_spinwait = {
+	.name		= "",
+	.cpu_prepare	= NULL,
+	.cpu_start	= NULL,
+};
+#endif
 
 void __init cpu_set_ops(int cpuid)
 {
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 824aaeb5b951..2dfeea56d5fe 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -258,7 +258,7 @@ pmp_done:
 	li t0, SR_FS
 	csrc CSR_STATUS, t0
 
-#ifdef CONFIG_SMP
+#ifdef CONFIG_RISCV_BOOT_SPINWAIT
 	li t0, CONFIG_NR_CPUS
 	blt a0, t0, .Lgood_cores
 	tail .Lsecondary_park
@@ -284,7 +284,7 @@ pmp_done:
 	beq t0, t1, .Lsecondary_start
 
 #endif /* CONFIG_XIP */
-#endif /* CONFIG_SMP */
+#endif /* CONFIG_RISCV_BOOT_SPINWAIT */
 
 #ifdef CONFIG_XIP_KERNEL
 	la sp, _end + THREAD_SIZE
@@ -343,7 +343,7 @@ clear_bss_done:
 	call soc_early_init
 	tail start_kernel
 
-#ifdef CONFIG_SMP
+#if CONFIG_RISCV_BOOT_SPINWAIT
 .Lsecondary_start:
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
@@ -370,7 +370,7 @@ clear_bss_done:
 	fence
 
 	tail .Lsecondary_start_common
-#endif
+#endif /* CONFIG_RISCV_BOOT_SPINWAIT */
 
 END(_start_kernel)
 
diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
index 5393cca77790..726731ada534 100644
--- a/arch/riscv/kernel/head.h
+++ b/arch/riscv/kernel/head.h
@@ -16,7 +16,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa);
 asmlinkage void __init __copy_data(void);
 #endif
 
+#ifdef CONFIG_RISCV_BOOT_SPINWAIT
 extern void *__cpu_spinwait_stack_pointer[];
 extern void *__cpu_spinwait_task_pointer[];
+#endif
 
 #endif /* __ASM_HEAD_H */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
