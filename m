Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A01C43458
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2026 02:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z1atw6Gnr/atKjgoLv2/kxRNtqsOi6CiSsAksJCAfJk=; b=hYHlSd7WY/TahB
	/28OEX6AQVh3TYE8P3WVtzlE3koCyKzOlQBQ5fvoX7g08sF1Ivt3+giKOv8HH0rISjCQv4lnCZv0z
	I48NPeLcUwjSwLFdeJYhK8+ZQBrOEBXI9+31r67LvylJSDJIHclgHi77tECgtvjMAglRt8vcYZJ9k
	XZ869tfm6nwMmQxisK85bl5WRSC0chBz6JHp1VDq/zGxYNec1d09H9b9eXCz+nUrDLBXzibgsFFPh
	4XB7/Q+HrU4enxSN2LFo6xu36/pW1tzxkG0qnvK1Ci9zcVqaA/2ATg6ocaPy/F1Nnytq0nO+ozY/b
	E7VYz52UQHq5A0q86gFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfqEw-000000086pl-27Mz;
	Sat, 04 Jul 2026 02:36:23 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfqEs-000000086pN-3VWB
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jul 2026 02:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783132574; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=uXcSSBqyEs6AmgiGt4HIlYfUa4BF9HhKnMFy5oK8LMg=;
	b=s0rSqkVJzaJSSHKAY5ZTFLPNr8jY40qRGSAswgqCWuBhMec1F1rcdi24jUYp0FOEnLonMAEzxraRiyBY0KpqbRUY2vtw4LrBCGJPZHrlOwO5lakJ8QzWJbzmGmvzYs86fV+O6mnoPftNDmh+KI+g4Op4oBmVrJHgkBejhMRHrSw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X6KaS.7_1783132569;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X6KaS.7_1783132569 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 04 Jul 2026 10:36:11 +0800
