Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7FFC83F10
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rzf+k/8OCWQL92f1I/Md9eBbVlgRuMMwW13ZSZ0oWX8=; b=Y/tsg4J+P/rDdN
	h+QGfXyCpmwMshheBEvJ3/1XMMwgkwAIy8+yxdJcWT/f8DF1WVSaP1Hy4Z/qrcpzwF4jTse+vYy9b
	ARLxIfWajViNMbRudBnz+l675OXmyfavrxPtHr6jYzBxFDX5epYsy5WqY4eAxLCV6S0fLUQSJKspU
	lNDErhp1fbrv5RzNweroIG/M3TdbhB0u6Wj9fZAXQtYhNb8O8QwJL6iWS0mK4gPgWcHJvM7uS1ab9
	n218z7kmeQTlIIsDLsr8frMYCFK8nREPGlftFaDNFkwq79oXl/OZZufz/znh3hsgYzJJOMOxZLizC
	DHZ7BYMFpHLud0ldHbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdi9-0000000A7s8-26rL;
	Wed, 09 Jul 2025 22:56:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaMS-00000009hne-45cp
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 19:21:46 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752088902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vMjyzxQXyuahEb06CsY6mazYic4ccEcL2flOjL77YaE=;
	b=HeUtwOML/HEHHQ1YghPovdnfIzzcG99EerITiX6a0DpPiTfpQqpEE6vr+L+lIW5XCTssNm
	CuSJjvtiCiAq33l+yr1o6DYqCYStzZ3we6hzzwr7An3Fd5aNQywFhtovBpZDhDkNWNHesO
	Cw+zWnrixAgml9mlAAsaj/WWNWvffjZcZg5TrhZm0TUUXrekQ0FzSasm475XHM4nhFkUQm
	V06nC896Z9IUMyntCN/IzMBfcEW11sZs990LdOh42MsSndxRRz59FOTWsO2gFcnGIpt/9N
	dmm9JbV+/NVNr5bS3Wopewy+HlajqoODbWCKBmu80NYcPHDbF3SPq/9aoCvd8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752088902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vMjyzxQXyuahEb06CsY6mazYic4ccEcL2flOjL77YaE=;
	b=KMm0HoYxtXzEQN8GK25Fj4n3wfGcZeKiXrQQHNmuTWtsMeyteFxIuIGZCaVOP4vDPet0VY
	UiL9EGmyOC6jKYDg==
To: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 00/12] RV: Linear temporal logic monitors for RT application
Date: Wed,  9 Jul 2025 21:21:11 +0200
Message-Id: <cover.1752088709.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_122145_152901_DABDF9C6 
X-CRM114-Status: GOOD (  27.55  )
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

Real-time applications may have design flaws causing them to have
unexpected latency. For example, the applications may raise page faults, or
may be blocked trying to take a mutex without priority inheritance.

However, while attempting to implement DA monitors for these real-time
rules, deterministic automaton is found to be inappropriate as the
specification language. The automaton is complicated, hard to understand,
and error-prone.

For these cases, linear temporal logic is found to be more suitable. The
LTL is more concise and intuitive.

This series adds support for LTL RV monitor, and use it to implement two
monitors for reporting problems with real-time tasks.

v12->v13 https://lore.kernel.org/linux-trace-kernel/cover.1752082806.git.namcao@linutronix.de
  - keep consistent format around __printf(1, 0)

v11->v12 https://lore.kernel.org/linux-trace-kernel/cover.1751634289.git.namcao@linutronix.de
  - drop the applied patches
  - fixup build failure when CONFIG_PRINTK=n

v10->v11 https://lore.kernel.org/linux-trace-kernel/cover.1749547399.git.namcao@linutronix.de/
  - Split the patch adding LTL support into three smaller patches
  - Keep comments and document within 80 columns
  - Add a '&' to memset's argument to make it look more natural
  Note: all changed patches are explicitly marked so below the --- line

