Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB95CC61DD6
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TRbPkg63lzscFmUp6IDdwD7vBZ1j7qRSzu4RfvZtapM=; b=U7diIfJ2lhhroP
	RGEo6CBPEJ1xPed+MF16mphYpMo6HINs48liIOjqw/wRbtFROwXtVMDg/3p00DEzj745yFl4xAPGi
	5tl6PewOeLX9xCmtBIScQ8bTkCAIcV+PLR4IUSJMNBJsmStj6FUz8pssKRlpvRujGaX2HWXMuPkq6
	UUp+2NzweBMVMAH1R3sqzbP/5xtLfnlB9v5eldDOJ7ZEfiXI8ztbzdCgx67voqNtOD6LkzTWV0a+5
	8lg1pwvApJSprSWwVXue/PKqUUbdwa88UDTM1Q2pE3f0XNb+nogIDEyeaW7YrWXbBi9NtmqC/Uzjt
	dcEXOdUqCyM5s+FroooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0LEX-000000074mt-3nyF;
	Sat, 29 Aug 2026 15:44:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0LEV-000000074mG-2YZC
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 15:44:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso17851915e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Aug 2026 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788018276; x=1788623076; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n8nQYQ7Cl9qztsEwnAxBh67Qx5SoTbCnvhZ8LBGAfp4=;
        b=AqYsDJVgotEciZ42PeihxjECT1zaih/DsR03Dw8BQ18iuvbZGE1p2MnSKBiKAJ4fG/
         LZRpsuIINWjzXxfpfMBpIVzG1HZtZcEolMjv2pOsvidSy+2GJrnJWbZCeslTSmCLTHjj
         QMzJMzcZyAynwgIcUnWAqFFSQ8StlQetuXm7X6gp4qZKXDS5SvhDG3leYy55rM5H6nNq
         a5FQ+T7MrVDySZe/DFH7Io/slbxh+gwkvUJueT8OTB2ozy1ekW4rEyKeFRCs4rfIVBNX
         dWGOyDHQnUNM050nbTCOY4rU2H1uXJw7c6LtUCu4lsYG9tMOcWML/v3mELf1JL+AS4MU
         o9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018276; x=1788623076;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=n8nQYQ7Cl9qztsEwnAxBh67Qx5SoTbCnvhZ8LBGAfp4=;
        b=K1Ws/0xTtm/jG8vrQs9yah9EPHP53k83Y0jv1CcOtNR2scPOU+3tyWQRvkcJ7ZvO4G
         E9uSBKODAV5maGlcxPdMDBw/kjt5J3qwRT3uvkiDxfJL0JI8xPNFUwTq2WLZefdMO2NG
         3HjP3xiOCqtuSuAWNyj3DVdJX3PTELpgaCdEWVaXYS03L0zMz3pgQNycPifmE7hFl902
         /vG5LSlgS4qa5Cl+SIcz37HhzU1rv3hduMjvKks7RB8NF9JgR2ezKWThma7tROyQWVpN
         UrDSI+QaO3AMwPiqys0o+BeizEdX7N2CA4B9LsdYaO5OphLkDXROdPJnIMoHd4SM/uCa
         n3Aw==
X-Gm-Message-State: AFuF++nhMTNYNAoMG5kjOyDCTR98ShaMOdcanrlJu/vilp5UpL6OO662
	gc7wr+549kn1+iOKJT0LZupotArgE5Nn3m6rFp8m7APtOyDgpGikkK9NzOwb9bjo
