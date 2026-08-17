Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FFBC5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CQ6UMo1dtjKWoqeQ24sCGCaYhlpohWvWxDuXnVRQy+k=; b=3Pd4gAjQFBUvnE
	15I6PKWhCHf6liyzoMBHx+exY4xh73OpKOaZWQRLURosH4WJrLV414p9mbv5eQ+RlUAyRZDZGZWMq
	04MTsFVbfSDz0rTnpBKQAgyqiqQfmLiksD5lCRrQXxg8LGeQL4M8JCllKcAZF+8KcCODC++YbsTdT
	2p8pAKHjRobrUkzbWSG3JK8L4aI0mwKjP1LWNoF91e7twD+FbZbXDkysatx/wRGslPD2pbjtJTLRx
	gneKxvZJ9Y3jVwxDmn6Yh/EyDZK/R1azXmReB/XBZwVPyIdbFDIi/NXedWKxGWEhjFlZieS2QB+Aa
	jIy3JchWg3bLR3yMO7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzfk-00000006SIC-0FMp;
	Mon, 17 Aug 2026 15:54:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzfh-00000006SHf-16tM
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 15:54:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so29441995e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786982083; x=1787586883; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CYoVZjftpouSJ7GJkuPaD9Nbny+lb8Qv46HwHPYwG5E=;
        b=kvnmUmiQjrvn5RuhwewfRqcwURlRcz/Lg2wHevsPzpyZhcWNfAKO8Vc265F68aJ8Ea
         /6wXS9/ouz4AlRmbCHK/CDivaNXFYnSLYoBwMUkJVDjKEvvFqJes9W4asO1Fn09jSJCB
         QEcZoRin1xCZ7fhIlz7A1bao33zA0PxyeGg98+KzcosRkv911NFdVDFmRkESFyIXQ74L
         4kwcqjyUbvRBGAKSaO347/mtNRN6DfhTc5rjAFbh/kYKxcamp+NNkKjNE3lKHQRbUBYj
         LWWNq6ZN0Uu3eM6b04siWDNeKH/adqOO8SI5rpFbArVc4mpPj3tkkPQnHvgc4DOgGqS7
         v6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982083; x=1787586883;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CYoVZjftpouSJ7GJkuPaD9Nbny+lb8Qv46HwHPYwG5E=;
        b=oxi938YTxTKyWxx/VqwqbaMQ3ASECjQ3nOMw+GpwCqB2xZNmZ21J9zMElERhUNn7tb
         bugs7aBEBeiWXbEzmmZRIoBwLiwvgDx9h/NsPllY0ttBr2uPtfoXY6fNiQ4tPExTMZF0
         ZrBnP8BTa9z7Oi7RCTzghvOGDUvuzJ31tanJXzabMWxHCtFbX9s4MZslqYE0tkn5LiZe
         cJ92xPaQqtytIH4oj3Ojyft8g5Eu5t/eyIaNUtGZGvAQsgaP8x3iFEQuHwTrCaawCGAi
         OXFXTrPIGw5F+w+k4Q15Vf9xMVkVvoe86i+ChY48JTmosG3qKmt4xLM3NszFAdeCZJ35
         7K5A==
X-Forwarded-Encrypted: i=1; AHgh+RqKF/g1Pb/o/hGqI5BICnx2N3D2Fwe60mwIfR/s3Mvpg5O8qCuDHigOAv2Cm3xtYHQ9v9wmVF7DRoJDZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNJWZamhERmEuJniq8HZMY0Q1lfVnoJFIcDqWtiC6Eqic56H9P
	7dU0CHndLGohlKQ9WHUniMVCLJlgp5ped3/pj46RQM+qyqLdifnstzs9j3BR5GRbMlk=
