Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712D6C55184
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qxcYEDKyWbdJPgueyvc33Qxu0oOmHPyYCoQCetO3qI=; b=Gm+Y+33nI0uoVY
	tv/6dInAUdgFzlzny2PML5xBg8jzAzJR/3HiZ2ZHdl3nzKra8SzYlsazk+8lFPj+Zj6q6coYbI4YM
	yU8OQJ3+lyOIWryFqPOYgNLpwZOLlGs61I58jn+1bztZuEtTQ0UGJD7vlqUwvBXAA66/RKgZ0O31T
	sYrv7zm81RtR+Pv4WavnUXPnMtEWA8WV0otoIZ4AxJD3n5NEBpdOlsY+JTcp0r33rVwUKWsJhxeRz
	NphLdeIk+a7C5dnP4pMO6KuA/gisFvTno0FTy8HekYOg+TZ9WEAJyReNtaSUBIxsZk58a8QfX7oao
	YM8+tcuoC1pHjGcqLJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt2y-0000000HFXe-0bda;
	Mon, 03 Aug 2026 13:49:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt2v-0000000HFWT-2UFH
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 13:49:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673DS55W1031911
	for <linux-riscv@lists.infradead.org>; Mon, 3 Aug 2026 13:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JDL8L5Ufeca
	w9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=; b=PcvdoPEzsECcN+Uj3R7ZuUQZAsQ
	sUl9+c/jhDZAbgmcnyV8qwbX6rssqi6ITatWqFwUDx3owcOXirwn7mIbt70zkdjL
	optjzwOPiRf9CRatpuOTkufgwDeHOEexD7mCySsLgL4+O3kYsPBLTW9omhI9cNT2
	2gc7b7Hdk6jj8edP6GONDUwltrNiDma2QUh6ZeUyZubCCttp14dN8wVecbCyh8En
	vWMjBjGo410zRizW5Ie4/MVFi7nGCpQl+G+iWFOrfG2uhA5VsstGeO2z4QcGoNkW
	yLSAiW5wx3zLzIh12TBGlay6xzyfXzPWrDymNOTD8bvEDVJsGVJwsL0LQfw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj79th2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 13:49:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b13so4254063a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785764976; x=1786369776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDL8L5Ufecaw9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=;
        b=PbBjRvSvXnLnvuaOhbzyEfFxEUV7c6Kv8qdiuePps/Z0R5a3e7+mcw62Ma3pRUKi9s
         4UP1V10nyGnkQEGWFSVWbdrzO/dJWBQiELl/TpZ5GT+8+NabNC/iAyyglkIOAZpPeWRP
         LaZOsbkQ9dwZdPpt5qOrnT+g3/X0jSHLMm3xg76dyeofPztei6iILFQWBg9wfJz2PzqZ
         g26xxJlpRKq76ylRnb15jfyY+qKCtJjirSx6he7scqer64JEdXVH+LpNMXOJeVO9Xdtq
         B4QixG9WEyDjd7u3z36LMht7JVrSXOfIT91X74/kAA+RqvoBXQ9Gu4JsQK5wV+LuMUWL
         5ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764976; x=1786369776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDL8L5Ufecaw9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=;
        b=hCXYqfLOZafz8OAkB6kIY/4d5VmZHcMqLdlPsiIl/wjiFD2K1nmDfaCucdB9X95KHU
         0PBHdIyKrB6G8uUaOV51hU1WDzpYdsvG29B1HkyQN6DGAf/ddTdj+M5141rNPUfy3O+m
         osDfdy/+9VUNG2z+aoC2/C9libjiM9P+VfCAOlVlfjzKYEnjXdDfMalTv1yHfbwJuINR
         DiKGU8t2WCkjHaRX4Vqq7DVpSCz0/x2/5/HiGKiWQdeV3EgCqf2hoGwg1GsLTYNjR/nc
         aczzwmnXWwohmpvqpISTUhWFpxcYUp0fYrxPY3LMzU3Ljshb0g/8FcB/j/hvGqNekXcj
         EhYQ==
X-Gm-Message-State: AOJu0YwR2V6FZRFL7Og9lxjEKTGo0IzX9CC7PpM7QEQcS0D4qDzokhXK
	y7LxfGBuyiaBGf4JdV5PnV7l/lu7BWI4FNgHw/EMYPsER1SUEcbzqmpQfEzyOMfZAy69H5EGsdL
	FFZqIlI9rT05MqyF34ilJtr19IakyIVao2KeBR50jAeO6FblR2lkw7kv9i4J7hZMfyWsxN3+xof
	buP1s=
