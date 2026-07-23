Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E59C531C7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0deK7BksPrEJH2/c9KMnQksDAc/CXifmWhf9RYtHp/k=; b=gynjJMAWGqtnyA
	9rkvbtzVPgngcURrFNVZ9tzl5ueDjSt/erhWck+Ax4TA2h+OJEyjoIrrC+BU3WLgvizguqZzIWuSo
	md/Y9SxXpn7h7mp0GNRO1nH2F8W1FN+bnuS1BRt7MV+InCMAmUrq7mf+cC5k96QaF6xed688rURSG
	GzNQ76Bh0xY6Y2Gug87CLeowJa309Ux/uNRYEOFVwceAi4Ui6cyLfvgHlpP8x7+ARF20pm3u5bzfK
	mF0nKYh3R4/hH0k88hApPFlOMcCtnGEBpoTmp5SbqRMz8CjICyf+fnAI7OF5PMj6zx8Z6jLNbrQw6
	w5NG4DAQUJQUdzFsJxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp71-0000000DmPH-1LTi;
	Thu, 23 Jul 2026 08:49:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp6w-0000000DmO4-3bV5
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 08:49:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7Bb413416116
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dbZ3xXkQg0G
	AoFQOuj7Xc4PquM86bkn9GebR2/Q4dKY=; b=E6iNzAOnIjRAjyIFB7T3Pv8X8Hb
	whLl1BVA0keQjDLAN3tUX/K849j+1g4nSNnvyAKxDYHDUSh1iZu6VWnfaNfdwQAE
	PgWVspIK3OLMihDErPzcmBMosSCCWiC+fWdQ/k1PiLBWNKC7FMf8+mNLfL6cBJzh
	FRAr6sl3DTXZxnlvcXUuRQfr3u0Bw3v3aQJSvvgTc747dH5u6qEA/k2gM3vWcaeu
	OISWiHTlyyQ0dLonKTxopv0yGMgHJnjDcMPdKsiP2a89RWh/BKDzafgZJpKJIxDW
	nA3NUeWxeEjrfj8V1CltSuOUvL7VLQkT29afYOLYoP6sKSVhc8+Aoj4ngbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7j43j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:48:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so965798a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784796538; x=1785401338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbZ3xXkQg0GAoFQOuj7Xc4PquM86bkn9GebR2/Q4dKY=;
        b=WWD7FCOOS5AZLFrLHI7naV+0abg5MoG48bhbBdLob8xoo5ub4ci4PG5vm+nXOJ+uhM
         4FHOYmL32v+CthIlgcwfY44gIwkMQm8Ssi+QTxXddXULu9e81c6w5miiTaXyny8o/Fri
         /ZC4Lb02ymqNABDqBCf4x+awfghPpqL0KqXRBcI52tmetJ5rdd/6h2/XmN/0f23UCAkh
         Jf87TsC+286ZVARlYQnM6Kq4aNSLg8jEo++ojxcOVN62bQnWpx9hiVGtOz4/PleAxzv+
         /L1wKmMydpJ+n3TjAcVpkUvH1Lz6T1DeyT2sP6sBpyuQzCqUOhP/og8TLbjsVJUHLTQr
         jkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784796538; x=1785401338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dbZ3xXkQg0GAoFQOuj7Xc4PquM86bkn9GebR2/Q4dKY=;
        b=nil/lwD8/1ZTYdPuhFgfTGKvxJ1JaCHtbMSKQzLlTMnQCbE23KcXCLJ27CRHyN7MGh
         8LOJhDlJ3SKUKBlUOa/d7MdV4OyiV58ofztIaYRrbqUenx/T4V7SjB0aeE5mSik/tHdf
         BnLFBc//caaqyhi06zi4812IeZ4x7fiMtPwApcBoZM90ns6zprrVJ4IIqHNXo40gbbyI
         DVtxQTTjjmr2FAPelvsIghtcm0qIoneS3e8QhLUp/PIPC0uyJgJQt0kW3F2pHEXhBeCW
         EVO8rhP+bMQ7f7Xng4BxY3zUS4FtYjX1WF4cv1kb9qIK9+7xfGu2cybkAnvZmi2HpG0S
         6Spg==