X-Gm-Gg: AR+sD13MFVB59xldf5sABb9OUiwAdVoSp+6lnvCwNogDWhn+N6+oGbH2TH5x2nfiHuY
	QT3+fZguL0gTu2annaVj2tDzh3LVG1Lvj+m3QeZndvrs8iznCqp2ab3A/7VZpACfc9bLnfSq1qD
	XOpglI7j2MW1fZ1J1omQJv7/8EZmB2hv7MbZLKDxRU06wyZL0sanRKdADD6JtZeB4UtumilFH+O
	ux/R32oIDCIeeiN4M+WiQMNGlpr3yW+6yQ6DQr+nyTe6wA0UZfTH71yrIAxMIbjHqaeUGXKL9R4
	mxqRcEXiISUAkFNeZQSYT4on3arO/bnFH8frBKlSJhU42CfmcLpeEH7lqrmEXvahP5ROzWBoGck
	4nQYz3Kox+yUs6ITjOQfVxEHeFnQ7vDFBJxyEkLONgz58UEURy28QCF9kP9dpPK+1kbtME3LXT4
	X71EwwS2MZMtW/R8/5P3UB8ySTwCC+uko3RBXAAOfwZ1lFmvVQM7Iwu3WRpNq6Ro8sCXJ4nQlgt
	R6bnzddbeP7Wtbx52kZ
X-Received: by 2002:a05:600c:a01:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49b91c33792mr190881725e9.7.1788018275680;
        Sat, 29 Aug 2026 08:44:35 -0700 (PDT)