X-Gm-Gg: AR+sD13d7HhrcFeyV9qwD8npZu4SqaHuGzvpfT0Z5mF2xSwcJLBHHZjfF3DX86IMDYi
	b4uxkT0aJBb9w0x56U5AIg7MAdKHEd8vWFFh/ZpVNqxekO7ZcOkazWvVdc2laoq8/Dlu1s/ygyT
	lsgecFBt3icvlhA2l5cQ6S30VGaUy5TYfi5tuVylkQxujH9pKhQ5up3IT/9i5EclUXnjMqYFfL1
	S6ynMA9iilKCPx8+TK6Kt+cMnAKx3Tin/0NHrOIRckiy4oyYw1PvWhSfd2LiSDpMhQfdstLimDS
	sFFersGu4BTlltz2LYuNtcq6fvsGYC4O11UwGtkAWLLt0nur8hQcETLNG9Wyz4sth+WfWKqABjU
	JrrwLmeE8sKqhULtWMhrTCLWBMfCG8aJzdmQ3HT4OWT78idppxpxQlTVrLyozKiP0+EHeCDDg9P
	WTK2iVJxKOeIWOO5RH8O7IGPstM9lljabz6awk6LlW62X80fL2RuMef4vN+2TtEEJ6
X-Received: by 2002:a05:600c:1908:b0:499:841c:2016 with SMTP id 5b1f17b1804b1-4999fa6a973mr16566425e9.0.1786982082744;
        Mon, 17 Aug 2026 08:54:42 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610ecf4sm129358815e9.7.2026.08.17.08.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:54:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 17 Aug 2026 16:54:13 +0100
Subject: [PATCH v4] perf tests: mmap-basic: fix user rdpmc detection logic
MIME-Version: 1.0
Message-Id: <20260817-rdpmc-detection-logic-v4-1-c22074578f6a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKQug2oC/0XMQQ6CMBCF4auQWTtkoKUIK+9hXNR2SpsIxdIYI
 +HuNm5cfsl7/w4bp8AbjNUOiV9hC3EpkKcKjNfLxBhsMbTUKjo3PSa7zgYtZza5bPERp1AsXK/
 lYNxdKijfNbEL71/3eit2Kc6YfWL9rwlBNBCRqFWnOknY4PPjdbwktl7n2sQZjuML1UtK2aIAA
 AA=
X-Change-ID: 20260817-rdpmc-detection-logic-d3f7a49cfb46
To: Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>, 
 Qiao Zhao <qzhao@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_085445_375528_B2E95769 
X-CRM114-Status: GOOD (  26.64  )
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

From: Qiao Zhao <qzhao@redhat.com>

RISC-V and Arm control userspace counter access through
/proc/sys/kernel/perf_user_access. Add that as a fallback to
set_user_read() so the test can test both the enabled and disabled
states on those platforms. RISC-V also uses a '2' value rather than just
0 or 1 so add support for restoring arbitrary values.

On Arm, cap_user_rdpmc will always be set when requested, even if the
global setting is disabled. This is so that the feature can be enabled
or revoked while events are live. Skip checking it on Arm for the
"expected disabled" case, otherwise the test will fail.

Add comments, more meaningful variable names and improve the error
messages so that it's clearer what this part of the test is doing.

Signed-off-by: Qiao Zhao <qzhao@redhat.com>
[Test pc->index, fix bugs in set_user_read(), and simplify commit msg]
Assisted-by: Codex:GPT-5.6
Signed-off-by: James Clark <james.clark@linaro.org>
---
I'm sending this to fix the comments that I left on the "V3 resend"
because I don't think Qiao sent a V4 and it's been quite a while.

There were also some unreported bugs that I found during testing.

Changes in V4:
 - Don't remove pc->index check. Without it Perf can silently fall back
   to the read() syscall and the test is useless.
 - Test the 'expected disabled' case for Arm in an ifdef to workaround
   platform differences.
 - lseek() before writing to perf_user_access otherwise it's ignored.
 - Support restoring arbitrary values to perf_user_access because RISC-V
   uses '2' for legacy mode.
 - Rename rdpmc_supported to rdpmc_expected as this is what the test
   expects, not what the system does.
 - Label pc->index as rdpmc_event_active for clarity.
 - Add comments and simplify the commit message.
---
 tools/perf/tests/mmap-basic.c | 137 ++++++++++++++++++++++++++++++------------
 1 file changed, 98 insertions(+), 39 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index 5cec7644952c..4433a5df3d77 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
 #include <inttypes.h>
+#include <limits.h>
 #include <stdlib.h>
 
 #include <fcntl.h>