v9->v10 https://lore.kernel.org/lkml/cover.1747649899.git.namcao@linutronix.de
  - rebase onto v6.16-rc1 (only the vpanic patch is changed)
  - riscv: move page fault tracepoints back to be after kprobe pagefault
    handling
  - drop x86 tracepoint patches, they have already been applied
  - drop arm64 tracepoint patch. It requires further discussion and will be
    sent separately.
  - pagefault monitor: set dependency on x86 and riscv, only these archs
    have the required tracepoints right now.

v8->v9 https://lore.kernel.org/lkml/cover.1747046848.git.namcao@linutronix.de/
  - Move page faults tracepoints to be before kprobe pagefault handling
  - Add guidance into Kconfig entries whether they should be enabled
  - Replace TRACE_EVENT with DECLARE_EVENT_CLASS for the tracepoint classes, so
    that the class names are not wrongly exposed to userspace

v7->v8 https://lore.kernel.org/lkml/cover.1746776116.git.namcao@linutronix.de/
  - Fix some pylint warnings
  - Fix some bugs with some currently-unused operators in the ltl2ba.py
    script
  - sleep monitor: Allow all FUTEX_WAIT_* as valid sleep reason

v6->v7 https://lore.kernel.org/lkml/cover.1745999587.git.namcao@linutronix.de/
  - Add missing parameter description for vpanic()
  - Remove the now-redundant CFLAGS_fault.o for x86
  - Change #if to #ifdef to resolve a build warning
  - rtapp/sleep monitor:
    + Handle the case where an RT task "aborts" the sleep by setting state
      to TASK_RUNNING. This case previously caused a false positive. Fix it
      by adding "ABORT_SLEEP" as an RT-safe wake.
    + Also allow CLOCK_TAI for real-time tasks.

v5->v6 https://lore.kernel.org/lkml/cover.1745926331.git.namcao@linutronix.de
  - sleep monitor: Drop the block_on_rt_mutex tracepoints. The contention
    tracepoints are sufficient.

v4->v5 https://lore.kernel.org/lkml/cover.1745390829.git.namcao@linutronix.de
  - sleep monitor: Fix a false positive due to a race with waking and
    scheduling.
  - sleep monitor: Add block_on_rt_mutex tracepoints and use them for
    BLOCK_ON_RT_MUTEX, instead of trace_sched_pi_setprio
  - sleep monitor: tighten the rule on nanosleep: only clock_nanosleep()
    with TIMER_ABSTIME and CLOCK_MONOTONIC is allowed
  - add comments explaining why it is correct to treat PI-boosted tasks as
    real-time tasks.

    It should be noted that due to the changes in v5, 'perf' does not work
    as well as before, because sometimes the errors happen out of the
    real-time tasks' contexts. Fixing this is left for future work.

    stress-ng is also far noisier in v5, because the rule on nanosleep is
    tightened.

v3->v4 https://lore.kernel.org/lkml/cover.1744785335.git.namcao@linutronix.de
  - support deadline tasks
  - rtapp_sleep: use sched_pi_setprio tracepoint instead of contention
    tracepoints for BLOCK_ON_RT_MUTEX, so that proxy lock is covered.
  - fix the scripts generating an "slightly" incorrect verification automaton
  - makes rtapp monitor depends on RV_PER_TASK_MONITORS >= 2
  - make the event tracepoint output a bit more readable
  - some documentation's format fixes

v2->v3 https://lore.kernel.org/lkml/cover.1744355018.git.namcao@linutronix.de/
  - fix a problem with sleep monitor's specification (around
    KTHREAD_SHOULD_STOP)
  - merge the patches that move the dot2k/rvgen scripts around
  - pull panic/printk changes into separate patches
  - fixup some build errors
  - fixup monitor's init function return code
  - fix some flake8 warnings with the scripts
  - add some references to LTL documentation
  - fixup some mistakes with rtapp documentation
  - fixup capitalization mistake with monitor_synthesis.rst
  - remove the now-redundant macro RV_PER_TASK_MONITORS

v1->v2 https://lore.kernel.org/lkml/cover.1741708239.git.namcao@linutronix.de/
  - Integrate the LTL scripts into the existing dot2k tool, taking
    advantage of the existing monitor generation scripts.
  - Switch the struct ltl_monitor to use bitmap instead of an array, to
    optimize memory usage.
  - Correct the generated code to be non-deterministic state machine,
    instead of deterministic state machine
  - Put common code for all LTL monitors into a single file
    (include/rv/ltl_monitor.h), reducing code duplication
  - Change the LTL monitors to make user of container. Add a bug fix to
    container while at it.
  - Make the number of per-task monitor configurable

