Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DE606B54E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yqKtztKx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=X8cJyEAv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RQ8fEyhw24p8/ufGxdYJVdyhdSo2f5Mb5pcm7bQmrYY=; b=yqKtztKxSjzhmkE5A9GxpOjLAR
	ST+F4SV1R1Qp66A//7ZdKWNHEmdLl+bcQB0z9qCyrAV4LjkpF3Oed5HK0ffuUs+0gguI/mlWwYCF+
	Wtz6kUFoK5bkjmx8NwVDlmW6USF0JmyajyupdAZeQI5Sb7+IKMyVn5jpL3Jpra65WYfGryxeHJ715
	LU7Hc8Lq0lqm9h1zwnRX1ZXk4Ox071ryzHlas3EizGEDhTnqcS1Y84fvtxkvsJwvQ+ShqEYqrdgM4
	Ol3FT5tTptMd9Ov85X9oA8EKFOqov+ZUCApJGe9/fVzpuDynm7LeYz/6RxTIrd6+j76z03Ag+MOOB
	J+8YBrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBT-0000000CrpS-27rN;
	Fri, 13 Nov 2026 13:19:15 +0000
Received: from smtpout.efficios.com ([158.69.130.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrBQ-0000000Crln-2ooE;
	Fri, 13 Nov 2026 13:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575949;
	bh=V6G0bPzKPqW9y5CcOLYbTf+p7g3V14XBJCbAwz7OwwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X8cJyEAvdMWB71Tx5hYHbX9rgjIzRtn8e8WljOb6kbBjAJRhCppqLMlzblBT84BpS
	 5t5XEneMR04259TaXcu7brlD7exXU8OdKknO6REXSWgXX7zcAVeD3JF4/s1t/ZP0U7
	 jf/Ws0yxqDnkpjI4f3YE5RwDc/Wl6SOiodXJHhMjZ4INF+PIk/gbGt71GD8DLae5dU
	 ERyWsM3Aw2wIDyAi5wSFdKln0zJ5I5ty1Qiwv9D3OLerH+HQO6XVK2AuJOxOtunMdH
	 4udFKcw+CmrF1RqutBd3gAm7D6gvCufrIKUqxSVLdZRG8Xxf6ysWn/cx+PmhZHatou
	 pUO6qcX8nAbDw==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyWw64mfzPxK;
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
Subject: [RFC PATCH 02/16] sched/membarrier: Report only completed registrations
Date: Fri, 13 Nov 2026 08:18:49 -0500
Message-Id: <20261113131903.157186-3-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
References: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051912_850868_387231A8 
X-CRM114-Status: GOOD (  18.27  )
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

MEMBARRIER_CMD_GET_REGISTRATIONS returns the registration commands
which the process issued.

Each registration has two state bits: one is set when the registration
starts and the "ready" one when it completes. The command reports a
registration when either bit is set.

The sync core and rseq registrations also set
MEMBARRIER_STATE_PRIVATE_EXPEDITED, without its "ready" bit. They set
it because their commands need the same scheduler barriers as
MEMBARRIER_CMD_PRIVATE_EXPEDITED. So a process which only issued
MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ is reported as having
issued MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED as well. Yet
MEMBARRIER_CMD_PRIVATE_EXPEDITED returns -EPERM for that process.

A registration which failed with -ENOMEM would be reported the same
way.

User-space gets a wrong registration mask. The command was added for
CRIU, which saves the registrations of a process at checkpoint. A
restored process would carry a registration which the original
process did not issue. A program which trusts the mask would issue
MEMBARRIER_CMD_PRIVATE_EXPEDITED and get -EPERM.

Fix this by reporting a registration only when its "ready" bit is
set.

This changes the mask which user-space reads.
MEMBARRIER_CMD_GET_REGISTRATIONS no longer reports
MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED for a process which only
issued the sync core or the rseq registration. The result of every
other command is unchanged.

Fixes: 544a4f2ecd45 ("sched/membarrier: Introduce MEMBARRIER_CMD_GET_REGISTRATIONS")
Cc: stable@vger.kernel.org
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/membarrier.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index cb957b8f1946..46e823a3d668 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -566,15 +566,17 @@ static int membarrier_get_registrations(void)
 	struct task_struct *p = current;
 	struct mm_struct *mm = p->mm;
 	int registrations_mask = 0, membarrier_state, i;
-	static const int states[] = {
-		MEMBARRIER_STATE_GLOBAL_EXPEDITED |
-			MEMBARRIER_STATE_GLOBAL_EXPEDITED_READY,
-		MEMBARRIER_STATE_PRIVATE_EXPEDITED |
-			MEMBARRIER_STATE_PRIVATE_EXPEDITED_READY,
-		MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE |
-			MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY,
-		MEMBARRIER_STATE_PRIVATE_EXPEDITED_RSEQ |
-			MEMBARRIER_STATE_PRIVATE_EXPEDITED_RSEQ_READY
+	/*
+	 * Only the "ready" state tells that a registration command
+	 * completed. The other state of each pair is not specific to
+	 * one registration command: the sync core and rseq
+	 * registrations also set MEMBARRIER_STATE_PRIVATE_EXPEDITED.
+	 */
+	static const int ready_states[] = {
+		MEMBARRIER_STATE_GLOBAL_EXPEDITED_READY,
+		MEMBARRIER_STATE_PRIVATE_EXPEDITED_READY,
+		MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY,
+		MEMBARRIER_STATE_PRIVATE_EXPEDITED_RSEQ_READY
 	};
 	static const int registration_cmds[] = {
 		MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED,
@@ -582,16 +584,13 @@ static int membarrier_get_registrations(void)
 		MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE,
 		MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_RSEQ
 	};
-	BUILD_BUG_ON(ARRAY_SIZE(states) != ARRAY_SIZE(registration_cmds));
+	BUILD_BUG_ON(ARRAY_SIZE(ready_states) != ARRAY_SIZE(registration_cmds));
 
 	membarrier_state = atomic_read(&mm->membarrier_state);
-	for (i = 0; i < ARRAY_SIZE(states); ++i) {
-		if (membarrier_state & states[i]) {
+	for (i = 0; i < ARRAY_SIZE(ready_states); ++i) {
+		if (membarrier_state & ready_states[i])
 			registrations_mask |= registration_cmds[i];
-			membarrier_state &= ~states[i];
-		}
 	}
-	WARN_ON_ONCE(membarrier_state != 0);
 	return registrations_mask;
 }
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
