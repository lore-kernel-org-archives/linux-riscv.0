Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5991CA6007
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i10yWVB7bG6rPnMF5VQzLLsE0iGO9otbn7XIcPu7FEE=; b=VhwA4VuTEcyb8Z
	YNzKvcxiZS+wIUdaB9kndzaXZglHtCo9R7urnZnwsufGnDnGV9vPnaUNLZj5HIB8j0eJvW459O1Fj
	vSmzEpLyu7JlfqKmx7x5gAn11nd0Ywdj5rfGSrP2y8VPkVpitnGSx4EPAnYHrdUHx6rM2e1mw3K25
	PqLd0TDfFiLolaaxNz5di2obeu5vyWnTDp7JvRxfxUO4J66fTmR1CaVAlWfpnFJvm5roZD0TrpBi3
	Hmmxyu+ROIbu/z3YNvpAFaEeSxFZIUR2GW9h1aB8YqNmtxtEOCN0VLsNyzqIOSCvhsFbOJpSGhlhn
	bz2yUGIKJuIgmtdBgpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPGV-00000002Eau-38D2;
	Wed, 07 Oct 2026 10:52:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPGS-00000002EYp-2ule
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 10:52:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso9225885e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791370367; x=1791975167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNNH9av8SFT8quNSTc63AF+CNNxl0BFefXFN7mUmANs=;
        b=pUQ/p44f3KVl+kg/+QDMeFL8+0ixI2uXzhBrNUfYiYUN44ibokrQCzuofOsD8a9XU1
         a6pVzTsmo0OC4AaPEABowVvoJdLsfntzQ5lsqmG80kN254hX90TT3jqbilGTwspM2cl3
         Rp9KUV/FbUhzxD98Nd8aqNAxGv9OXnxWcmmHddRaTgs99fyvfWa3w81pdGIu7lQ80FNk
         6N5AT4H0DUqI9Y8yuyvoLigbcoAklt94sx/YBdWQYN8yEJ1CztvrXnqRfWHfTWWelO/b
         O53o0E/hzsosfvGktS0baf5xPw9iVBa2w1qgxTY3asa+vJYPvyUrIHRCa7LfQqh0xGG7
         p3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370367; x=1791975167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNNH9av8SFT8quNSTc63AF+CNNxl0BFefXFN7mUmANs=;
        b=dy+MfR0Iw2IESCih7AHanch4HbxzqDTxsKsp5YmQs89Lpi8dNbuV48dVZ3oV4ROeg1
         keB/aDGLR1VCHRvTZLnbXhv4hGCXzmVbHA9e7CcUIVtLXnLKBIYs3zwUUcbrk0ccyQJE
         ON+8Qa7IAOsgCaYAgJ+bELzvCLka8DuS4eo5rF5XrDWpRKXuqLp3lmXLZNQIkANkdkTp
         ThwGWW30obh2PGtxLX0IqJabCa2Q/iMO+1yRTS8SM7n/pZIhBZ2Dsn8imUnHChYPnT+8
         oKAOy9dcT415XwAkqNCI9dvDY1v5EGBtnoJtHBCSHYAY2npKwu1+rwK095oVSBFCPT3g
         x+CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsV3/ZOFrpuLWLzh7sCN65yE9/F3DG0MYa3BLTUym2Jz8ZY5c99hQI5M/JDST600vVUu7qqKhu1/o5Zw==@lists.infradead.org
X-Gm-Message-State: AFuF++nhcXBqS67mpv7IRlbdnaIVMcqxvgLCIXHIYa+2FThNbu4urgY6
	0eHn6cxozroN7LehXcA16oNrOE2xOZzINO1SVESaPv9EkYWOGXE71kmiKqiunfuJslA=
X-Gm-Gg: AYBFou3arQmKhve6uZQf8EJVtrswCkdQGsBUxzlhlEdpMO5gRkj/AnRH0+DfEU4aq6d
	0AyoALAgNrGsNYdi/ci1MSkJYkXhl+RAUXbUlB0KdWM73a3V0NalQ4TIlAsfxdsCjRw3bXarBCn
	OWV3JnUjVfAN/5Nbdfar4O541ISkooi7PkPbiWIpJ8G4UoWH2c8hxshnpueh0TPtLXsebEfq+tx
	eg4dbSDOzIgSSc92h89sZgg0IdAibgGdidr42RJyIjU+Q+m82VYW6tcUmn5XSzbdFv0EImg4Xn+
	2dXSXchfdU5Npn450sAXdof3kzQ0SKJcjxL1RGLoNofYOkSbgFBDHQfgf3YQu4FV+pChJywU0b+
	ztFd4P+5C4Fv4xAWayWDrXAeb1eTcWCTTXwR5FyHmbBYas94wQrmyR6s6U1yw6X2hv7E1q91Pn+
	Q5oDp2tc4+NUyr5iTHnFpBu1FOnyKk3o7ehz0q8GyrP1wkWTnkzhI699wL8vsZxVKKsZlOpIIbt
	Q==
