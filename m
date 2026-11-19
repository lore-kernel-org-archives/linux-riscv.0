Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C7606A339
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tLXVLCGJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HlfGxi6L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DeebP/TlYots7Lgm91qtLuXPAiOg1eYI6364gKnSnqM=; b=tLXVLCGJwxeIL0C8JGq0cV0r+7
	IruPu5uEGXlehnuVxClXj23dIf8GlnBgnz/PJHz8iMMObBDp+xXq+nUbGn5sz0s178tZ3dP1mSTrn
	pyY4R+9BahTEbdMb0Ruvg4keBUj2HHGNouW2fPVWK2oIv3Y0JdDpPJ+1EDW69TjxxIrjJxTc+s3Nj
	c4xtc0YfFhXh9TZeqSB+zBSEbnAn8y15yVljHa3E7SRzTjF29pzbo94o2hC710UX48FDKHlKXXkSh
	feV8qYbBxpIQAd6n5DN63I8Vb4xsRdyuk8OUVPsqam4a8dntch++3+YcPf5Y3LhfJK4aayNVu3z28
	bPRovYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xs-0000000BnN0-0aC6;
	Thu, 19 Nov 2026 12:10:08 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0xp-0000000BnJF-0M1P
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 12:10:06 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3282db206d3so5752674eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 04:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090203; x=1795695003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBWgjTIBdjRYedM5vWqNsq+cxEewFYhLyP8m5/StiLc=;
        b=HlfGxi6LXfz6s7Uo2nc6IbflBZNvrltm63h/VR5kZOGmrUW0SHOHuSuiMkcYJA4/qU
         LFzPLeWzKk5F9GhAdv7rblKFz87l4m8HFEFOmrc1MBrp1PMAuQp3xVQq4ju+C589oJZJ
         4zDRlXjjdba+Rnhq+2y/jFemQOSB+kfoCkm4mGWJLeFHXXiaUw1QmpjTHp/7igqzIIUn
         sSJ8FkKIy7mIdUe/py2nM2TTNsq6uU7s8bBMEddG3DLjLWI0osQs7nJGgp8Z8IWgW+z3
         cY8GJ+lIRE9EArt7O4Hl0l1qKeU7/XE3FQaZAVEWGDaEeuqbaUHD/WvpfvfLaeB05pop
         2rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090203; x=1795695003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBWgjTIBdjRYedM5vWqNsq+cxEewFYhLyP8m5/StiLc=;
        b=PUHBklKZ80QsBap3zMBhYAqJK+V3RzV2aUSebLc8JlNzcDCZBTbpUhxwThk+5oqt0+
         dQdojA1odFp///DPjmXNqAW3Qwr2sfe9GCvNnf/rz3JfPfLgARg6ciNMtdqxtky+mIFX
         dmcc6MjqRqcKu6kIzxw1vhGXrII2I/ikSoQI4bstkq/y3otb33E/klvGwHIXiQEF15bD
         hLRURnq2XX6GZgZYGS/xu/TNckck7lYlx4pEgkN0vzQGWKiXNuxPCHQMRLRjrCU99lPK
         7LEtuMdNtlESfI/QLnOqM1vby7ZqiOWO7YRPYEut5cdr8JOPR+/yZMxQhQVNf8xWdUfR
         EeIA==
X-Forwarded-Encrypted: i=1; AL+hErG2C/mzLrJXAhS0NkQqzSFdX8LcKGaBRtjrGdJ4WmZDKmspLfqtsfVs9Oo6YO1hjL0vbb8of+pgHNypNw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9T1JsHgcx/2aOlAXDzztKIPqiZO1REVaEXhDDVdYVu3WpVhl54
	GJeDRVoVuSBtIP1W2Ox4nwJ8NWXBF5EOCOUImOG6NXgzy0RbYopy2Gy7WV1UPt5KBB0=
X-Gm-Gg: AZFdTZcUwT9ct1gq8LZ8KpUDDOmNJbbXsDhWNEckCVI7SvGxs3n6m/eOa+aG8rmt1J1
	egEStv9dyA27RweXLRkaOAftH8LTaKcQrKq9Wj01K2E+oCzQwWtoKfeh2IGWoP0fg35ZhH5PzDO
	ThRTGECIzgcaB8VvyWc/vB4nz15Dq6rzDy3ZU9OhaYIvjg4bcOHydxqu+gsoaU4KmqX71mi30bG
	QeFs1ZbsHTDVymoS4kf60de73udjdiMaciD5rfuB3++e50NN37XNlByB7R2DnLJIMMv/7hJ1UOc
	8TG8eEcumNbYh4WUt5o1yPRrClBe8ddeKecl5wJuHSZXD+YB+EimaRo2e3pjCcSYAdLsdvAqEWB
	XXWs1/+M7WKtZ4s+szX0JRwHNCuUm6vFsgNBJF3Ne//frEvQj4vpTy6mb2cfFNAy9ClSaOhLq2w
	eBRydSO4D9HiRnytT97xhLe3lk4N/mvMmV4UiIBv/0JSUgRTwoVmqa2uxylP1BNKfPNgfWdmwto
	KdC4nY/54N8+5i6daur7Qx+uu0eYSmxAbYkxz7ajufaVicp6TXjKc+lOwhWi5Jdmqu3lDNhQ4cv
	LP4/gEFLdhcf6eLDobZbIYU+akHnPBsiqKLIROps8BSNIDKIztAxySkIG2eUHL0l2LeLqk6+UbP
	Ef/OFCWw=
