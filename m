Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B855606A8B0
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rrGgpH7w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=XzFBQinm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P1YBiLQtL0V7UZGQa8fLiTqvl4dkIFnN5hm901FPe7w=; b=rrGgpH7w5cz++syBpiJXazoU0s
	gtPJDcO0gd2wWnh0R6MA0OWUcEwE1fXDFTgM1tr965HNLQgQHgHjUGGb1raMSGbZqoU2+xae2/RT7
	4nRTttu0e17vHpejXYBXPAVrf9WFM6QbN8QPWoCwH9d/7F8YV6ndCo9OR15d6USM5nC8G9Q9l57/u
	Xek9HTJcbHnoA7yI+QKIxguDHKrfbo8FhsOuEVC+OhcoA6SG4t+6EInxSPu9iKhj6vK1sc9JPzZqG
	433nwUNYGfB9LCMbn6zyQ+zbuzQXypduvsNbetvnO2UGghV2I28h1mUn4UaBXfhi/VSowFR6BJwHj
	KGYQy0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBm-0000000Cs65-06rS;
	Fri, 13 Nov 2026 13:19:34 +0000
Received: from smtpout.efficios.com ([158.69.130.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBU-0000000Crpp-1eDq;
	Fri, 13 Nov 2026 13:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575950;
	bh=MfSMwXSAWBd4ItZsKrFa1iXIKNYRq7JCuBaisKgh7Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XzFBQinmY6fr9eGhf2cbtfzg/1faOcgzEfBG8sRtll1K4eiA9z+xy6NK05lIDWKlj
	 kNySDgTBw731Hug+iba6DV9A8A2GHSMxVNC9OMzVhRoZd1UBtnPgnvXUPffB9Srbz3
	 BmCvNaKRs077KN/Pm392V5d1O2PTUuBybv92UVIomLJ6rY2//OJElrbXP49mAhylJ4
	 8zUBSUy7RE98POsyXfrpd4aKo6WZ0d1OxzhW72JLRKBuO8J5wZ5ZTlq//d9pvQ71YL
	 iyqCJZph1ZigjdlDYW6WE1w9cuab/DhZykEg3kX/56qv6g5/Wrjv/1ue7v14f+Vh3X
	 tESQLk/L/TApg==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyWy3XCtzPX2;
	Fri, 13 Nov 2026 08:19:10 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Michal Clapinski <mclapinski@google.com>,
	Andrei Vagin <avagin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Aniket Gattani <aniketgattani@google.com>,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Gellermann <christian.gellermann@codasip.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-openrisc@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	linux-arch@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	lkmm@lists.linux.dev,
	bpf@vger.kernel.org,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RFC PATCH 08/16] LoongArch: membarrier: Add full memory barrier in switch_mm()
Date: Fri, 13 Nov 2026 08:18:55 -0500
Message-Id: <20261113131903.157186-9-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
References: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051916_572961_7B7B70E2 
X-CRM114-Status: GOOD (  26.02  )
X-Spam-Score: -4.4 (----)
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

The expedited membarrier commands need a full memory barrier after
the scheduler stores to rq->curr, before the CPU returns to
user-space. membarrier() skips the IPI to a CPU which it sees running
another mm. This barrier orders the user-space accesses of the
incoming thread after that check. See scenario (A) in
kernel/sched/membarrier.c.

LoongArch has no dedicated barrier. It used to get it from
spin_unlock() in finish_lock_switch(), which was a full barrier
("dbar 0").

This is no longer true. Commit e031a5f3f1ed ("LoongArch: Support dbar
with different hints") made smp_store_release() an ordering barrier
("dbar 0b10010"). It does not order a previous store with a following
load. That commit kept a full barrier in queued_spin_unlock(). Commit
9c68ece8b2a5 ("LoongArch: Define the __io_aw() hook as mmiowb()") then
removed it.

Nothing else is a full barrier on a switch between two user
processes. switch_mm_irqs_off() writes CSRs and sets a bit in the mm
cpumask with a plain "amor". finish_task() uses smp_store_release().

The LoongArch manual lists the instructions which order memory
accesses: DBAR, IBAR, the AM*_DB instructions and LL/SC pairs. A CSR
write and ERTN are not among them.

This was found by reading the code and the architecture manual. On
Loongson-3A6000 or newer, a thread which is scheduled in would run
user-space code without the barrier which membarrier promised to the
caller. User-space would see a memory ordering failure: the caller of
an expedited membarrier command would miss a recent store of that
thread. Older processors treat every dbar hint as "dbar 0" and are not
affected.

Do as powerpc and riscv: add membarrier_arch_switch_mm() and call it
from switch_mm_irqs_off() when the mm changes. It issues smp_mb()
only when the next mm registered for an expedited command.

Compile-tested only.

Fixes: 9c68ece8b2a5 ("LoongArch: Define the __io_aw() hook as mmiowb()")
Cc: stable@vger.kernel.org
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 arch/loongarch/Kconfig                   |  1 +
 arch/loongarch/include/asm/membarrier.h  | 33 ++++++++++++++++++++++++
 arch/loongarch/include/asm/mmu_context.h |  4 +++
 3 files changed, 38 insertions(+)
 create mode 100644 arch/loongarch/include/asm/membarrier.h

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index b5ed4881d3c0..be6e7545d646 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -22,6 +22,7 @@ config LOONGARCH
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_KERNEL_FPU_SUPPORT if 64BIT && CPU_HAS_FPU
+	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PREEMPT_LAZY
diff --git a/arch/loongarch/include/asm/membarrier.h b/arch/loongarch/include/asm/membarrier.h
new file mode 100644
index 000000000000..1789f878821f
--- /dev/null
+++ b/arch/loongarch/include/asm/membarrier.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_LOONGARCH_MEMBARRIER_H
+#define _ASM_LOONGARCH_MEMBARRIER_H
+
+static inline void membarrier_arch_switch_mm(struct mm_struct *prev,
+					     struct mm_struct *next,
+					     struct task_struct *tsk)
+{
+	/*
+	 * Only need the full barrier when switching between processes.
+	 * Barrier when switching from kernel to userspace is not
+	 * required here, given that it is implied by mmdrop(). Barrier
+	 * when switching from userspace to kernel is not needed after
+	 * store to rq->curr.
+	 */
+	if (IS_ENABLED(CONFIG_SMP) &&
+	    likely(!(atomic_read(&next->membarrier_state) &
+		     (MEMBARRIER_STATE_PRIVATE_EXPEDITED |
+		      MEMBARRIER_STATE_GLOBAL_EXPEDITED))))
+		return;
+
+	/*
+	 * The membarrier system call requires a full memory barrier
+	 * after storing to rq->curr, before going back to user-space.
+	 *
+	 * Nothing else provides it on this path. spin_unlock() and
+	 * smp_store_release() are ordering barriers ("dbar 0b10010"):
+	 * they do not order a previous store with a following load.
+	 */
+	smp_mb();
+}
+
+#endif /* _ASM_LOONGARCH_MEMBARRIER_H */
diff --git a/arch/loongarch/include/asm/mmu_context.h b/arch/loongarch/include/asm/mmu_context.h
index 304363bd3935..dba62dd7a131 100644
--- a/arch/loongarch/include/asm/mmu_context.h
+++ b/arch/loongarch/include/asm/mmu_context.h
@@ -9,6 +9,7 @@
 
 #include <linux/errno.h>
 #include <linux/sched.h>
+#include <linux/sched/mm.h>
 #include <linux/mm_types.h>
 #include <linux/smp.h>
 #include <linux/slab.h>
@@ -91,6 +92,9 @@ static inline void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *
 	bool need_flush = false;
 	unsigned int cpu = smp_processor_id();
 
+	if (prev != next)
+		membarrier_arch_switch_mm(prev, next, tsk);
+
 	/* Check if our ASID is of an older version and thus invalid */
 	if (!asid_valid(next, cpu))
 		get_new_mmu_context(next, cpu, &need_flush);
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
