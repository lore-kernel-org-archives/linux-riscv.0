Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797A9C64EBA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2522064D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s435NYQv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="LopD2I1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2522064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A34pivcsJaWiBvnF5efQ3EksOozQcIFTZD/zoxUls0g=; b=s435NYQvDrA8sZtq1ORGZL0qVL
	HB3MeMI3vuUT7cQkSsuCO5JlR8kw591KyCiJjTe9+CfRVx858kAExqb0BdKANiqIQefEvzzhTVIGB
	QGvsxhYFBNXmA6VdRrmJfU5Br3WKNRhVkIZmtaHzfEV6R419F+o0yVMXdCI9HNfPjvEr+blo/wjsT
	S8eiqtSIFqhGee9E8itGpGgpLYPZSJUoTBZSlVtIrgOTCFzX2+YxzQRRd7J9I6Uy4nnblgdtEavEA
	02TrG5fnypYmCHGli3UkWX34y4K0769J8r6Wl+zDeu3wX3GwGbb+I0TAMnzMZZitTSsgD26mDZpai
	QvFAV3Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q9i-0006H2-1Y; Tue, 02 Oct 2018 19:16:26 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q91-0005tu-5y
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507744; x=1570043744;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=pf+0u0uwzGfARo8auPdpk95VJOThU/BAdNh4s6pHCmA=;
 b=LopD2I1rmrbwa0mhgjRxi5czx0qoLhHRpb9GCtFkrCf2Kh63iqWay1D+
 uTIJ2johye7o9OzdoFQodcsB3t6WoVRdDCsVcgeei1O9z/gUPsxtyhNiE
 ziTMbbTsOLfCfIqxOM5tKqHE0s9+W44xvOeaRlogKlj8iMyqNAvuN2RdX
 NPAsYe0spdqhpYG6u7f/WN5Y4TO6Ae/vsxx1tx7LvjNYICT3pYnUZbQNw
 /vtT7ZH6xOW0px0iFsiLGL5tUqhKVJc066IqXWZdLmHo7O9UIP/MdII5+
 but7MVjxqQdMPRJfjMuXW4fmFpJcyAnrUiNVbQreVQcrCrnjfFRbb7p2Z Q==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92147442"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:13 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:51 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:11 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 12/14] RISC-V: Use Linux logical CPU number instead of
 hartid
