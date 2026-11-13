Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D0606A88E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w33OCCjC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Boh0H29Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=duRCXxywHKGJfsyh9/2p1MgybH0ACyOw7WrTLY4+r0o=; b=w33OCCjCVTeKcN91KIr8GDy2nJ
	PvhbPvqHFSK8sAc0Vm03HGo1wAmyv1GbTaFNeXep1cvL8/bnBOd63IrZsDbas8jf6eEzmRJdQDXqU
	YuVPIwL9RJSK1ZDWXe8Cjx+oNCiz86TB/izVebgyYSJl/ow6vw53dep4jkOt76xxrr37HRcdl/T/1
	Zcy6kCKYmDdgQnl1ZoCTG41cufwUAg8YfXgsWLsc1+iYtrEjC0Dmt4qsJ2DG4LC1LMx8oibGoOXdv
	VwnWnS3D2W8BxcTveUepD4ado0tEXPfPElHuZh593MGR4AfW+XnU7hQ8zI6+UMWTRnIJkrYzw/sSI
	E9N+yPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBY-0000000Crud-1DZX;
	Fri, 13 Nov 2026 13:19:20 +0000
Received: from smtpout.efficios.com ([158.69.130.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBQ-0000000Crlp-3EPa;
	Fri, 13 Nov 2026 13:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575948;
	bh=rvc8V6tMkpwX750VfmxtJXX879RUjLM/1sI2Y+JFcqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Boh0H29Zy3W6/iojzvMBugxCcXuZoZT3to+7u1/yHQKomKH3AKEIAXwnGB/7mHayf
	 PIW+JgUgn4DoIBNp8rJ+Q8KNmJpezZ18gHlfgErrTvfk70hXhJ1zZbsiQ4N9T7FRKr
	 N0sNMyi+nLnBg/5F7/oeDU3GAOQUARkN4uS2wAhr6I8sVRA/4Pg09kQA7ADLhNwGbC
	 j5wjLPysp4cxWqM/aJRyC9XwZ3GrOUPER7eoDc9B4ml9amdSP+L4nuckccvb5GBknu
	 jHmUvGdWxFo/A7LfUJ1wRw2sLdJ9iZvtzDTIp7bZiAKJ9Rck0yWINC98sJilvopKFl
	 /yUOxT2LoZaWA==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyWw3t30zP36;
	Fri, 13 Nov 2026 08:19:08 -0500 (EST)
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
Subject: [RFC PATCH 01/16] sched/membarrier: Fix stale runqueue state after a lazy mm switch
Date: Fri, 13 Nov 2026 08:18:48 -0500
Message-Id: <20261113131903.157186-2-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
References: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051912_888993_69248530 
X-CRM114-Status: GOOD (  26.00  )
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

MEMBARRIER_CMD_GLOBAL_EXPEDITED sends an IPI to each CPU which runs
a registered process. It finds those CPUs with rq->membarrier_state,
a per-runqueue copy of the membarrier state of the mm.

Commit 227a4aadc75b ("sched/membarrier: Fix p->mm->membarrier_state
racy load") added the copy. The scheduler updates it when it switches
between two mm. A registration sends an IPI to update the runqueues
which keep running the mm.

membarrier_switch_mm() compares the previous active_mm with the next
mm. So it also skips the update when the previous task only borrowed
the mm. This is a kernel thread in lazy TLB mode, or a task past
exit_mm(). The copy can be stale in two such cases.

Case 1: a process registers while a lazy TLB kernel thread borrows
its mm on another CPU. T is a thread of a process with mm M, which is
not registered yet. S is a thread of another process.

  CPU 0                                        CPU 1

  T runs in user-space
    rq->membarrier_state == 0
  T migrates to CPU 1
  context_switch(T -> idle)
    idle borrows M as its active_mm
                                               context_switch(-> T)
                                               T: MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED
                                                 sets the state of M
                                                 sets rq->membarrier_state of CPU 1
                                                 CPU 0 runs idle: no IPI
                                               T migrates to CPU 0
  context_switch(idle -> T)
    membarrier_switch_mm(rq, idle->active_mm, T->mm)
      prev_mm == next_mm: no update
  T runs in user-space
    rq->membarrier_state == 0 (stale)
                                               S: MEMBARRIER_CMD_GLOBAL_EXPEDITED
                                                 CPU 0: state not set, no IPI

Case 2: a thread exits and the CPU then runs another thread of the
same process. A and B are threads of a registered process with mm M.
S is a thread of another process.

  CPU 0                                        CPU 1

  B exits
  exit_mm()
    B->mm = NULL
    membarrier_update_current_mm(NULL)
      rq->membarrier_state = 0
  context_switch(B -> A)
    membarrier_switch_mm(rq, B->active_mm, A->mm)
      prev_mm == next_mm: no update
  A runs in user-space
    rq->membarrier_state == 0 (stale)
                                               S: MEMBARRIER_CMD_GLOBAL_EXPEDITED
                                                 CPU 0: state not set, no IPI

kthread_unuse_mm() clears the copy in the same way as exit_mm().

In both cases, the registered process runs without the promised
memory barrier. This lasts until the CPU switches to the process from
another mm.

User-space sees this as a memory ordering failure. The registered
processes omit memory barriers from their fast paths. The caller
issues MEMBARRIER_CMD_GLOBAL_EXPEDITED where it needs those barriers.
An example is RCU-like synchronization over shared memory. Without the
IPI, the caller would miss a recent store of a registered process. It
would then, for example, free memory which that process still uses.
A thread exit in a registered multi-threaded process is enough to
trigger case 2.

Both cases were reproduced on v7.4-rc2: 1000 commands send no IPI to
the registered process.

Fix this by passing prev->mm rather than prev->active_mm. It is NULL
for a kernel thread and for an exited task, which forces the update.
The update is still skipped between two user tasks of the same mm.

Fixes: 227a4aadc75b ("sched/membarrier: Fix p->mm->membarrier_state racy load")
Cc: stable@vger.kernel.org
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/core.c  |  6 +++++-
 kernel/sched/sched.h | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1a088d4576f5..df6d15cf7109 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5551,7 +5551,11 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		else
 			prev->active_mm = NULL;
 	} else {					// to user
-		membarrier_switch_mm(rq, prev->active_mm, next->mm);
+		/*
+		 * Pass prev->mm, not prev->active_mm: see
+		 * membarrier_switch_mm().
+		 */
+		membarrier_switch_mm(rq, prev->mm, next->mm);
 		/*
 		 * sys_membarrier() requires an smp_mb() between setting
 		 * rq->curr / membarrier_switch_mm() and returning to userspace.
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 1d76950dbb0a..68353796a7f9 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3907,6 +3907,21 @@ static inline bool sched_energy_enabled(void) { return false; }
  * - prior user-space memory accesses and store to rq->membarrier_state,
  * - store to rq->membarrier_state and following user-space memory accesses.
  * In the same way it provides those guarantees around store to rq->curr.
+ *
+ * @prev_mm is the mm of the previous task. It is NULL for a kernel
+ * thread and for a task past exit_mm().
+ *
+ * The update is skipped only between two user tasks of the same mm.
+ * rq->membarrier_state is up to date in that case. It was set when
+ * the first of those tasks was scheduled in, or later by the
+ * registration IPI.
+ *
+ * It must not be skipped when the previous task only borrowed the mm
+ * as its active_mm. rq->membarrier_state can be stale then:
+ *
+ * - exit_mm() and kthread_unuse_mm() clear it,
+ * - a registration does not send an IPI to a CPU which runs a lazy
+ *   TLB kernel thread.
  */
 static inline void membarrier_switch_mm(struct rq *rq,
 					struct mm_struct *prev_mm,
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