From: fangyu.yu@linux.alibaba.com
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Anup Patel <anup@brainfault.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	guoren@kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] perf kvm/riscv: Fix event key collision between interrupts and exceptions
Date: Sat,  4 Jul 2026 10:36:08 +0800
Message-Id: <20260704023608.24971-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_193619_744731_B6BAC239 
X-CRM114-Status: GOOD (  12.28  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

RISC-V scause encodes interrupts and exceptions in the same
cause field, with bit 63 on RV64 and bit 31 on RV32 used to
distinguish interrupts from exceptions. The lower cause bits
overlap between the two namespaces, so masking off the interrupt
bit makes distinct IRQ and exception events map to the same key.

This affects perf kvm stat exit-reason decoding. For example,
IRQ_S_TIMER and EXC_LOAD_ACCESS both use cause code 5, and can be
misreported as the wrong exit reason.

Fix this by using the full scause value as the lookup key in
event_get_key(). Also split TRAP() into TRAP_EXC() and
TRAP_IRQ() so interrupt entries are encoded with the
architecture-specific IRQ bit set, matching the value reported by
hardware.

Fixes: ceea279f9376 ("perf kvm stat: Remove use of the arch directory")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 .../perf/util/kvm-stat-arch/kvm-stat-riscv.c  |  4 +--
 .../util/kvm-stat-arch/riscv_trap_types.h     | 27 ++++++++++---------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c b/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
index 967bba261a47..829096a41a3b 100644
--- a/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
+++ b/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
@@ -23,10 +23,8 @@ static const char * const __kvm_events_tp[] = {
 static void event_get_key(struct perf_sample *sample,
 			  struct event_key *key)
 {
-	int xlen = 64; // TODO: 32-bit support.
-
 	key->info = 0;
-	key->key = perf_sample__intval(sample, kvm_exit_reason(EM_RISCV)) & ~CAUSE_IRQ_FLAG(xlen);
+	key->key = perf_sample__intval(sample, kvm_exit_reason(EM_RISCV));
 	key->exit_reasons = riscv_exit_reasons;
 }
 
diff --git a/tools/perf/util/kvm-stat-arch/riscv_trap_types.h b/tools/perf/util/kvm-stat-arch/riscv_trap_types.h
index aa5d24fab4ee..da1f1ce55326 100644
--- a/tools/perf/util/kvm-stat-arch/riscv_trap_types.h
+++ b/tools/perf/util/kvm-stat-arch/riscv_trap_types.h
@@ -38,20 +38,21 @@
 #define EXC_VIRTUAL_INST_FAULT 22
 #define EXC_STORE_GUEST_PAGE_FAULT 23
 
-#define TRAP(x) { x, #x }
+#define TRAP_EXC(x) { x, #x }
+#define TRAP_IRQ(x) { (x) | CAUSE_IRQ_FLAG(__riscv_xlen), #x }
 
 #define kvm_riscv_trap_class \
-	TRAP(IRQ_S_SOFT), TRAP(IRQ_VS_SOFT), TRAP(IRQ_M_SOFT), \
-	TRAP(IRQ_S_TIMER), TRAP(IRQ_VS_TIMER), TRAP(IRQ_M_TIMER), \
-	TRAP(IRQ_S_EXT), TRAP(IRQ_VS_EXT), TRAP(IRQ_M_EXT), \
-	TRAP(IRQ_S_GEXT), TRAP(IRQ_PMU_OVF), \
-	TRAP(EXC_INST_MISALIGNED), TRAP(EXC_INST_ACCESS), TRAP(EXC_INST_ILLEGAL), \
-	TRAP(EXC_BREAKPOINT), TRAP(EXC_LOAD_MISALIGNED), TRAP(EXC_LOAD_ACCESS), \
-	TRAP(EXC_STORE_MISALIGNED), TRAP(EXC_STORE_ACCESS), TRAP(EXC_SYSCALL), \
-	TRAP(EXC_HYPERVISOR_SYSCALL), TRAP(EXC_SUPERVISOR_SYSCALL), \
-	TRAP(EXC_INST_PAGE_FAULT), TRAP(EXC_LOAD_PAGE_FAULT), \
-	TRAP(EXC_STORE_PAGE_FAULT), TRAP(EXC_INST_GUEST_PAGE_FAULT), \
-	TRAP(EXC_LOAD_GUEST_PAGE_FAULT), TRAP(EXC_VIRTUAL_INST_FAULT), \
-	TRAP(EXC_STORE_GUEST_PAGE_FAULT)
+	TRAP_IRQ(IRQ_S_SOFT), TRAP_IRQ(IRQ_VS_SOFT), TRAP_IRQ(IRQ_M_SOFT), \
+	TRAP_IRQ(IRQ_S_TIMER), TRAP_IRQ(IRQ_VS_TIMER), TRAP_IRQ(IRQ_M_TIMER), \
+	TRAP_IRQ(IRQ_S_EXT), TRAP_IRQ(IRQ_VS_EXT), TRAP_IRQ(IRQ_M_EXT), \
+	TRAP_IRQ(IRQ_S_GEXT), TRAP_IRQ(IRQ_PMU_OVF), \
+	TRAP_EXC(EXC_INST_MISALIGNED), TRAP_EXC(EXC_INST_ACCESS), TRAP_EXC(EXC_INST_ILLEGAL), \
+	TRAP_EXC(EXC_BREAKPOINT), TRAP_EXC(EXC_LOAD_MISALIGNED), TRAP_EXC(EXC_LOAD_ACCESS), \
+	TRAP_EXC(EXC_STORE_MISALIGNED), TRAP_EXC(EXC_STORE_ACCESS), TRAP_EXC(EXC_SYSCALL), \
+	TRAP_EXC(EXC_HYPERVISOR_SYSCALL), TRAP_EXC(EXC_SUPERVISOR_SYSCALL), \
+	TRAP_EXC(EXC_INST_PAGE_FAULT), TRAP_EXC(EXC_LOAD_PAGE_FAULT), \
+	TRAP_EXC(EXC_STORE_PAGE_FAULT), TRAP_EXC(EXC_INST_GUEST_PAGE_FAULT), \
+	TRAP_EXC(EXC_LOAD_GUEST_PAGE_FAULT), TRAP_EXC(EXC_VIRTUAL_INST_FAULT), \
+	TRAP_EXC(EXC_STORE_GUEST_PAGE_FAULT)
 
 #endif /* ARCH_PERF_RISCV_TRAP_TYPES_H */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