Date: Tue,  2 Oct 2018 12:15:05 -0700
Message-Id: <1538507707-22299-13-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121543_465155_071CF8C7 
X-CRM114-Status: GOOD (  20.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, anup@brainfault.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002191505.zXzX3Xo6ORJHvs6OKIafL-UbtVMdGRLislEiOPD_rlM@z>

Setup the cpu_logical_map during boot. Moreover, every SBI call
and PLIC context are based on the physical hartid. Use the logical
CPU to hartid mapping to pass correct hartid to respective functions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/tlbflush.h | 16 +++++++++++++---
 arch/riscv/kernel/cpu.c           |  8 +++++---
 arch/riscv/kernel/head.S          |  4 +++-
 arch/riscv/kernel/setup.c         |  6 ++++++
 arch/riscv/kernel/smp.c           | 24 +++++++++++++++---------
 arch/riscv/kernel/smpboot.c       | 25 ++++++++++++++++---------
 drivers/clocksource/riscv_timer.c | 12 ++++++++----
 drivers/irqchip/irq-sifive-plic.c |  8 +++++---
 8 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 85c2d8ba..54fee0ca 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -16,6 +16,7 @@
 #define _ASM_RISCV_TLBFLUSH_H
 
 #include <linux/mm_types.h>
+#include <asm/smp.h>
 
 /*
  * Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
@@ -49,13 +50,22 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 
 #include <asm/sbi.h>
 
+static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
+				     unsigned long size)
+{
+	struct cpumask hmask;
+
+	cpumask_clear(&hmask);
+	riscv_cpuid_to_hartid_mask(cmask, &hmask);
+	sbi_remote_sfence_vma(hmask.bits, start, size);
+}
+
 #define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
 #define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
 #define flush_tlb_range(vma, start, end) \
-	sbi_remote_sfence_vma(mm_cpumask((vma)->vm_mm)->bits, \
-			      start, (end) - (start))
+	remote_sfence_vma(mm_cpumask((vma)->vm_mm), start, (end) - (start))
 #define flush_tlb_mm(mm) \
-	sbi_remote_sfence_vma(mm_cpumask(mm)->bits, 0, -1)
+	remote_sfence_vma(mm_cpumask(mm), 0, -1)
 
 #endif /* CONFIG_SMP */
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 4723e235..cccc6f61 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/smp.h>
 
 /*
  * Returns the hart ID of the given device tree node, or -1 if the device tree
@@ -138,11 +139,12 @@ static void c_stop(struct seq_file *m, void *v)
 
 static int c_show(struct seq_file *m, void *v)
 {
-	unsigned long hart_id = (unsigned long)v - 1;
-	struct device_node *node = of_get_cpu_node(hart_id, NULL);
+	unsigned long cpu_id = (unsigned long)v - 1;
+	struct device_node *node = of_get_cpu_node(cpuid_to_hartid_map(cpu_id),
+						   NULL);
 	const char *compat, *isa, *mmu;
 
-	seq_printf(m, "hart\t: %lu\n", hart_id);
+	seq_printf(m, "hart\t: %lu\n", cpu_id);
 	if (!of_property_read_string(node, "riscv,isa", &isa))
 		print_isa(m, isa);
 	if (!of_property_read_string(node, "mmu-type", &mmu))
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index c4d2c63f..711190d4 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -47,6 +47,8 @@ ENTRY(_start)
 	/* Save hart ID and DTB physical address */
 	mv s0, a0
 	mv s1, a1
+	la a2, boot_cpu_hartid
+	REG_S a0, (a2)
 
 	/* Initialize page tables and relocate to virtual addresses */
 	la sp, init_thread_union + THREAD_SIZE
@@ -55,7 +57,7 @@ ENTRY(_start)
 
 	/* Restore C environment */
 	la tp, init_task
-	sw s0, TASK_TI_CPU(tp)
+	sw zero, TASK_TI_CPU(tp)
 
 	la sp, init_thread_union
 	li a0, ASM_THREAD_SIZE
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d40b7c0f..afc78aff 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -81,11 +81,17 @@ EXPORT_SYMBOL(empty_zero_page);
 
 /* The lucky hart to first increment this variable will boot the other cores */
 atomic_t hart_lottery;
+unsigned long boot_cpu_hartid;
 
 unsigned long __cpuid_to_hartid_map[NR_CPUS] = {
 	[0 ... NR_CPUS-1] = INVALID_HARTID
 };
 
+void __init smp_setup_processor_id(void)
+{
+	cpuid_to_hartid_map(0) = boot_cpu_hartid;
+}
+
 #ifdef CONFIG_BLK_DEV_INITRD
 static void __init setup_initrd(void)
 {
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 0bd48935..4eac0094 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -97,14 +97,18 @@ void riscv_software_interrupt(void)
 static void
 send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 {
-	int i;
+	int cpuid, hartid;
+	struct cpumask hartid_mask;
 
+	cpumask_clear(&hartid_mask);
 	mb();
-	for_each_cpu(i, to_whom)
-		set_bit(operation, &ipi_data[i].bits);
-
+	for_each_cpu(cpuid, to_whom) {
+		set_bit(operation, &ipi_data[cpuid].bits);
+		hartid = cpuid_to_hartid_map(cpuid);
+		cpumask_set_cpu(hartid, &hartid_mask);
+	}
 	mb();
-	sbi_send_ipi(cpumask_bits(to_whom));
+	sbi_send_ipi(cpumask_bits(&hartid_mask));
 }
 
 void arch_send_call_function_ipi_mask(struct cpumask *mask)
@@ -146,7 +150,7 @@ void smp_send_reschedule(int cpu)
 void flush_icache_mm(struct mm_struct *mm, bool local)
 {
 	unsigned int cpu;
-	cpumask_t others, *mask;
+	cpumask_t others, hmask, *mask;
 
 	preempt_disable();
 
@@ -164,9 +168,11 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 	 */
 	cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
 	local |= cpumask_empty(&others);
-	if (mm != current->active_mm || !local)
-		sbi_remote_fence_i(others.bits);
-	else {
+	if (mm != current->active_mm || !local) {
+		cpumask_clear(&hmask);
+		riscv_cpuid_to_hartid_mask(&others, &hmask);
+		sbi_remote_fence_i(hmask.bits);
+	} else {
 		/*
 		 * It's assumed that at least one strongly ordered operation is
 		 * performed on this hart between setting a hart's cpumask bit
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 1e478615..18cda0e8 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -53,17 +53,23 @@ void __init setup_smp(void)
 	struct device_node *dn = NULL;
 	int hart;
 	bool found_boot_cpu = false;
+	int cpuid = 1;
 
 	while ((dn = of_find_node_by_type(dn, "cpu"))) {
 		hart = riscv_of_processor_hartid(dn);
-		if (hart >= 0) {
-			set_cpu_possible(hart, true);
-			set_cpu_present(hart, true);
-			if (hart == smp_processor_id()) {
-				BUG_ON(found_boot_cpu);
-				found_boot_cpu = true;
-			}
+		if (hart < 0)
+			continue;
+
+		if (hart == cpuid_to_hartid_map(0)) {
+			BUG_ON(found_boot_cpu);
+			found_boot_cpu = 1;
+			continue;
 		}
+
+		cpuid_to_hartid_map(cpuid) = hart;
+		set_cpu_possible(cpuid, true);
+		set_cpu_present(cpuid, true);
+		cpuid++;
 	}
 
 	BUG_ON(!found_boot_cpu);
@@ -71,6 +77,7 @@ void __init setup_smp(void)
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
+	int hartid = cpuid_to_hartid_map(cpu);
 	tidle->thread_info.cpu = cpu;
 
 	/*
@@ -81,9 +88,9 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	 * the spinning harts that they can continue the boot process.
 	 */
 	smp_mb();
-	WRITE_ONCE(__cpu_up_stack_pointer[cpu],
+	WRITE_ONCE(__cpu_up_stack_pointer[hartid],
 		  task_stack_page(tidle) + THREAD_SIZE);
-	WRITE_ONCE(__cpu_up_task_pointer[cpu], tidle);
+	WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
 
 	while (!cpu_online(cpu))
 		cpu_relax();
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index ad7453fc..084e97dc 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -8,6 +8,7 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
+#include <asm/smp.h>
 #include <asm/sbi.h>
 
 /*
@@ -84,13 +85,16 @@ void riscv_timer_interrupt(void)
 
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
-	int cpu_id = riscv_of_processor_hartid(n), error;
+	int cpuid, hartid, error;
 	struct clocksource *cs;
 
-	if (cpu_id != smp_processor_id())
+	hartid = riscv_of_processor_hartid(n);
+	cpuid = riscv_hartid_to_cpuid(hartid);
+
+	if (cpuid != smp_processor_id())
 		return 0;
 
-	cs = per_cpu_ptr(&riscv_clocksource, cpu_id);
+	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
 	clocksource_register_hz(cs, riscv_timebase);
 
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
@@ -98,7 +102,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
 	if (error)
 		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpu_id);
+		       error, cpuid);
 	return error;
 }
 
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index c55eaa31..357e9daf 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -15,6 +15,7 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+#include <asm/smp.h>
 
 /*
  * This driver implements a version of the RISC-V PLIC with the actual layout
@@ -218,7 +219,7 @@ static int __init plic_init(struct device_node *node,
 		struct of_phandle_args parent;
 		struct plic_handler *handler;
 		irq_hw_number_t hwirq;
-		int cpu;
+		int cpu, hartid;
 
 		if (of_irq_parse_one(node, i, &parent)) {
 			pr_err("failed to parse parent for context %d.\n", i);
@@ -229,12 +230,13 @@ static int __init plic_init(struct device_node *node,
 		if (parent.args[0] == -1)
 			continue;
 
-		cpu = plic_find_hart_id(parent.np);
-		if (cpu < 0) {
+		hartid = plic_find_hart_id(parent.np);
+		if (hartid < 0) {
 			pr_warn("failed to parse hart ID for context %d.\n", i);
 			continue;
 		}
 
+		cpu = riscv_hartid_to_cpuid(hartid);
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		handler->present = true;
 		handler->ctxid = i;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
