Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C09BCCF2C7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C+oEcmWRT3zA/NIOvSAUFswVXh8Z1JVgaGYoTGwr9lo=; b=qhLo/JYiGcyyVg
	f8y7mV7leQHhEpVsC50M8vPoOcauZYorDQjRQKZ4CRejefbSVqpm9enMjjwMET9ZfzbiBCslVXbSS
	hY+Sy1FnaxxhkEQgS7vOWyRbqQCt9cXrv2Jvwg+bYad7TafsTjvPM0KELoNu9XoWjscP/l1urI22n
	dcU1D7VCZqVE6aXPfXrL/qeiRK7hwQtjQYEK7cyF/QPv4xkBh1bqtK4E0LyZ2/8wUgCBpzIyfHQxx
	HQfZleQlD9wSoBm3y9nfZH8M0Xxjw/Wy11Shy0zzTZaX+V7EX31ZoCVsY2BcQOLQnut1EQq0J2j/z
	7D5VqBGW6I+n4dJGhiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI4nZ-00000004no3-18Ol;
	Sat, 17 Oct 2026 13:50:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI4nW-00000004nng-0B9O
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 13:50:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-487049569b6so394251f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792245004; x=1792849804; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x/7sTjM+j/xtn89k/aOm3H9ejU9nyAE+tKqITVTZM6c=;
        b=W9KB8WJP4p5kBYnB6nezlulVxsrYfJFuPozPBxNie4zpPqXfRgVS4dTZCBPhalBeBJ
         9+zWI4cjxEs9z9zs8yh63bkNOoMuvJcncYEGM8tgeuiqE3b8E4Yuf55qjSFjdxw0GCJd
         dpCap1UsgX2KpwUU/7539BGwNgTIWoBuHj/+sCk7CJESRZWitam9Nm6OPAaD+o1n1BRi
         TcPunZ7HLqHyvUSFh15zlpRt6uD+1MqOHozQrj5tE/N45Zb55Qbgq8l/X+gOgvogKsYK
         Qi7NnicY5df5DkyIzA6TQsE7XJS0C7nb6V6U7/GPHLAS0lnNc6qLNysVOD/90LMw1TZP
         +39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245004; x=1792849804;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x/7sTjM+j/xtn89k/aOm3H9ejU9nyAE+tKqITVTZM6c=;
        b=ghAng0jXdYALibwxF+bQgwMlEfjf4oJs4EsWNYWijuc6rNyLMtHJ8J/LgJxkGMwsWy
         4IrnMQ0ZY1xtzO96UMw+aPXRWcrdQyty9svT0ValU7Emwa1CY0yC1fP0v4pWEkLAzLeK
         H9ycthimFweM0WkidjLmS21URZ2h5jNBXhrC4D1l4dxGbpoKf+bwCyueDSxWbJQdY4T5
         NKEsz11QCkBBTYOfRbB0jdSAp5s61WM8k4gdAkAGHNbd4IQkcwGfDR1VrONqTXKU4ORI
         gS0+WawLTbzkMijUxUPSVBcu1Y9+5Lok3hQ8jUfqiANM61N1RR2z1T+Gqic5F+ZxbNno
         G+QQ==
X-Forwarded-Encrypted: i=1; AKwUvByXKNBGlX1Xg1FVgUhPTtNbMzP4pipcuI2HeGW2QzcFG7oP+6VZg1LliZSadIA7UAZ+JzY1p2igBnUfNA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKaGyMKO6cHybRYfJgNlgRCtUDJf3GxMVEq/1hV5IThohlrxYWn
	Zo2ksqxjz6ywZUzKHfJQWQKmZFcn50i5yeqBnCo1ccV5ivcYV7fOJtY1
