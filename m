Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AAAEE01E3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFti3FRuPIcnxx+3pyXEnZXoBV1CAz3dvX5E+hd+hUY=; b=fRPMXM9KCax/A4
	yT3FmFFgBT1Dw02Yf0PG0w+XO+MhWaEh9eoF+NeeKkgfmgkF6gz39QiUqARUXQ13htljqQmquin8h
	O/xucpM01JnbmSGpLnXr36JG5forqoy2v9LZRLmjispXsIFDNBGxiO5H5JP8mHU4xR3sLODnAD/uW
	eo2xjjmcnvUUdAXh+ydZr4XzCkif4G+KIL7aHMbBbpqZMzKWCoew3E1mwgIkz4Z4sIl9/KzI36nyz
	5nNjUxRJi8iBcoVu/NHudoUaBgqzkpr3rXuFPTdW01n0cLiyG3Fj/wleLl5rm4vltmE3mtQFu57TE
	C1/EnLDecVtyML8ilFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSvn-006NL6-1D;
	Wed, 13 Sep 2023 16:41:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgStx-006LEp-0u;
	Wed, 13 Sep 2023 16:39:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 586F01007;
	Wed, 13 Sep 2023 09:40:18 -0700 (PDT)
Received: from merodach.members.linode.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DDC13F5A1;
	Wed, 13 Sep 2023 09:39:39 -0700 (PDT)
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
Subject: [RFC PATCH v2 24/35] drivers: base: Implement weak arch_unregister_cpu()
Date: Wed, 13 Sep 2023 16:38:12 +0000
Message-Id: <20230913163823.7880-25-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093952_069922_DE6E5C8E 
X-CRM114-Status: GOOD (  10.89  )
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

Add arch_unregister_cpu() to allow the ACPI machinery to call
unregister_cpu(). This is enough for arm64, riscv and loongarch, but
needs to be overridden by x86 and ia64 who need to do more work.

CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v1:
 * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
---
 arch/ia64/include/asm/cpu.h      | 4 ----
 arch/loongarch/include/asm/cpu.h | 6 ------
 arch/x86/include/asm/cpu.h       | 1 -
 drivers/base/cpu.c               | 9 ++++++++-
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/ia64/include/asm/cpu.h b/arch/ia64/include/asm/cpu.h
index a3e690e685e5..642d71675ddb 100644
--- a/arch/ia64/include/asm/cpu.h
+++ b/arch/ia64/include/asm/cpu.h
@@ -15,8 +15,4 @@ DECLARE_PER_CPU(struct ia64_cpu, cpu_devices);
 
 DECLARE_PER_CPU(int, cpu_state);
 
-#ifdef CONFIG_HOTPLUG_CPU
-extern void arch_unregister_cpu(int);
-#endif
-
 #endif /* _ASM_IA64_CPU_H_ */
diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
index b8568e637420..48b9f7168bcc 100644
--- a/arch/loongarch/include/asm/cpu.h
+++ b/arch/loongarch/include/asm/cpu.h
@@ -128,10 +128,4 @@ enum cpu_type_enum {
 #define LOONGARCH_CPU_HYPERVISOR	BIT_ULL(CPU_FEATURE_HYPERVISOR)
 #define LOONGARCH_CPU_PTW		BIT_ULL(CPU_FEATURE_PTW)
 
-#if !defined(__ASSEMBLY__)
-#ifdef CONFIG_HOTPLUG_CPU
-void arch_unregister_cpu(int cpu);
-#endif
-#endif /* ! __ASSEMBLY__ */
-
 #endif /* _ASM_CPU_H */
diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index f349c94510e8..91867a6a9f8e 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -24,7 +24,6 @@ static inline void prefill_possible_map(void) {}
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_HOTPLUG_CPU
-extern void arch_unregister_cpu(int);
 extern void soft_restart_cpu(void);
 #endif
 
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 677f963e02ce..c709747c4a18 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -531,7 +531,14 @@ int __weak arch_register_cpu(int cpu)
 {
 	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
 }
-#endif
+
+#ifdef CONFIG_HOTPLUG_CPU
+void __weak arch_unregister_cpu(int num)
+{
+	unregister_cpu(&per_cpu(cpu_devices, num));
+}
+#endif /* CONFIG_HOTPLUG_CPU */
+#endif /* CONFIG_GENERIC_CPU_DEVICES */
 
 static void __init cpu_dev_register_generic(void)
 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
