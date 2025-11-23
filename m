Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3E3CFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uW47iLBDpYN6IovKlLa//fb8B8UI+03NEX9Tvfc9/Qo=; b=r6rCuMq7IgceRE
	L47u5hziUi7VoxKh9Q6PzOKxhLZeWqlLacT4gwD1xKO1I/tMyM7CzEml0/w0P0eDdX+Rh8oEhhgpD
	O8Jsv6R/2S3O5FqSvBJFpy8lzjjTH0m90RNTRDQOWOiJ4/nKsjjADKXrUSiMo4Ou5Nu7n53YenCnL
	rRnEeoGGy1Oe+Oe/+KbmikGxOITTrzP7SQYwok7BdHzyjhsqTok27ZQRWtvcUjUjKKSswfCFmI8bZ
	EtY8iY8KkRmpDTz20k2hpdm4g/cazbhEPH9BPn+CJulbyT9jIJL9o3hiSxjrEcyE9NBanjB9ktLtZ
	YWy2Ch/b8IEG2j3msDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN94A-0000000AOp7-46ng;
	Sun, 23 Nov 2025 12:19:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN945-0000000AOoH-1Tsk
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 12:19:41 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso2847577b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763900376; x=1764505176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCYrQqEvztHYX2R5Z02I20mOYhdh9Ir99v7aCp1zUe4=;
        b=FLzvRXaYRRzqa3cBTgzRggIuDW+UzEXsKb1X8eB7Daa8XHj2Ue9oGhdmiViLqxa77R
         LxuSiG0VBcnYGHSb7JhPzswFZ18K12LyiGdn/KXczWrIAJGtvmM3Y0ZSRnwgU+pX8jnr
         FTlOEN7FT8dYGLGB4iJEMHm38ImQYywY2I3Sh8D8u9bAmbK7LzM5WorlMofEA5sjvKAV
         44LR7xeawuOFxg9s7V+JoRuphiBBXmva9DR+R7mWLXjMhAkJ3BK5EHeaexCVhTz7GFrV
         GprMoxJtu7RlKA55R0qxxvVpdjHZ4SpZ3Xyvq+V0/2r6rBmPuf11xXLPaOv+7J14ZH6Y
         sf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763900376; x=1764505176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCYrQqEvztHYX2R5Z02I20mOYhdh9Ir99v7aCp1zUe4=;
        b=eqeYfDFgdpTEGy2cbtREDvwwhKu+4CMOFS6a/zb0jcWRMHkKxpI944iHF5tCBTocDt
         id47seiyWfggKzD00K7LjzHYbfKAiEkuCKmod27WP8ac31tEfoFkORZ9gMQKWVTQURw4
         eRII1AfC7SDWRaQqeDfYakLKdjUrdwHFfvOgrc2eluwXmPJrZm67YR7JiSwQcBd/j6Od
         coEf95wdMCUz4s72/mDolSPsi06nlYvSBW7l8RsyjkGKxqXD6R5c4eDJH44Gc1lBcpp1
         o0UK9oGGZaSikgst4od2ctL+GbSq4NS287I7MPwfXYT+8nf+POOf3lwfO25hKVUB3E7p
         vhGw==
X-Forwarded-Encrypted: i=1; AJvYcCULYPMqk5fwlskEZJ30OLNawqiG0Szn5K8DAVijCfOzLJl1BAYR3sDQao00CLQVVryR/TJN69Pt9fIzUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7YioUAq05/XvoQ609h2Usd64zKNChvRRi2FP4ENz0iOs5dhMN
	eebt9FMwTIe83wcqUJw59qQMJ0clTG8XTlnXB5qjrVtB9DI7VWO58o7E
X-Gm-Gg: ASbGncvoTdAV6Ym8mj7A39NO24t+WnffBnjMEVXW5SZqwRe/Hl1WkcLtL3W71hy0I9r
	icEQwiZys3NoofTCYHI3CE+t1sG1HLt6RMjoLoeSreZwjjxKJNFPv/7si8rQIxvLsmEPDda+TFb
	0hljj4dcG7DZ3wMgwFgmpEnYOb3Y8e3gd3R7ghnhoHSNubacnHGmL3wnQX/Gk9Gx59zGsnb3taf
	37+Ty5O7+D0USY6fTubrCjDCK2r7lzgZpeSDbkoKjr9sTvVLf8b9smFj/qK1kzbJtjrGeEqwWI5
	UwmnscDDD0L7Dgozo8G3zsMGN1hCKYRZEqpZz8iL1MyRpNkeIoHlQE7sWS7y5A44rLiA3tpWhhi
	pdn2e50TrMESciOJhUNWCvaohLWdKah/YMPiXX2dmx5Q9LnLSGvc3it979QenVGQNmaQdIkZQF3
	SCKTuMib06hH/8AKJ0gMRxRm7FNsR/i4kT/EJZlI/0xtNYCKee
