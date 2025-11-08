Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F596CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 17:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VpVACILTPKyEwNgu4cM0stHSX7APN+J0jKl/IqbveNY=; b=bDz0Dh0bBqFGQ7
	2niRxaS+DK6/d9slYKZfyg7kKhjdIKwzR8rHor7RBNZnLmwc9vTQDayk/f65Q7u2r6rI133lAYoI4
	VcJZnai7JwrSq57SxEFjmDEj9YkCS/m77LAFdG9K+gY7M5LzwcCMKl6zlMVMbNfzkc5Cm1x3284Kd
	Tw8kQ6X4k7Sbf88zFuVR1kqd6GqxbHL477KNpSWT9Id5xuEvPDioUD7mojlJs/yO9JCbiiv4HUaGr
	fhgD8wnwqpK9KC9uiUvz0Blf9nfgQSlSDlds3Z8/fxu+rrqYriPY9oCTNxTnGEOpnoDMjAZq70Bhf
	Sxpn4igEaHrAUOA8RyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmg5-00000003Jne-0i7r;
	Sat, 08 Nov 2025 17:24:41 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmg2-00000003Jmz-3Pkn
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 17:24:40 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3437ca434f4so249938a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762622677; x=1763227477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmolD9piAeZb92H38GnbUIPJQwG0OencO484hl6w0mE=;
        b=IzeLs72KtjuJoUSTQMpjNIZNqnDta4cFRVmuMtrgkBe5r/4I+4Pm+9r0cw7/83p2zm
         DWCKDF4tIoAedQ9wV9vWJzPdGif90CD5DwtXYg/kXhAAvfaF6MGlJgtaTG7m1RrniC19
         y1FgaNx0sZGyb8vYKG0hbYYlpc4VtgjMuxP3qV6AeVyght/xIkU8iHD0LOM2uZoE3ig2
         +LUCkeUtxd3JPjdZJpDM0K6bcNSCaJWpJxRe8jAPWdFtPvjkKTY6j2n6YBxAfUz+tyH+
         XKhYM63xfQH5zT2j7ZNoqB8RhHel+3sKMTJJ+J2J3uH6JCsXaQVlDpNewZAqX7ys13Wr
         IBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762622677; x=1763227477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmolD9piAeZb92H38GnbUIPJQwG0OencO484hl6w0mE=;
        b=W4dwTdmUCZplKTuPq0fEZ1AunJVPKnPAZbztqv4oeISKHvqC49XM6TlyAPwYnSzcSL
         wPol8gtYbgfV3OZd4/jP5DET7sYf0M7+vFXTd/Ibfn3TVThiRDiE97vgLUCllwNxtgem
         Jv9WCQmi4eVtM1axrerSmiW7p3EclCZI0vIU+xEP+ki6NU1g/hUZf8OSCGAwlhGWLzHM
         ix603cklw4rotGL1qB7gw2rE1Jyj/rz95a+8qrj3wsjOX07T8C0YjwD5KsNmpP7Wwg+I
         eK01XFtZLQlaRp1w5cKP0W1eJDJz03aVXFQYWyfLMBKHanghgWqrk07LhPmx85k97v5t
         LiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUusIVC5XSrawObkATRRHt9QOEUx05A8W+tcVZVYfz7pw1eTdpQVrFXc0AOgdJXwSigvWAj0fbXTIFWaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOjrFttbqPtWjd9BmbdPH8fNCjoUWo0+4xXcCAOz28cSOu8Zlr
	4hkaN2TSDy+c58OsGGMWdGTv9RK1ze3iHtR8orZL3QYEgjJT51hS9otN
X-Gm-Gg: ASbGnctGRhL8kDbMIvx8iCiYY507T7QEG7DqGoUwdFyiO0Yyljtf+xMArcUh14D7tkE
	AUcbY6eB7bVOILDmGz/F6BtbgazyJhjAwffhKAQGUcu8FjKSrY8pwovS3qSfvjUe6M/qBJE5CJ7
	Qf5QDApCy/uWmyUiO/roLlK9mjKgQnh0716Ty0n8CXX0QHMUm+75FVPBBg2vaTSbJkOe8e9rtkU
	HMNlfOrXeyIX9q7zeENSzyopK1C8aGnmeWGvqPc/Ql6DIzTACRDbUQo/k3Aa5y656S9pt9hQh8Z
	n4EWLqSj8CHGvjqCXcq9g4eW4DGJnr7+d9QwnOhoYm/ZWAqc0D/p9xoowqeZX/cdwPBaGdlr2dp
	LhT1ulaO1gCFxgR7KfLX1fApLDdoOGCQUhmQ2kYmvcROvbCK6zZ6v7Y5TIP5pcqrzuTno5E2rav
	5HjF8PafXAIGd3TMyyCyMalGO35V+7VLkEFlM=
