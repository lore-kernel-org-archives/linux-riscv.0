Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54243CCF9EB
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MsAc0MyWzNk6tZ3KG5GAGwgBTC96zYnhGzs4OENahk=; b=B7a2d0khkUO8Kk
	4gqkeejalXJ3AeJoLApNdYJ75KZ8s6ekTtp4bL9DWBlMGWfPcoR9tQ+lJTQX6F5x1eJYvcmIID5lH
	hNkaPn5XcCKBfyvGPa6o37EKI/04jtNepHIzL0dH1qZVWNvnMWyypFxn0rhroKpXjtc/J2BSFlyJs
	CY8wu+xmb1/7ymH6XM1OvRUPp/mz9UiEu/zKTlRMLybKwNmd5bPtsKAYu2VFqiiw8f18CZBFk15zG
	jRrO9dfwGaaFlZc2nxK5wfDF0N9JB8v7iYNoRyX1qYAIVV1CT7QB3OsFVsV0/wH9thxTn3F+Vyf2y
	wAMMsRhpKcXj+2XRKuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDP2L-0000000EDYp-1lv0;
	Mon, 27 Oct 2025 15:21:33 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDP2I-0000000EDY6-39NT
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 15:21:32 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so4345525a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761578490; x=1762183290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAuDRjv5uAXTsOVI/eb5J4UAMhtSLGfuIUeu/cvlLSU=;
        b=VfhmXVqZftpf4SEFbqCpU/kRKUEwoMJX05N5Ge8i7YQNQFqe5NKeyYKUHg6Rd7HCjS
         /zgibWD0geN/lzSomP581/Wu8YharHGulCdtRNarRJ6Mwn6Gpks6qRoQx7xDTewf6lGj
         q2lXmw/k/lWG7gEV3GgYWl6XIP2dXwWjrRTA/2Xp5FWQjL4WONPcSiGTXWvia+7EIeB3
         Y7SvkEOUGH9LWCjODjXRIj4ssny09ppnsgj7KKq4H7H21KT2gXnqkzUw2NjHC/9iSOcG
         qElL1E8PHiImti8YSXPWnrg57N3Ii5KIX7+X/1US/9PI2QyMhJ5bE5WuPnd2TDlEPy1A
         I+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578490; x=1762183290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAuDRjv5uAXTsOVI/eb5J4UAMhtSLGfuIUeu/cvlLSU=;
        b=K4cYdbFVrr68Ap2uDCUxMjWu/USDaw2T30CSXr2oPPiY2KjxznRy5ZjdMAbFHsCuAr
         OFT7old9d0MGIq9tYiXg8IxRieXjCh30tt+vdfiq7FZPZsSggf3lnE6VGifP5eJnJFci
         Afu86bs09M0w7MDuOHN3j81g+9NrAHKqdX0O8ycmLNsExEaqUqK5hVelU4E6oiGajluL
         BwFy3luMkY0mVTVVsfSliJ/7zXucMkzSV7ROmIAKvUaFIzTFyt+Foniy8jPuF5QETven
         BB7OgHg2O6mskT+z46T5esK7o2x9mE+0DSXT+VeonJiJDoiuVjk67igILgWgxg9pjEoL
         Ln2A==
X-Forwarded-Encrypted: i=1; AJvYcCXG0Rxdexto1Y/95AGWLlv26QlbEoIFqX9FA6MHGOeKN6Nn9Nsdce4f1NgDmKPOdTbFq6v5xavTHUl/Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr2OvhCbYpjG1D/qdf8CtBvEH3yfVkorD+0LJPaiYVTUy+A0Nk
	r/J6CywwTmrFdNvYTKqjosXX2MNUKzCI5AZU7RCbM6JmvdAZQLOS6/RH
X-Gm-Gg: ASbGncuJ3WFc6vTlCpkW/GVFTluCgO4w92Wdc6GcEBc3OySFfNPP+dKLuYqZctf3FqE
	fuKOw3UmwDOybqXZXg7Ft8YC4wVJKtjmugCIXGq9xgwILNsukvY6lRZlzrs9prWy3ROS1Q0OEQb
	YQ5GyPRMlWz6MrQrujGSzBgNrrYiLC9nIxdduhYZdDiAx0Jh7Q5LCZ/rsJghEVMUOOf9wk2POhJ
	OUMhkJgYfMI8RDJhbUoTIy8GLdAI328+R6oqwcEz1qhC4sB6/i5FlDXLSF1GkbnQDg2Nf9NkOal
	+dixxqvCmgmockNiX1GV78O1RchF0nF3NMX7XTPYDZaBs/zjJILZD26BT+kQ2TnYBUij94ut2E9
	t7u71cAtah3aQOV0dfY4SodKx8k2atj2+r03JhayyapmPDS+NyV/OEA8LrL+oGi48AoG3lhhv1i
	mcbVP/YcnS0/p41aZ8hucfvqacn73SjgTexSY=
X-Google-Smtp-Source: AGHT+IE98kyCeEo6PTndR/a9uNVMw9TW4vCsYVgseUaymh3OJieDxpigWzsO7C6JngKgDnTsgFT3wA==
X-Received: by 2002:a17:903:1d0:b0:290:dfab:ca91 with SMTP id d9443c01a7336-294cb68836emr3428795ad.54.1761578489223;
        Mon, 27 Oct 2025 08:21:29 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3426sm87711215ad.7.2025.10.27.08.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:21:28 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: peterz@infradead.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
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
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	luto@kernel.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	nysal@linux.ibm.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	will@kernel.org
Subject: Re: [PATCH 0/3] Optimize code generation during context
Date: Mon, 27 Oct 2025 23:21:00 +0800
Message-ID: <20251027152100.62906-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024182628.68921-1-qq570070308@gmail.com>
References: <20251024182628.68921-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_082130_794378_1D28B45F 
X-CRM114-Status: GOOD (  13.33  )
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