X-Google-Smtp-Source: AGHT+IGf6ygH8Jb4cf01QxiqfQEDJ29a6hRUllFevQDvAG//mWFJqgi9wfdZ9zJBDAoD7TvOdP34+g==
X-Received: by 2002:a05:6a00:1aca:b0:781:9ae1:1be6 with SMTP id d2e1a72fcca58-7c58c2b0d3amr10154323b3a.6.1763900375746;
        Sun, 23 Nov 2025 04:19:35 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([45.121.215.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63aefsm11410178b3a.52.2025.11.23.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 04:19:35 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	david@kernel.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	hpa@zytor.com,
	arnd@arndb.de,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
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
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	thuth@redhat.com,
	akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com,
	anshuman.khandual@arm.com,
	nysal@linux.ibm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH v4 0/3] Optimize code generation during context switching
Date: Sun, 23 Nov 2025 20:18:24 +0800
Message-ID: <20251123121827.1304-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_041937_407948_22ABCB86 
X-CRM114-Status: GOOD (  19.04  )
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

It is found that finish_task_switch() is not inlined even in the O2 level
optimization. This may affect performance for the following reasons:
1. It is in the context switching code, which is a hot code path.
2. Because of the modern CPU vulnerabilities, kernel is likely to perform
some mitigations inside switch_mm_irq_off(), such as branch prediction
hardening or l1d flushing, the instruction pipeline and cache may be
flushed. finish_task_switch() is right after that, so the performance
here is greatly affected by function calls and branch jumps.
3. The __schedule function has __sched attribute, which makes it be
placed in the ".sched.text" section, while finish_task_switch() does not,
which causes their distance to be very far in binary, aggravating the
above performance degradation.

This series of patches primarily make some functions called in context
switching as always inline to optimize performance. Here is the
performance test data for these patches:
Time spent on calling finish_task_switch(), the unit is tsc from x86:
 | test scenario             | old   | new   | delta          |
 | gcc 15.2                  | 13.94 | 12.40 | 1.54  (-11.1%) |
 | gcc 15.2 + spectre_v2     | 24.78 | 13.70 | 11.08 (-44.7%) |
 | clang 21.1.4              | 13.90 | 12.71 | 1.19  (- 8.6%) |
 | clang 21.1.4 + spectre_v2 | 29.01 | 18.91 | 10.1  (-34.8%) |

Additional information:
1. The testing kernel source is commit 9c0826a5d9aa4d52206d ("Add
linux-next specific files for 20251107") from linux-next branch.

2. Testing machine:
cpu: intel i5-8300h@4Ghz
mem: DDR4 2666MHz
Bare-metal boot, non-virtualized environment

3. Testing compiler:
gcc: gcc version 15.2.0 (Debian 15.2.0-7) with
GNU ld (GNU Binutils for Debian) 2.45
clang: Debian clang version 21.1.4 (8) with
Debian LLD 21.1.4 (compatible with GNU linkers)

4. Testing config:
base on default x86_64_defconfig, and setting:
CONFIG_HZ=100
CONFIG_DEBUG_ENTRY=n
CONFIG_X86_DEBUG_FPU=n
CONFIG_EXPERT=y
CONFIG_MODIFY_LDT_SYSCALL=n
CONFIG_CGROUPS=n
CONFIG_BLK_DEV_NVME=y

5. Test method:
Use rdtsc (cntvct_el0 can be use on arm64/arm) to obtain timestamps
before and after finish_task_switch() calling point, and created multiple
processes to trigger context switches, then calculated the average
duration of the finish_task_switch() call.
Note that using multiple processes rather than threads is recommended for
testing, because this will trigger switch_mm_irqs_off(), where
spectre_v2 mitigations may be performed, during context switching.

6. Testing code:
kernel:
```patch
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

v3->v4: https://lore.kernel.org/20251113105227.57650-1-qq570070308@gmail.com
  - Improve the commit message

v2->v3: https://lore.kernel.org/20251108172346.263590-1-qq570070308@gmail.com
  - Fix building error in patch 1
  - Simply add the __always_inline attribute to the existing function,
    Instead of adding the always inline version functions

v1->v2: https://lore.kernel.org/20251024182628.68921-1-qq570070308@gmail.com
  - Make raw_spin_rq_unlock() inline
  - Make __balance_callbacks() inline
  - Add comments for always inline functions
  - Add Performance Test Data

Xie Yuanbin (3):
  x86/mm/tlb: Make enter_lazy_tlb() always inline on x86
  sched: Make raw_spin_rq_unlock() inline
  sched/core: Make finish_task_switch() and its subfunctions always
    inline

 arch/arm/include/asm/mmu_context.h      |  2 +-
 arch/riscv/include/asm/sync_core.h      |  2 +-
 arch/s390/include/asm/mmu_context.h     |  2 +-
 arch/sparc/include/asm/mmu_context_64.h |  2 +-
 arch/x86/include/asm/mmu_context.h      | 23 ++++++++++++++++++++++-
 arch/x86/include/asm/sync_core.h        |  2 +-
 arch/x86/mm/tlb.c                       | 21 ---------------------
 include/linux/perf_event.h              |  2 +-
 include/linux/sched/mm.h                | 10 +++++-----
 include/linux/tick.h                    |  4 ++--
 include/linux/vtime.h                   |  8 ++++----
 kernel/sched/core.c                     | 19 +++++++------------
 kernel/sched/sched.h                    | 24 ++++++++++++++----------
 13 files changed, 60 insertions(+), 61 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
