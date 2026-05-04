Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1049CD3423
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQKPBfoCYaetcHIB5+zgv50WxuMVJ1J7z7+QEa8c/kQ=; b=q+QxC9iwn9e07o
	GMVsnfBte9rAH7Uhxjcgz78n6R25JC/mI1uPVIXSoC16HDka+YuLMLgsXq73faCb0A1D7pYOK9fTV
	0zzv6k11NbywPULBuuadGqTmImTs0gkC7GYV2fBNj8W/CzEc98Rlia82xai8Lpr1fm/BGyYwW4gAI
	9s7Xl2w8rINKfELx4XWTwHTjG1E6W1lFKXeZekX+qe0wBGtr0JZ9eO29vMRTTfBx9UauRIN1WZsb5
	ukNX1DQ/JFaYUot/QDN+VhTqrYeuqU656DVgnsI+HiAOw95tIAO/ZBbzHZ4AYplXMNBicyfvtAFdK
	tYemlfYAQUPOsKoepxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnyI-0000000Cdg7-0Yr1;
	Mon, 04 May 2026 07:44:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnyF-0000000CdeW-33Jz
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 07:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777880642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tnys7K/9v0O55CEJGXyqjjo3X9Li4otJ+Uz/nwlsSjY=;
	b=iawoEaEiXZ+MbnIpUrwxtYm1CvAdOhTzwudH6hWtroC93StYeGTwmGyEdy72F18SwUimEb
	zlVwz0kPpqQeZESBlzuARzVIl5lu3AzqJB/I7htWcxtpU/yYZ8PnFZy7ZWK6pxAMKm9OT6
	sZMCL2fUyK8avwTI+/uxzq98tgBKyPk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-DXJaZ9owOZ-t6DGFIciKDQ-1; Mon,
 04 May 2026 03:42:00 -0400
X-MC-Unique: DXJaZ9owOZ-t6DGFIciKDQ-1
X-Mimecast-MFC-AGG-ID: DXJaZ9owOZ-t6DGFIciKDQ_1777880517
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D3C31956095;
	Mon,  4 May 2026 07:41:56 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC3DA1953952;
	Mon,  4 May 2026 07:41:48 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 04 May 2026 09:41:26 +0200
Subject: [PATCH v8 2/4] kunit: Add backtrace suppression self-tests
MIME-Version: 1.0
Message-Id: <20260504-kunit_add_support-v8-2-3e5957cdd235@redhat.com>
References: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
In-Reply-To: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Alessandro Carminati <acarmina@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Kees Cook <kees@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777880489; l=7602;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=MPqWQRUdtbNfJXopMeu+OACXdzeU52PSCq9boOzmY9E=;
 b=Brw74qOGhkGRJzJXdV3ap46kPR0GwcVV2hbIPTXWh6XX1i4So0lelm46aXQ8ErU4mZdRw2tft
 kThCZ3+aRU8DZjjfqZKm0nj0Duf2wZZkbi698pxBUazWfmxY2Mfo1X+
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: Yfkdu8PARK6zJUHNnX9EcxWUNFmt9rQ3F_kDI226vRY_1777880517
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_004403_845834_DFC8838F 
X-CRM114-Status: GOOD (  17.73  )
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

From: Guenter Roeck <linux@roeck-us.net>

Add unit tests to verify that warning backtrace suppression works.

Tests cover all three API forms:
- Scoped: kunit_warning_suppress() with in-block count verification
  and post-block inactivity check.
- Manual macros: KUNIT_START/END_SUPPRESSED_WARNING() with WARN()
  and WARN_ON(), both direct and through helper functions, as well
  as multiple warnings in a single block.
- Direct functions: kunit_start/end_suppress_warning() with
  sequential independent suppression blocks and per-block counts.

Furthermore, tests verify incremental warning counting, that
kunit_has_active_suppress_warning() transitions correctly around
suppression boundaries, and that suppression active in the test
kthread does not leak to a separate kthread.

If backtrace suppression does _not_ work, the unit tests will likely
trigger unsuppressed backtraces, which should actually help to get
the affected architectures / platforms fixed.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 lib/kunit/Makefile                     |   1 +
 lib/kunit/backtrace-suppression-test.c | 184 +++++++++++++++++++++++++++++++++
 2 files changed, 185 insertions(+)

diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 4592f9d0aa8dd..2e8a6b71a2ab0 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -22,6 +22,7 @@ obj-$(if $(CONFIG_KUNIT),y) +=		hooks.o
 
 obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
 obj-$(CONFIG_KUNIT_TEST) +=		platform-test.o
+obj-$(CONFIG_KUNIT_TEST) +=		backtrace-suppression-test.o
 
 # string-stream-test compiles built-in only.
 ifeq ($(CONFIG_KUNIT_TEST),y)
diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
new file mode 100644
index 0000000000000..0e6fb685d2cbb
--- /dev/null
+++ b/lib/kunit/backtrace-suppression-test.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for suppressing warning tracebacks.
+ *
+ * Copyright (C) 2024, Guenter Roeck
+ * Author: Guenter Roeck <linux@roeck-us.net>
+ */
+
+#include <kunit/test.h>
+#include <linux/bug.h>
+#include <linux/completion.h>
+#include <linux/kthread.h>
+
+static void backtrace_suppression_test_warn_direct(struct kunit *test)
+{
+	kunit_warning_suppress(test) {
+		WARN(1, "This backtrace should be suppressed");
+		/*
+		 * Count must be checked inside the scope; the handle
+		 * is not accessible after the block exits.
+		 */
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+}
+
+static void trigger_backtrace_warn(void)
+{
+	WARN(1, "This backtrace should be suppressed");
+}
+
+static void backtrace_suppression_test_warn_indirect(struct kunit *test)
+{
+	KUNIT_START_SUPPRESSED_WARNING(test);
+	trigger_backtrace_warn();
+	KUNIT_END_SUPPRESSED_WARNING(test);
+
+	KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+}
+
+static void backtrace_suppression_test_warn_multi(struct kunit *test)
+{
+	KUNIT_START_SUPPRESSED_WARNING(test);
+	WARN(1, "This backtrace should be suppressed");
+	trigger_backtrace_warn();
+	KUNIT_END_SUPPRESSED_WARNING(test);
+
+	KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
+}
+
+static void backtrace_suppression_test_warn_on_direct(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE) && !IS_ENABLED(CONFIG_KALLSYMS))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE or CONFIG_KALLSYMS");
+
+	KUNIT_START_SUPPRESSED_WARNING(test);
+	WARN_ON(1);
+	KUNIT_END_SUPPRESSED_WARNING(test);
+
+	KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+}
+
+static void trigger_backtrace_warn_on(void)
+{
+	WARN_ON(1);
+}
+
+static void backtrace_suppression_test_warn_on_indirect(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
+
+	KUNIT_START_SUPPRESSED_WARNING(test);
+	trigger_backtrace_warn_on();
+	KUNIT_END_SUPPRESSED_WARNING(test);
+
+	KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+}
+
+static void backtrace_suppression_test_count(struct kunit *test)
+{
+	KUNIT_START_SUPPRESSED_WARNING(test);
+
+	KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+
+	WARN(1, "suppressed");
+	KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+
+	WARN(1, "suppressed again");
+	KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
+
+	KUNIT_END_SUPPRESSED_WARNING(test);
+}
+
+static void backtrace_suppression_test_active_state(struct kunit *test)
+{
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+
+	KUNIT_START_SUPPRESSED_WARNING(test);
+	KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning());
+	KUNIT_END_SUPPRESSED_WARNING(test);
+
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+
+	kunit_warning_suppress(test) {
+		KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning());
+	}
+
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+}
+
+static void backtrace_suppression_test_multi_scope(struct kunit *test)
+{
+	struct kunit_suppressed_warning *sw1, *sw2;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
+
+	sw1 = kunit_start_suppress_warning(test);
+	trigger_backtrace_warn_on();
+	WARN(1, "suppressed by sw1");
+	kunit_end_suppress_warning(test, sw1);
+
+	sw2 = kunit_start_suppress_warning(test);
+	WARN(1, "suppressed by sw2");
+	kunit_end_suppress_warning(test, sw2);
+
+	KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(sw1), 2);
+	KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(sw2), 1);
+}
+
+struct cross_kthread_data {
+	bool was_active;
+	struct completion done;
+};
+
+static int cross_kthread_fn(void *data)
+{
+	struct cross_kthread_data *d = data;
+
+	d->was_active = kunit_has_active_suppress_warning();
+	complete(&d->done);
+	return 0;
+}
+
+static void backtrace_suppression_test_cross_kthread(struct kunit *test)
+{
+	struct cross_kthread_data data;
+	struct task_struct *task;
+
+	init_completion(&data.done);
+
+	KUNIT_START_SUPPRESSED_WARNING(test);
+
+	task = kthread_run(cross_kthread_fn, &data, "kunit-cross-test");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(task));
+	wait_for_completion(&data.done);
+
+	KUNIT_END_SUPPRESSED_WARNING(test);
+
+	KUNIT_EXPECT_FALSE(test, data.was_active);
+}
+
+static struct kunit_case backtrace_suppression_test_cases[] = {
+	KUNIT_CASE(backtrace_suppression_test_warn_direct),
+	KUNIT_CASE(backtrace_suppression_test_warn_indirect),
+	KUNIT_CASE(backtrace_suppression_test_warn_multi),
+	KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
+	KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
+	KUNIT_CASE(backtrace_suppression_test_count),
+	KUNIT_CASE(backtrace_suppression_test_active_state),
+	KUNIT_CASE(backtrace_suppression_test_multi_scope),
+	KUNIT_CASE(backtrace_suppression_test_cross_kthread),
+	{}
+};
+
+static struct kunit_suite backtrace_suppression_test_suite = {
+	.name = "backtrace-suppression-test",
+	.test_cases = backtrace_suppression_test_cases,
+};
+kunit_test_suites(&backtrace_suppression_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression");

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
