Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4951CA5FFC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCHZZe+aCmSke734XRbIraV80MsyNbg+ZcqguSnqvWA=; b=SwHVyfmhVOvi87
	X8zkoVoZkOKu2SYzcMsqKshvDVBYJbtsiWKWNdm0o+BBRwhaaK0SZcdudsvaYTAcqPqp4SZJIJhLm
	AfYGu2vZcOiSqQtGA8JY318NwC1RUmHQvIYSgBWWb94pk6j/tZzmO0LjPX4Xq1NZehlKzZE3mGb11
	iJJbVaxQSI3cO1W8MTkLoPXJ+LwH7vdW4MaunDSyUKhMj3mQ+xrV7cvRQHb/8vVk5WXYR6jNX71yc
	KyE5iNARaz0wumQzlVjL0J48+HrfdsSn3iAxje4Ems1k82AbO2gwLxK1rgFzN3tEbBL7h1yzk1aop
	+2t6zPq0Cvdf2MdPwg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE87p-000000019Ui-3SWM;
	Tue, 06 Oct 2026 16:34:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE87m-000000019Td-0mj5
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 16:34:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so17146445e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791304480; x=1791909280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v77RP6NX1t8+mngdQWnjTKnGkpEcdnikya0pL1YxqU=;
        b=l5dvmbfHWl2bMRiwra02FtkbGuKdVt+aaOx+Wm++0TTMk8SfRb33lOYfzYLjuu90tA
         KTIZUba9eyA5zlH84feLYaONh9vcBYHhfQ6I+kUXRpYtDUS2RBYFAtEta2T23k/YzivH
         COXJbuS+p6jUtUkYqbmkfLYKdImDyvtxA3rN01crzAe95Jagm+WlRn5S8jpQUuQvrfG2
         olsjx7m4rR3AiYVkPlD5sWb+XNZ5mTBQOALCkqYDmSHI+IMNVOvdqkIcJraHCs7HouYK
         NmehqYUuompN/RbXjv5QvsRlwPBP+2P1b9j2/ge/Yqb48DE1eg3D4gaB+p+WbfXTuVFp
         JPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304480; x=1791909280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v77RP6NX1t8+mngdQWnjTKnGkpEcdnikya0pL1YxqU=;
        b=Rk+zWj7wdx0eC9YqIz+POeeVtarfjTHq9HFDDcgyqxk+L91fbtcj/VmpeXFN5ARuWv
         APBdIjapLlabwarkdRywn0Y/ZDovT82b+ShXXtRn1fB7wCM8p3stWtQe3U0j93q7few6
         QUW/7iwwTZ5cdcZ9VwBrXVX24Xh0X7OzSEzPqRSK+w2kjWgbuvUjhobC7q8LrOyGeuuY
         AEkknNkIifpy4Dat/1hbHZe0Zbw92yoyHIC6wAs8nl+ImjBSt93CQ6Kqpv1fT5lRZTJc
         MVk/VUg/zKhJFv0S3jqkcUui2cC+vSB+hnqA/G2iYvxDk8PlM1h4YYkXT4qry3ket4WQ
         wiow==
X-Forwarded-Encrypted: i=1; AKwUvBxSXYG5dMi8e7y/0imlWbx5fwwlRLe5WRt87uwJLCtv5ITpPbGjHE1UEKt0d/2Df097bqhCY+W+9mTSMg==@lists.infradead.org
X-Gm-Message-State: AFuF++nfrVhxEcgwiPdtW4sYwuCbUsPrsDjfTQ9dVfA1fm+FoB9Ya86o
	/FfhjhlTNiImYi7MApaRRx6bS7uSNPVKPKzhWjkNija4I8ji9dLGIL4FtbGoV1Zgoms=
X-Gm-Gg: AYBFou0Bg/c3dC2vsAAh1kjoUfuTyXF8P7Y9FFdputj6zPaH2IvhTjh6dqmj+vZ9n9t
	PKlACLqyF81SIdUfTdOPy4DPpxadhPjMvtJSQgcmfvO17FL6D1H1Yiv8/KMh5R8tIjyle+S1hRs
	qiZexC6TepOT+JZzu1zON+WvCVrzo+Wau+rEzhw5HmaYaBu99mOUKUAzsypOHbtLPPOXjj5/96b
	qnmiuxxsTJkn29aE9XsIz/+jTbwSenMTwhNQALn1be4odH9CFRTZAO9X7C7dt/KHzmoSWfMblvy
	qUVcDvz7cFktESyVdmgwuh/cs3N45qGk1ZneL9w99JKWtR0OtyE30QekA1aHQDGteTxdi6DIBD2
	IPLsu/YKCTYnnKJZadF8K0wH/qnGZXl+Los7KODYNXIgxn9j3cGgp2yhvB6uexAM6FpqCf1IOtV
	1rMWP98224nfeZ5stOKGdJyqh37zIYbVqYWKOai7lC/Xojq6JoNWmB7SSp7VzP/w0mBexEUMDGx
	g==