X-Gm-Gg: AYBFou2+CUERH3ocl+iHyxQXGZ6nIqz3ByHgrTs6zCk6yZN1RWRhHxxalixS5DzkCF+
	uX7VpjLpf0rTE4XtyYSPaI0Y/whI5dWLnPKql3JmX35XXriVlk8bzF1a2eZY2MN7pbrpvsGZWLG
	MZP7rJ+djZImWrNWVwGWPOSd0lwJ5HKlnSQp0Fi5emRmlQMmGVMTz3zI/07Iv9gdLT+PMch5vIF
	V1DLenFsrTFGU6N9RmTmuXqYGdt9TxLVMGE/55v8xygUsTfDoyEuKfmhkl3GBn7p50eXirS6AdU
	XUnhiEzL/ZE54GH6rHVdO7xkH1D0s2N/M7xuJXoSvZzs9Giio00Gr1E/5XVIa71yBrw4PIZrLYf
	zfqMHomQx1/fJKxz622lmHz+NrgmS5s/UdIhsJnKus9gh4ByDQk64dg1QYpa29/sqcL71PWbrFW
	3BigzGm1vivHDjI7dKUUyVgjmT0TN2W2bYKWj8N6EbpgeLz0j2NVHQG1BFLyDklP7gRtj7OZJLu
	YXd2dWDBgY9iopGjw8iZsQGmR7E3pxiRBTn4O7cvkE=
X-Received: by 2002:a05:6000:60b:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-48e0797ffddmr5174562f8f.7.1792245003468;
        Sat, 17 Oct 2026 06:50:03 -0700 (PDT)
