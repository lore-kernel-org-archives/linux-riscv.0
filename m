Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1732606A899
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sk46rCCF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=AzlCAT/j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IwpTH/RCmkYVCbZDCbnfNJHYP4m3zGhDpy/QoLbEmj4=; b=Sk46rCCFUmKKuUa3sDf7UBySjU
	e4GpS8Gr3jjQYxwgZ38zCL/am/XqHghk4H/aghQVShkiokOXyhVAJGZWqLtBaz2gwtFmhsN6D9apg
	oXwZsEOm+BdtEzOk0oyAaVK7XmDZixnsLvYZX6jmRHN+DSvAQWkwd7PvXxovZFpn96gLOdKBkXkkh
	7akYXGzIipQg8PnX55G2MomDmcjoXXfmEGANOf2ZNIzldjPo/LTKyeaXrT/wl2oVbu4ZyCWFtg4Mx
	iBoDuaGM+yHFXnCmVy7CanQvkHVVk2TXDPeT377Wv3gxzDBQbAYEmrBYnE1FnQ8eXkTGHJLlU8F6s
	RZgAUZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBb-0000000Crxm-3wwz;
	Fri, 13 Nov 2026 13:19:23 +0000
Received: from smtpout.efficios.com ([158.69.130.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBQ-0000000Crlo-3Jm8;
	Fri, 13 Nov 2026 13:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575948;
	bh=gyhWEGPSHfYR4qbwYVwABlTiCA1xCTefy5QMkyAB5W0=;
	h=From:To:Cc:Subject:Date:From;
	b=AzlCAT/j7fqqtuF7QGjbYmq5H061yEAjMAcNYXS5gbzsdpsTc3cz5EUb9bwND5lDi
	 WSOnEx6zP+PD0JSUVM1MBnBhTU5UF4FLBzLFzpICMdvFWbzkaPNptk0BAVOVi4LipM
	 Oz+nqW2NdeburbIbjm6AvCagXRtp6KVFWI9Wbo6YNDzslqFLvm6BLgP9/cBBXxCgIk
	 GbMYq28n0TxDtW/I5VcfRAA2uNzsHeiqsvKxiZ9Ixg0p/e7H7d9Z9S3KT8OZ+2Ug93
	 TMin1Xyqplf8qKCaTcAhedXCORxPyFzuN8ayYPQ2nz8YeS96LERo20yIWbax+u3PY6
	 ygIk+wgrvhPPw==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyWw1czwzP35;
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
	linux-trace-kernel@vger.kernel.org
Subject: [RFC PATCH 00/16] membarrier: fixes, selftests and documentation
Date: Fri, 13 Nov 2026 08:18:47 -0500
Message-Id: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051912_909857_B6B29F21 
X-CRM114-Status: GOOD (  24.15  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series comes from a review of the membarrier system call. The
review covered the code, its selftests and the fixes applied over
time. It also covered the barrier and core serialization requirements
of each architecture.

The series fixes four kernel issues:

 - Patch 1: update the runqueue membarrier state when the scheduler
   switches from a kernel thread or an exited task which borrowed the
   mm. MEMBARRIER_CMD_GLOBAL_EXPEDITED no longer skips a registered
   process.

 - Patch 2: report a registration in MEMBARRIER_CMD_GET_REGISTRATIONS
   only when it completed. An rseq or sync core registration is no
   longer reported as a private expedited registration as well.

 - Patch 8 and patch 9: add a full memory barrier in switch_mm() for
   registered processes, on LoongArch and on parisc. The expedited
   commands need it after the store to rq->curr.

Patch 1 and patch 2 were reproduced from user-space on v7.4-rc2.

Patch 8 and patch 9 were found by reading the code and the
architecture manuals. Feedback from the LoongArch and parisc
maintainers is welcome.

The series fixes and extends the selftests:

 - Patch 3: rebuild the tests when membarrier_test_impl.h changes.

 - Patch 4: issue the sync core command in the test which is named
   after it.

 - Patch 5: run the tests on nohz_full kernels, which only lack
   MEMBARRIER_CMD_GLOBAL.

 - Patch 6: add membarrier_test_ipi. It checks which CPUs each
   expedited command interrupts. Two of its test cases fail without
   patch 1.

 - Patch 7: add membarrier_test_cmd. It checks the command arguments
   and the registrations across fork, exec and CLONE_VM. Two of its
   tests fail without patch 2.

 - Patch 13: add litmus tests of the memory ordering scenarios, for
   the Linux kernel memory model. One variant shows the LoongArch and
   parisc issue.

 - Patch 14: add the selftests to the MEMBARRIER SUPPORT entry of
   MAINTAINERS.

 - Patch 15: add membarrier_test_barrier, a stress test for x86-64.
   BPF programs on kprobes count, for each thread, the memory
   barriers which membarrier relies on. The test also checks the
   barriers of the scheduler. Two of its test cases fail without
   patch 1. It adds no kernel code.

 - Patch 16: extend membarrier_test_barrier to the sync core
   command. It counts the core serializing instructions in the same
   way.

The series updates the documentation:

 - Patch 10: add the missing architectures to the list of barriers
   after the store to rq->curr.

 - Patch 11: describe what the sync core command relies on for x86
   with FRED and for arm64 with FEAT_ExS.

 - Patch 12: remove two stale x86 entry comments.

The sync core requirements were checked against the architecture
manuals of x86 (Intel SDM and AMD APM), arm, arm64, powerpc, s390 and
riscv. These are the architectures which support the sync core
command. No return path to user-space was found to miss its documented
serialization.

Testing:

 - The six membarrier test programs pass in an x86-64 KVM guest
   with 8 CPUs and lockdep.

 - With nohz_full=2-7, the six programs pass. Only the
   MEMBARRIER_CMD_GLOBAL test is skipped.

 - With nosmp and with maxcpus=2, membarrier_test_ipi is skipped
   because it needs 3 CPUs. membarrier_test_barrier skips the two
   test cases which need 3 CPUs. The four other programs pass.

 - With pti=on, membarrier_test_barrier passes and does not check
   the core serialization.

 - Patch 8 and patch 9 are compile-tested only: LoongArch and parisc
   (32-bit, SMP), default configuration.

 - herd7 reports the expected result for each of the 13 litmus tests.

The series is based on v7.4-rc2.

An LLM coding assistant did this work at my request: the review, the
reproducers, the fixes, the tests and the changelogs. I actively
steered it and reviewed the result.

Mathieu Desnoyers (16):
  sched/membarrier: Fix stale runqueue state after a lazy mm switch
  sched/membarrier: Report only completed registrations
  selftests/membarrier: Rebuild the tests when their header changes
  selftests/membarrier: Issue the sync core command in its test
  selftests/membarrier: Run the tests on nohz_full kernels
  selftests/membarrier: Test which CPUs the expedited commands interrupt
  selftests/membarrier: Test command arguments and registration lifetime
  LoongArch: membarrier: Add full memory barrier in switch_mm()
  parisc: membarrier: Add full memory barrier in switch_mm()
  Documentation/membarrier: Update the per-architecture barrier list
  Documentation/features: Update the membarrier sync core requirements
  x86/entry: Remove stale membarrier sync core comments
  selftests/membarrier: Add litmus tests of the memory ordering
  MAINTAINERS: Add the membarrier selftests to MEMBARRIER SUPPORT
  selftests/membarrier: Check the memory barriers of each thread
  selftests/membarrier: Check the core serialization of the sync core
    command

 .../membarrier-sync-core/arch-support.txt     |   35 +-
 Documentation/scheduler/membarrier.rst        |   14 +-
 MAINTAINERS                                   |    1 +
 arch/loongarch/Kconfig                        |    1 +
 arch/loongarch/include/asm/membarrier.h       |   33 +
 arch/loongarch/include/asm/mmu_context.h      |    4 +
 arch/parisc/Kconfig                           |    1 +
 arch/parisc/include/asm/membarrier.h          |   33 +
 arch/parisc/include/asm/mmu_context.h         |    2 +
 arch/x86/entry/entry_32.S                     |    5 -
 arch/x86/entry/entry_64.S                     |    4 -
 arch/x86/include/asm/sync_core.h              |    2 +-
 kernel/sched/core.c                           |   16 +-
 kernel/sched/membarrier.c                     |   32 +-
 kernel/sched/sched.h                          |   15 +
 tools/testing/selftests/membarrier/.gitignore |    6 +
 tools/testing/selftests/membarrier/Makefile   |   20 +
 tools/testing/selftests/membarrier/config     |    9 +
 .../selftests/membarrier/litmus/README        |   52 +
 .../litmus/ipi-after-thread-no-exit-mb.litmus |   36 +
 .../ipi-after-thread-no-handler-mb.litmus     |   36 +
 .../membarrier/litmus/ipi-after-thread.litmus |   47 +
 .../ipi-before-thread-no-entry-mb.litmus      |   37 +
 .../ipi-before-thread-no-handler-mb.litmus    |   37 +
 .../litmus/ipi-before-thread.litmus           |   46 +
 .../litmus/sched-in-no-entry-mb.litmus        |   34 +
 .../membarrier/litmus/sched-in-no-mb.litmus   |   33 +
 .../membarrier/litmus/sched-in-release.litmus |   38 +
 .../membarrier/litmus/sched-in.litmus         |   51 +
 .../litmus/sched-out-no-exit-mb.litmus        |   34 +
 .../litmus/sched-out-no-sched-mb.litmus       |   34 +
 .../membarrier/litmus/sched-out.litmus        |   49 +
 .../membarrier/membarrier_test_barrier.bpf.c  |  173 +++
 .../membarrier/membarrier_test_barrier.c      | 1347 +++++++++++++++++
 .../membarrier/membarrier_test_barrier.h      |   54 +
 .../membarrier/membarrier_test_cmd.c          |  352 +++++
 .../membarrier/membarrier_test_impl.h         |   14 +-
 .../membarrier/membarrier_test_ipi.c          |  739 +++++++++
 38 files changed, 3426 insertions(+), 50 deletions(-)
 create mode 100644 arch/loongarch/include/asm/membarrier.h
 create mode 100644 arch/parisc/include/asm/membarrier.h
 create mode 100644 tools/testing/selftests/membarrier/config
 create mode 100644 tools/testing/selftests/membarrier/litmus/README
 create mode 100644 tools/testing/selftests/membarrier/litmus/ipi-after-thread-no-exit-mb.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/ipi-after-thread-no-handler-mb.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/ipi-after-thread.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/ipi-before-thread-no-entry-mb.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/ipi-before-thread-no-handler-mb.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/ipi-before-thread.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/sched-in-no-entry-mb.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/sched-in-no-mb.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/sched-in-release.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/sched-in.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/sched-out-no-exit-mb.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/sched-out-no-sched-mb.litmus
 create mode 100644 tools/testing/selftests/membarrier/litmus/sched-out.litmus
 create mode 100644 tools/testing/selftests/membarrier/membarrier_test_barrier.bpf.c
 create mode 100644 tools/testing/selftests/membarrier/membarrier_test_barrier.c
 create mode 100644 tools/testing/selftests/membarrier/membarrier_test_barrier.h
 create mode 100644 tools/testing/selftests/membarrier/membarrier_test_cmd.c
 create mode 100644 tools/testing/selftests/membarrier/membarrier_test_ipi.c


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
