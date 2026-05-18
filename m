Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621C6CD4F4A
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODyEds1KOpsjZq4cz2GqlaRbzm9hVifBrk0pR7Sce6k=; b=mj25HIwmGJqbqa
	GQmExwbBqFCfuttvqfFf4yht1JeCpYO78xZodRh6MJ3sSb8TMBXFsQoNDSRtkhwmkoj3AAnS9sk39
	eX99KV+3tVOjMpLbXtX9yZGodCGJ26CF+S9n6TUMUWzhLqJ0FW1LGXQTbrNb1nw3XXNU27YlFAr2c
	bfMz2j3kmFHcz8VuQdW0D7HeNUyc97OcSdGAG5qbb1DCui5DPxySZ07CdkkJO4J2k/aZ5pNtNhxtD
	5I3K4zHZ5Envdj8D5q/X3xWZZv/l8BbwcnAnCtbq4onFiaM6jmos0Jcy5g4anseYbyTRHt6QJv4Hc
	BjFQ+JKn+Lg+w2/NBbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrx3-0000000EVFC-45B7;
	Mon, 18 May 2026 06:59:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrx1-0000000EVDj-3Phn
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 06:59:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6s4T84172509
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 06:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/Bj06COUQIs
	cFqII6dwWM4/3R9nLRsenJmBkVyAtqa0=; b=k+9g+4J7IcC+Qfhw3Rt2JmXsyXm
	nlaNLKupT81zyZIuIQoA2LbtLVd80wVc/ZOcJe6nHcOHDH67rSHvSRQlTLfr4JaS
	GOhUeVIB+sIr+fRxYYxY3eDPxZ/lJpx6+A4fWKuPg6H5jqtV4K2kpW9Y0XHrMgu0
	Bx2XoYXfAf5abjwGrZgSkAO7lUeU2T7jpNownwVP9Gk+c+u+tB8YUW/QhgTk5E0f
	oXU7t5ZwYmN4bQ5ssNRKcCyTfM2n69eHScN+UBrLjmJ/ujetokVA/ZzSyay2X3Qg
	vya66ONW8GXGjgiSqyDzEezbBb3Y+QXtCHlAy1AbKfSLSFb14Buz6EOnkMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g52aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 06:59:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso4040881a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 23:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779087583; x=1779692383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Bj06COUQIscFqII6dwWM4/3R9nLRsenJmBkVyAtqa0=;
        b=fURhq5+5QSOVFt+M3aPT+au327Wt3M5SOuKGM/OY62K5Zhhs8yvuwV2l6gwS7PHvzw
         aPb5mOAWoSCwmN9GtShJPlA2SoEQUK2JXPWQvGRGRHqQnJMqR097oksaBxJv5rGh+USl
         N6xDwOqcrSoHQH6Zezj5RyLbik4mIwQvPlPxCHLjEontiUyazQ/KyPWSJMqrvknPW0bo
         P7jWodJdjI8sOlMz3ykpSHARA2IaDUd+op+V1/XjJH1hs5TG245qUKxsSJyrKvOWLSuE
         UFPRuxAR2O+BwOKxi8DOSNnmcbr7WaeXc+PFhqLlrIDf2OhkHOU+yJmi92ZbiUqWIq/Z
         LsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087583; x=1779692383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Bj06COUQIscFqII6dwWM4/3R9nLRsenJmBkVyAtqa0=;
        b=eFRGXUtWaqs01DPk/596fkZDaXeMaJDfCusBtfRmMM1NZjxsk6dR2OlvbBTJekGyeG
         tbPrzXiumseV2KuYLKxjDgPWrRBmrcZcUepRLt26uy1tAI2g7JZpykveEeVcNLGl6zVN
         OG5Rz+MGu4wqfdfmYLERUvQR92E3e43mP8gfAGyWrjiUt0FzwXSdg+XHMqF9g2nCCoYm
         IvH7RQm2Cy+C92qvQez2wB60xeMJbiVK66OrodRb7unEhCEkOTjWujb2ftcz+1BK2jjC
         rxFR/UEvnwjLQ7HoKs+2anwPppwXgJfiin1dFG80MFS52jqrn9onAsb3ePNNLyTT++BJ
         /11g==
