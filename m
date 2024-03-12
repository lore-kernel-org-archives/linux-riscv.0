Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71350C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 17:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYG9m4vavea4RPEITRd+2qPDuuCp0Nyy90wicDnG2YA=; b=uQYom8ONX5vdhH
	xM2GyodoKzPAgReeuRBN3gAcaY3eXpDwG9Pr8h6K0u6LThe6vt/N4XRT+XTo1dagSLcgqvRrUG661
	yUgZ2vCx72TfsiQmgUEOyZyxwxRZn0OJ4Xb5rfehuq8UUnSNI4iZIt1ZxzZ8FLa6PYlBHuS2ORPiZ
	daZYQ/MWI8xCwkoOWktRkT6zW5eIZqxPLKtUiYPZNQSX2THw9bfaPwFa99ajy2jZUuDGG71Nsix3g
	sx3ot5w4uMs3CGdWy1MFNEJ1IKq0iaJK4TxrXKgI/3V75PP0IVDdad+7vU8SXxzegwHyKFhUJmAXb
	qA0rdURbjklr/zSQ4OFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XS-00000006iuO-1vF1;
	Tue, 12 Mar 2024 17:03:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5X5-00000006iZr-33zB;
	Tue, 12 Mar 2024 17:03:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dd611d5645so283485ad.1;
        Tue, 12 Mar 2024 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710262996; x=1710867796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of8hHWisNxYysvbPB0I6Y4GqENZSkz1n2sIkdEVr+kQ=;
        b=KsBkN23OLJluKeE51bBh6sUQeqlPLQXaAB4K6in+KynE7afrPrzZGjVNKOcv3NYkfB
         PBmG/97rn6+FOlLpbST2MSToVvuKEwSJG1DxqBrF8LYTvhutvz/TVVJ0ok1RY5JJA45P
         BSeTtVUCC1rW4Idux9rCBbT0cwBuHyy0piF3aDgmUk6gOfv7Yi0HIFy1fmavxoMOM7s+
         hualoc7bHy5LfzhzDu2Z98B4uz7WrhdznQhdXTQFqlGLBbpFitA1HLJlmT78DkXPWT1b
         MegleMov964xYN5pHm5VXZC4rVFjfVaERFG285o4xc7eqSuKHQIjA/2gvlS8r3hTK0xU
         QVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710262996; x=1710867796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Of8hHWisNxYysvbPB0I6Y4GqENZSkz1n2sIkdEVr+kQ=;
        b=uD3ex/SZw8JWWZ9UXwBLaqOzEnKp802OnQ3h6UAtDeMZ02kOmF9NxyfSixWDdYSmZC
         72vnIwAvROjUqVmtiYNu29u9/gACM3t0ykU+PuliENzoJXMWx3EHvtvhe6/bUp6sLzGi
         FWFG9ueI7z6xqeLqnbHQcoxQFH5Q3XXFHR6Ci/pAAH3vnEvJ+A8dzKAQn+U7rMiEj2xq
         7d+2w1IAbCOrIlyS7LOsMgncaDIL6lLoecJ3/82mh0m+QpasDcdrJduF9uxf+wXQolT/
         15eNPBpEhyCjW+KrijnaOZzwtik5FUimo905JGWjbfRN506NVehKugCGh0bgVN76Cmds
         XcCw==
X-Forwarded-Encrypted: i=1; AJvYcCVv9Z4Ld3CL3CcybL7surgkQRUeOVxupkqWZc8HDNWoI0hQqzJJ7Rr5fAMORfepFnw+d3b9+IzcXa6GOfRhn/QMSqvmkzMD8UGYRl4+VNF0rLpWXVphufSGcsjRg6JgHgtaDvBDfAATentwhpQ9668uEhaptiw=
X-Gm-Message-State: AOJu0YxGBf2WGoSGMlE753+1jdotNqzfrr6kr78a1U/mN/Ds80q3tFoy
	qn4mB81r8d4CEUToK91Q2S7oxNkctcUppkS093v+8GkBEUaUdlTh