X-Gm-Gg: AR+sD10rKrkw1v+S+Ls59J+v3s3VPdvQncZZ/1yypgs8LqXcxrd9iLItKR9fTPBYKQE
	dgDT1IM6CzOSo05zq7Kctt0ElDh118RAZY9Gnq6wZKC6GwVDLjLQ/FBLsxwlkg0RItlX2vmpeJP
	fNez1Crt0X86evXGLVqtE6b/HoVduQX12danlwWORlcUlYG+VviYOY9B/fmxcZ7ry8+oQer6kfd
	Xlt55ujI7rbfP0gwxUzHQBUTi6pARGU+ooIw77HWY1MdBnKTSfDUugf5WwxtbposQ9v1npBI416
	PGlizdHqCZdmGBWhEOXqQISC5QmU4bIpZFGDIh1V9dMoGQDGOVZdiNupUhAf/V6A2vyGEtshfU0
	CHzh3Hhv5hx0uky6abdFq/cXQrhMV/2Mypyj3u3Zd981yBSlzUox5URrX2cnbpkdxyLHZFuVlxN
	XcM0HekGdHYb3Db+9htuADh5Lh
X-Received: by 2002:a05:6a20:431f:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3c92a540ceemr9489641637.10.1785764975363;
        Mon, 03 Aug 2026 06:49:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:431f:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3c92a540ceemr9489614637.10.1785764974876;
        Mon, 03 Aug 2026 06:49:34 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm39278870eec.30.2026.08.03.06.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:49:34 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org, thecharlesjenkins@gmail.com,
        jtaubepe@redhat.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v6 2/5] riscv: Add breakpoint and watchpoint test for riscv
Date: Mon,  3 Aug 2026 19:19:10 +0530
Message-ID: <20260803134913.2013674-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: GBvcBYTL85FTw39y64lkNpTIvI0jx6VW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfXyyJAF6o1pgHy
 wkjjzq+h3vYW8QYUqhQYoJU3ARM0UO+hqnS7gwi+TqbAjp13r9IMr1hau0LAq0N05/OGOjOa72J
 lt7X2HEQgS3eSucVkhU86potd+JcU1Zzfmz59043RXrqDgh2BejtctvUxs82nno3xIRrkWYKmlc
 /RXzVOSj7Uc4QmpEKBr+bzONxRBJay98ATPy5b8Lqn5Mms+9rAqYcareeBzVEO3RFyvZpTK9WOX
 DAm5qKKOYQPXn77/GunEEyq2xtrXtUqj2NWrSKim0+nXUlHV320+Jf5ihEkhujGINuntlJugSoR
 Iwabt/UZY5z0HivIrFR3R22co2ZFolbv5w9lQ73TAEPQmYjbFQXfHgvZy/P3+nLddQ8XSPmxH7t
 oMcQ8jJRWckSx2Aq3mwheWyKOhN4lHB1tObqOPAD7GumDTtXGH4GNcIoH/0CUY5gafCQT+4KsED
 Z2QOb4nNJp2d1UKpIDA==
X-Proofpoint-GUID: GBvcBYTL85FTw39y64lkNpTIvI0jx6VW
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a709c70 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qd3H3YWZb18LjlhzOR0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfX+uwZo6/tdoGc
 W8fo5LvDyVOVi6cdfyHoAqRZNjrd/51uK6pcVh+1OfDwq9sJBcAEUuWFzORDDgPWlKGAJIatBJH
 Zxx/WsNs0evtEU3HksIfHsPC3ir5n8c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064937_748805_AD3B77EB 
X-CRM114-Status: GOOD (  21.62  )
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

Add self test for riscv architecture. It uses ptrace to ptrace framework
to set/unset break/watchpoint and uses signals to check triggers.

Also add $(KHDR_INCLUDES) to CFLAGS for the riscv test build so the
UAPI headers exercised by the test can be located during compilation.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 219 ++++++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 0b8f5acf7c78..b32c56b3c1db 100644
--- a/tools/testing/selftests/breakpoints/Makefile
+++ b/tools/testing/selftests/breakpoints/Makefile
@@ -12,5 +12,10 @@ ifneq (,$(filter $(ARCH),aarch64 arm64))
 TEST_GEN_PROGS += breakpoint_test_arm64
 endif
 
+ifneq (,$(filter $(ARCH),riscv))
+CFLAGS += -static $(KHDR_INCLUDES)
+TEST_GEN_PROGS += breakpoint_test_riscv
+endif
+
 include ../lib.mk
 
diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
new file mode 100644
index 000000000000..0649940b709e
--- /dev/null
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ *
+ * Author: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+ */
+
+#define _GNU_SOURCE
+#include <linux/perf_event.h>    /* Definition of PERF_* constants */
+#include <linux/hw_breakpoint.h> /* Definition of HW_* constants */
+#include <sys/syscall.h>         /* Definition of SYS_* constants */
+#include <unistd.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <time.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <string.h>
+#include <semaphore.h>
+#include <errno.h>
+
+#ifndef noinline
+#define noinline __attribute__((noinline))
+#endif
+
+static int gfd;
+sem_t ib_mtx, wp_mtx;
+static int bp_triggered, wp_triggered;
+static int test_func_sink;
+static const int wait_timeout_sec = 5;
+
+int setup_bp(bool is_x, void *addr, int sig)
+{
+	struct perf_event_attr pe;
+	int fd;
+
+	memset(&pe, 0, sizeof(struct perf_event_attr));
+	pe.type = PERF_TYPE_BREAKPOINT;
+	pe.size = sizeof(struct perf_event_attr);
+
+	pe.config = 0;
+	pe.bp_type = is_x ? HW_BREAKPOINT_X : HW_BREAKPOINT_W;
+	pe.bp_addr = (unsigned long)addr;
+	pe.bp_len = sizeof(long);
+
+	pe.sample_period = 1;
+	pe.sample_type = PERF_SAMPLE_IP;
+	pe.wakeup_events = 1;
+
+	pe.disabled = 1;
+	pe.exclude_kernel = 1;
+	pe.exclude_hv = 1;
+
+	fd = syscall(SYS_perf_event_open, &pe, 0, -1, -1, 0);
+	if (fd < 0) {
+		printf("Failed to open event: %llx\n", pe.config);
+		return -1;
+	}
+
+	fcntl(fd, F_SETFL, O_RDWR | O_NONBLOCK | O_ASYNC);
+	fcntl(fd, F_SETSIG, sig);
+	fcntl(fd, F_SETOWN, getpid());
+
+	ioctl(fd, PERF_EVENT_IOC_RESET, 0);
+
+	return fd;
+}
+
+static void sig_handler_bp(int signum, siginfo_t *oh, void *uc)
+{
+	int ret;
+
+	bp_triggered++;
+
+	printf("Breakpoint triggered!\n");
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+	ret = sem_post(&ib_mtx);
+	if (ret) {
+		printf("Failed to report BP success\n");
+		return;
+	}
+}
+
+static void sig_handler_wp(int signum, siginfo_t *oh, void *uc)
+{
+	int ret;
+
+	printf("Watchpoint triggered!\n");
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+	wp_triggered++;
+
+	ret = sem_post(&wp_mtx);
+
+	if (ret) {
+		printf("Failed to report WP success\n");
+		return;
+	}
+}
+
+/*
+ * Keep a real instruction address for HW execute breakpoints: prevent inlining
+ * and force a visible side effect so the function can't be optimized away.
+ */
+static noinline void test_func(void)
+{
+	test_func_sink++;
+	__asm__ __volatile__("" : : "g" (test_func_sink));
+}
+
+static int trigger_bp(void)
+{
+	struct sigaction sa;
+
+	memset(&sa, 0, sizeof(struct sigaction));
+	sa.sa_sigaction = (void *)sig_handler_bp;
+	sa.sa_flags = SA_SIGINFO;
+
+	if (sigaction(SIGIO, &sa, NULL) < 0) {
+		printf("Failed to setup signal handler\n");
+		return -1;
+	}
+
+	gfd = setup_bp(1, test_func, SIGIO);
+
+	if (gfd < 0) {
+		printf("Failed to setup breakpoint.\n");
+		return -1;
+	}
+
+	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
+
+	test_func();
+
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+
+	close(gfd);
+
+	return 0;
+}
+
+static int trigger_wp(void)
+{
+	struct sigaction sa;
+	unsigned long test_data;
+
+	memset(&sa, 0, sizeof(struct sigaction));
+	sa.sa_sigaction = (void *)sig_handler_wp;
+	sa.sa_flags = SA_SIGINFO;
+
+	if (sigaction(SIGUSR1, &sa, NULL) < 0) {
+		printf("Failed to setup signal handler\n");
+		return -1;
+	}
+
+	gfd = setup_bp(0, &test_data, SIGUSR1);
+
+	if (gfd < 0) {
+		printf("Failed to setup watchpoint\n");
+		return -1;
+	}
+
+	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
+	test_data = 0xdeadbeef;
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+
+	return 0;
+}
+
+static int wait_event(sem_t *sem, const char *name)
+{
+	struct timespec ts;
+
+	if (clock_gettime(CLOCK_REALTIME, &ts)) {
+		printf("%s: Failed to get current time\n", name);
+		return -1;
+	}
+
+	/*
+	 * Deadlock fix: avoid blocking forever on sem_wait() if the breakpoint/
+	 * watchpoint signal never arrives. Use a bounded wait and fail the test
+	 * on timeout instead.
+	 */
+	ts.tv_sec += wait_timeout_sec;
+	if (!sem_timedwait(sem, &ts))
+		return 0;
+
+	if (errno == ETIMEDOUT)
+		printf("%s: Timed out waiting for event\n", name);
+	else
+		printf("%s: sem_timedwait() failed with %d\n", name, errno);
+
+	return -1;
+}
+
+int main(int argc, char *argv[])
+{
+	sem_init(&ib_mtx, 0, 0);
+	if (trigger_bp() < 0)
+		return -1;
+	if (wait_event(&ib_mtx, "Breakpoint") < 0)
+		return -1;
+
+	if (bp_triggered)
+		printf("Breakpoint test passed!\n");
+
+	sem_init(&wp_mtx, 0, 0);
+	if (trigger_wp() < 0)
+		return -1;
+	if (wait_event(&wp_mtx, "Watchpoint") < 0)
+		return -1;
+
+	if (wp_triggered)
+		printf("Watchpoint test passed!\n");
+
+	return 0;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
