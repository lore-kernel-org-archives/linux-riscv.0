Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D5A606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 17:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DgwBLncu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p0gFO0+i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sWhSwE44jxld//Ac/Zuh9zUqbbxnjiix6IZiJz6oAkg=; b=DgwBLncuU88SEf
	0y286dvqJbYHV5nVhse3a+kJ+jyAQW/3kHr5zFGoVFMetXEI5eZwRBvv482mVEOEMyoxAZYFdjGZT
	1bq3+YHyeM5NcsTgbA/b1qrniJ05lBFY+EaQrhWkRRoK4bVxLvBbcY9tgXoWdnPyHrBaQGp7J2EFX
	iwVZWSA8hnukHN3ENr7FjppGxjnRO9JCfmT9IX41Qt/MZQEvPvc8xQ2IdpKEanypsYoh8WC/LE2Ei
	5hUz4HL5qusH1PRhWDFMXsce6cbZr5obX7qSwgyXJomVLAHUqm3pKzf5KrFLCF+ITjgH/qSqpZ/67
	+v2iFmT8mHQKgOQ9mpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIr2p-000000084hc-18zv;
	Mon, 19 Oct 2026 17:21:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIr2l-000000084h9-2VZ9
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 17:21:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so23009465e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2026 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792430461; x=1793035261; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1aDSC/6caT0lwDDexiAxkoUQe1Pgm8dLFVDyR39TkOI=;
        b=p0gFO0+iB+zLOS5VMJBJLP+/o4KfZ0VoorbTh2j3Xrr4CmySVPraYGKznnX696+rTt
         wn/0qg27FVOTEVmXSuHmulGTaJxHP8M17KFAJYUXdlRqh9IwDCy+nMHLKnMjzlbHnrEa
         6OBoX5HRVo3yvcJAP/b6FrF4JGVQzxsSBCJjuA1bs50A98n/7RFBUOxatpAgEsJo6uXG
         jHNPIm9BPPmICZ7kVBijoPjRHXubROMAZXeI4/g3TYQHM6vZNp39bUHulFMlPgxw6x3R
         Ei+V2IFu7L7zVXdhftyqvNNlO+1pjJ/tii3FctzET+AHukkrOhyDbDp9CHVHYgiLyvB6
         D0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430461; x=1793035261;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1aDSC/6caT0lwDDexiAxkoUQe1Pgm8dLFVDyR39TkOI=;
        b=Fu2WFZe6pJUhbDKBsBgfoKz3YFVCAsnhvqkj7VC2HdqtC/DoinYI6Pyrj0UQZvOyZZ
         MP+6TNFJxUlsXdxEREiJplY5tBCUUCFg6MWZ6yQH6UjiJqaUOMt/Agu8e+s5EVCPb7JY
         78HBicXHCBVeivgGTTSr1oMRl97jsg0A1x08a+4nB7DjD9w4ezJabIhY+kYrbbmHLxsS
         Oor5BjUwMS44mxae/EPko9sFVYw6dZbILFHvsIZFPSRr33Dab6D/+3DWfQQKGhcxdr7b
         etIHRkB03Ib+CzmhYHBDnM+VHxIqpUTKc8VNmd8SDV6buY3ACPhjMwYOz9WlhnFYymWW
         ceIw==
X-Forwarded-Encrypted: i=1; AKwUvBzo4euetRjmjoiHYyZ6EPT7C2E/gHL+UcDAtuxnaZxVJAFkNe68G1n8FWboncHNE1D+bkcaiLXIiROxJA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJJi8ISAULWV97d92DS+PkFXqbxYJt2sU99KILlMLfeQhi+uLJa
	Tr4uO6yAEYK0hfaoPH7CfX2XxLRkfvO4QuysqgXFRX6+slFyGK2O6XrN