Cc: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org

Nam Cao (12):
  rv: Add #undef TRACE_INCLUDE_FILE
  printk: Make vprintk_deferred() public
  panic: Add vpanic()
  rv: Let the reactors take care of buffers
  rv: rename CONFIG_DA_MON_EVENTS to CONFIG_RV_MON_EVENTS
  rv: Add support for LTL monitors
  rv: Add rtapp container monitor
  riscv: mm: Add page fault trace points
  rv: Add rtapp_pagefault monitor
  rv: Add rtapp_sleep monitor
  rv: Add documentation for rtapp monitor
  rv: Allow to configure the number of per-task monitor

 Documentation/trace/rv/index.rst              |   1 +
 Documentation/trace/rv/monitor_rtapp.rst      | 133 +++++++++
 arch/riscv/mm/fault.c                         |   8 +
 include/linux/panic.h                         |   3 +
 include/linux/printk.h                        |   7 +
 include/linux/rv.h                            |  75 ++++-
 include/linux/sched.h                         |   8 +-
 include/rv/da_monitor.h                       |  45 +--
 include/rv/ltl_monitor.h                      | 184 +++++++++++++
 kernel/fork.c                                 |   5 +-
 kernel/panic.c                                |  16 +-
 kernel/printk/internal.h                      |   1 -
 kernel/trace/rv/Kconfig                       |  27 +-
 kernel/trace/rv/Makefile                      |   3 +
 kernel/trace/rv/monitors/pagefault/Kconfig    |  20 ++
 .../trace/rv/monitors/pagefault/pagefault.c   |  88 ++++++
 .../trace/rv/monitors/pagefault/pagefault.h   |  64 +++++
 .../rv/monitors/pagefault/pagefault_trace.h   |  14 +
 kernel/trace/rv/monitors/rtapp/Kconfig        |  11 +
 kernel/trace/rv/monitors/rtapp/rtapp.c        |  33 +++
 kernel/trace/rv/monitors/rtapp/rtapp.h        |   3 +
 kernel/trace/rv/monitors/sleep/Kconfig        |  22 ++
 kernel/trace/rv/monitors/sleep/sleep.c        | 237 ++++++++++++++++
 kernel/trace/rv/monitors/sleep/sleep.h        | 257 ++++++++++++++++++
 kernel/trace/rv/monitors/sleep/sleep_trace.h  |  14 +
 kernel/trace/rv/reactor_panic.c               |   8 +-
 kernel/trace/rv/reactor_printk.c              |   8 +-
 kernel/trace/rv/rv.c                          |  10 +-
 kernel/trace/rv/rv_reactors.c                 |   2 +-
 kernel/trace/rv/rv_trace.h                    |  52 +++-
 tools/verification/models/rtapp/pagefault.ltl |   1 +
 tools/verification/models/rtapp/sleep.ltl     |  22 ++
 32 files changed, 1307 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/trace/rv/monitor_rtapp.rst
 create mode 100644 include/rv/ltl_monitor.h
 create mode 100644 kernel/trace/rv/monitors/pagefault/Kconfig
 create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault.c
 create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault.h
 create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault_trace.h
 create mode 100644 kernel/trace/rv/monitors/rtapp/Kconfig
 create mode 100644 kernel/trace/rv/monitors/rtapp/rtapp.c
 create mode 100644 kernel/trace/rv/monitors/rtapp/rtapp.h
 create mode 100644 kernel/trace/rv/monitors/sleep/Kconfig
 create mode 100644 kernel/trace/rv/monitors/sleep/sleep.c
 create mode 100644 kernel/trace/rv/monitors/sleep/sleep.h
 create mode 100644 kernel/trace/rv/monitors/sleep/sleep_trace.h
 create mode 100644 tools/verification/models/rtapp/pagefault.ltl
 create mode 100644 tools/verification/models/rtapp/sleep.ltl

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
