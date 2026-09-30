Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F422CA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qxcYEDKyWbdJPgueyvc33Qxu0oOmHPyYCoQCetO3qI=; b=DxfE6kx7EGOjO0
	zofQ4La0DncQV6Zi3v8EU3fw20g5jW77GomTcaLEnRHGErOyMla8RTSdJsoB+DDRluQNHoOICHxcO
	MjkpmoRjuAMkIIcNjTHxEym0M/3c4NpNFr2vRDhpdRnpsO2gMKhzHiJ9pwP2h3ZhbwTz46ktr/0+k
	EVwn2jkSNHP5kL7Z4MVnwGtcfJJh7kXmgVfmosuxJZ8h1DgXdfhjZgqODhuuzFhtKJBz3JwiNmZbh
	5r1Z0NHfwDmnDd/buc1cMqtKfO0rDrrMIIqlXlgJv00bvb/o++nIzNRyd9Snn2Fx1tnOPCpVL0FwF
	OVg7e9RDN8gOh8rC9q7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnyj-00000005A8E-0sFf;
	Wed, 30 Sep 2026 06:39:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnyg-00000005A76-2WyW
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:39:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1ANDJ1264007
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JDL8L5Ufeca
	w9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=; b=h0PiS34F0bnhUpjKoN3WG2jxjFS
	vsDNMhlyfHLJx5cCT6oQxCVNS7e4uY815j/HS2XzKMojEowDQrI2BTT+rcN+QzkU
	yXmEJ0OmQFGEYlqQ93XexIe2HevxGP3NkFNOPhGbnZ3i/w4e/YtLKGMuChFll4cc
	rKFZSaOmZzFBImzSeatw4PKLiTr2ocJebm0JXmm7+QGrTh6TddkVUEoIiHG6On7I
	VB9dwRbBheiJFUbNCM78OOynRygywDrkKqjLajgo4oYwCcVudP8vLNwvEfs9qQC3
	zWdoqMUSpAkLAQ3Soc9SGFGRdG03ktpbBWHb74PLRbROJ7hGQF1gLIwfRXw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rheh8xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso1999548eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750381; x=1791355181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDL8L5Ufecaw9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=;
        b=RcW6MDXAONieYB9tF0AHg8QP23/ygAMB6HbYDdd3WEg1gkAzd9aSS9twoevxV6optl
         OtNJGh3m8+a56+xBzv3HV/OwOxBkLOJCapocZPafV+r6WoxU6p7rHj7l+Y3Va7ZBZOL9
         r9rKjXGoyiq5UVCaMzQP6BuunEX/YPbhfnEJt1e3NvofjCZyZ7ElYFQ40rW0lY6ImcDH
         Q6QdF6G8VVYEOsA9zE46JFDZ4tZVBavulIIhw0PUcBC+9+0xTeF2FqN4Q7ShF9nlhCLC
         mdfny6snrv4D5T1HYhtDmebSy1qkzNhO2PmEBP8jmUdAIcqW4GhGrmAz7EPrCiGWzArr
         2phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750381; x=1791355181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDL8L5Ufecaw9rYAA5nxqMzomuFEvy76+Mr0sJjLj5Y=;
        b=jRYE7ruK/7lJ4d+VjpxRq3E5p2SXXzWnqHV8YYDfZCgUhwN6ap8EN79x6f1ggCe/5H
         bldnNIaieDJdMOdF8FEFpvlQje7pr1rz9s8I+PG8YfFR/EVLxumS76dZao0kJZ/mcHJA
         GWkekAqzbJ7HQKnKdSjTBqlS53KxziglaqHYqUZLAAX+egx6iYkux2nfcBCUleCOV2sz
         pZ5mKGgAzgticFlNkexPBxqEaWt8QSdkPT+f9QzUeq6w8VrexYh/9qACWXNmuqtf/S8p
         km1ghgDYMarZ1gwp0kEzOCWzXx1WB7B8nlRkoUP26OdHTCJx/E0uYG7AC+kdKxuw7EGf
         WQ6A==