X-Received: by 2002:a05:600c:3552:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a17b551effmr32518595e9.17.1791304480263;
        Tue, 06 Oct 2026 09:34:40 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm78918555e9.3.2026.10.06.09.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:34:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 Oct 2026 17:34:13 +0100
Subject: [PATCH v5 2/2] perf tests: mmap-basic: fix user rdpmc detection
 logic
MIME-Version: 1.0
Message-Id: <20261006-rdpmc-detection-logic-v5-2-b25c9d49baa1@linaro.org>
References: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
In-Reply-To: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
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
X-CRM114-CacheID: sfid-20261006_093442_471801_42765984 
X-CRM114-Status: GOOD (  24.90  )
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

RISC-V and Arm control userspace counter access through
/proc/sys/kernel/perf_user_access. Add that as a fallback to
set_user_read() so the test can exercise both enabled and disabled
states on those platforms.

Document disabled, enabled and legacy states in user_read_state and fail
on values outside the known 0-2 range. Preserve and restore any value in
this range, rather than just 0 or 1.

Skip when the control files exist but can't be written to
(USER_READ_ERR_PERM). We can't rely on always being able to write to
them when an exclude_kernel=0 event can be opened because opening events
might succeed for non-root users when perf_event_paranoid=-1.

This test isn't run on unsupported platforms since the previous commit,
so we can simplify the following things:

 * Test that cap_user_rdpmc is always equal to the requested state
   rather than checking it only when disabled. As long as we stop
   setting the cap in the attr unconditionally on Arm, this is ok.

 * Remove the USER_READ_UNKNOWN/rdpmc_supported fallback in the checks.
   Now the expected state is always the one requested. USER_READ_UNKNOWN
   only controls whether to skip restoration of the state on unsupported
   platforms, so call it USER_READ_ERR_NO_FILE.

Signed-off-by: Qiao Zhao <qzhao@redhat.com>
[Re-write to fix bugs in set_user_read() and simplify tests]
Assisted-by: Codex:GPT-6.1-Sol
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/mmap-basic.c | 131 ++++++++++++++++++++++++++++--------------
 1 file changed, 88 insertions(+), 43 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index 208cd889f23d..2c3276e82da8 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -12,6 +12,8 @@
 #include <perf/evlist.h>
 #include <perf/mmap.h>
 
+#include <tools/config.h>
+
 #include "cpumap.h"
 #include "debug.h"
 #include "event.h"
@@ -182,50 +184,79 @@ static int test__basic_mmap(struct test_suite *test __maybe_unused, int subtest
 }
 
 enum user_read_state {
-	USER_READ_ENABLED,
-	USER_READ_DISABLED,
-	USER_READ_UNKNOWN,
+	USER_READ_ERR_PERM = -2,
+	USER_READ_ERR_NO_FILE = -1,
+
+	USER_READ_DISABLED = '0',
+	USER_READ_ENABLED = '1',
+#if defined(__i386__) || defined(__x86_64__) || (defined(__riscv) && __riscv_xlen == 64)
+	/* Unrestricted access on x86, legacy access on RISC-V. */
+	USER_READ_LEGACY = '2',
+#endif
+	USER_READ_MAX
 };
 
-static enum user_read_state set_user_read(struct perf_pmu *pmu, enum user_read_state enabled)
+static enum user_read_state user_read_file_op(int fd, enum user_read_state enabled)
 {
 	char buf[2] = {0, '\n'};
-	ssize_t len;
-	int events_fd, rdpmc_fd;
-	enum user_read_state old_user_read = USER_READ_UNKNOWN;
-
-	if (enabled == USER_READ_UNKNOWN)
-		return USER_READ_UNKNOWN;
-
-	events_fd = perf_pmu__event_source_devices_fd();
-	if (events_fd < 0)
-		return USER_READ_UNKNOWN;
-
-	rdpmc_fd = perf_pmu__pathname_fd(events_fd, pmu->name, "rdpmc", O_RDWR);
-	if (rdpmc_fd < 0) {
-		close(events_fd);
-		return USER_READ_UNKNOWN;
-	}
+	ssize_t len = read(fd, buf, 1);
+	enum user_read_state old_user_read = USER_READ_ERR_NO_FILE;
 
-	len = read(rdpmc_fd, buf, sizeof(buf));
-	if (len != sizeof(buf))
+	if (len <= 0)
 		pr_debug("%s read failed\n", __func__);
-
-	// Note, on Intel hybrid disabling on 1 PMU will implicitly disable on
-	// all the core PMUs.
-	old_user_read = (buf[0] == '1') ? USER_READ_ENABLED : USER_READ_DISABLED;
+	old_user_read = buf[0];
 
 	if (enabled != old_user_read) {
-		buf[0] = (enabled == USER_READ_ENABLED) ? '1' : '0';
-		len = write(rdpmc_fd, buf, sizeof(buf));
+		buf[0] = enabled;
+		lseek(fd, 0, SEEK_SET);
+		len = write(fd, buf, sizeof(buf));
 		if (len != sizeof(buf))
 			pr_debug("%s write failed\n", __func__);
 	}
-	close(rdpmc_fd);
-	close(events_fd);
+
+	close(fd);
 	return old_user_read;
 }
 