I conducted a more detailed performance test on this series of patches.
https://lore.kernel.org/lkml/20251024182628.68921-1-qq570070308@gmail.com/t/#u

The data is as follows:
1. Time spent on calling finish_task_switch (unit: rdtsc):
| compiler && appended cmdline | without patches | with patches  |
| clang + NA                   | 14.11 - 14.16   | 12.73 - 12.74 |
| clang + "spectre_v2_user=on" | 30.04 - 30.18   | 17.64 - 17.73 |
| gcc + NA                     | 16.73 - 16.83   | 15.35 - 15.44 |
| gcc + "spectre_v2_user=on"   | 40.91 - 40.96   | 30.61 - 30.66 |

Note: I use x86 for testing here. Different architectures have different
cmdlines for configuring mitigations. For example, on arm64, spectre v2
mitigation is enabled by default, and it should be disabled by adding
"nospectre_v2" to the cmdline.

2. bzImage size:
| compiler | without patches | with patches  |
| clang    | 13173760        | 13173760      |
| gcc      | 12166144        | 12166144      |

No size changes were found on bzImage.

Test info:
1. kernel source:
latest linux-next branch:
commit id 72fb0170ef1f45addf726319c52a0562b6913707
2. test machine:
cpu: intel i5-8300h@4Ghz
mem: DDR4 2666MHz
Bare-metal boot, non-virtualized environment
3. compiler:
gcc: gcc version 15.2.0 (Debian 15.2.0-7)
clang: Debian clang version 22.0.0 (++20250731080150+be449d6b6587-1~exp1+b1)
4. config:
base on default x86_64_defconfig, and setting:
CONFIG_PREEMPT=y
CONFIG_PREEMPT_DYNAMIC=n
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_HZ=100
CONFIG_DEBUG_ENTRY=n
CONFIG_X86_DEBUG_FPU=n
CONFIG_EXPERT=y
CONFIG_MODIFY_LDT_SYSCALL=n
CONFIG_CGROUPS=n
CONFIG_BUG=n
CONFIG_BLK_DEV_NVME=y
5. test method:
Use rdtsc (cntvct_el0 can be use on arm64/arm) to obtain timestamps
before and after finish_task_switch calling point, and created multiple
processes to trigger context switches, then calculated the average
duration of the finish_task_switch call.
Note that using multiple processes rather than threads is recommended for
testing, because this will trigger switch_mm (where spectre v2 mitigations
may be performed) during context switching.

I put my test code here:
kernel(just for testing, not a commit):
```
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index ced2a1dee..9e72a4a1a 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -394,6 +394,7 @@
 467	common	open_tree_attr		sys_open_tree_attr
 468	common	file_getattr		sys_file_getattr
 469	common	file_setattr		sys_file_setattr
+470	common	mysyscall		sys_mysyscall
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1842285ea..bcbfea69d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5191,6 +5191,40 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	calculate_sigpending();
 }
 
+static DEFINE_PER_CPU(uint64_t, mytime);
+static DEFINE_PER_CPU(uint64_t, total_time);
+static DEFINE_PER_CPU(uint64_t, last_total_time);
+static DEFINE_PER_CPU(uint64_t, total_count);
+
+static __always_inline uint64_t myrdtsc(void)
+{
+    register uint64_t rax __asm__("rax");
+    register uint64_t rdx __asm__("rdx");
+
+    __asm__ __volatile__ ("rdtsc" : "=a"(rax), "=d"(rdx));
+    return rax | (rdx << 32);
+}
+
+static __always_inline void start_time(void)
+{
+	raw_cpu_write(mytime, myrdtsc());
+}
+
+static __always_inline void end_time(void)
+{
+	const uint64_t end_time = myrdtsc();
+	const uint64_t cost_time = end_time - raw_cpu_read(mytime);
+
+	raw_cpu_add(total_time, cost_time);
+	if (raw_cpu_inc_return(total_count) % (1 << 20) == 0) {
+		const uint64_t t = raw_cpu_read(total_time);
+		const uint64_t lt = raw_cpu_read(last_total_time);
+
+		pr_emerg("cpu %d total_time %llu, last_total_time %llu, cha : %llu\n", raw_smp_processor_id(), t, lt, t - lt);
+		raw_cpu_write(last_total_time, t);
+	}
+}
+
 /*
  * context_switch - switch to the new MM and the new thread's register state.
  */
@@ -5254,7 +5288,10 @@ context_switch(struct rq *rq, struct task_struct *prev,
 	switch_to(prev, next, prev);
 	barrier();
 
-	return finish_task_switch(prev);
+	start_time();
+	rq = finish_task_switch(prev);
+	end_time();
+	return rq;
 }
 
 /*
@@ -10854,3 +10891,19 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		p->sched_class->prio_changed(rq, p, ctx->prio);
 	}
 }
+
+
+static struct task_struct *my_task;
+
+SYSCALL_DEFINE0(mysyscall)
+{
+	preempt_disable();
+	while (1) {
+		if (my_task)
+			wake_up_process(my_task);
+		my_task = current;
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		__schedule(0);
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
	syscall(470);
	// unreachable
	return 0;
}
```

Usage:
1. set core5 as isolated cpu: add "isolcpus=5" to cmdline
2. run user programe
3. wait for kernel print

Everyone is welcome to test it.

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