X-Received: by 2002:a05:7301:e8e:b0:381:e8f2:c006 with SMTP id 5a478bee46e88-38280f20365mr7681950eec.28.1795090202481;
        Thu, 19 Nov 2026 04:10:02 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:10:02 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 07/11] perf: RISC-V: support callchains with SSE delivery
Date: Thu, 19 Nov 2026 20:08:31 +0800
Message-ID: <20261119120824.13969-20-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_041005_156977_39C4C224 
X-CRM114-Status: GOOD (  22.56  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PMU overflow delivery through SSE enters Linux with a synthetic supervisor
context on a dedicated event stack. The perf unwinder must use the context
interrupted by the overflow rather than treating the SSE handler frame as
the sampled frame.

Use the interrupted pt_regs published by the RISC-V SSE entry path. Walk a
kernel callchain only when the interrupted PC, SP, and frame pointer are
consistent with the current task stack. For sensitive entry windows and
IRQ stacks whose bounds cannot be proven, retain the interrupted PC without
following an unsafe frame chain.

User callchains continue through the existing nofault RISC-V user unwinder.
If hstatus.SPV says the interrupted context was a guest, do not interpret
the guest stack through the host address space.

DWARF callchains additionally copy a raw user stack. Provide an SSE-aware
riscv_perf_out_copy_user() following x86's copy_from_user_nmi().
The copy runs under pagefault_disable(), so a non-resident source
page takes an exception-table handled fault that returns the number
of bytes not copied
instead of entering handle_mm_fault() or opening an interrupt window, and
perf truncates the user-stack dump accordingly. The SSE entry saves and
restores the interrupted task's stack metadata across that nested trap.

In SSE context also check access_ok(), require a user mm, and compare
the active page-table root with current->mm before copying. This rejects
a mismatched root, but does not exclude stale translations in the window
between a satp update and the following TLB flush. It is not a complete
equivalent of x86's nmi_uaccess_okay(). Outside SSE, retain the existing
inatomic copy with page faults disabled.

Susheng Yang reported this failure with perf callchain workloads.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
Reported-by: Susheng Yang <yang.susheng@zte.com.cn>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/perf_event.h |  10 ++
 arch/riscv/kernel/perf_callchain.c  | 140 ++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index bcc928fd3785..ddc404794751 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -18,6 +18,16 @@
 	(regs)->sp = current_stack_pointer; \
 	(regs)->status = SR_PP; \
 }
+
+#ifdef CONFIG_RISCV_SBI_SSE
+/*
+ * Raw user-stack sampling can run in the NMI-like SSE context. Route it
+ * through an implementation that does not fault on a non-resident page.
+ */
+unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
+				       unsigned long n);
+#define arch_perf_out_copy_user riscv_perf_out_copy_user
+#endif
 #endif
 
 #endif /* _ASM_RISCV_PERF_EVENT_H */
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..216f5bd14c00 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
 
+#include <linux/kallsyms.h>
+#include <linux/mm.h>
 #include <linux/perf_event.h>
+#include <linux/sched/task_stack.h>
+#include <linux/thread_info.h>
 #include <linux/uaccess.h>
 
+#include <asm/csr.h>
+#include <asm/sse.h>
 #include <asm/stacktrace.h>
 
 static bool fill_callchain(void *entry, unsigned long pc)
@@ -11,6 +17,126 @@ static bool fill_callchain(void *entry, unsigned long pc)
 	return perf_callchain_store(entry, pc) == 0;
 }
 