Received: from [127.0.1.1] (89-65-152-218.dynamic.play.pl. [89.65.152.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c0894sm10294478f8f.12.2026.10.17.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:50:02 -0700 (PDT)
From: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Date: Sat, 17 Oct 2026 15:49:45 +0200
Subject: [PATCH v5] riscv: mm: Trace TLB flush requests
MIME-Version: 1.0
Message-Id: <20261017-tlb_tracepoint-v5-1-256fb5393a7f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PTQrCMBCG4atI1kaSSWKjK+8hIvmZtAFtS1qKU
 np3UxdSLLr8Bp4XZiQdpogdOW5GknCIXWzqPNR2Q1xl6hJp9HkTYLBnGg60v9lrn4zDtol1T7W
 UnCljFTsAyahNGOLjHTxf8q5i1zfp+e4PfL7+TA2ccuqDN+ixwELyU3k38bZzzZ3MqQEWXLAVh
 8xROK0dSB+U/ebiwznjasXFzDGI/I2wdi++ufzPZeYBhDZgvQ4FLvk0TS/8CM1aaQEAAA==
X-Change-ID: 20260829-tlb_tracepoint-844105ab5092
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_065006_178752_7810D622 
X-CRM114-Status: GOOD (  26.42  )
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

Make RISC-V TLB flush requests observable together with the
architecture-specific context available when the request reaches
the RISC-V implementation.

The generic tlb:tlb_flush event provides reason and page-count
information. At the RISC-V implementation level, additional
context is available, including the invalidation range and stride,
ASID, target CPU mask, and invalidation scope.

This context is useful for debugging and workload analysis. The
target CPU mask shows the address-space CPU footprint involved in
an invalidation, while range and stride distinguish requests at
different mapping granularities. The ASID and scope help correlate
requests with MM, scheduler, IPI, and firmware activity.

Add riscv_tlb:riscv_tlb_flush_request in flush_tlb_all() and
__flush_tlb_range(). Record start, size, stride, ASID (or the
no-ASID sentinel), whether an mm is associated with the request,
the target CPU mask and its weight, and the derived scope.

Record the complete target mask because CPU identity cannot be
reconstructed from a count. Calculate its weight from the recorded
bitmap so both fields agree even if mm_cpumask() changes during
recording.

The event describes an invalidation request before dispatch. It
does not report whether a remote flush uses SBI RFENCE or Linux
cross-CPU coordination, since that choice is effectively established
during initialization rather than made for each request.

The address field (start) may contain kernel virtual addresses
for flushes involving kernel mappings. Require perf tracepoint
permissions even for counting-only events, since perf filters
could otherwise reveal address information through event counts.

Tested on QEMU virt with OpenSBI using local and shared-mm
mprotect()/munmap() workloads, exercising single, range, and
address-space invalidations. A MADV_PAGEOUT reclaim workload
exercised global flushes. All four scope values were observed.

Confirmed that trace-cmd records the event and that perf can count
it with sufficient privileges. With perf_event_paranoid=0,
unprivileged attempts to count the event using perf were denied,
as intended.

Built with and without CONFIG_PERF_EVENTS.

Signed-off-by: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
---
Add a RISC-V tracepoint for observing TLB invalidation requests
before they are dispatched by the architecture-specific
implementation.

The generic tlb:tlb_flush event describes TLB flush activity using
reason and page-count information. The RISC-V event records
additional context, including the invalidation range and stride,
ASID, target CPU mask and its weight, and derived request scope.

This context helps correlate TLB invalidation activity with MM,
scheduler, IPI, and firmware activity. The event describes the
request rather than the execution backend. SBI RFENCE versus Linux
cross-CPU coordination is effectively determined at initialization
rather than selected independently for each request.

The target CPU mask weight is derived from the recorded bitmap to
keep both fields consistent under concurrent mm_cpumask() updates.
Since the address field (start) may contain kernel virtual
addresses, the event requires perf tracepoint permissions even
for counting-only access.

Tested on QEMU virt with OpenSBI using local and shared-mm
mprotect()/munmap() workloads. A MADV_PAGEOUT reclaim workload
on QEMU virt with APLIC+IMSIC exercised global flushes. All four
scope values -- single, range, address-space, and all -- were
observed.

Confirmed trace-cmd recording and privileged perf counting.
With perf_event_paranoid=0, unprivileged attempts to count the
event using perf were denied, as intended. The kernel was built
with and without CONFIG_PERF_EVENTS.
---
Changes in v5:
- Move the architecture-specific trace event definition under
  arch/riscv/, as requested by Steven Rostedt.
- Calculate target_mask_weight from the recorded CPU mask to
  keep both fields consistent under concurrent updates.
- Require perf tracepoint permissions for counting-only access,
  since the event may expose kernel virtual addresses.
- Link to v4: https://lore.kernel.org/r/20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com

Changes in v4:
- Drop unrelated whitespace-only changes in arch/riscv/mm/tlbflush.c.
- Link to v3: https://lore.kernel.org/all/20261015-tlb_tracepoint-v3-1-eef305a3bb63@gmail.com/

Changes in v3:
- Rebase on current RISC-V for-next.
- Thanks to Jisheng Zhang for pointing out that SBI RFENCE versus Linux
  cross-CPU coordination is effectively a system-wide choice established
  during initialization rather than a per-request decision.
- Drop the local/SBI RFENCE/cross-CPU path field.
- Rename the event from riscv_tlb_flush_path to
  riscv_tlb_flush_request and refocus it on the semantic TLB
  invalidation request.
- Emit one request event independently of the mechanism subsequently
  used to perform the invalidation.
- Address checkpatch.pl --strict alignment issues.
- Link to v2: https://lore.kernel.org/r/20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com

Changes in v2:
- Use trace_call__riscv_tlb_flush_path() after the explicit
  trace_riscv_tlb_flush_path_enabled() check to avoid a second
  tracepoint static-key test, as suggested by Steven Rostedt.
- Link to v1: https://lore.kernel.org/r/20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com
---
 arch/riscv/include/asm/riscv_tlb.h | 103 +++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/tlbflush.c           |  45 ++++++++++++++--
 2 files changed, 144 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/riscv_tlb.h b/arch/riscv/include/asm/riscv_tlb.h
new file mode 100644
index 000000000000..2c438f6bc0d4
--- /dev/null
+++ b/arch/riscv/include/asm/riscv_tlb.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM riscv_tlb
+
+#if !defined(_TRACE_RISCV_TLB_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RISCV_TLB_H
+
+#include <linux/cpumask.h>
+#include <linux/tracepoint.h>
+#include <linux/perf_event.h>
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
+#endif /* _TRACE_RISCV_TLB_ENUMS */
+
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
+TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
+
+#define show_riscv_tlb_flush_scope(scope) \
+	__print_symbolic(scope, \
+		{ RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" }, \
+		{ RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
+
+/*
+ * Record the invalidation request received by the RISC-V architecture code
+ *
+ * The target CPU mask represents the CPUs Linux intends to cover for the
+ * request. It can be correlated with per-CPU activity, but does not describe
+ * which harts ultimately performed an invalidation.
+ *
+ * The ASID is hardware-visible and may be reused. It must not be treated as a
+ * persistent identifier for an mm.
+ *
+ * The stride describes the invalidation granularity supplied to the RISC-V
+ * implementation.
+ *
+ * The event records the invalidation request before it is dispatched. It does
+ * not describe the mechanism used to execute the request.
+ *
+ */
+TRACE_EVENT(riscv_tlb_flush_request,
+	    TP_PROTO(unsigned long start, unsigned long size,
+		     unsigned long stride, unsigned long asid, bool has_mm,
+		     const struct cpumask *cmask,
+		     enum riscv_tlb_flush_scope scope),
+
+	TP_ARGS(start, size, stride, asid, has_mm, cmask, scope),
+
+	TP_STRUCT__entry(__field(unsigned long, start)
+		__field(unsigned long, size)
+		__field(unsigned long, stride)
+		__field(unsigned long, asid)
+		__field(bool, has_mm)
+		__field(unsigned int, target_mask_weight)
+		__cpumask(target_cpus)
+		__field(u8, scope)
+	),
+
+	TP_fast_assign(__entry->start = start;
+		__entry->size = size;
+		__entry->stride = stride;
+		__entry->asid = asid;
+		__entry->has_mm = has_mm;
+		__assign_cpumask(target_cpus, cpumask_bits(cmask));
+		__entry->target_mask_weight = cpumask_weight((const struct cpumask *)
+						     __get_cpumask(target_cpus));
+		__entry->scope = scope;
+	),
+
+	TP_printk("start=%#lx size=%#lx stride=%#lx asid=%#lx has_mm=%d target_mask_weight=%u target_cpus=%s scope=%s",
+		  __entry->start, __entry->size, __entry->stride,
+		  __entry->asid, __entry->has_mm,
+		  __entry->target_mask_weight, __get_cpumask(target_cpus),
+		  show_riscv_tlb_flush_scope(__entry->scope))
+);
+
+#ifdef CONFIG_PERF_EVENTS
+TRACE_EVENT_PERF_PERM(riscv_tlb_flush_request,
+		      perf_allow_tracepoint());
+#endif
+
+#endif /* _TRACE_RISCV_TLB_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+
+#define TRACE_INCLUDE_PATH asm
+#define TRACE_INCLUDE_FILE riscv_tlb
+
+/* This part must be outside protection. */
+#include <trace/define_trace.h>
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 962db300a166..f66348a9b999 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -9,6 +9,9 @@
 #include <asm/mmu_context.h>
 #include <asm/cpufeature.h>
 
+#define CREATE_TRACE_POINTS
+#include <asm/riscv_tlb.h>
+
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
 /*
@@ -63,6 +66,32 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
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
+riscv_tlb_trace_flush_request(const struct cpumask *cmask, unsigned long start,
+			      unsigned long size, unsigned long stride,
+			      unsigned long asid, bool has_mm)
+{
+	enum riscv_tlb_flush_scope scope;
+
+	if (!trace_riscv_tlb_flush_request_enabled())
+		return;
+
+	scope = riscv_tlb_get_flush_scope(size, stride, has_mm);
+	trace_call__riscv_tlb_flush_request(start, size, stride, asid, has_mm,
+					    cmask, scope);
+}
+
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
@@ -70,12 +99,18 @@ static void __ipi_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
-	if (num_online_cpus() < 2)
+	riscv_tlb_trace_flush_request(cpu_online_mask, 0,
+				      FLUSH_TLB_MAX_SIZE, 0,
+				      FLUSH_TLB_NO_ASID, false);
+
+	if (num_online_cpus() < 2) {
 		local_flush_tlb_all();
-	else if (riscv_use_sbi_for_rfence())
-		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
-	else
+	} else if (riscv_use_sbi_for_rfence()) {
+		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE,
+					   FLUSH_TLB_NO_ASID);
+	} else {
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
+	}
 }
 
 struct flush_tlb_range_data {
@@ -105,6 +140,8 @@ static void __flush_tlb_range(struct mm_struct *mm,
 
 	cpu = get_cpu();
 
+	riscv_tlb_trace_flush_request(cmask, start, size, stride, asid, !!mm);
+
 	/* Check if the TLB flush needs to be sent to other CPUs. */
 	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
 		local_flush_tlb_range_asid(start, size, stride, asid);

---
base-commit: a5ae1bf65cee84bcc121d659e7e22a767853f5f5
change-id: 20260829-tlb_tracepoint-844105ab5092

Best regards,
-- 
Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