X-Google-Smtp-Source: AGHT+IE/Isr4cUsadh0SsOhn7mx4Gox6shabBQwnzVwQlzBf1DTIw8GWGf1C7I1mI94rK1/gQQW32g==
X-Received: by 2002:a17:903:947:b0:1dd:a616:8205 with SMTP id ma7-20020a170903094700b001dda6168205mr110005plb.34.1710262996297;
        Tue, 12 Mar 2024 10:03:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b001dcfc8a5fafsm6970018plg.96.2024.03.12.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:15 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/14] bug/kunit: Core support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:02:56 -0700
Message-Id: <20240312170309.2546362-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_100319_835828_3E27D65B 
X-CRM114-Status: GOOD (  34.35  )
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

Some unit tests intentionally trigger warning backtraces by passing
bad parameters to API functions. Such unit tests typically check the
return value from those calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code.

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Daniel Diaz <daniel.diaz@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/asm-generic/bug.h | 16 +++++++++---
 include/kunit/bug.h       | 51 +++++++++++++++++++++++++++++++++++++++
 include/kunit/test.h      |  1 +
 include/linux/bug.h       | 13 ++++++++++
 lib/bug.c                 | 51 ++++++++++++++++++++++++++++++++++++---
 lib/kunit/Makefile        |  6 +++--
 lib/kunit/bug.c           | 40 ++++++++++++++++++++++++++++++
 7 files changed, 169 insertions(+), 9 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/bug.c

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 6e794420bd39..c170b6477689 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -18,6 +18,7 @@
 #endif
 
 #ifndef __ASSEMBLY__
+#include <kunit/bug.h>
 #include <linux/panic.h>
 #include <linux/printk.h>
 
@@ -39,8 +40,14 @@ struct bug_entry {
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	const char	*file;
+#ifdef HAVE_BUG_FUNCTION
+	const char      *function;
+#endif
 #else
 	signed int	file_disp;
+#ifdef HAVE_BUG_FUNCTION
+	signed int	function_disp;
+#endif
 #endif
 	unsigned short	line;
 #endif
@@ -96,15 +103,18 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #define __WARN()		__WARN_printf(TAINT_WARN, NULL)
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
-		warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);	\
+		if (!IS_SUPPRESSED_WARNING(__func__))			\
+			warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);\
 		instrumentation_end();					\
 	} while (0)
 #else
 #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
-		__warn_printk(arg);					\
-		__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
+		if (!IS_SUPPRESSED_WARNING(__func__)) {			\
+			__warn_printk(arg);				\
+			__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
+		}							\
 		instrumentation_end();					\
 	} while (0)
 #define WARN_ON_ONCE(condition) ({				\
