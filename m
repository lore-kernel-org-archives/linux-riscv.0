Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14651C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 00:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MF8c1Tr1XRAa125DNgG9ayfuvJJR/tjpvF73NWiHPHM=; b=0aP/ycbZFk8hy8
	dSDQimijf6Jr4kVNaxeOJY2r+pvhivzprShTq5yhPSftB/Jh6YzSBl6Bk2qCHr24CtrK/WsJEyRKm
	+GBA8M2HwBelB1XrbbG4g7zh8clmLKa+yCI4gNui8TPxXljaYrpF/88ndJTQnzLz96tSuIHIN0i+t
	XGmyj26ZOaZqhanSOUNZVziU9iuUV0QvULXsmOexOalQKp9rUWHR2UbEfxIiBwjCaoEV9sdOzp2Eq
	1U8ycUBfK+puhsrI7V+GsKjWdzq3TFi5RnMnBwDVjC3zD0Kaym68Xy+fGUOtLD/wb+AjDl91IfRoj
	VvN8ZHibfNtIMPZ2F9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtIoC-00HIRF-Pl; Sat, 04 Dec 2021 00:21:44 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtInS-00HHqU-Np
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 00:21:01 +0000
Received: by mail-pg1-x531.google.com with SMTP id m15so4594203pgu.11
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 16:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=swEa7qpsajKgCxZA2Su/bxF+YJ1+Y66ngqAKD6+8Oxg=;
 b=SrtcEbUMfX6BFvl81Eh55+QTf17GQ6EYAeE50Tk/U6AT8/ZgolQh+RPi/9hAZWdMOo
 u9IZmUkU6hRuKuayvzcC8h1YJsBSSJwl6gSS7F/nVt+uMToCdKO9mKy2WmL2Ybp4eLK6
 VL7+ehzveDnbiavTshyhEPxFN2cjLDDBuLytc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=swEa7qpsajKgCxZA2Su/bxF+YJ1+Y66ngqAKD6+8Oxg=;
 b=kw/Hwz1A99BDUziICb8/KvT/X6SHbeB1CqEEwEyuWrIILGN3j+zCNnC8O/+5AO/HNA
 DZC5OvxZ6Fbi/K/APHIH6G7z0FKdoB7nxj3XH7AKngzDjqop7mMoVqkqWeJnQ6ochCUZ
 jQH2neOhDfV2JXZ9vvhxSlr/cyZIKli0fcFgRbIt5kA4McKwJ6+OoMoiQg92wz+J3V+R
 O0JhhcyqpOlvmQbcKFAh+JYhqn6SQdnsXyS8C0upPiv4TU9QwZBAf31Me0tXdzq9S1VN
 +l1Whop7scLGULfykkd9+uFjcZC0wNx6eKOBAXBhnIRTUIHfSIuUUANKUulz0VDCsZ3s
 G/tw==
X-Gm-Message-State: AOAM530rrK51DhqPl1baRaEzMEm05u9U9v0gswybURQ2ASOzS/dmk7kL
 NbgFt3BnyWjjnLQOD7tkegYZ
X-Google-Smtp-Source: ABdhPJwXiSVwtEhpX0ysW2nZnO0HD4Yyb2I+Rg7C1DXlmoOIB3WGxPueCJOvkBqTsSI44xhQtL9tlg==
X-Received: by 2002:a63:2cd1:: with SMTP id s200mr6991174pgs.489.1638577257563; 
 Fri, 03 Dec 2021 16:20:57 -0800 (PST)
Received: from fedora.ba.rivosinc.com
 (99-13-229-45.lightspeed.snjsca.sbcglobal.net. [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id r6sm3272402pjg.21.2021.12.03.16.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 16:20:57 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pekka Enberg <penberg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [RFC 5/6] RISC-V: Move spinwait booting method to its own config
Date: Fri,  3 Dec 2021 16:20:37 -0800
Message-Id: <20211204002038.113653-6-atishp@atishpatra.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204002038.113653-1-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_162058_852253_94D37318 
X-CRM114-Status: GOOD (  14.77  )
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

From: Atish Patra <atishp@rivosinc.com>

The spinwait booting method should only be used for platforms with older
firmware without SBI HSM extension or M-mode firmware because spinwait
method can't support cpu hotplug, kexec or sparse hartid. It is better
to move the entire spinwait implementation to its own config which can
be disabled if required. It is enabled by default to maintain backward
compatibility and M-mode Linux.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kconfig          | 14 ++++++++++++++
 arch/riscv/kernel/Makefile  |  3 ++-
 arch/riscv/kernel/cpu_ops.c |  8 ++++++++
 arch/riscv/kernel/head.S    |  6 +++---
 arch/riscv/kernel/head.h    |  2 ++
 5 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 821252b65f89..4afb42d5707d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -403,6 +403,20 @@ config RISCV_SBI_V01
 	  This config allows kernel to use SBI v0.1 APIs. This will be
 	  deprecated in future once legacy M-mode software are no longer in use.
 
+config RISCV_BOOT_SPINWAIT
+	bool "Spinwait booting method"
+	depends on SMP
+	default y
+	help
+	  This enables support for booting Linux via spinwait method. In the
+	  spinwait method, all cores randomly jump to Linux. One of the core
+	  gets chosen via lottery and all other keeps spinning on a percpu
+	  variable. This method can not support cpu hotplug and sparse hartid
+	  scheme. It should be only enabled for M-mode Linux or platforms relying
+	  on older firmware without SBI HSM extension. All other platform should
+	  rely on ordered booing via SBI HSM extension which gets chosen
+          dynamically at runtime if the firmware supports it.
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
index 9f16bfe9307e..4a694e15b95b 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -259,7 +259,7 @@ pmp_done:
 	li t0, SR_FS
 	csrc CSR_STATUS, t0
 
-#ifdef CONFIG_SMP
+#ifdef CONFIG_RISCV_BOOT_SPINWAIT
 	li t0, CONFIG_NR_CPUS
 	blt a0, t0, .Lgood_cores
 	tail .Lsecondary_park
@@ -285,7 +285,7 @@ pmp_done:
 	beq t0, t1, .Lsecondary_start
 
 #endif /* CONFIG_XIP */
-#endif /* CONFIG_SMP */
+#endif /* CONFIG_RISCV_BOOT_SPINWAIT */
 
 #ifdef CONFIG_XIP_KERNEL
 	la sp, _end + THREAD_SIZE
@@ -344,7 +344,7 @@ clear_bss_done:
 	call soc_early_init
 	tail start_kernel
 
-#ifdef CONFIG_SMP
+#if defined(CONFIG_SMP) && defined(CONFIG_RISCV_BOOT_SPINWAIT)
 .Lsecondary_start:
 	/* Set trap vector to spin forever to help debug */
 	la a3, .Lsecondary_park
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