X-Forwarded-Encrypted: i=1; AKwUvBw32M/0+uhSmBiQ6CHfWhoyDu7WC5ImFlV+iCPzo2C3p3WFa1AxKcjr7zQRJKNCCBopJOxWjcpzumCxpQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k7AsT8uAUw732FBNn8wibnmX6mWIObVavEFYfQXYKOcynLCjgS
	wSqiKBWxPrNb7+3qFpiYgTY/4aZQT8R5RQ0VRbWwnw+IknvFvQarNd/nDG0gOw3Mwn6Odn0It1W
	YbHGWYQO2JLjN0n+a8XczRgp7x52rB3nXD3bkD/vsFmlBNuaYZP0u1eUWON2tuZgJvJGbwH0=
X-Gm-Gg: AYBFou0408nR5Q+m9/F5gYNQMnW0TKhA1CCmgkxhlASrhzcTvPKOE4sdONJNTUTB2Jw
	q8CpqfU1FEBBphFRBX2Mt5xyLQF7HO3BjReLD8dBy9Ce+z4ScQbqzMneNhFQPo9C1bbPCeXl9Vf
	rNfoHUqvwSbRwyhQgvmcXrCWRg+XNe6trSo8wKaipSH/U1UG107Ydf623TbuVkaYZa+oge9pQgK
	6B1S9kgLX/8t87ZP9EhgschwzVR8oPfMV8+VhAZ9lgHg0T6mgpUqeRHODC+8a3Rl3QZNecNQW6J
	Y/Sy5VTX+fnNE5UEIHHMmfJytlAu7AKogeYOqJA50n71aQeRaNyxDy4Uw7IL+ZWi1bziCzctlvw
	yjuW6Ld+iPi6Y/8keLDxfhSzfYA4RNYqHGsQtB9M5SUNbfIPJ5z8AYgNrkrmOJlMW4WxfHMCm5g
	ywmqsylLO0ZdP6wHYbjoV3UsOq
X-Received: by 2002:a05:7022:b902:b0:147:9ad0:cf15 with SMTP id a92af1059eb24-14d399e6230mr296172c88.22.1790750380494;
        Tue, 29 Sep 2026 23:39:40 -0700 (PDT)
X-Received: by 2002:a05:7022:b902:b0:147:9ad0:cf15 with SMTP id a92af1059eb24-14d399e6230mr296154c88.22.1790750379906;
        Tue, 29 Sep 2026 23:39:39 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:39:39 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 2/8] riscv: Add breakpoint and watchpoint test for riscv
Date: Wed, 30 Sep 2026 12:09:13 +0530
Message-ID: <20260930063919.608911-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: wu8nGehTzXFgkqMfpwtk0EtFMNSCl73t
X-Proofpoint-ORIG-GUID: wu8nGehTzXFgkqMfpwtk0EtFMNSCl73t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX6WicloF8sOju
 YJ0e4zF2jLbckgckxTwt6lfKThxnr6bdwgQNoBBaiLbggpXJ3STUNyS40I9/0I9kYx9EeNWRI6E
 NH6JxEElqmjmnoj+hE5zLXbhnu6oCuGXzJnPfVVI66VXMNwJh68M71v8uwIiJatuSCseFq3hxIv
 tT2H0FTGs5Ad8xZdE2DkEQtWAjOSWzuVhT0EgTGGeQoHMmFoPsvxTKiqaoU4HWxXxA8MUwwgZK9
 kU2QQOxOsMtU5E6jYuZpzkqGTR9riCD+TiGZAab8sfvsFWXPoBe3dmPkmZbwTbix6g8pFxg3u1K
 mfhSgBLrEat2TXvTXg8WnhDZ1SF48TYN6HywX8BeSjbiqZkCczy/siVdjrYrp3h9G9ekQvyEmvd
 TdTFl7SYXUaGt3cTIv2GCZwj6Mz9M6Kf+ECaAaCGrzFkhMnHr0evrcKZ8ZsAJi73D/43iBcy0l/
 BM42W8rWQW/282nUtwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX+Y1JtJaisifm
 Ek0hJPkZ1+CoxBoqdpss5v56UxJKvCqu7I2TTpvYUDZw7QH7GZ3fKNQ3/+RH3MFun41fshRN+dL
 VtdyWMrTE/vQU3DrKp+Pf2DxbTa6Yh4=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcaead cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qd3H3YWZb18LjlhzOR0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_233942_758189_72DDBD1D 
X-CRM114-Status: GOOD (  21.76  )
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