X-Gm-Message-State: AOJu0YyoHSh3GHPc4IV+mBYNnIjjrLkWEXwWeYuqEcqabBi5gdbzzMhm
	JIrfexyGIWiMGSE6Yb5+yFrL0HMpOZAXOG5YtMNMjBH+u6SoEiMJ54GWgYaA+EpZNokV/nIZei9
	6/7y3dDzo8DZdKblOkABnxbuJtfRiVhe5z8izbcHpZrfo6dBNiy74p50rccC7yONauj9frD5tIa
	XAZSQ=
X-Gm-Gg: AR+sD13PLMqGXaxAsE9c3I7DVg/WD99qEhq8M6n+4ho/ktnSDAkzRF19vbbvvDoGwSG
	2QS0/dYPLFjpvc9Dw3A+IVmgefMH0CAmhvwNEwSOdXvFvI0Exkslgn+r0ZbOkisL1QMN79A3Kxv
	jNAJ4MymNA+wsln8c0X5B2o4RBCQ7zhAUJLUL4qTjq7OwsZKLCgbVHB9nm3DBO8w3SfZDqEkPPg
	uMriOoSdUDR5DB5VdB/6m0JU+xj4ng6FDQU3t1kz0Y5m1ihO76pjsXareTyEfvp0WEwbiEk2/Xo
	qSnBl+Sj94/nyRBbaKVfhazlTkP5J8D+tLyam2LG/6xA9hWswSoo7ztKaxN/VvIIojOYrfAvlL/
	p0CNL45y3qk6YZfrnPA4kwX3MD+AxYERoF9bb5EsfPRNg3Z3sfRagoNUitVPYvZPCv3DizllfJt
	wNeC1NzpcdIBMSO8rsH+20uAu5
X-Received: by 2002:a17:90b:568b:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38ec6636864mr1986749a91.30.1784796537707;
        Thu, 23 Jul 2026 01:48:57 -0700 (PDT)
X-Received: by 2002:a17:90b:568b:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38ec6636864mr1986727a91.30.1784796537225;
        Thu, 23 Jul 2026 01:48:57 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130ce035sm13852140c88.13.2026.07.23.01.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:48:56 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 2/3] riscv: Add breakpoint and watchpoint test for riscv
Date: Thu, 23 Jul 2026 14:18:39 +0530
Message-ID: <20260723084841.2988456-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Fu2vk74g7qGLd2mkcTDB3CrkMljYMySn
X-Proofpoint-ORIG-GUID: Fu2vk74g7qGLd2mkcTDB3CrkMljYMySn
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61d57a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=DSfzdtd1K3_Evk7s5LgA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX6leXNCEKeql2
 RwH3pG8oPmEpQJ5y6BJarv1wmh4fTiF2UkVg7QH2+cBNbmvW1FFsZMUIcIPewW9TByrsGh94lsl
 B1ZRZkRCTDRz/Wlqnlu2+KQAnPtUEbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX153M94BUUirw
 yGo6gU9vJWJFmjfs4UyP8qAmdsdrXxslCZu4E+NCOl8tjfhOMcjlY21I3NlrUdG0Dl1gmQcAW0h
 xfVJVffVTpmGJbkyLjDWZ+uuTdRH1krZoKe0qhSzSPgQWeUibP3Ex79GyDWfESaGgeRQgIoWJ5Z
 ZvkqckMcX+NM8A3dbSa9PJZaxqQaRfDEDFEqzVKs28P2X3+63cYYOOM3YZHZErxjz0HoFJBCDaD
 tVb0sh1KqD1NjRocKuynulV4JK/STYA/UeK/CCwRieFFmRex9jwJMcGx2gafRQE2hbVUpnM5Qz9
 KZO8d4cKdmcVAjgoguwLuvuVbvmJqu5tcAlV/9LPbgVcfjOXm50NKBLYKOIcQC9LHZFaXLwIlEv
 BhMNxquBl/nv28Xj2eHlFJ0UwJMZWt7HkC0+HFMraqatMLVDF6DarNYjXrGTVNLcvcXGyq1K1Q7
 2grwY5yZyjft942IY9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_014858_931494_AF9795F0 
X-CRM114-Status: GOOD (  21.47  )
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

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 219 ++++++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 0b8f5acf7c78..c16782460b49 100644
--- a/tools/testing/selftests/breakpoints/Makefile
+++ b/tools/testing/selftests/breakpoints/Makefile
@@ -12,5 +12,10 @@ ifneq (,$(filter $(ARCH),aarch64 arm64))
 TEST_GEN_PROGS += breakpoint_test_arm64
 endif
 
+ifneq (,$(filter $(ARCH),riscv))
+CFLAGS += -static
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