diff --git a/include/kunit/bug.h b/include/kunit/bug.h
new file mode 100644
index 000000000000..1e34da961599
--- /dev/null
+++ b/include/kunit/bug.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit helpers for backtrace suppression
+ *
+ * Copyright (c) 2024 Guenter Roeck <linux@roeck-us.net>
+ */
+
+#ifndef _KUNIT_BUG_H
+#define _KUNIT_BUG_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/kconfig.h>
+
+#if IS_ENABLED(CONFIG_KUNIT)
+
+#include <linux/stringify.h>
+#include <linux/types.h>
+
+struct __suppressed_warning {
+	struct list_head node;
+	const char *function;
+};
+
+void __start_suppress_warning(struct __suppressed_warning *warning);
+void __end_suppress_warning(struct __suppressed_warning *warning);
+bool __is_suppressed_warning(const char *function);
+
+#define DEFINE_SUPPRESSED_WARNING(func)	\
+	struct __suppressed_warning __kunit_suppress_##func = \
+		{ .function = __stringify(func) }
+
+#define START_SUPPRESSED_WARNING(func) \
+	__start_suppress_warning(&__kunit_suppress_##func)
+
+#define END_SUPPRESSED_WARNING(func) \
+	__end_suppress_warning(&__kunit_suppress_##func)
+
+#define IS_SUPPRESSED_WARNING(func) \
+	__is_suppressed_warning(func)
+
+#else /* CONFIG_KUNIT */
+
+#define DEFINE_SUPPRESSED_WARNING(func)
+#define START_SUPPRESSED_WARNING(func)
+#define END_SUPPRESSED_WARNING(func)
+#define IS_SUPPRESSED_WARNING(func) (false)
+
+#endif /* CONFIG_KUNIT */
+#endif /* __ASSEMBLY__ */
+#endif /* _KUNIT_BUG_H */
diff --git a/include/kunit/test.h b/include/kunit/test.h
index fcb4a4940ace..894c9fd1495d 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -10,6 +10,7 @@
 #define _KUNIT_TEST_H
 
 #include <kunit/assert.h>
+#include <kunit/bug.h>
 #include <kunit/try-catch.h>
 
 #include <linux/args.h>
diff --git a/include/linux/bug.h b/include/linux/bug.h
index 348acf2558f3..c668762dc76a 100644
--- a/include/linux/bug.h
+++ b/include/linux/bug.h
@@ -36,6 +36,9 @@ static inline int is_warning_bug(const struct bug_entry *bug)
 	return bug->flags & BUGFLAG_WARNING;
 }
 
+void bug_get_file_function_line(struct bug_entry *bug, const char **file,
+				const char **function, unsigned int *line);
+
 void bug_get_file_line(struct bug_entry *bug, const char **file,
 		       unsigned int *line);
 
@@ -62,6 +65,16 @@ static inline enum bug_trap_type report_bug(unsigned long bug_addr,
 }
 
 struct bug_entry;
+static inline void bug_get_file_function_line(struct bug_entry *bug,
+					      const char **file,
+					      const char **function,
+					      unsigned int *line)
+{
+	*file = NULL;
+	*function = NULL;
+	*line = 0;
+}
+
 static inline void bug_get_file_line(struct bug_entry *bug, const char **file,
 				     unsigned int *line)
 {
diff --git a/lib/bug.c b/lib/bug.c
index e0ff21989990..6b85d4042e07 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -26,6 +26,14 @@
        when CONFIG_DEBUG_BUGVERBOSE is not enabled, so you must generate
        the values accordingly.
 
+  2a.Optionally implement support for the "function" entry in struct
+     bug_entry. This entry must point to the name of the function triggering
+     the warning or bug trap (normally __func__). This is only needed if
+     both CONFIG_DEBUG_BUGVERBOSE and CONFIG_KUNIT are enabled and if
+     the architecture wants to implement support for suppressing warning
+     backtraces. The architecture must define HAVE_BUG_FUNCTION if it adds
+     pointers to function names to struct bug_entry.
+
   3. Implement the trap
      - In the illegal instruction trap handler (typically), verify
        that the fault was in kernel mode, and call report_bug()
@@ -127,14 +135,21 @@ static inline struct bug_entry *module_find_bug(unsigned long bugaddr)
 }
 #endif
 
-void bug_get_file_line(struct bug_entry *bug, const char **file,
-		       unsigned int *line)
+void bug_get_file_function_line(struct bug_entry *bug, const char **file,
+				const char **function, unsigned int *line)
 {
+	*function = NULL;
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 	*file = (const char *)&bug->file_disp + bug->file_disp;
+#ifdef HAVE_BUG_FUNCTION
+	*function = (const char *)&bug->function_disp + bug->function_disp;
+#endif
 #else
 	*file = bug->file;
+#ifdef HAVE_BUG_FUNCTION
+	*function = bug->function;
+#endif
 #endif
 	*line = bug->line;
 #else
@@ -143,6 +158,13 @@ void bug_get_file_line(struct bug_entry *bug, const char **file,
 #endif
 }
 
+void bug_get_file_line(struct bug_entry *bug, const char **file, unsigned int *line)
+{
+	const char *function;
+
+	bug_get_file_function_line(bug, file, &function, line);
+}
+
 struct bug_entry *find_bug(unsigned long bugaddr)
 {
 	struct bug_entry *bug;
@@ -157,8 +179,9 @@ struct bug_entry *find_bug(unsigned long bugaddr)
 static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *regs)
 {
 	struct bug_entry *bug;
-	const char *file;
+	const char *file, *function;
 	unsigned line, warning, once, done;
+	char __maybe_unused sym[KSYM_SYMBOL_LEN];
 
 	if (!is_valid_bugaddr(bugaddr))
 		return BUG_TRAP_TYPE_NONE;
@@ -169,12 +192,32 @@ static enum bug_trap_type __report_bug(unsigned long bugaddr, struct pt_regs *re
 
 	disable_trace_on_warning();
 
-	bug_get_file_line(bug, &file, &line);
+	bug_get_file_function_line(bug, &file, &function, &line);
+#if IS_ENABLED(CONFIG_KUNIT) && defined(CONFIG_KALLSYMS)
+	if (!function) {
+		/*
+		 * This will be seen if report_bug is called on an architecture
+		 * with no architecture-specific support for suppressing warning
+		 * backtraces, if CONFIG_DEBUG_BUGVERBOSE is not enabled, or if
+		 * the calling code is from assembler which does not record a
+		 * function name. Extracting the function name from the bug
+		 * address is less than perfect since compiler optimization may
+		 * result in 'bugaddr' pointing to a function which does not
+		 * actually trigger the warning, but it is better than no
+		 * suppression at all.
+		 */
+		sprint_symbol_no_offset(sym, bugaddr);
+		function = sym;
+	}
+#endif /* IS_ENABLED(CONFIG_KUNIT) && defined(CONFIG_KALLSYMS) */
 
 	warning = (bug->flags & BUGFLAG_WARNING) != 0;
 	once = (bug->flags & BUGFLAG_ONCE) != 0;
 	done = (bug->flags & BUGFLAG_DONE) != 0;
 
+	if (warning && IS_SUPPRESSED_WARNING(function))
+		return BUG_TRAP_TYPE_WARN;
+
 	if (warning && once) {
 		if (done)
 			return BUG_TRAP_TYPE_WARN;
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 309659a32a78..545b57c3be48 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -14,8 +14,10 @@ ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
 kunit-objs +=				debugfs.o
 endif
 
-# KUnit 'hooks' are built-in even when KUnit is built as a module.
-obj-y +=				hooks.o
+# KUnit 'hooks' and bug handling are built-in even when KUnit is built
+# as a module.
+obj-y +=				hooks.o \
+					bug.o
 
 obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
 
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
new file mode 100644
index 000000000000..f93544d7a9d1
--- /dev/null
+++ b/lib/kunit/bug.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit helpers for backtrace suppression
+ *
+ * Copyright (c) 2024 Guenter Roeck <linux@roeck-us.net>
+ */
+
+#include <kunit/bug.h>
+#include <linux/export.h>
+#include <linux/list.h>
+#include <linux/string.h>
+
+static LIST_HEAD(suppressed_warnings);
+
+void __start_suppress_warning(struct __suppressed_warning *warning)
+{
+	list_add(&warning->node, &suppressed_warnings);
+}
+EXPORT_SYMBOL_GPL(__start_suppress_warning);
+
+void __end_suppress_warning(struct __suppressed_warning *warning)
+{
+	list_del(&warning->node);
+}
+EXPORT_SYMBOL_GPL(__end_suppress_warning);
+
+bool __is_suppressed_warning(const char *function)
+{
+	struct __suppressed_warning *warning;
+
+	if (!function)
+		return false;
+
+	list_for_each_entry(warning, &suppressed_warnings, node) {
+		if (!strcmp(function, warning->function))
+			return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(__is_suppressed_warning);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
