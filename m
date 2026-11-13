Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECFC606A33B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KXLT6epb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=EnxNh76r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YmSEUJw6tKIUbhx9vhOyvrE7G4Asr/3PBCPuihqZjFs=; b=KXLT6epbR78j43UyWEvmOCZWPv
	wX/o4zscuemPgASTFgojPHoad2ToQfc6l5/P5mdWMrPCayEvH0Apb+XN5kY9YNWwUGfJ+gQq7Iyh9
	aFgbTkT77huzJ0KobQFb1klYfRDvxjE+blvF9WEYxCwx4xBlrNtq6d5DHjeetGryzKBIWW9dulQNC
	F30Ahf9Iglpyx2stdEZ/FrkVFIXc0g+XKUbWOi9NOzWJIPTm5PgpqLbin+fZAJjcbYEbCGJzvWdEO
	R97BCakVAwV1ju3mcKnRSbLbBrOJsRqkSEkXiFgBlHs3bEEnfCeFw4nOXRYJsKFjO8f+JlA40Fnbi
	MfnQsXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrC5-0000000CsNH-1b7v;
	Fri, 13 Nov 2026 13:19:53 +0000
Received: from smtpout.efficios.com ([2607:5300:400:ed00::31e5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBc-0000000CrxR-0Kj0;
	Fri, 13 Nov 2026 13:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575952;
	bh=6K5+1bJFXUKUg3IFl6qgg/BC25Z/G5ULg9pbLn4UPTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EnxNh76rEx+TrhUSzsnsZ3F3UT4G7JmFnAvOLo6y79PyIBiGOXO4WqcvtgE72z/My
	 XLC2uBUfs5RuTsJHWD7upDrBo2yWHu2qw00ST7Al48W+unxLZ8BcO64rq5v44UaUJG
	 ceddhO7H2rLjQWrMw6RoD3eygdTLKoWz6eaak4Nt3rN4oMAZ0/bzVhrBGx2A3X9WZ+
	 ed2zb6dOBn8sZzAi/6MdgfCFQyoG+LKrByO4Fd9u7jJvYSBqp5Sy5AJPSeeVkDdLO0
	 0lE7M6E5Wvw5G12zAdr1LZyZj/Q2uCcfbdxMx/wltow8YbrqtXEvHcy6UpX9CT5M4a
	 sRsxvpkpqemUA==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyX04hD8zPxN;
	Fri, 13 Nov 2026 08:19:12 -0500 (EST)
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
	linux-trace-kernel@vger.kernel.org
Subject: [RFC PATCH 16/16] selftests/membarrier: Check the core serialization of the sync core command
Date: Fri, 13 Nov 2026 08:19:03 -0500
Message-Id: <20261113131903.157186-17-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
References: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051924_306055_695004C4 
X-CRM114-Status: GOOD (  32.97  )
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

MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE promises more than a
memory barrier. Each running sibling thread of the caller executes a
core serializing instruction after the call starts, and before it
runs user-space code again. A thread which is not running executes
one before it resumes user-space. This supports memory reclaim by a
JIT compiler.

On x86, the kernel serializes the core in the IPI handler and in the
scheduler. membarrier_test_barrier counts the memory barriers of each
thread, but not these instructions.

Count them as well. These are the instructions, for x86-64:

 - sync_core() in ipi_sync_core(),
 - the writes to CR3 in switch_mm_irqs_off(),
 - sync_core() in finish_task_switch().

sync_core() issues SERIALIZE or IRET. An IRET cannot be probed, so the
instruction before it is probed instead.

The sync core test case then checks two more things:

 - A call makes each target execute a core serializing instruction
   in the IPI handler. A check where the target was scheduled out is
   dropped.

 - A target can be scheduled in after a task of another mm or after
   a kernel thread. The scheduler then executes a core serializing
   instruction before the target is scheduled out again.

These checks are skipped with page table isolation. The kernel then
serializes the core with the write to CR3 of each return to
user-space, in entry code which cannot be probed.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 .../membarrier/membarrier_test_barrier.bpf.c  |  11 +-
 .../membarrier/membarrier_test_barrier.c      | 102 +++++++++++++++++-
 .../membarrier/membarrier_test_barrier.h      |   6 ++
 3 files changed, 112 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_barrier.bpf.c b/tools/testing/selftests/membarrier/membarrier_test_barrier.bpf.c
index 46cfba13f00f..ce18089f8dab 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_barrier.bpf.c
+++ b/tools/testing/selftests/membarrier/membarrier_test_barrier.bpf.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Count the memory barriers which membarrier relies on, for each
- * registered thread.
+ * Count the memory barriers and the core serializing instructions which
+ * membarrier relies on, for each registered thread.
  *
  * See membarrier_test_barrier.c.
  */
@@ -40,6 +40,7 @@ struct {
 
 /* What the scheduler owes to the thread which it switched to. */
 #define OWES_BARRIER	1
+#define OWES_SYNC_CORE	2
 
 struct cpu_state {
 	/* Slot, plus one, of the thread which this CPU last switched to. */
@@ -111,6 +112,8 @@ int barrier_site(struct pt_regs *ctx)
 		slot = state->slot;
 		if (mask & (1U << MBT_SWITCH_MM))
 			state->owed &= ~OWES_BARRIER;
+		if (mask & (1U << MBT_SYNC_CORE_SWITCH))
+			state->owed &= ~OWES_SYNC_CORE;
 	} else {
 		slot = slot_of(bpf_get_current_task_btf());
 	}
@@ -131,13 +134,15 @@ int BPF_PROG(sched_switch, bool preempt, struct task_struct *prev,
 	/* The CPU leaves the thread which it last switched to. */
 	if (state->owed & OWES_BARRIER)
 		count(state->slot, 1U << MBT_SCHED_IN_MISSED);
+	if (state->owed & OWES_SYNC_CORE)
+		count(state->slot, 1U << MBT_SYNC_CORE_IN_MISSED);
 	count(slot_of(prev), 1U << MBT_SCHED_OUT);
 	slot = slot_of(next);
 	state->slot = slot;
 	state->owed = 0;
 	/* The cases which need a barrier after the store to rq->curr. */
 	if (slot && next->mm && prev->mm != next->mm) {
-		state->owed = OWES_BARRIER;
+		state->owed = OWES_BARRIER | OWES_SYNC_CORE;
 		count(slot, 1U << MBT_SCHED_IN);
 	}
 	return 0;
diff --git a/tools/testing/selftests/membarrier/membarrier_test_barrier.c b/tools/testing/selftests/membarrier/membarrier_test_barrier.c
index 46502d271242..a8152ec4eecd 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_barrier.c
+++ b/tools/testing/selftests/membarrier/membarrier_test_barrier.c
@@ -36,6 +36,9 @@
  * must then execute a memory barrier after the store to rq->curr,
  * before the target is scheduled out again.
  *
+ * The sync core command is checked in the same way, with the core
+ * serializing instructions.
+ *
  * The instructions are found by their bytes in the kernel text, which
  * is read from /proc/kcore. The list is for x86-64. It depends on what
  * the compiler inlines into the functions it names.
@@ -94,6 +97,10 @@ struct target_stats {
 	atomic_ulong sched_in;
 	/* Scheduled in without a barrier after the store to rq->curr. */
 	atomic_ulong sched_in_missed;
+	/* Checks where the target did not serialize its core. */
+	atomic_ulong sync_core_missed;
+	/* Scheduled in without a core serializing instruction. */
+	atomic_ulong sync_core_in_missed;
 };
 
 struct shared {
@@ -126,6 +133,9 @@ struct target {
 static struct shared *shared;
 static int shared_fd;
 
+/* The targets of this process also check the sync core guarantee. */
+static bool check_sync_core;
+
 static int sys_membarrier(int cmd, unsigned int flags, int cpu_id)
 {
 	return syscall(__NR_membarrier, cmd, flags, cpu_id);
@@ -190,6 +200,11 @@ enum match {
 	MATCH_CR3,
 	/* Instruction with a LOCK prefix. */
 	MATCH_LOCK,
+	/*
+	 * SERIALIZE or IRET, as issued by sync_core(). An IRET cannot be
+	 * probed: the instruction before it is probed instead.
+	 */
+	MATCH_SYNC_CORE,
 };
 
 struct site {
@@ -205,15 +220,21 @@ struct site {
 #define IPI		(1U << MBT_IPI)
 #define SYSCALL		(1U << MBT_SYSCALL)
 #define SWITCH_MM	(1U << MBT_SWITCH_MM)
+#define SYNC_CORE	(1U << MBT_SYNC_CORE)
+#define SYNC_CORE_SWITCH (1U << MBT_SYNC_CORE_SWITCH)
 
 static const struct site sites[] = {
 	{ "ipi_mb", MATCH_MB, IPI },
 	{ "ipi_sync_core", MATCH_MB, IPI },
+	{ "ipi_sync_core", MATCH_SYNC_CORE, SYNC_CORE },
 	{ "ipi_rseq", MATCH_MB, IPI },
 	{ "membarrier_global_expedited", MATCH_MB, SYSCALL },
 	{ "membarrier_private_expedited", MATCH_MB, SYSCALL },
-	/* Switch to another mm: write to CR3. It is a full barrier. */
-	{ "switch_mm_irqs_off", MATCH_CR3, SWITCH_MM, true },
+	/*
+	 * Switch to another mm: write to CR3. It is a full barrier and
+	 * it is core serializing.
+	 */
+	{ "switch_mm_irqs_off", MATCH_CR3, SWITCH_MM | SYNC_CORE_SWITCH, true },
 	/* Switch to the mm which the CPU kept in lazy TLB mode: smp_mb(). */
 	{ "switch_mm_irqs_off", MATCH_MB, SWITCH_MM, true },
 	/*
@@ -221,6 +242,8 @@ static const struct site sites[] = {
 	 * locked instruction of this function counts as well.
 	 */
 	{ "finish_task_switch", MATCH_LOCK, SWITCH_MM, true },
+	/* membarrier_mm_sync_core_before_usermode() */
+	{ "finish_task_switch", MATCH_SYNC_CORE, SYNC_CORE_SWITCH, true },
 };
 
 struct probe {
@@ -319,6 +342,7 @@ static void scan_function(const struct site *site, const struct ksym *sym,
 {
 	unsigned char *text;
 	size_t i, left;
+	int32_t imm;
 
 	text = malloc(size);
 	if (!text || !read_kernel(sym->addr, text, size)) {
@@ -350,6 +374,24 @@ static void scan_function(const struct site *site, const struct ksym *sym,
 			if (insn[0] == 0xf0)
 				probe_insn(site, sym, addr);
 			break;
+		case MATCH_SYNC_CORE:
+			/* SERIALIZE is 0f 01 e8. */
+			if (left >= 3 && insn[0] == 0x0f && insn[1] == 0x01 &&
+			    insn[2] == 0xe8) {
+				probe_insn(site, sym, addr);
+				break;
+			}
+			/*
+			 * iret_to_self() is "pushq $1f; iretq; 1:". Probe the
+			 * push.
+			 */
+			if (left < 7 || insn[0] != 0x68 || insn[5] != 0x48 ||
+			    insn[6] != 0xcf)
+				break;
+			memcpy(&imm, insn + 1, sizeof(imm));
+			if (imm == (int32_t)(addr + 7))
+				probe_insn(site, sym, addr);
+			break;
 		}
 	}
 	free(text);
@@ -624,8 +666,9 @@ static bool check_call(const uint64_t *counters, struct target_stats *stats)
 	unsigned long done = atomic_load(&shared->done);
 	uint64_t ipi = counter(counters, MBT_IPI);
 	uint64_t sched_out = counter(counters, MBT_SCHED_OUT);
+	uint64_t sync_core = counter(counters, MBT_SYNC_CORE);
 	unsigned long started = atomic_load(&shared->started);
-	bool by_ipi, scheduled;
+	bool by_ipi, scheduled, serialized;
 	int spins = 0;
 
 	/* A call is in flight. */
@@ -637,6 +680,7 @@ static bool check_call(const uint64_t *counters, struct target_stats *stats)
 	}
 	by_ipi = counter(counters, MBT_IPI) != ipi;
 	scheduled = counter(counters, MBT_SCHED_OUT) != sched_out;
+	serialized = counter(counters, MBT_SYNC_CORE) != sync_core;
 	if (scheduled) {
 		atomic_fetch_add(&stats->by_sched, 1);
 		return true;
@@ -648,6 +692,8 @@ static bool check_call(const uint64_t *counters, struct target_stats *stats)
 		atomic_fetch_add(&stats->by_ipi, 1);
 	else
 		atomic_fetch_add(&stats->missed, 1);
+	if (check_sync_core && !serialized)
+		atomic_fetch_add(&stats->sync_core_missed, 1);
 	return true;
 }
 
@@ -658,7 +704,8 @@ static void run_target(const struct target *target)
 	const uint64_t *counters;
 	long deadline = now_ms() + target->ms;
 	unsigned long checks = 0;
-	uint64_t first_ipi, first_sched_in;
+	uint64_t first_ipi, first_sched_in, first_sync_core_missed;
+	uint64_t first_sched_out;
 
 	if (target->cpu >= 0 && pin_to_cpu(target->cpu))
 		setup_error("sched_setaffinity");
@@ -671,6 +718,18 @@ static void run_target(const struct target *target)
 	atomic_fetch_add(&shared->ready, 1);
 	while (!atomic_load(&shared->registered) && !atomic_load(&shared->stop))
 		sched_yield();
+	/*
+	 * The scheduler serializes the core of a registered process
+	 * only. The target may have been scheduled in before the
+	 * registration. So wait until it is scheduled out, and count
+	 * from there.
+	 */
+	first_sched_out = counter(counters, MBT_SCHED_OUT);
+	while (check_sync_core &&
+	       counter(counters, MBT_SCHED_OUT) == first_sched_out &&
+	       !atomic_load(&shared->stop))
+		usleep(1000);
+	first_sync_core_missed = counter(counters, MBT_SYNC_CORE_IN_MISSED);
 	first_ipi = counter(counters, MBT_IPI);
 	first_sched_in = counter(counters, MBT_SCHED_IN);
 	while (!atomic_load(&shared->stop)) {
@@ -690,6 +749,10 @@ static void run_target(const struct target *target)
 			 counter(counters, MBT_SCHED_IN) - first_sched_in);
 	atomic_fetch_add(&stats->sched_in_missed,
 			 counter(counters, MBT_SCHED_IN_MISSED));
+	if (check_sync_core)
+		atomic_fetch_add(&stats->sync_core_in_missed,
+				 counter(counters, MBT_SYNC_CORE_IN_MISSED) -
+				 first_sync_core_missed);
 }
 
 static void *target_thread(void *arg)
@@ -816,6 +879,9 @@ static void sum_stats(int first, int nr, struct target_stats *sum)
 		sum->ipis += atomic_load(&stats->ipis);
 		sum->sched_in += atomic_load(&stats->sched_in);
 		sum->sched_in_missed += atomic_load(&stats->sched_in_missed);
+		sum->sync_core_missed += atomic_load(&stats->sync_core_missed);
+		sum->sync_core_in_missed +=
+			atomic_load(&stats->sync_core_in_missed);
 	}
 }
 
@@ -828,6 +894,8 @@ static void sum_stats(int first, int nr, struct target_stats *sum)
 	       __sum.by_ipi, __sum.by_sched, __sum.ipis);		\
 	EXPECT_EQ(__sum.missed, 0);					\
 	EXPECT_EQ(__sum.sched_in_missed, 0);				\
+	EXPECT_EQ(__sum.sync_core_missed, 0);				\
+	EXPECT_EQ(__sum.sync_core_in_missed, 0);			\
 	EXPECT_GT(__sum.by_ipi + __sum.by_sched + __sum.missed, 0);			\
 } while (0)
 
@@ -902,8 +970,34 @@ TEST(private_expedited)
 		     MEMBARRIER_CMD_PRIVATE_EXPEDITED);
 }
 
+/*
+ * With page table isolation, the kernel serializes the core with the
+ * write to CR3 of each return to user-space. This write is in the entry
+ * code, which cannot be probed.
+ */
+static bool page_table_isolation(void)
+{
+	char *line = NULL;
+	bool pti = false;
+	size_t len = 0;
+	FILE *f;
+
+	f = fopen("/proc/cpuinfo", "r");
+	if (!f)
+		return false;
+	while (!pti && getline(&line, &len, f) >= 0)
+		pti = !strncmp(line, "flags", 5) &&
+		      (strstr(line, " pti ") || strstr(line, " pti\n"));
+	free(line);
+	fclose(f);
+	return pti;
+}
+
 TEST(private_expedited_sync_core)
 {
+	check_sync_core = !page_table_isolation();
+	if (!check_sync_core)
+		TH_LOG("page table isolation: core serialization not checked");
 	test_private(_metadata,
 		     MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE,
 		     MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE);
diff --git a/tools/testing/selftests/membarrier/membarrier_test_barrier.h b/tools/testing/selftests/membarrier/membarrier_test_barrier.h
index d615ad1d9e8a..7c31d8cba544 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_barrier.h
+++ b/tools/testing/selftests/membarrier/membarrier_test_barrier.h
@@ -24,6 +24,12 @@ enum {
 	 * the scheduler executed no memory barrier in between.
 	 */
 	MBT_SCHED_IN_MISSED,
+	/* Core serializing instruction of the membarrier IPI handler. */
+	MBT_SYNC_CORE,
+	/* Core serializing instruction of the scheduler. */
+	MBT_SYNC_CORE_SWITCH,
+	/* Like MBT_SCHED_IN_MISSED, for a core serializing instruction. */
+	MBT_SYNC_CORE_IN_MISSED,
 	MBT_NR_COUNTERS,
 };
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