@@ -182,47 +183,77 @@ static int test__basic_mmap(struct test_suite *test __maybe_unused, int subtest
 }
 
 enum user_read_state {
-	USER_READ_ENABLED,
-	USER_READ_DISABLED,
-	USER_READ_UNKNOWN,
+	USER_READ_UNKNOWN = -1,
+	USER_READ_DISABLED = 0,
+	USER_READ_ENABLED = 1,
 };
 
-static enum user_read_state set_user_read(struct perf_pmu *pmu, enum user_read_state enabled)
+static int set_user_read_fd(int fd, int enabled)
 {
-	char buf[2] = {0, '\n'};
+	char buf[32], *endptr;
+	long value;
 	ssize_t len;
-	int events_fd, rdpmc_fd;
-	enum user_read_state old_user_read = USER_READ_UNKNOWN;
+	int old_user_read;
 
-	if (enabled == USER_READ_UNKNOWN)
+	len = read(fd, buf, sizeof(buf) - 1);
+	if (len <= 0) {
+		pr_debug("%s read failed\n", __func__);
 		return USER_READ_UNKNOWN;
+	}
+	buf[len] = '\0';
 
-	events_fd = perf_pmu__event_source_devices_fd();
-	if (events_fd < 0)
+	errno = 0;
+	value = strtol(buf, &endptr, 10);
+	if (errno || endptr == buf || value < 0 || value > INT_MAX) {
+		pr_debug("%s invalid value: %s\n", __func__, buf);
 		return USER_READ_UNKNOWN;
+	}
+	old_user_read = value;
 
-	rdpmc_fd = perf_pmu__pathname_fd(events_fd, pmu->name, "rdpmc", O_RDWR);
-	if (rdpmc_fd < 0) {
-		close(events_fd);
-		return USER_READ_UNKNOWN;
+	if (enabled == old_user_read)
+		return old_user_read;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", enabled);
+	if (lseek(fd, 0, SEEK_SET) < 0) {
+		pr_debug("%s seek failed\n", __func__);
+		return old_user_read;
 	}
+	if (write(fd, buf, len) != len)
+		pr_debug("%s write failed\n", __func__);
 
-	len = read(rdpmc_fd, buf, sizeof(buf));
-	if (len != sizeof(buf))
-		pr_debug("%s read failed\n", __func__);
+	return old_user_read;
+}
+
+static int set_user_read(struct perf_pmu *pmu, int enabled)
+{
+	int events_fd, fd, old_user_read;
 
-	// Note, on Intel hybrid disabling on 1 PMU will implicitly disable on
-	// all the core PMUs.
-	old_user_read = (buf[0] == '1') ? USER_READ_ENABLED : USER_READ_DISABLED;
+	if (enabled == USER_READ_UNKNOWN)
+		return USER_READ_UNKNOWN;
 
-	if (enabled != old_user_read) {
-		buf[0] = (enabled == USER_READ_ENABLED) ? '1' : '0';
-		len = write(rdpmc_fd, buf, sizeof(buf));
-		if (len != sizeof(buf))
-			pr_debug("%s write failed\n", __func__);
+	events_fd = perf_pmu__event_source_devices_fd();
+	if (events_fd >= 0) {
+		fd = perf_pmu__pathname_fd(events_fd, pmu->name, "rdpmc", O_RDWR);
+		if (fd >= 0) {
+			/*
+			 * Note, on Intel hybrid disabling on 1 PMU will
+			 * implicitly disable on all the core PMUs.
+			 */
+			old_user_read = set_user_read_fd(fd, enabled);
+			close(fd);
+			close(events_fd);
+			return old_user_read;
+		}
+		close(events_fd);
 	}
-	close(rdpmc_fd);
-	close(events_fd);
+
+	/* Fallback: perf_user_access interface (arm64, riscv, or similar) */
+	fd = open("/proc/sys/kernel/perf_user_access", O_RDWR);
+	if (fd < 0)
+		return USER_READ_UNKNOWN;
+
+	old_user_read = set_user_read_fd(fd, enabled);
+	close(fd);
 	return old_user_read;
 }
 
@@ -240,7 +271,7 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 	perf_thread_map__set_pid(threads, 0, 0);
 
 	while ((pmu = perf_pmus__scan_core(pmu)) != NULL) {
-		enum user_read_state saved_user_read_state = set_user_read(pmu, enabled);
+		int saved_user_read_state = set_user_read(pmu, enabled);
 		struct perf_event_attr attr = {
 			.type	= PERF_TYPE_HARDWARE,
 			.config	= perf_pmus__supports_extended_type()
@@ -253,7 +284,8 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 		struct perf_evsel *evsel = NULL;
 		int err;
 		struct perf_event_mmap_page *pc;
-		bool mapped = false, opened = false, rdpmc_supported;
+		bool mapped = false, opened = false, rdpmc_expected;
+		bool rdpmc_event_active;
 		struct perf_counts_values counts = { .val = 0 };
 
 
@@ -301,26 +333,53 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 			goto cleanup;
 		}
 
+		/*
+		 * When pc->index == 0, userspace access is disabled and Perf
+		 * will silently use the read() syscall instead. Test this to
+		 * make sure we're not doing that.
+		 */
+		rdpmc_event_active = pc->index;
+
+		/*
+		 * If we couldn't set the state, test that whatever state we're
+		 * already in is the expected one.
+		 */
 		if (saved_user_read_state == USER_READ_UNKNOWN)
-			rdpmc_supported = pc->cap_user_rdpmc && pc->index;
+			rdpmc_expected = pc->cap_user_rdpmc && rdpmc_event_active;
 		else
-			rdpmc_supported = (enabled == USER_READ_ENABLED);
+			rdpmc_expected = (enabled == USER_READ_ENABLED);
 
-		if (rdpmc_supported && (!pc->cap_user_rdpmc || !pc->index)) {
-			pr_err("User space counter reading for PMU %s [Failed unexpected supported counter access %d %d]\n",
-				pmu->name, pc->cap_user_rdpmc, pc->index);
+		if (rdpmc_expected && (!pc->cap_user_rdpmc || !rdpmc_event_active)) {
+			pr_err("User space counter reading for PMU %s [Failed. rdpmc event should be both enabled and active %d %d]\n",
+				pmu->name, pc->cap_user_rdpmc, rdpmc_event_active);
 			ret = TEST_FAIL;
 			goto cleanup;
 		}
 
-		if (!rdpmc_supported && pc->cap_user_rdpmc) {
-			pr_err("User space counter reading for PMU %s [Failed unexpected unsupported counter access %d]\n",
-				pmu->name, pc->cap_user_rdpmc);
+#ifdef __aarch64__
+		/*
+		 * On Arm, pc->cap_user_rdpmc is set when the event is opened
+		 * with userspace counter access, regardless of whether rdpmc is
+		 * enabled or not via sysfs. The event is always opened with it
+		 * in this test, so don't check it in the expected disabled
+		 * case.
+		 */
+		if (!rdpmc_expected && rdpmc_event_active) {
+			pr_err("User space counter reading for PMU %s [Failed. rdpmc event should be inactive %d]\n",
+				pmu->name, rdpmc_event_active);
+			ret = TEST_FAIL;
+			goto cleanup;
+		}
+#else
+		if (!rdpmc_expected && pc->cap_user_rdpmc) {
+			pr_err("User space counter reading for PMU %s [Failed. rdpmc event should be disabled and inactive %d %d]\n",
+				pmu->name, pc->cap_user_rdpmc, rdpmc_event_active);
 			ret = TEST_FAIL;
 			goto cleanup;
 		}
+#endif
 
-		if (rdpmc_supported && pc->pmc_width < 32) {
+		if (rdpmc_expected && pc->pmc_width < 32) {
 			pr_err("User space counter reading for PMU %s [Failed width not set %d]\n",
 				pmu->name, pc->pmc_width);
 			ret = TEST_FAIL;
@@ -328,7 +387,7 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 		}
 
 		perf_evsel__read(evsel, 0, 0, &counts);
-		if (rdpmc_supported && counts.val == 0) {
+		if (rdpmc_expected && counts.val == 0) {
 			pr_err("User space counter reading for PMU %s [Failed read]\n", pmu->name);
 			ret = TEST_FAIL;
 			goto cleanup;

---
base-commit: 6ae6fb96ccd48032b00a38d5f8e0e0a2cce4972b
change-id: 20260817-rdpmc-detection-logic-d3f7a49cfb46

Best regards,
--  
James Clark <james.clark@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