X-Gm-Message-State: AOJu0YwWClkayM6NQ/hOwnaunJf8RgsaYlZiRbOnKf5RZHzBkY1dUsHT
	pQcCvBlhaoNuULC/6gRy2ubkHG+AxY3fRuuSmLiio+qucI5TokOF/ZVgHDf0IU6xqwGWMAcJ6UP
	BLN2qiqrQucfUHccFGxrbtUZq9Ch78Brvm5NIWKoK2FEjLiA5NqrTfs2iGgROSzDf+/EXdnElFz
	jfUY0=
X-Gm-Gg: Acq92OGKUoiVWrOnmLLthCW5aH726vXcC1cM0VsQZ7Knio9Sg30xXWspWPp2U+JN7YF
	9j3GxxUiLPPt06Cx3yza5Tzm9r8v2rW+zNlnrZ4CZjqt3WgB5lRT/CaHwZgAOmOqJTCvSP9WmED
	vLvPOpCdbs0RI5X/6cStEvRgR10VK49oZc1qe/CD1JIH7xBfHMu1SoDegZC2CBcMxn3UFsAPy3s
	5muTyLcnqDQptXuYVK/afbm47iHUKZgKAJmPRvbS76vitKT6aYFcsm+WDRB/sajWOM1lWferrSO
	hFCOaP+gC75ylpL3utCYmH+Mma2+lD8DUmUnqF9Q4zJapjosVvqPvJhJjSX8dyN1sPzFVBQwnQc
	gMbyQwK4kZZgwuMYVk8v6jj2OelYczWMqqL+5PnuPbIFaXceMP6/fm/UmA8/dO/Cv+fhG3uEbQo
	tp/VrE2XO39dKbksNkV3692+d++0rFUi7qN2jo/e3djeS/vg==
X-Received: by 2002:a17:90b:5284:b0:367:bafd:9431 with SMTP id 98e67ed59e1d1-369519e1633mr13608395a91.8.1779087582600;
        Sun, 17 May 2026 23:59:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:367:bafd:9431 with SMTP id 98e67ed59e1d1-369519e1633mr13608371a91.8.1779087582096;
        Sun, 17 May 2026 23:59:42 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c5f0eb2bsm2058381a91.7.2026.05.17.23.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 23:59:41 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 2/2] riscv: Add breakpoint and watchpoint test for riscv
Date: Mon, 18 May 2026 12:29:19 +0530
Message-ID: <20260518065920.872131-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518065920.872131-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260518065920.872131-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2NSBTYWx0ZWRfXxPyWB36qKyiS
 BUVseBDVF2Eo5qiLmVSp/2OC3FmKmdBq+8KyNq5ewD46E9ffbvX6prkwQIs1WKs2zihKXYL0RCH
 xxAW34BL2xrJOS1DHpykw8HIoaZcenRpw57r/zLOOWG6x8Y8D0+7ba8hFuQ2QW3YnUwY/XK0u+v
 KX9TBP9u9NuP3d6MgLDNCG1sk6+VnJUtp3zaW1FWrdC/OiLR93vseZ6WxDyK0ILWpfaof/DbX8I
 nUdoIQSKryFghaeUjzLrpo4VaD+EMZzLUk3HVVob3sRYcVTvHunnEx655p5ZF9+15VKX7YVcnq1
 uYfzBHKZ3+/pYQ+ltICVihMaXY/6+fGs5MtD8nnorWusVAgNqKEuvDr+QOY7lHs9eEXBlMad41f
 TozvZPXXjKlbJrXAQCM3+5bOMPjIMfsRy2hvS9kV3+rTPoixAhhIM08sL01KRSxoR48aGcwsQQa
 sKkU7c+sHN8gQr4DUUg==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0ab8df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=DSfzdtd1K3_Evk7s5LgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 17n7lt8I-DP6D823CKM2yuCxrkr1YUgt
X-Proofpoint-ORIG-GUID: 17n7lt8I-DP6D823CKM2yuCxrkr1YUgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_235943_858472_F3F5FA01 
X-CRM114-Status: GOOD (  20.64  )
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
 .../breakpoints/breakpoint_test_riscv.c       | 214 ++++++++++++++++++
 2 files changed, 219 insertions(+)
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
index 000000000000..35c043f4271c
--- /dev/null
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -0,0 +1,214 @@
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
+static int gfd;
+sem_t ib_mtx, wp_mtx;
+static int bp_triggered, wp_triggered;
+static volatile int test_func_sink;
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
+static __attribute__((noinline)) void test_func(void)
+{
+	test_func_sink++;
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
