Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC684C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zB0hmGowLd+UoqU5g+bpvfOwyAFPIBDpUjrMp9P64k=; b=HkEFO+A1RNHYLk
	unPVtfj1K/qR4merGac8vR5/j94QcQ9airoGJAigq2iyvylzk329goLdqt/R9BwRbVZUlw7w480no
	7C9tEnWvQPHPqasNyk1GNAYL7dWGSf4GL9V8UBe+1X6JVn6QFcqIdQJ1dQWU9O6IlWTVqcgGcEC4s
	X6LVRzu5hk0LCsqnbxzr/HTXLGVDlyQwYCoZ5HlWPVt6qdSJ83Cm721fojrv0ncJtxinHG7lfiFS3
	/d7zOQsK7kkdSRUQ8Bjsnzee6MSdNj0s898aaPrCm5UbU/hfRz8yY1/6rickRd1QJJy0F3gvOuWHs
	gBXHXPC3N1HUJOVX62pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u393A-0000000Cv23-1hVX;
	Fri, 11 Apr 2025 07:43:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38xv-0000000CtzU-1Cnh;
	Fri, 11 Apr 2025 07:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RBmDrhu0Y2boD5jF26ggcoAtTCTRqgDeFKAQWZPdoF8=; b=SRy9eViUX0f7BdhoDYCATlzKdx
	J9t4bIEKYOZJc3TZ892wCC7XIe1nV/1VvB94XYD7CV3lSd8c2jS2mFeDaUSWnSWraymIwxhYRGdOb
	HXSIYrz5SvX36Wv2Hd7TfvF2UtyCVtu4hgb4RJxvno5RqVoALSzaH16dy0bVRvd5lXPiG013K4RwD
	Wx421wgRBCJNRVEW0uIhpI5AfOifyT1qF6Vtx2ctkAhExXHMFRb2A01jegP1Rp/OHKGDagguYu7sD
	uXAwjcGlFeghrIpFzERVCIvbNkhURw5IUjIpS0evtOdlIBWZoBvNKkOj+XIvVhxlvJdGrABCF8voy
	cJ6ccLhA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u38xs-00000008xvu-1E0e;
	Fri, 11 Apr 2025 07:38:18 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744357093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBmDrhu0Y2boD5jF26ggcoAtTCTRqgDeFKAQWZPdoF8=;
	b=b5qttIrpDkpQwlivCD+hVWgAfFUwB2Gw2Ji6eC1nGW1frRf7lrpPulX7Ta/qotxELABNax
	cJmLzn7Y7xtVgnlsv6+3SYQUmeydQYPSyajeJFwBp9eGBZxOULseYDd5gE8XdPu3Gyi1Ip
	r+DEtnTtHvtKiTCX1iUUmCrEpG8vahyobdd36/yFnHG2gLXlS2Kes0NeJ2haf8p+Ih7G49
	Mtcxwa8PqtVLa7nHuyJrPeE6Q7H6zwJJRefRfnPS1XqY6r9FlUlbd6kzbXuoWDxUyUOghR
	AlaJeWr0ZemjgOJrqsTJFAAnZyuam93VFvkdlhPCyH6Y84hg4ZMYzay6MK/+eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744357093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBmDrhu0Y2boD5jF26ggcoAtTCTRqgDeFKAQWZPdoF8=;
	b=1Q1+UFco+iXSwfZiKaZv1A/TWlXNwzatkGQwlapQSNGthsLfDmgU3qmIZtezT05bLF5BvP
	5hrip2WfW9EKPoBw==
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 19/22] rv: Add rtapp_pagefault monitor
Date: Fri, 11 Apr 2025 09:37:35 +0200
Message-Id: <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
In-Reply-To: <cover.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_083816_580162_AB348104 
X-CRM114-Status: GOOD (  18.78  )
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

Userspace real-time applications may have design flaws that they raise
page faults in real-time threads, and thus have unexpected latencies.

Add an linear temporal logic monitor to detect this scenario.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
---
 kernel/trace/rv/Kconfig                       |  1 +
 kernel/trace/rv/Makefile                      |  1 +
 kernel/trace/rv/monitors/pagefault/Kconfig    | 11 +++
 .../trace/rv/monitors/pagefault/pagefault.c   | 83 +++++++++++++++++++
 .../trace/rv/monitors/pagefault/pagefault.h   | 57 +++++++++++++
 .../rv/monitors/pagefault/pagefault_trace.h   | 14 ++++
 kernel/trace/rv/rv_trace.h                    |  1 +
 tools/verification/models/rtapp/pagefault.ltl |  1 +
 8 files changed, 169 insertions(+)
 create mode 100644 kernel/trace/rv/monitors/pagefault/Kconfig
 create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault.c
 create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault.h
 create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault_trace.h
 create mode 100644 tools/verification/models/rtapp/pagefault.ltl

diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
index 5c407d291661..6f86d8501e87 100644
--- a/kernel/trace/rv/Kconfig
+++ b/kernel/trace/rv/Kconfig
@@ -42,6 +42,7 @@ source "kernel/trace/rv/monitors/scpd/Kconfig"
 source "kernel/trace/rv/monitors/snep/Kconfig"
 source "kernel/trace/rv/monitors/sncid/Kconfig"
 source "kernel/trace/rv/monitors/rtapp/Kconfig"
+source "kernel/trace/rv/monitors/pagefault/Kconfig"
 # Add new monitors here
 
 config RV_REACTORS
diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
index 9b28c2419995..353ecf939d0e 100644
--- a/kernel/trace/rv/Makefile
+++ b/kernel/trace/rv/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_RV_MON_SCPD) += monitors/scpd/scpd.o
 obj-$(CONFIG_RV_MON_SNEP) += monitors/snep/snep.o
 obj-$(CONFIG_RV_MON_SNCID) += monitors/sncid/sncid.o
 obj-$(CONFIG_RV_MON_RTAPP) += monitors/rtapp/rtapp.o
+obj-$(CONFIG_RV_MON_PAGEFAULT) += monitors/pagefault/pagefault.o
 # Add new monitors here
 obj-$(CONFIG_RV_REACTORS) += rv_reactors.o
 obj-$(CONFIG_RV_REACT_PRINTK) += reactor_printk.o