Received: from [127.0.1.1] (89-65-152-218.dynamic.play.pl. [89.65.152.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm161111375e9.9.2026.08.29.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:44:35 -0700 (PDT)
From: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Date: Sat, 29 Aug 2026 17:44:18 +0200
Subject: [PATCH] riscv: mm: Trace TLB flush path selection
MIME-Version: 1.0
Message-Id: <20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFH+kmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNL3ZKcpPiSosTk1IL8zLwSXQsTE0MD08QkUwNLIyWgpoKi1LTMCrC
 B0bG1tQAPu5MbYAAAAA==
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_084439_685142_B704B73E 
X-CRM114-Status: GOOD (  27.19  )
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

Make RISC-V TLB flush path selection observable. Record whether Linux
handles an invalidation locally, delegates it to SBI RFENCE, or executes
it through a cross-CPU call, so MM activity can be correlated with the
RISC-V, firmware, or Linux cross-CPU path carrying the request.

The generic tlb:tlb_flush event describes TLB flush activity using
architecture-independent reason and page-count information. The RISC-V
implementation subsequently selects between local invalidation, SBI
RFENCE, and Linux cross-CPU coordination, with additional
architecture-specific request context available at that point.

Making this selection observable is useful when debugging RISC-V TLB
shootdowns. When a remote invalidation is observed to be slow, the
selected path determines whether to investigate SBI firmware and
platform handling or Linux cross-CPU and IPI handling. An unexpectedly
broad target mask can reveal an unintended address-space CPU footprint,
while the range and stride distinguish invalidation requests with
different mapping granularities.

Place the event in the RISC-V implementation because the local, SBI
RFENCE, or cross-CPU choice is made there, and SBI RFENCE and the
invalidation stride are RISC-V-specific semantics rather than properties
of the generic MM flush request.

Add riscv_tlb:riscv_tlb_flush_path in flush_tlb_all() and
__flush_tlb_range(). Record start, size, stride, the hardware-visible
ASID, whether a specific mm is associated with the request, the target
CPU mask and its weight, the requested scope, and the selected path.

Record the complete target mask in addition to its weight because CPU
identity cannot be reconstructed from a count and is needed to correlate
the request with per-CPU scheduler, IPI, and firmware activity.

The event records the invalidation request and the path selected by Linux
before the operation is dispatched. In particular, selecting the SBI
RFENCE path means that Linux delegated the request to firmware; the event
does not describe the implementation or outcome of that delegated
operation.

Tested on QEMU virt with OpenSBI using local and shared-mm
mprotect()/munmap() workloads. Local requests reported path=local,
while remote requests reported path=sbi-rfence and were followed by the
existing riscv:sbi_call RFENCE event.

The cross-CPU-call path was tested with QEMU virt using APLIC+IMSIC.
A MADV_PAGEOUT reclaim workload was used to exercise mm-independent
global flushes. All reported path values (local, sbi-rfence and
cross-cpu-call) and scope values (single, range, address-space and all)
were observed.

Signed-off-by: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
---
Add a RISC-V tracepoint for observing the path selected by Linux for TLB
invalidation requests: local invalidation, SBI RFENCE, or Linux
cross-CPU coordination.

The tracepoint is intended to make RISC-V TLB shootdown behavior easier
to correlate with MM activity, CPU targeting, SBI calls, and IPI
handling. The patch records the invalidation request context and the
Linux path-selection decision before the operation is dispatched.

The patch was tested on QEMU virt with both the SBI RFENCE path and an
APLIC+IMSIC configuration. Local, SBI RFENCE, and cross-CPU-call paths
were exercised. All reported scope values -- single, range,
address-space, and all -- were also observed.
---
 arch/riscv/mm/tlbflush.c         |  60 +++++++++++++++++++--
 include/trace/events/riscv_tlb.h | 113 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 962db300a166..87cc409779f6 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -9,6 +9,9 @@
 #include <asm/mmu_context.h>
 #include <asm/cpufeature.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/riscv_tlb.h>
+
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
 /*
@@ -63,6 +66,33 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
 }
 
+static enum riscv_tlb_flush_scope
+riscv_tlb_get_flush_scope(unsigned long size, unsigned long stride, bool has_mm)
+{
+	if (size == FLUSH_TLB_MAX_SIZE)
+		return has_mm ? RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE :
+			RISCV_TLB_FLUSH_SCOPE_ALL;
+
+	return size <= stride ? RISCV_TLB_FLUSH_SCOPE_SINGLE :
+		RISCV_TLB_FLUSH_SCOPE_RANGE;
+}
+
+static __always_inline void
+riscv_tlb_trace_flush_path(const struct cpumask *cmask, unsigned long start,
+			   unsigned long size, unsigned long stride,
+			   unsigned long asid, bool has_mm,
+			   enum riscv_tlb_flush_path path)
+{
+	enum riscv_tlb_flush_scope scope;
+
+	if (!trace_riscv_tlb_flush_path_enabled())
+		return;
+
+	scope = riscv_tlb_get_flush_scope(size, stride, has_mm);
+	trace_riscv_tlb_flush_path(start, size, stride, asid, has_mm, cmask,
+				   scope, path);
+}
+
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
@@ -70,12 +100,26 @@ static void __ipi_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
-	if (num_online_cpus() < 2)
+	if (num_online_cpus() < 2) {
+		riscv_tlb_trace_flush_path(cpu_online_mask, 0,
+					   FLUSH_TLB_MAX_SIZE, 0,
+					   FLUSH_TLB_NO_ASID, false,
+					   RISCV_TLB_FLUSH_PATH_LOCAL);
 		local_flush_tlb_all();
-	else if (riscv_use_sbi_for_rfence())
-		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
-	else
+	} else if (riscv_use_sbi_for_rfence()) {
+		riscv_tlb_trace_flush_path(cpu_online_mask, 0,
+					   FLUSH_TLB_MAX_SIZE, 0,
+					   FLUSH_TLB_NO_ASID, false,
+					   RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
+		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE,
+					   FLUSH_TLB_NO_ASID);
+	} else {
+		riscv_tlb_trace_flush_path(cpu_online_mask, 0,
+					   FLUSH_TLB_MAX_SIZE, 0,
+					   FLUSH_TLB_NO_ASID, false,
+					   RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
+	}
 }
 
 struct flush_tlb_range_data {
@@ -107,12 +151,20 @@ static void __flush_tlb_range(struct mm_struct *mm,
 
 	/* Check if the TLB flush needs to be sent to other CPUs. */
 	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
+		riscv_tlb_trace_flush_path(cmask, start, size, stride, asid,
+					   !!mm, RISCV_TLB_FLUSH_PATH_LOCAL);
 		local_flush_tlb_range_asid(start, size, stride, asid);
 	} else if (riscv_use_sbi_for_rfence()) {
+		riscv_tlb_trace_flush_path(cmask, start, size, stride, asid,
+					   !!mm, RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
 		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
 	} else {
 		struct flush_tlb_range_data ftd;
 
+		riscv_tlb_trace_flush_path(cmask, start, size, stride, asid,
+					   !!mm,
+					   RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
+
 		ftd.asid = asid;
 		ftd.start = start;
 		ftd.size = size;
diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/riscv_tlb.h
new file mode 100644
index 000000000000..3eff171ec54f
--- /dev/null
+++ b/include/trace/events/riscv_tlb.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM riscv_tlb
+
+#if !defined(_TRACE_RISCV_TLB_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RISCV_TLB_H
+
+#include <linux/cpumask.h>
+#include <linux/tracepoint.h>
+
+#ifndef _TRACE_RISCV_TLB_ENUMS
+#define _TRACE_RISCV_TLB_ENUMS
+
+enum riscv_tlb_flush_scope {
+	RISCV_TLB_FLUSH_SCOPE_SINGLE,
+	RISCV_TLB_FLUSH_SCOPE_RANGE,
+	RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE,
+	RISCV_TLB_FLUSH_SCOPE_ALL,
+};
+
+enum riscv_tlb_flush_path {
+	RISCV_TLB_FLUSH_PATH_LOCAL,
+	RISCV_TLB_FLUSH_PATH_SBI_RFENCE,
+	RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL,
+};
+
+#endif /* _TRACE_RISCV_TLB_ENUMS */
+
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
+
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_LOCAL);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
+
+#define show_riscv_tlb_flush_scope(scope) \
+	__print_symbolic(scope, \
+		{ RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
+
+#define show_riscv_tlb_flush_path(path) \
+	__print_symbolic(path, \
+		{ RISCV_TLB_FLUSH_PATH_LOCAL,          "local" }, \
+		{ RISCV_TLB_FLUSH_PATH_SBI_RFENCE,     "sbi-rfence" }, \
+		{ RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL, "cross-cpu-call" })
+
+/*
+ * Record the invalidation request received by the RISC-V architecture code
+ * and the path selected by Linux.
+ *
+ * The target CPU mask represents the CPUs Linux intends to cover for the
+ * request. It can be correlated with per-CPU activity, but does not describe
+ * which harts ultimately performed an invalidation.
+ *
+ * The ASID is hardware-visible and may be reused. It must not be treated as a
+ * persistent identifier for an mm.
+ *
+ * The stride describes the invalidation granularity supplied to the RISC-V
+ * implementation. SBI RFENCE receives start, size and ASID, but not stride.
+ *
+ * The event is emitted at path selection time. For SBI RFENCE, it records
+ * delegation of the request to firmware; firmware processing after that
+ * point is outside the event's scope.
+ */
+TRACE_EVENT(riscv_tlb_flush_path,
+	TP_PROTO(unsigned long start, unsigned long size,
+		 unsigned long stride, unsigned long asid, bool has_mm,
+		 const struct cpumask *cmask,
+		 enum riscv_tlb_flush_scope scope,
+		 enum riscv_tlb_flush_path path),
+
+	TP_ARGS(start, size, stride, asid, has_mm, cmask, scope, path),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, start)
+		__field(unsigned long, size)
+		__field(unsigned long, stride)
+		__field(unsigned long, asid)
+		__field(bool, has_mm)
+		__field(unsigned int, target_mask_weight)
+		__cpumask(target_cpus)
+		__field(u8, scope)
+		__field(u8, path)
+	),
+
+	TP_fast_assign(
+		__entry->start = start;
+		__entry->size = size;
+		__entry->stride = stride;
+		__entry->asid = asid;
+		__entry->has_mm = has_mm;
+		__entry->target_mask_weight = cpumask_weight(cmask);
+		__assign_cpumask(target_cpus, cpumask_bits(cmask));
+		__entry->scope = scope;
+		__entry->path = path;
+	),
+
+	TP_printk("start=%#lx size=%#lx stride=%#lx asid=%#lx has_mm=%d target_mask_weight=%u target_cpus=%s scope=%s path=%s",
+		  __entry->start, __entry->size, __entry->stride,
+		  __entry->asid, __entry->has_mm,
+		  __entry->target_mask_weight, __get_cpumask(target_cpus),
+		  show_riscv_tlb_flush_scope(__entry->scope),
+		  show_riscv_tlb_flush_path(__entry->path))
+);
+
+#endif /* _TRACE_RISCV_TLB_H */
+
+/* This part must be outside protection. */
+#include <trace/define_trace.h>

---
base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
change-id: 20260829-tlb_tracepoint-844105ab5092

Best regards,
-- 
Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