+static enum user_read_state set_user_read(struct perf_pmu *pmu,
+					  enum user_read_state enabled)
+{
+	int events_fd, fd;
+	enum user_read_state ret = USER_READ_ERR_NO_FILE;
+
+	if (enabled == USER_READ_ERR_NO_FILE)
+		return USER_READ_ERR_NO_FILE;
+
+	events_fd = perf_pmu__event_source_devices_fd();
+	if (events_fd >= 0) {
+		fd = perf_pmu__pathname_fd(events_fd, pmu->name, "rdpmc", O_RDWR);
+		if (fd >= 0) {
+			/*
+			 * Note, on Intel hybrid disabling on 1 PMU will implicitly
+			 * disable on all the core PMUs.
+			 */
+			ret = user_read_file_op(fd, enabled);
+			close(events_fd);
+			return ret;
+		} else if (errno == EACCES) {
+			/* Permissions failure, flag the failure for a skip. */
+			close(events_fd);
+			return USER_READ_ERR_PERM;
+		}
+		close(events_fd);
+	}
+
+	/* Fallback: perf_user_access interface (arm64, riscv, or similar) */
+	fd = open("/proc/sys/kernel/perf_user_access", O_RDWR);
+	if (fd >= 0)
+		ret = user_read_file_op(fd, enabled);
+	else if (errno == EACCES)
+		ret = USER_READ_ERR_PERM;
+
+	return ret;
+}
+
+
 static int test_stat_user_read(u64 event, enum user_read_state enabled)
 {
 	struct perf_pmu *pmu = NULL;
@@ -246,9 +277,6 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 			.config	= perf_pmus__supports_extended_type()
 			? event | ((u64)pmu->type << PERF_PMU_TYPE_SHIFT)
 				: event,
-#ifdef __aarch64__
-			.config1 = 0x2,		/* Request user access */
-#endif
 		};
 		struct perf_evsel *evsel = NULL;
 		int err;
@@ -256,8 +284,28 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 		bool mapped = false, opened = false, rdpmc_supported;
 		struct perf_counts_values counts = { .val = 0 };
 
+		if (__is_defined(__aarch64__) && enabled == USER_READ_ENABLED)
+			attr.config1 = 0x2;  /* Request user access */
 
 		pr_debug("User space counter reading for PMU %s\n", pmu->name);
+
+		if (saved_user_read_state == USER_READ_ERR_PERM) {
+			pr_debug("User space counter reading for PMU %s [Failed to get user read state]\n",
+				 pmu->name);
+			ret = TEST_SKIP;
+			continue;
+		}
+
+		/* Check value is in the expected range */
+		if (saved_user_read_state != USER_READ_ERR_NO_FILE &&
+		    (saved_user_read_state < USER_READ_DISABLED ||
+		     saved_user_read_state >= USER_READ_MAX)) {
+			pr_err("User space counter reading for PMU %s [Unexpected current state %d]\n",
+				pmu->name, saved_user_read_state);
+			ret = TEST_FAIL;
+			continue;
+		}
+
 		/*
 		 * Restrict scheduling to only use the rdpmc on the CPUs the
 		 * event can be on. If the test doesn't run on the CPU of the
@@ -301,21 +349,18 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 			goto cleanup;
 		}
 
-		if (saved_user_read_state == USER_READ_UNKNOWN)
-			rdpmc_supported = pc->cap_user_rdpmc && pc->index;
-		else
-			rdpmc_supported = (enabled == USER_READ_ENABLED);
+		rdpmc_supported = (enabled == USER_READ_ENABLED);
 
-		if (rdpmc_supported && (!pc->cap_user_rdpmc || !pc->index)) {
-			pr_err("User space counter reading for PMU %s [Failed unexpected supported counter access %d %d]\n",
-				pmu->name, pc->cap_user_rdpmc, pc->index);
+		if (rdpmc_supported && !pc->index) {
+			pr_err("User space counter reading for PMU %s [index must be set when enabled %d]\n",
+				pmu->name, pc->index);
 			ret = TEST_FAIL;
 			goto cleanup;
 		}
 
-		if (!rdpmc_supported && pc->cap_user_rdpmc) {
-			pr_err("User space counter reading for PMU %s [Failed unexpected unsupported counter access %d]\n",
-				pmu->name, pc->cap_user_rdpmc);
+		if (rdpmc_supported != pc->cap_user_rdpmc) {
+			pr_err("User space counter reading for PMU %s [cap should match requested state %d %d]\n",
+				pmu->name, pc->cap_user_rdpmc, rdpmc_supported);
 			ret = TEST_FAIL;
 			goto cleanup;
 		}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