X-Google-Smtp-Source: AGHT+IFLi+Th00uaXxhUNhYA85eC+pE3UEEtS8jC3XrBy4L0uanqOsP0a9RvY6lEJJy0G5KQOs05ew==
X-Received: by 2002:a17:90b:3bcb:b0:341:8ae5:fde5 with SMTP id 98e67ed59e1d1-3436ccfae1emr3590376a91.18.1762622677245;
        Sat, 08 Nov 2025 09:24:37 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm2769122a91.7.2025.11.08.09.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:24:36 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
	peterz@infradead.org,
	linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: [PATCH v2 0/4] Optimize code generation during context switching
Date: Sun,  9 Nov 2025 01:23:42 +0800
Message-ID: <20251108172346.263590-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_092438_912914_CC0453D8 
X-CRM114-Status: GOOD (  22.24  )
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

The purpose of this series of patches is to optimize the performance of
context switching. It does not change the code logic, but only modifies
the inline attributes of some functions.

It is found that `finish_task_switch` is not inlined even in the O2 level
optimization. This may affect performance for the following reasons:
1. It is in the context switching code, which is a hot code path.
2. Because of the modern CPU mitigations for vulnerabilities, inside
switch_mm, the instruction pipeline and cache may be cleared.
finish_task_switch is right after that, so the performance is greatly
affected by function calls and branch jumps.
3. The __schedule function has __sched attribute, which makes it be
placed in the ".sched.text" section, while finish_task_switch does not,
which causes their distance to be very far in binary, aggravating the
above performance degradation.

This series of patches mainly does the following things:
1. Make enter_lazy_tlb inline on x86.
2. Make raw_spin_rq_unlock inline.
3. Let the finish_task_switch function be called inline during context
switching.
4. Set the subfunctions called by finish_task_switch to be inline:
After finish_task_switch is changed to an inline function, the number of
calls to the subfunctions (called by finish_task_switch) increases in
this translation unit due to the inline expansion of finish_task_switch.
For example, the finish_lock_switch function originally had only one
calling point in core.o (in finish_task_switch func), but because the
finish_task_switch was inlined, the calling points become two.
Due to compiler optimization strategies, these functions may transition
from inline functions to non inline functions, which can actually lead to
performance degradation.
Make the subfunctions of finish_task_stwitch inline to prevent
degradation.

Performance test data for these patches:
Time spent on calling finish_task_switch (unit: rdtsc):
 | compiler && appended cmdline | without patches | with patches  |
 | gcc + NA                     | 13.93 - 13.94   | 12.39 - 12.44 |
 | gcc + "spectre_v2_user=on"   | 24.69 - 24.85   | 13.68 - 13.73 |
 | clang + NA                   | 13.89 - 13.90   | 12.70 - 12.73 |
 | clang + "spectre_v2_user=on" | 29.00 - 29.02   | 18.88 - 18.97 |

Note: I use x86 for testing here. Different architectures have different
cmdlines for configuring mitigations. For example, on arm64, spectre v2
mitigation is enabled by default, and it should be disabled by adding
"nospectre_v2" to the cmdline.

Test info:
1. kernel source:
linux-next
commit 9c0826a5d9aa4d52206d ("Add linux-next specific files for 20251107")
2. test machine:
cpu: intel i5-8300h@4Ghz
mem: DDR4 2666MHz
Bare-metal boot, non-virtualized environment
3. compiler:
gcc: gcc version 15.2.0 (Debian 15.2.0-7) with
GNU ld (GNU Binutils for Debian) 2.45
clang: Debian clang version 21.1.4 (8) with
Debian LLD 21.1.4 (compatible with GNU linkers)
4. config:
base on default x86_64_defconfig, and setting:
CONFIG_HZ=100
CONFIG_DEBUG_ENTRY=n
CONFIG_X86_DEBUG_FPU=n
CONFIG_EXPERT=y
CONFIG_MODIFY_LDT_SYSCALL=n
CONFIG_CGROUPS=n
CONFIG_BLK_DEV_NVME=y
5. test method:
Use rdtsc (cntvct_el0 can be use on arm64/arm) to obtain timestamps
before and after finish_task_switch calling point, and created multiple
processes to trigger context switches, then calculated the average
duration of the finish_task_switch call.
Note that using multiple processes rather than threads is recommended for
testing, because this will trigger switch_mm (where spectre v2 mitigations
may be performed) during context switching.
The test code is attached at the end of the email.