X-Received: by 2002:a05:600c:3f08:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a1800ca17amr25117305e9.2.1791370366620;
        Wed, 07 Oct 2026 03:52:46 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm5182781f8f.51.2026.10.07.03.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:52:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 07 Oct 2026 11:52:13 +0100
Subject: [PATCH v6 2/2] perf tests: mmap-basic: fix user rdpmc detection
 logic
MIME-Version: 1.0
Message-Id: <20261007-rdpmc-detection-logic-v6-2-d7ed6a85f864@linaro.org>
References: <20261007-rdpmc-detection-logic-v6-0-d7ed6a85f864@linaro.org>
In-Reply-To: <20261007-rdpmc-detection-logic-v6-0-d7ed6a85f864@linaro.org>
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
X-CRM114-CacheID: sfid-20261007_035248_795157_FD768E75 
X-CRM114-Status: GOOD (  25.80  )
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
 tools/perf/tests/mmap-basic.c | 137 +++++++++++++++++++++++++++++-------------
 1 file changed, 94 insertions(+), 43 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index 208cd889f23d..2d892a51a7f4 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -2,6 +2,7 @@
 #include <errno.h>
 #include <inttypes.h>
 #include <stdlib.h>
+#include <unistd.h>
 
 #include <fcntl.h>
 #include <linux/err.h>
@@ -12,6 +13,8 @@
 #include <perf/evlist.h>
 #include <perf/mmap.h>
 
+#include <tools/config.h>
+
 #include "cpumap.h"
 #include "debug.h"
 #include "event.h"
@@ -182,50 +185,83 @@ static int test__basic_mmap(struct test_suite *test __maybe_unused, int subtest
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
+	ssize_t len = read(fd, buf, 1);
+	enum user_read_state old_user_read = USER_READ_ERR_NO_FILE;
 
-	rdpmc_fd = perf_pmu__pathname_fd(events_fd, pmu->name, "rdpmc", O_RDWR);
-	if (rdpmc_fd < 0) {
-		close(events_fd);
-		return USER_READ_UNKNOWN;
-	}
-
-	len = read(rdpmc_fd, buf, sizeof(buf));
-	if (len != sizeof(buf))
+	if (len <= 0) {
 		pr_debug("%s read failed\n", __func__);
+		goto out;
+	}
 
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
+out:
+	close(fd);
 	return old_user_read;
 }
 
+static enum user_read_state set_user_read(struct perf_pmu *pmu,
+					  enum user_read_state enabled)
+{
+	int events_fd, fd;
+	enum user_read_state ret = USER_READ_ERR_NO_FILE;
+
+	if (enabled == USER_READ_ERR_NO_FILE || enabled == USER_READ_ERR_PERM)
+		return enabled;
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
+		} else if (errno == EACCES || errno == EROFS) {
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
+	else if (errno == EACCES || errno == EROFS)
+		ret = USER_READ_ERR_PERM;
+
+	return ret;
+}
+
+
 static int test_stat_user_read(u64 event, enum user_read_state enabled)
 {
 	struct perf_pmu *pmu = NULL;
@@ -246,9 +282,6 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 			.config	= perf_pmus__supports_extended_type()
 			? event | ((u64)pmu->type << PERF_PMU_TYPE_SHIFT)
 				: event,
-#ifdef __aarch64__
-			.config1 = 0x2,		/* Request user access */
-#endif
 		};
 		struct perf_evsel *evsel = NULL;
 		int err;
@@ -256,8 +289,28 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
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
+			goto cleanup;
+		}
+
+		/* Check value is in the expected range */
+		if (saved_user_read_state != USER_READ_ERR_NO_FILE &&
+		    (saved_user_read_state < USER_READ_DISABLED ||
+		     saved_user_read_state >= USER_READ_MAX)) {
+			pr_err("User space counter reading for PMU %s [Unexpected current state %d]\n",
+				pmu->name, saved_user_read_state);
+			ret = TEST_FAIL;
+			goto cleanup;
+		}
+
 		/*
 		 * Restrict scheduling to only use the rdpmc on the CPUs the
 		 * event can be on. If the test doesn't run on the CPU of the
@@ -301,21 +354,18 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
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
@@ -363,7 +413,8 @@ static int test_stat_user_read(u64 event, enum user_read_state enabled)
 			perf_evsel__munmap(evsel);
 		if (opened)
 			perf_evsel__close(evsel);
-		perf_evsel__delete(evsel);
+		if (evsel)
+			perf_evsel__delete(evsel);
 
 		/* If the affinity was changed, then put it back to all CPUs. */
 		if (pmu->cpus != NULL) {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
