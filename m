Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D54CD4F3D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDXmu4INGQjgDPY4nT+NB6WtTyalP4QaWyWnbSo2Vdg=; b=oBPi0mb9qcSReG
	MiCaB58oazbUsNR7BCEzJB2CbeDGZ1se1NMDZ9E18zgb/Rqx+yw8JPMXrRJZSyQBn85PBU7cqbi5L
	lbvPN3UukUlMoSeHdc/065Bbba8fhGQcqsTXzooSRLybdJ0T5KITIRLAcB3EB54YlkJkAIy/yNijb
	tGUgG9lCH/Zx/L9hHnlPdUVQiyVCTTT6x8vfxABDk2s9B2G6KlD4l2RbScaoRRZiE8IWolnLYed6W
	9m+0sh/sQoh07TPSn/Ma6mOyrMf64bUvtW6jr2N7mm+dKxD+tBdNV1MLsoedlO+GMrXHBQLOij5CP
	TU5rrPEef3ArMwalqIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoIf-00000007nG0-03fR;
	Fri, 15 May 2026 08:53:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoId-00000007nFE-14Rw
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 08:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JbQpMKcevS++aTCfiq6LCpCT2Etcw0pMnz1eArG6sPw=; b=K3oF8NjHIz03RBOAdIZjj1ehnS
	wEniu84wlQkW96r66432/uPuRxXzTfv/g4bvoj7ckvcUSlHGzR7MuCycNuMrAOFH4Aj9SbKh1OykE
	15Af11VRdSsQRTYj65KnU22RNI8V/kjNDQubxe/bppxBBsWfb/iEpazz5YDaAv+JW25CRGfq4+xpX
	tMVJqoxIpd2NDfHa23/ZdOPR6BBEjboQq5rb0dB9TFUId1KeDJTrU6YrFJIonKcrkmBrlk2nOpzNf
	aVeI60Tt4HvFyriEp3BTmaiI8E6IC/ANZQSlycDDYx9JFhsL2rYCON7tO3hGY9OCZEdnV6UoTu2nv
	4zE8MMHQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoIZ-00000004ftj-3RHh
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 08:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778835215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbQpMKcevS++aTCfiq6LCpCT2Etcw0pMnz1eArG6sPw=;
	b=CSBebebPBIm1JNxJLxeAWOOvvMjo+Qr35UcdVlXZ2KflDJwix1H4FW63OIciFgc+rPRi2M
	B+WQO5z7FnAgtFfjSSg+VTkC0yUEQ7xSwo3CUORGoJKod2uOsIR/sUCMsJtWaA87Q7MTlY
	9CX2MnKv8G7zqKixZgkBo6gLusBwoz4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778835215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbQpMKcevS++aTCfiq6LCpCT2Etcw0pMnz1eArG6sPw=;
	b=CSBebebPBIm1JNxJLxeAWOOvvMjo+Qr35UcdVlXZ2KflDJwix1H4FW63OIciFgc+rPRi2M
	B+WQO5z7FnAgtFfjSSg+VTkC0yUEQ7xSwo3CUORGoJKod2uOsIR/sUCMsJtWaA87Q7MTlY
	9CX2MnKv8G7zqKixZgkBo6gLusBwoz4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-JBzra1UNM3ii7Sgm1uAPLQ-1; Fri,
 15 May 2026 04:53:28 -0400
X-MC-Unique: JBzra1UNM3ii7Sgm1uAPLQ-1
X-Mimecast-MFC-AGG-ID: JBzra1UNM3ii7Sgm1uAPLQ_1778835204
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9D2E18005B3;
	Fri, 15 May 2026 08:53:23 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E3091956053;
	Fri, 15 May 2026 08:53:15 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 10:52:51 +0200
Subject: [PATCH v12 2/4] kunit: Add backtrace suppression self-tests
MIME-Version: 1.0
Message-Id: <20260515-kunit_add_support-v12-2-a216dc228be8@redhat.com>
References: <20260515-kunit_add_support-v12-0-a216dc228be8@redhat.com>
In-Reply-To: <20260515-kunit_add_support-v12-0-a216dc228be8@redhat.com>
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
 Alessandro Carminati <acarmina@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Dan Carpenter <error27@gmail.com>, 
 Kees Cook <kees@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778835177; l=7437;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=fXyWbZzlWoIL12G+585gezsNpwYj6kS7sHf+I+BjxB8=;
 b=iBIb1SqBIMjQALBFLF0YLTfxD5qV8e6Gf+3Iz33GHBrXwKwHaeOTPOGiGkj5jJReSCRSZbCx/
 acQbgSVIW90DzirXwiHSxXXyy7Ahw1AxbVxBAc3rGLC3Q8GxPxMbzQA
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: twfgJpfidouVmefpAxk7ns7i7UpGM8I5ldJ3bSfzH_4_1778835204
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_095336_348537_70D4FCDA 
X-CRM114-Status: GOOD (  16.46  )
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

Tests cover both API forms:
- Scoped: kunit_warning_suppress() with in-block count verification
  and post-block inactivity check.
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
 lib/kunit/backtrace-suppression-test.c | 192 +++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+)

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
index 0000000000000..59a038b2739f5
--- /dev/null
+++ b/lib/kunit/backtrace-suppression-test.c
@@ -0,0 +1,192 @@
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
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
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
+static noinline void trigger_backtrace_warn(void)
+{
+	WARN(1, "This backtrace should be suppressed");
+}
+
+static void backtrace_suppression_test_warn_indirect(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		trigger_backtrace_warn();
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+}
+
+static void backtrace_suppression_test_warn_multi(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		WARN(1, "This backtrace should be suppressed");
+		trigger_backtrace_warn();
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
+	}
+}
+
+static void backtrace_suppression_test_warn_on_direct(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		WARN_ON(1);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+}
+
+static noinline void trigger_backtrace_warn_on(void)
+{
+	WARN_ON(1);
+}
+
+static void backtrace_suppression_test_warn_on_indirect(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		trigger_backtrace_warn_on();
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+}
+
+static void backtrace_suppression_test_count(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+
+		WARN(1, "suppressed");
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+
+		WARN(1, "suppressed again");
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
+	}
+}
+
+static void backtrace_suppression_test_active_state(struct kunit *test)
+{
+	KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
+
+	kunit_warning_suppress(test) {
+		KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning());
+	}
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
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
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
+	while (!kthread_should_stop())
+		schedule();
+	return 0;
+}
+
+static void backtrace_suppression_test_cross_kthread(struct kunit *test)
+{
+	struct cross_kthread_data data;
+	struct task_struct *task;
+
+	data.was_active = false;
+	init_completion(&data.done);
+
+	kunit_warning_suppress(test) {
+		task = kthread_run(cross_kthread_fn, &data, "kunit-cross-test");
+		KUNIT_ASSERT_FALSE(test, IS_ERR(task));
+		wait_for_completion(&data.done);
+		kthread_stop(task);
+	}
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
