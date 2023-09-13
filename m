Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54C6EE01E4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxSZrJg7L93r7jDb4DUuOeRjr41h/mRplbRMry/+Pe8=; b=p2H+gd9DxNotTE
	Xzqkvu8fKQeyyrkgerjgBViXkPHgFpOw1HNpzT2E6l+5UGaQrCWe49bm1RBOa4Mp/UGtmo6V+LbKI
	Dl8YAcuNqRVZEsm7L4J55RouyX/oqf+mpYCNyNrsZMRK0/hfta5ws4QvLxeBjZdu+mw4MjpGMIWtd
	mb98rNuhwqKxGa+DXO/mdkxmDVIQK/7gJTdhsUF/ulLFXqQlLrRqsiY7ZkoHTjVfIGvkZlxVNcTYH
	MWVzNeO2dv9JUKMynfdgz9N/PgoGnDc+mCR/88xzcY+BYsxkpj/SQ+S04ZY3x+WXlhrhv5YANl8QX
	vgy9Q4swheErvwn62qog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgStT-006Kz6-0B;
	Wed, 13 Sep 2023 16:39:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgStJ-006Kqm-1T;
	Wed, 13 Sep 2023 16:39:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45A3FFEC;
	Wed, 13 Sep 2023 09:39:36 -0700 (PDT)
Received: from merodach.members.linode.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A8B83F5A1;
	Wed, 13 Sep 2023 09:38:57 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: x86@kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Russell King <linux@armlinux.org.uk>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com,
	justin.he@arm.com
Subject: [RFC PATCH v2 03/35] drivers: base: Allow parts of GENERIC_CPU_DEVICES to be overridden
Date: Wed, 13 Sep 2023 16:37:51 +0000
Message-Id: <20230913163823.7880-4-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093901_589107_F1E352FE 
X-CRM114-Status: GOOD (  14.69  )
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

Architectures often have extra per-cpu work that needs doing
before a CPU is registered, often to determine if a CPU is
hotpluggable.

To allow the ACPI architectures to use GENERIC_CPU_DEVICES, move
the cpu_register() call into arch_register_cpu(), which is made __weak
so architectures with extra work can override it.
This aligns with the way x86, ia64 and loongarch register hotplug CPUs
when they become present.

Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since RFC:
 * Dropped __init from x86/ia64 arch_register_cpu()
---
 arch/ia64/include/asm/cpu.h      |  1 -
 arch/ia64/kernel/topology.c      |  2 +-
 arch/loongarch/include/asm/cpu.h |  1 -
 arch/x86/include/asm/cpu.h       |  1 -
 arch/x86/kernel/topology.c       |  2 +-
 drivers/base/cpu.c               | 14 ++++++++++----
 include/linux/cpu.h              |  5 +++++
 7 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/ia64/include/asm/cpu.h b/arch/ia64/include/asm/cpu.h
index db125df9e088..a3e690e685e5 100644
--- a/arch/ia64/include/asm/cpu.h
+++ b/arch/ia64/include/asm/cpu.h
@@ -16,7 +16,6 @@ DECLARE_PER_CPU(struct ia64_cpu, cpu_devices);
 DECLARE_PER_CPU(int, cpu_state);
 
 #ifdef CONFIG_HOTPLUG_CPU
-extern int arch_register_cpu(int num);
 extern void arch_unregister_cpu(int);
 #endif
 
diff --git a/arch/ia64/kernel/topology.c b/arch/ia64/kernel/topology.c
index 94a848b06f15..741863a187a6 100644
--- a/arch/ia64/kernel/topology.c
+++ b/arch/ia64/kernel/topology.c
@@ -59,7 +59,7 @@ void __ref arch_unregister_cpu(int num)
 }
 EXPORT_SYMBOL(arch_unregister_cpu);
 #else
-static int __init arch_register_cpu(int num)
+int __init arch_register_cpu(int num)
 {
 	return register_cpu(&sysfs_cpus[num].cpu, num);
 }
diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
index 7afe8cbb844e..b8568e637420 100644
--- a/arch/loongarch/include/asm/cpu.h
+++ b/arch/loongarch/include/asm/cpu.h
@@ -130,7 +130,6 @@ enum cpu_type_enum {
 
 #if !defined(__ASSEMBLY__)
 #ifdef CONFIG_HOTPLUG_CPU
-int arch_register_cpu(int num);
 void arch_unregister_cpu(int cpu);
 #endif
 #endif /* ! __ASSEMBLY__ */
diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index 3a233ebff712..96dc4665e87d 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -28,7 +28,6 @@ struct x86_cpu {
 };
 
 #ifdef CONFIG_HOTPLUG_CPU
-extern int arch_register_cpu(int num);
 extern void arch_unregister_cpu(int);
 extern void soft_restart_cpu(void);
 #endif
diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
index ca004e2e4469..0bab03130033 100644
--- a/arch/x86/kernel/topology.c
+++ b/arch/x86/kernel/topology.c
@@ -54,7 +54,7 @@ void arch_unregister_cpu(int num)
 EXPORT_SYMBOL(arch_unregister_cpu);
 #else /* CONFIG_HOTPLUG_CPU */
 
-static int __init arch_register_cpu(int num)
+int __init arch_register_cpu(int num)
 {
 	return register_cpu(&per_cpu(cpu_devices, num).cpu, num);
 }
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 34b48f660b6b..579064fda97b 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -525,19 +525,25 @@ bool cpu_is_hotpluggable(unsigned int cpu)
 EXPORT_SYMBOL_GPL(cpu_is_hotpluggable);
 
 #ifdef CONFIG_GENERIC_CPU_DEVICES
-static DEFINE_PER_CPU(struct cpu, cpu_devices);
+DEFINE_PER_CPU(struct cpu, cpu_devices);
+
+int __weak arch_register_cpu(int cpu)
+{
+	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
+}
 #endif
 
 static void __init cpu_dev_register_generic(void)
 {
-#ifdef CONFIG_GENERIC_CPU_DEVICES
 	int i;
 
+	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
+		return;
+
 	for_each_present_cpu(i) {
-		if (register_cpu(&per_cpu(cpu_devices, i), i))
+		if (arch_register_cpu(i))
 			panic("Failed to register CPU device");
 	}
-#endif
 }
 
 #ifdef CONFIG_GENERIC_CPU_VULNERABILITIES
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 0abd60a7987b..a71691d7c2ca 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -80,12 +80,17 @@ extern __printf(4, 5)
 struct device *cpu_device_create(struct device *parent, void *drvdata,
 				 const struct attribute_group **groups,
 				 const char *fmt, ...);
+extern int arch_register_cpu(int cpu);
 #ifdef CONFIG_HOTPLUG_CPU
 extern void unregister_cpu(struct cpu *cpu);
 extern ssize_t arch_cpu_probe(const char *, size_t);
 extern ssize_t arch_cpu_release(const char *, size_t);
 #endif
 
+#ifdef CONFIG_GENERIC_CPU_DEVICES
+DECLARE_PER_CPU(struct cpu, cpu_devices);
+#endif
+
 /*
  * These states are not related to the core CPU hotplug mechanism. They are
  * used by various (sub)architectures to track internal state
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