I also tested the impact on bzImage size, which may affect
embedded devices:
1. kernel source && compiler: same as above
2. config:
base on default x86_64_defconfig, and setting:
CONFIG_SCHED_CORE=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_NO_HZ_FULL=y

bzImage size:
 | compiler | without patches | with patches  |
 | clang    | 13722624        | 13722624      |
 | gcc      | 12596224        | 12596224      |

No size changes were found on bzImage.

testing code:
kernel(just for testing, not a commit):
```c
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index 8a4ac4841be6..5a42ec008620 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -395,6 +395,7 @@
 468	common	file_getattr		sys_file_getattr
 469	common	file_setattr		sys_file_setattr
 470	common	listns			sys_listns
+471	common	sched_test		sys_sched_test
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 81cf8452449a..d7e2095aeb7d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5195,6 +5195,36 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	calculate_sigpending();
 }
 
+static DEFINE_PER_CPU(uint64_t, start_time);
+static DEFINE_PER_CPU(uint64_t, total_time);
+static DEFINE_PER_CPU(uint64_t, total_count);
+
+static __always_inline uint64_t test_rdtsc(void)
+{
+    register uint64_t rax __asm__("rax");
+    register uint64_t rdx __asm__("rdx");
+
+    __asm__ __volatile__ ("rdtsc" : "=a"(rax), "=d"(rdx));
+    return rax | (rdx << 32);
+}
+
+static __always_inline void test_start(void)
+{
+	raw_cpu_write(start_time, test_rdtsc());
+}
+
+static __always_inline void test_end(void)
+{
+	const uint64_t end_time = test_rdtsc();
+	const uint64_t cost_time = end_time - raw_cpu_read(start_time);
+
+	raw_cpu_add(total_time, cost_time);
+	if (unlikely(raw_cpu_inc_return(total_count) % (1 << 20) == 0)) {
+		pr_emerg("cpu %d total_time %llu\n", raw_smp_processor_id(), raw_cpu_read(total_time));
+		raw_cpu_write(total_time, 0);
+	}
+}
+
 /*
  * context_switch - switch to the new MM and the new thread's register state.
  */
@@ -5264,7 +5294,10 @@ context_switch(struct rq *rq, struct task_struct *prev,
 	switch_to(prev, next, prev);
 	barrier();
 
-	return finish_task_switch(prev);
+	test_start();
+	rq = finish_task_switch(prev);
+	test_end();
+	return rq;
 }
 
 /*
@@ -10861,3 +10894,18 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		p->sched_class->prio_changed(rq, p, ctx->prio);
 	}
 }
+
+static struct task_struct *wait_task;
+
+SYSCALL_DEFINE0(sched_test)
+{
+	preempt_disable();
+	while (1) {
+		if (likely(wait_task))
+			wake_up_process(wait_task);
+		wait_task = current;
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		__schedule(SM_NONE);
+	}
+	return 0;
+}
```

User program:
```c
int main()
{
	cpu_set_t mask;
	if (fork())
		sleep(1);

	CPU_ZERO(&mask);
	CPU_SET(5, &mask); // Assume that cpu5 exists
	assert(sched_setaffinity(0, sizeof(mask), &mask) == 0);
	syscall(471);
	// unreachable
	return 0;
}
```

Usage:
1. set core5 as isolated cpu: add "isolcpus=5" to cmdline
2. run user programe
3. wait for kernel print

v1->v2: https://lore.kernel.org/20251024182628.68921-1-qq570070308@gmail.com
  - Make raw_spin_rq_unlock inline
  - Make __balance_callbacks inline
  - Add comments for always inline functions
  - Add Performance Test Data

Xie Yuanbin (4):
  Make enter_lazy_tlb inline on x86
  Make raw_spin_rq_unlock inline
  Provide the always inline version of some functions
  Make finish_task_switch and its subfuncs inline in context switching

 arch/arm/include/asm/mmu_context.h      | 12 +++++-
 arch/riscv/include/asm/sync_core.h      |  2 +-
 arch/s390/include/asm/mmu_context.h     | 12 +++++-
 arch/sparc/include/asm/mmu_context_64.h | 12 +++++-
 arch/x86/include/asm/mmu_context.h      | 21 +++++++++-
 arch/x86/include/asm/sync_core.h        |  2 +-
 arch/x86/mm/tlb.c                       | 21 ----------
 include/linux/perf_event.h              |  2 +-
 include/linux/sched/mm.h                | 10 ++---
 include/linux/tick.h                    |  4 +-
 include/linux/vtime.h                   |  8 ++--
 kernel/sched/core.c                     | 55 ++++++++++++++++++-------
 kernel/sched/sched.h                    | 24 ++++++-----
 13 files changed, 121 insertions(+), 64 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
