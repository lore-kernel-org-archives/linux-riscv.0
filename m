Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3210FC64EBA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D502064D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOVyio8p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JyzFmNtW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D502064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/nAm9WwM0fuRe4g8nDmum20Dkm5+nfE/8zC/UJHHU1Q=; b=rOVyio8p+osHIOSa8yds9qhlT3
	6oTELCQuqYAmNicRyJUL4UcMI/5C5e4ELkY+5KYJlYmOFcTOd0leJtjJkzoA/a+yCI7M1EHF1biEO
	XDko+MjTMd6lkmdRjc1oeZJcqhhAlhACkDiyQVHpFpxb0s9+la0H+79F88/3pqDmbYItULDKB5DCf
	X+U/qWuNz08sIM+nmZ2fO48uEnetkYAr0r5AzwubmKR0AGg72HZfyL9h/Sq2woFVjXDf6xBIb+2N5
	6Nm78naSRQxU3AOC6HVndjcgSzZNDKnhTP3lLLqzbcExTJqy+OyJf2VIvsCV6IXeSPWqEroKeW+T7
	SqTU7mJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q9a-0006Cu-GE; Tue, 02 Oct 2018 19:16:18 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q91-0005Mr-Lh
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507744; x=1570043744;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=XkHB0PFioUjaEN+xmb1y3meqxTOBFcjUD87BCOD5eac=;
 b=JyzFmNtWYV4qCjbdoZtHMVtuez1vXazpUIJRjlDhkFDwYgBy7GlDGch+
 eTdep4Z1hX4dvqWC9a8HXJp6TyNLRn6kKvdWyXuER812XwJZ8Hj8+Jq7M
 O8O+NTNZdXyiK0d+fT4B98ny6dWgGlrrhaJ2w8iQc/Flcxx+lnQbbXS/Q
 NKskOmOjRWDftzmlua/5f6slHMO6oGaPUB6kJAhpDbEl8jblrO7j3gnpk
 hiAir8grb7KPV6HoA5EsEmfWKJqKPNXyNsPIZaCEaLHeIkOGaUWIfG41b
 JMT4+7jzECf0F1U1L71Ds7vidwi0IKJWe+WF7LWEmjuBL2UyIc8P+kRf2 g==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92732911"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:52 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:11 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 14/14] RISC-V: Show IPI stats
Date: Tue,  2 Oct 2018 12:15:07 -0700
Message-Id: <1538507707-22299-15-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121543_785146_105B9F70 
X-CRM114-Status: GOOD (  15.52  )
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
Message-ID: <20181002191507.Md936DrCIDlF5AC15HlS3wpPLSFkdpkd-DxzP7i6zzQ@z>

From: Anup Patel <anup@brainfault.org>

This patch provides arch_show_interrupts() implementation to
show IPI stats via /proc/interrupts.

Now the contents of /proc/interrupts" will look like below:
           CPU0       CPU1       CPU2       CPU3
  8:         17          7          6         14  SiFive PLIC   8  virtio0
 10:         10         10          9         11  SiFive PLIC  10  ttyS0
IPI0:       170        673        251         79  Rescheduling interrupts
IPI1:         1         12         27          1  Function call interrupts

Signed-off-by: Anup Patel <anup@brainfault.org>
[Atish - Fixed checkpatch errors]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Changes since v2:
 - Remove use of IPI_CALL_WAKEUP because it's being removed

Changes since v1:
 - Add stub inline show_ipi_stats() function for !CONFIG_SMP
 - Make ipi_names[] dynamically sized at compile time
 - Minor beautification of ipi_names[] using tabs
---
 arch/riscv/include/asm/smp.h |  9 +++++++++
 arch/riscv/kernel/irq.c      |  8 ++++++++
 arch/riscv/kernel/smp.c      | 39 ++++++++++++++++++++++++++++++++-------
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 47fd61df..41aa73b4 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -25,8 +25,13 @@
 extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
 #define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
 
+struct seq_file;
+
 #ifdef CONFIG_SMP
 
+/* print IPI stats */
+void show_ipi_stats(struct seq_file *p, int prec);
+
 /* SMP initialization hook for setup_arch */
 void __init setup_smp(void);
 
@@ -47,6 +52,10 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
 
 #else
 
+static inline void show_ipi_stats(struct seq_file *p, int prec)
+{
+}
+
 static inline int riscv_hartid_to_cpuid(int hartid)
 {
 	return 0;
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index ca459331..48e6b7db 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -8,6 +8,8 @@
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
+#include <linux/seq_file.h>
+#include <asm/smp.h>
 
 /*
  * Possible interrupt causes:
@@ -24,6 +26,12 @@
  */
 #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
 
+int arch_show_interrupts(struct seq_file *p, int prec)
+{
+	show_ipi_stats(p, prec);
+	return 0;
+}
+
 asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 4eac0094..57b1383e 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -22,22 +22,24 @@
 #include <linux/interrupt.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/seq_file.h>
 
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 
-/* A collection of single bit ipi messages.  */
-static struct {
-	unsigned long bits ____cacheline_aligned;
-} ipi_data[NR_CPUS] __cacheline_aligned;
-
 enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
 	IPI_MAX
 };
 
+/* A collection of single bit ipi messages.  */
+static struct {
+	unsigned long stats[IPI_MAX] ____cacheline_aligned;
+	unsigned long bits ____cacheline_aligned;
+} ipi_data[NR_CPUS] __cacheline_aligned;
+
 int riscv_hartid_to_cpuid(int hartid)
 {
 	int i = -1;
@@ -67,6 +69,7 @@ int setup_profiling_timer(unsigned int multiplier)
 void riscv_software_interrupt(void)
 {
 	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
+	unsigned long *stats = ipi_data[smp_processor_id()].stats;
 
 	/* Clear pending IPI */
 	csr_clear(sip, SIE_SSIE);
@@ -81,11 +84,15 @@ void riscv_software_interrupt(void)
 		if (ops == 0)
 			return;
 
-		if (ops & (1 << IPI_RESCHEDULE))
+		if (ops & (1 << IPI_RESCHEDULE)) {
+			stats[IPI_RESCHEDULE]++;
 			scheduler_ipi();
+		}
 
-		if (ops & (1 << IPI_CALL_FUNC))
+		if (ops & (1 << IPI_CALL_FUNC)) {
+			stats[IPI_CALL_FUNC]++;
 			generic_smp_call_function_interrupt();
+		}
 
 		BUG_ON((ops >> IPI_MAX) != 0);
 
@@ -111,6 +118,24 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 	sbi_send_ipi(cpumask_bits(&hartid_mask));
 }
 
+static const char * const ipi_names[] = {
+	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
+	[IPI_CALL_FUNC]		= "Function call interrupts",
+};
+
+void show_ipi_stats(struct seq_file *p, int prec)
+{
+	unsigned int cpu, i;
+
+	for (i = 0; i < IPI_MAX; i++) {
+		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
+			   prec >= 4 ? " " : "");
+		for_each_online_cpu(cpu)
+			seq_printf(p, "%10lu ", ipi_data[cpu].stats[i]);
+		seq_printf(p, " %s\n", ipi_names[i]);
+	}
+}
+
 void arch_send_call_function_ipi_mask(struct cpumask *mask)
 {
 	send_ipi_message(mask, IPI_CALL_FUNC);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