diff --git a/kernel/trace/rv/monitors/pagefault/Kconfig b/kernel/trace/rv/monitors/pagefault/Kconfig
new file mode 100644
index 000000000000..b31dee208459
--- /dev/null
+++ b/kernel/trace/rv/monitors/pagefault/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+config RV_MON_PAGEFAULT
+	depends on RV
+	select RV_LTL_MONITOR
+	depends on RV_MON_RTAPP
+	default y
+	select LTL_MON_EVENTS_ID
+	bool "pagefault monitor"
+	help
+	  Monitor that real-time tasks do not raise page faults
diff --git a/kernel/trace/rv/monitors/pagefault/pagefault.c b/kernel/trace/rv/monitors/pagefault/pagefault.c
new file mode 100644
index 000000000000..9f7a4cba39a1
--- /dev/null
+++ b/kernel/trace/rv/monitors/pagefault/pagefault.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/ftrace.h>
+#include <linux/tracepoint.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/rv.h>
+#include <rv/instrumentation.h>
+
+#define MODULE_NAME "pagefault"
+
+#include <rv_trace.h>
+#include <trace/events/exceptions.h>
+#include <monitors/rtapp/rtapp.h>
+
+#include "pagefault.h"
+#include <rv/ltl_monitor.h>
+
+static void ltl_atoms_fetch(struct task_struct *task, struct ltl_monitor *mon)
+{
+	ltl_atom_set(mon, LTL_RT, rt_task(task));
+}
+
+static void ltl_atoms_init(struct task_struct *task, struct ltl_monitor *mon, bool task_creation)
+{
+	if (task_creation)
+		ltl_atom_set(mon, LTL_PAGEFAULT, false);
+}
+
+static void handle_page_fault(void *data, unsigned long address, struct pt_regs *regs,
+			      unsigned long error_code)
+{
+	ltl_atom_pulse(current, LTL_PAGEFAULT, true);
+}
+
+static int enable_pagefault(void)
+{
+	int retval;
+
+	retval = ltl_monitor_init();
+	if (retval)
+		return retval;
+
+	rv_attach_trace_probe("pagefault", page_fault_kernel, handle_page_fault);
+	rv_attach_trace_probe("pagefault", page_fault_user, handle_page_fault);
+
+	return 0;
+}
+
+static void disable_pagefault(void)
+{
+	rv_pagefault.enabled = 0;
+
+	rv_detach_trace_probe("rtapp_pagefault", page_fault_kernel, handle_page_fault);
+	rv_detach_trace_probe("rtapp_pagefault", page_fault_user, handle_page_fault);
+
+	ltl_monitor_destroy();
+}
+
+static struct rv_monitor rv_pagefault = {
+	.name = "pagefault",
+	.description = "Monitor that RT tasks do not raise page faults",
+	.enable = enable_pagefault,
+	.disable = disable_pagefault,
+};
+
+static int __init register_pagefault(void)
+{
+	rv_register_monitor(&rv_pagefault, &rv_rtapp);
+	return 0;
+}
+
+static void __exit unregister_pagefault(void)
+{
+	rv_unregister_monitor(&rv_pagefault);
+}
+
+module_init(register_pagefault);
+module_exit(unregister_pagefault);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Nam Cao <namcao@linutronix.de>");
+MODULE_DESCRIPTION("pagefault: Monitor that RT tasks do not raise page faults");
diff --git a/kernel/trace/rv/monitors/pagefault/pagefault.h b/kernel/trace/rv/monitors/pagefault/pagefault.h
new file mode 100644
index 000000000000..f4535c83f7d1
--- /dev/null
+++ b/kernel/trace/rv/monitors/pagefault/pagefault.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/rv.h>
+
+#define MONITOR_NAME pagefault
+
+enum ltl_atom {
+	LTL_PAGEFAULT,
+	LTL_RT,
+	LTL_NUM_ATOM
+};
+static_assert(LTL_NUM_ATOM <= RV_MAX_LTL_ATOM);
+
+static const char *ltl_atom_str(enum ltl_atom atom)
+{
+	static const char *const names[] = {
+		"p",
+		"r",
+	};
+
+	return names[atom];
+}
+
+enum ltl_buchi_state {
+	S0,
+	RV_NUM_BA_STATES
+};
+static_assert(RV_NUM_BA_STATES <= RV_MAX_BA_STATES);
+
+static void ltl_start(struct task_struct *task, struct ltl_monitor *mon)
+{
+	bool pagefault = test_bit(LTL_PAGEFAULT, mon->atoms);
+	bool val3 = !pagefault;
+	bool rt = test_bit(LTL_RT, mon->atoms);
+	bool val1 = !rt;
+	bool val4 = val1 || val3;
+
+	if (val4)
+		__set_bit(S0, mon->states);
+}
+
+static void
+ltl_possible_next_states(struct ltl_monitor *mon, unsigned int state, unsigned long *next)
+{
+	bool pagefault = test_bit(LTL_PAGEFAULT, mon->atoms);
+	bool val3 = !pagefault;
+	bool rt = test_bit(LTL_RT, mon->atoms);
+	bool val1 = !rt;
+	bool val4 = val1 || val3;
+
+	switch (state) {
+	case S0:
+		if (val4)
+			__set_bit(S0, next);
+		break;
+	}
+}
diff --git a/kernel/trace/rv/monitors/pagefault/pagefault_trace.h b/kernel/trace/rv/monitors/pagefault/pagefault_trace.h
new file mode 100644
index 000000000000..fe1f82597b1a
--- /dev/null
+++ b/kernel/trace/rv/monitors/pagefault/pagefault_trace.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Snippet to be included in rv_trace.h
+ */
+
+#ifdef CONFIG_RV_MON_PAGEFAULT
+DEFINE_EVENT(event_ltl_monitor_id, event_pagefault,
+	     TP_PROTO(struct task_struct *task, char *states, char *atoms, char *next),
+	     TP_ARGS(task, states, atoms, next));
+DEFINE_EVENT(error_ltl_monitor_id, error_pagefault,
+	     TP_PROTO(struct task_struct *task),
+	     TP_ARGS(task));
+#endif /* CONFIG_RV_MON_PAGEFAULT */
diff --git a/kernel/trace/rv/rv_trace.h b/kernel/trace/rv/rv_trace.h
index f9fb848bae91..02c906c9745b 100644
--- a/kernel/trace/rv/rv_trace.h
+++ b/kernel/trace/rv/rv_trace.h
@@ -172,6 +172,7 @@ TRACE_EVENT(error_ltl_monitor_id,
 
 	TP_printk("%s[%d]: violation detected", __get_str(comm), __entry->pid)
 );
+#include <monitors/pagefault/pagefault_trace.h>
 // Add new monitors based on CONFIG_LTL_MON_EVENTS_ID here
 #endif /* CONFIG_LTL_MON_EVENTS_ID */
 #endif /* _TRACE_RV_H */
diff --git a/tools/verification/models/rtapp/pagefault.ltl b/tools/verification/models/rtapp/pagefault.ltl
new file mode 100644
index 000000000000..d7ce62102733
--- /dev/null
+++ b/tools/verification/models/rtapp/pagefault.ltl
@@ -0,0 +1 @@
+RULE = always (RT imply not PAGEFAULT)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