X-Gm-Gg: AYBFou2NL6IVDnRXFryoRatqmJJ7VK4bkdcjTAfmsbYzSMIfcyFy2A+NRe6PeBvtNzF
	ETMtxpR7xQyekNG6SkBMX7wpcG4jITQ952isOUdMhKZGWmZVZvQNxx2QWpNufCOPnYEi9NzkvXT
	31bhJ1BJJv83vbR/rnJnkXZaWUMMWm1qlZI4hHdokMLRlLntMZKLCFWvkdSIvS+vw0dU+9AegZj
	0KgGoHcWV6DVkLF0iWkMAfk4anhJH8wZ6gBa9hDahyEu/SHrjA6LzLILIAS2BoFE1KKWlmaZMGc
	4MGw+CLCLaXHoRwkJz/NqWuAP706t0lA9mw7p9RVhOffnKIy/Y9mzIVj7YBq3bplB8F+Q8lqVKX
	FNf7EWmPg96q8/cNxMZZrdFOxWn0mOWLere8yden0wfcMNaxGtmmA8Qr3MLEjO3qkspLvtv1/Bj
	THpyGmZVc4ba3RauTRQfKsBQk8rPMTz2iz2hJBmh+TJ50IYugNMQ1TGkbYfcirA0l5F0mRNUCJ5
	8pIPr34w/gweuFHvYwAezYiNLhCv5cf
X-Received: by 2002:a05:600c:1909:b0:4a1:dbdd:d56b with SMTP id 5b1f17b1804b1-4a1dbddd68emr163879595e9.19.1792430460664;
        Mon, 19 Oct 2026 10:21:00 -0700 (PDT)
Received: from [127.0.1.1] (89-65-152-218.dynamic.play.pl. [89.65.152.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm9644465e9.0.2026.10.19.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:20:59 -0700 (PDT)
From: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
Date: Mon, 19 Oct 2026 19:20:51 +0200
Subject: [PATCH v7] riscv: mm: Trace TLB flush requests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261019-tlb_tracepoint-v7-1-4cc3e99d387a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PTWrDMBCG4asErasizejPXfUeJRTJGiWCxA6yM
 Q3Bd6+cRXFt2uU38LwwDzZQyTSwt8ODFZrykPuuDvtyYO3ZdyfiOdbNQIARDho+XsLnWHxLtz5
 3I3dKSaF90KIBVtGtUMpfz+DHse5zHsa+3J/9SS7XP1OT5JLHFD1FsmSVfD9dfb68tv2VLakJV
 hzFjkPlhK1zLaiYdNhy/OFSSL3juHBKWL/BEAxuufqfq8oToPMQokuWtlyvud1xXTlok4LGBr1
 NW27W3O24qVwqZY0C66z4xed5/gZFLFsV5wEAAA==
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
X-CRM114-CacheID: sfid-20261019_102103_788546_AF96DCAE 
X-CRM114-Status: GOOD (  23.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Tested local and shared-mm invalidations with
CONFIG_UBSAN_ALIGNMENT=y on QEMU virt without tracepoint-related
alignment warnings.

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

Tested local and shared-mm invalidations with
CONFIG_UBSAN_ALIGNMENT=y on QEMU virt without tracepoint-related
alignment warnings.
---
Changes in v7:
- Rename the tracepoint header to asm/tlb_trace.h to make its
  purpose explicit, as suggested by Steven Rostedt.
- Link to v6: https://lore.kernel.org/r/20261018-tlb_tracepoint-v6-1-14476427870f@gmail.com

Changes in v6:
- Change the scope field from u8 to u32 to ensure the dynamic
  CPU mask is properly aligned for bitmap operations.
- Verify local and shared-mm TLB flush tracing with
  CONFIG_UBSAN_ALIGNMENT=y on QEMU virt.
- Link to v5: https://lore.kernel.org/r/20261017-tlb_tracepoint-v5-1-256fb5393a7f@gmail.com

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
 arch/riscv/include/asm/tlb_trace.h | 103 +++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/tlbflush.c           |  45 ++++++++++++++--
 2 files changed, 144 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/tlb_trace.h b/arch/riscv/include/asm/tlb_trace.h
new file mode 100644
index 000000000000..60b48eb0d355
--- /dev/null
+++ b/arch/riscv/include/asm/tlb_trace.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM riscv_tlb
+
+#if !defined(_TRACE_RISCV_TLB_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RISCV_TLB_TRACE_H
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
+		__field(u32, scope)
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
+#endif /* _TRACE_RISCV_TLB_TRACE_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+
+#define TRACE_INCLUDE_PATH asm
+#define TRACE_INCLUDE_FILE tlb_trace
+
+/* This part must be outside protection. */
+#include <trace/define_trace.h>
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 962db300a166..9dcb07fb3ac0 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -9,6 +9,9 @@
 #include <asm/mmu_context.h>
 #include <asm/cpufeature.h>
 
+#define CREATE_TRACE_POINTS
+#include <asm/tlb_trace.h>
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