+#ifdef CONFIG_RISCV_SBI_SSE
+static bool sse_addr_on_task_stack(unsigned long addr, unsigned long size)
+{
+	unsigned long end = addr + size;
+	unsigned long stack;
+
+	if (end < addr)
+		return false;
+
+	stack = (unsigned long)task_stack_page(current);
+	if (addr >= stack && end <= stack + THREAD_SIZE)
+		return true;
+
+	return false;
+}
+
+static bool sse_kernel_regs_safe(struct pt_regs *regs)
+{
+	unsigned long fp = frame_pointer(regs);
+	unsigned long pc = instruction_pointer(regs);
+	unsigned long sp = user_stack_pointer(regs);
+
+	if (!__kernel_text_address(pc))
+		return false;
+	if (!sse_addr_on_task_stack(sp, sizeof(unsigned long)))
+		return false;
+	if (fp < sizeof(struct stackframe))
+		return false;
+
+	return sse_addr_on_task_stack(fp - sizeof(struct stackframe),
+				      sizeof(struct stackframe));
+}
+
+static bool sse_callchain_is_guest(const struct riscv_sse_interrupted_context *context)
+{
+	return context && (context->hstatus & HSTATUS_SPV);
+}
+
+static bool sse_callchain_kernel(struct perf_callchain_entry_ctx *entry,
+				 struct pt_regs *regs)
+{
+	const struct riscv_sse_interrupted_context *context;
+	unsigned long pc;
+
+	context = riscv_sse_get_interrupted_context();
+	if (!context || context->regs != regs)
+		return false;
+
+	/* A guest stack cannot be walked using the host kernel address space. */
+	if (sse_callchain_is_guest(context))
+		return true;
+
+	if (user_mode(regs))
+		return true;
+
+	if (sse_kernel_regs_safe(regs)) {
+		walk_stackframe(NULL, regs, fill_callchain, entry);
+		return true;
+	}
+
+	/*
+	 * Keep the sample useful for sensitive entry paths and IRQ stacks. The
+	 * generic walker does not take explicit IRQ stack bounds, and its
+	 * THREAD_SIZE alignment assumption fails for non-vmapped IRQ stacks.
+	 * Conservatively avoid walking IRQ stacks in every configuration.
+	 */
+	pc = instruction_pointer(regs);
+	if (__kernel_text_address(pc))
+		perf_callchain_store(entry, pc);
+
+	return true;
+}
+
+unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
+				       unsigned long n)
+{
+	unsigned long ret;
+
+	/*
+	 * Raw user-stack sampling can run in the NMI-like SSE context. Mirror
+	 * x86's copy_from_user_nmi(): the copy may take a page fault, but it
+	 * must not fault a non-resident page in. pagefault_disable() keeps the
+	 * RISC-V fault handler on the nofault exception-table fixup (no
+	 * handle_mm_fault(), no interrupt window), and the SSE entry saves and
+	 * restores the interrupted task's stack metadata across that nested
+	 * trap. A fault therefore returns the number of bytes not copied, and
+	 * perf truncates the user-stack dump accordingly.
+	 *
+	 * In SSE context also approximate x86's nmi_uaccess_okay(): only sample
+	 * when the active page table root still matches current->mm, so we do
+	 * not walk an unrelated address space after interrupting a KVM guest, a
+	 * kernel thread, or a task whose mm is being swapped. This root check
+	 * does not close the window inside switch_mm() between writing satp and
+	 * flushing the local TLB (RISC-V has no LOADED_MM_SWITCHING marker like
+	 * x86); that is a window between instructions, not within one. In that
+	 * window a stale TLB entry may still resolve to the outgoing mapping, and
+	 * with ASID reuse the residue can even belong to an unrelated address
+	 * space. The nofault fixup only bounds faulting accesses; it cannot
+	 * detect a successful hit on a stale translation. This is therefore a
+	 * bounded sample-quality gap (a mis-attributed or truncated user-stack
+	 * dump), not a memory-safety hazard: the copy target is the perf ring
+	 * buffer and the length is bounded, so a stale read cannot corrupt an
+	 * unrelated kernel object.
+	 */
+	if (riscv_sse_get_interrupted_context()) {
+		if (!access_ok(src, n))
+			return n;
+		if (!current->mm ||
+		    (csr_read(CSR_SATP) & SATP_PPN) != virt_to_pfn(current->mm->pgd))
+			return n;
+	}
+
+	pagefault_disable();
+	ret = __copy_from_user_inatomic(dst, src, n);
+	pagefault_enable();
+
+	return ret;
+}
+#endif
+
 /*
  * This will be called when the target is in user mode
  * This function will only be called when we use
@@ -28,6 +154,15 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_SBI_SSE
+	const struct riscv_sse_interrupted_context *context;
+
+	context = riscv_sse_get_interrupted_context();
+	/* A guest stack cannot be walked using the host address space. */
+	if (sse_callchain_is_guest(context))
+		return;
+#endif
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
@@ -39,6 +174,11 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_SBI_SSE
+	if (sse_callchain_kernel(entry, regs))
+		return;
+#endif
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
