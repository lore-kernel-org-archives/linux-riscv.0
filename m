Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABE0C61DE1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BdblGbLke9V60cxZL0WAAlaghr8C3b30W/OlFeBBr+Q=; b=pBLOsoPaZI6217
	vRTJJjXuDTWxPWO85SmYXaGXxq4c24J3vj6WqLcxCsuPhI8n5X5pyuwrpmc4DdlpBy2N3cojwJiou
	y38nCy4SdzAJ7w6CUW6Nq+6bjEQn9ZUigzFg1uBn3tvN1APfl1FhsDya35wecuMXx0egsaIgusmm1
	D3NAe9p3tolpl94rRdowjiorT+kStcVG+El9E1q3aBq07YCUClaKhf/R5Mw8/fAN1joOVbt4IELQA
	hp9t+424a8DvNnLW0JoYFIVpaa+JoR/5pwLfft+sCw+IjnX3VR+XZvW4gqJabvqd45LZOelJkkx50
	He2jSH2VA7I6Dq13DNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0geR-00000007oNq-17Cj;
	Sun, 30 Aug 2026 14:36:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0geO-00000007oNU-3Qv9
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 14:36:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso18139795e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2026 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788100607; x=1788705407; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K5qhWC1RezqgUxSYoHlPtRL/UlEjuJcpyuDmW9yQF/c=;
        b=aDdQNX04zsTvWb/VNzyMMvOG0kzJTKGCQzbm34qqs7HsUqCLHpXz5RZlyQXHsexjm2
         634kQ7imkTL4pnVU6YzpU/KbGFi7AN6PpBOLsHyUeinPTWj3Mzl3uexFq3GBkYIToie3
         5O4zq7rPxEOEykTV3uI6eK5VmW+D0zgnTdCdfWoM9ptnBYEywwB5v2Iyjk/Che5SSVBU
         W104X44GlWK99pOF9rXQKry7C/+EZiS1mxFKwtFbswwLi9QV8+6biRaq9yo5QDszl+2O
         m/+rgeJNFz5ISwzGfroK+SrsRjCXUqFglDmuiS9QmUT3luZCHZLvAapCOt14gaAvule1
         clXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788100607; x=1788705407;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K5qhWC1RezqgUxSYoHlPtRL/UlEjuJcpyuDmW9yQF/c=;
        b=pRVuTtz1o0MwitSFqBH6OnB50umPEuWc7XrT6sqEL/zHAGmDRmWvWBtW0ffhaZGUUd
         kbaiqem+tO3B93E9ebr4fvzU9kF+6dNEJSUb+AAEOSbmcfhxPIMrTuAtFaWlKguB9KpB
         8KhZ02jOXuVbV6KPLtuMS72q9LDhg0CgXTCEC+HmKFxydsYn0rgRODb5y8c0u6oEmM6j
         zEfNLX6Jix5xtXL2+EotFgaa9M68gzfmWExhK8Am8uIQY2gg6kNOn7CQM9zCjkSjtMMO
         iIkybtH6sXTLDrv1ZXM/vqrgs1wsQGWd2WiXM1sgFqF9Me/WnqOrDWOjo3wbCWgtVg0z
         qyrA==
X-Gm-Message-State: AFuF++moEZH6kJvQB/5n/qnSRMHn0T6jfJ7VmL8Ss+nJbZGd2ANXMZaW
	RXHNe7i6qQacGNYRtpQjyhavD0Id2kt9/lF0r/dsg7nmxdScVOB97cdX
X-Gm-Gg: AR+sD11UxUw5H7BGOTA6SuC+W/qKWMHKLB27N25Gm4yEHn02RV/sGnRDFF41JjRl3UT
	6vLX1SGgetGxwfOTidNhSuLpOr6zDUbVNNMPyfzdyf7jsK/u96++GmHeDBTRAk6P/HiA4kz+IQ3
	4fZCEm2h8K6kdT5tYXUjKL1yB/edx/JxkRHhY+OODXu6Bge3wBi1Pg00OmMUFJ03wo0JTYUigOn
	HvZEA1HyFGokv4Sk66+uGd2ymwy3NSQ+CxHaqD40d6xSUZIMBQhuc2hp7uzjIiR02hz1IVNt2/R
	dIygr14gyFEExHi76N/xWl3jgLY9W4Aq1FYNkUT9DDlizYb/y6H9JMhV9cOrCVEil9+5XDlnAza
	JF1VCtop6Qjlw3DTkbILEKCMM5hwzOZCXuQaQgM6biD5p+VSNaHZDf0j93MDLrYfiTbigoDcpgZ
	oshw7aU9tYuGnZ9jzIwCHMhF+VH1nXD2g9D2ZwAyJVTWDE/EqkrxHhLNdoL+iElp4CbFUgfEZRw
	1XImhYu83NIZzOaOvLJ
X-Received: by 2002:a05:600c:8885:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49b91c4884amr257020755e9.10.1788100606661;
        Sun, 30 Aug 2026 07:36:46 -0700 (PDT)
Received: from [127.0.1.1] (89-65-152-218.dynamic.play.pl. [89.65.152.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm245179715e9.9.2026.08.30.07.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 07:36:46 -0700 (PDT)
From: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Date: Sun, 30 Aug 2026 16:36:37 +0200
Subject: [PATCH v2] riscv: mm: Trace TLB flush path selection
MIME-Version: 1.0
Message-Id: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPQ/lGoC/3XM0QqDIBTG8VeJcz2Hiq3a1d5jxDA91YHKUJGN8
 N3nut/l/4Pvd0BATxjgXh3gMVEgt5WQlwrMrLcJGdnSILm88VZ2LC7DK3ptcHe0RdYqJXith5p
 3Espp9zjS+wSffemZQnT+c/pJ/Na/VBJMMDtajRYbbJR4TKum5WrcCn3O+QuOmNa2rAAAAA==
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
X-CRM114-CacheID: sfid-20260830_073648_934665_03C88E89 
X-CRM114-Status: GOOD (  27.98  )
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
Changes in v2:
- Use trace_call__riscv_tlb_flush_path() after the explicit
  trace_riscv_tlb_flush_path_enabled() check to avoid a second
  tracepoint static-key test, as suggested by Steven Rostedt.
- Link to v1: https://lore.kernel.org/r/20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com
---
 arch/riscv/mm/tlbflush.c         |  60 +++++++++++++++++++--
 include/trace/events/riscv_tlb.h | 113 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 962db300a166..cefce9364bd2 100644
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
+	trace_call__riscv_tlb_flush_path(start, size, stride, asid, has_mm,
+			 cmask, scope, path);
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
