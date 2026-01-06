Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8500C47BC4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNDk1TCsQLisp7x0GcRqvC22AyBdCnez9UuHuDJemHA=; b=w5aPFaQ/cmQQnN
	FcukdjIU+2NadITdyLTt87uPN3xfokXUM8YlBPhF2SM4C7Zd2Dnx5mAShg15qtgvPWVVfWMra2NZV
	mNR2/PHrOnvS/5LxJi3NaCIMOgYIPjj0xkMTqfDgksgX5fI9Hi4unb03H44QMmwUmTD96tynPVmou
	uvw9rLW7fYiADqy1h0E6jp1oXfH8Ffjq39+FC3QzE7XiVcgBpgeUtUkKsQhkMjfxOnYSF8rZ5L3uA
	18VbTp1GqqhVDiKCEIBy5pdLXhjcWg+/FGNS5pnRZIymXbjHoav7C4KXh/Mplw0vJId7nBI/za0NE
	f/EVb84nbypaBKD2gXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2J2-0000000CbPA-1sDp;
	Tue, 06 Jan 2026 08:20:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2Iz-0000000CbOd-3VFV
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 08:20:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60648xaR2253762
	for <linux-riscv@lists.infradead.org>; Tue, 6 Jan 2026 08:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xdLN8gp2iYt
	sa+buiIL+YLUY6aOwhIzSMbCHhXwEH+U=; b=k2HuLKPjgzJdFIGI66uBsE/wevB
	LGcAvAeHZOPPfUzBYoOYjoT+w+dBQ72VH9e67BHKLl7p+OBXYCeLxjNdLl0Cze93
	IoThi/Q6hst6NpRCB8Vocq81I8hWxLVckYg6jRtLWrTSnUOsZsqdGwEgXyLUu/CA
	lgiXp2raQFvCqKu59UZJGt7icO087zJWfmI58tzTOmROxB2wrlrIeGq3QtLv/r/r
	CLPk2jGBc9NTsepdQbPSZLieUhMgUhzdIBD19WOW3bp+JsGjRLqY9U4IIyMV5WVk
	dpIPc6mPaHrwaB0Or7vV7fls/t/agigU3cyR4I4D9o3frg/Z4sQzxFLCMoQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu420nkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 08:20:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a13be531b2so19588905ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 00:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767687639; x=1768292439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdLN8gp2iYtsa+buiIL+YLUY6aOwhIzSMbCHhXwEH+U=;
        b=UPt00YAjCiGM5bo/aowHZ+Ct+jHq5yLhUDiYlVs9/Sbivm4U2FGwLzt20C95SiErIv
         cZaa1KqOdAin5VMkyRtlf+LdsVrSf+IryX+EZHUQqjRgIuiWS+fESh/i7UXflFMvCC+r
         LnjyPkj1se5Lekij+WEhMpru6K/rHTJ80qaa+aZI8OUaup8lMxGJmEDiuhde2QcdYCDZ
         Yhg6cES79QRptrCV2oGfPcQPMTKaxdBGnLksIj6xsMsNXLFwZcUzr8cRsOJYjMGqiiaD
         inkatxUdUNJ7wgOMMOhqK1w4i93r2kq2PIlipdLkpeSMIheX5+mK3MR/TcEN7uzM0a8L
         aXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767687639; x=1768292439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xdLN8gp2iYtsa+buiIL+YLUY6aOwhIzSMbCHhXwEH+U=;
        b=U9Mr7F8yAm9y7VXYIytebZVOCBFiBRvBA6yILhSUiOyAy6J0czR2M4we/2iImJ0aKQ
         Z1QtaqCkXEa56r1CNA3Sr4aNbrV54d4kqCmng7vLv8kdYU0H9ISoI4yi85+/+XdXQHs0
         0nUxTmymIeMuMqgzmqs739c1Wm97dfSxBI6xA/n7dguV0ax0rvMLDfE0Bfgflj1lN/Vw
         2mKyVs+rA1zjCuGhh6/XDG2S1lmXxpNH4m/19h67t8cz5CLRzMDoy2v+ntEBaXRlbnwD
         FnRUFfQkfnL2ieXumx31q9YULR5L90SdDY3G0pyPBZG3bYe6eNofELCOzEvJugapxs9a
         i97Q==
X-Gm-Message-State: AOJu0Yxn2Iv6GcwQA6sUqtYTbwJsi8uadXbbl84MQUY1QvxwbMJDyvtb
	oYeugjA9MviD2LD/KSmuqO0Qm9G0bhRA2N3R+6lrluHh/SrbxShe8UTsAny1aQwXkJk/7vWcDw/
	8QPKn/BmCcUQ67YEIwgQMU8E96LWF3SQqCOUWSL6ROxtazw2dcY7qMrZ3UQVj9U7LtbLeNWKvRA
	Cb804=
X-Gm-Gg: AY/fxX7Uh6AQEDXP7dalqkJbRM3QpqdiKmvtJj6iGwJ0wx2+dzybGKBhPY2G9q+sgne
	Rg266QvSrEnZUtj2zMBY7X7+L/ztk152ZJuVsJrl1AChX8/HOV6Hpj29GJaNmiD/QzV4a3q8ZPU
	RKtJckkhFNrRZ67UKfd7rL1utiGfOu7X4ODcXaYckqmVCwIHN2iBDfod1dqg4ypJqlIx9cMwCdW
	b+4Q0XNilRIRlyNbbMWpSk8ean5jnZAl2E6rcakJ5ok9HbOTXIuXf1KdkM1FiiUPVZxg7Tb2n+O
	4dhe/ULvqrxh+YGr3FUTzS3bJ4jZlE3u0Pv4DntQcfZrkld449aFaFAm08ymgXMEPIfZ2CR0As7
	2R5Vi4FWyRZdFM1xB7fhcIvxm5XBgWT/KCp6tm20hHrJV/sWWs+qPjIodwlnX6PvcIe2nWyHs7D
	jdxqPWbNVnAmeAJmU4M0QFeoDYucz/QV03fA==
X-Received: by 2002:a17:903:110c:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-2a3e2d960fcmr20048575ad.22.1767687639289;
        Tue, 06 Jan 2026 00:20:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA/uHLI4xr00mnqhl1psEElvufVyZv0KoqxEVx9FlB28ve897iNw4jrfjMPA8acOXxNxZZzA==
X-Received: by 2002:a17:903:110c:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-2a3e2d960fcmr20048375ad.22.1767687638784;
        Tue, 06 Jan 2026 00:20:38 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3284sm14545575ad.91.2026.01.06.00.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:20:38 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v2 2/2] riscv: Add breakpoint and watchpoint test for riscv
Date: Tue,  6 Jan 2026 13:50:21 +0530
Message-ID: <20260106082021.2680658-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106082021.2680658-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260106082021.2680658-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695cc5d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nrFWDfrXf5gqSM9dz-wA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 76_KO09wurOVOTAaPW5wuAkTQQd3h0ee
X-Proofpoint-ORIG-GUID: 76_KO09wurOVOTAaPW5wuAkTQQd3h0ee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3MCBTYWx0ZWRfX1vuB4MwuIHpJ
 oAxLkmoB8urEfWCD796Ou/yZUYjvcWUs5gZf4mDHNyUp7NKRaZL7knv3bjSIHYwf48Zz1+1C7g4
 5BZE1UQwvPYvC6rlTS2MPatOG067eGjnC/VUDThNPz5pxvJSwbFc4ppGDqjxiv4jWUQYOqJxjrH
 0OTJyCGjZ9dqx92z862g6u9R7IP2PnPh5jw7r6EANHZwislUwWKCcQvT/waCVrkiyLSCXBWxOtW
 2xZUagMj8xOld8I8wRjOUsEdA7GQtVyc4uA4dUBI+nuGSFz/F09my3P+vaMKS4hN4StPDr6+nXn
 yp0wHsbzrJKaj8xpgPCfK1VxkIL3eTEqkT+qg0azR4GkC9EjU1333pF6eOEn84u5F0Co2dEkiKe
 8TF9PduJXWebACqULnOkj0iKBDwq/0nQBBWoC+ZNoFMai4wEKvvzdBjMfQX76tOeF+lJ/dZKfkG
 ZsK+F0lXW5LcwSGEvUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_002042_020453_1A3FDFBE 
X-CRM114-Status: GOOD (  19.11  )
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
 .../breakpoints/breakpoint_test_riscv.c       | 172 ++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 9ec2c78de8ca..97ab746908d8 100644
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
index 000000000000..61b9c53bb214
--- /dev/null
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -0,0 +1,172 @@
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
+
+static int gfd;
+sem_t ib_mtx, wp_mtx;
+static int bp_triggered, wp_triggered;
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
+	fcntl(fd, F_SETFL, O_RDWR|O_NONBLOCK|O_ASYNC);
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
+	printf("breakpoint triggered!\n");
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
+	printf("watchpoint triggered!\n");
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
+static void test_func(void)
+{
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
+		printf("failed to setup signal handler\n");
+		return -1;
+	}
+
+	gfd = setup_bp(1, test_func, SIGIO);
+
+	if (gfd < 0) {
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
+		printf("failed to setup signal handler\n");
+		return -1;
+	}
+
+	gfd = setup_bp(0, &test_data, SIGUSR1);
+
+	if (gfd < 0) {
+		printf("Failed to setup watchpoint\n");
+		return -1;
+	}
+	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
+	test_data = 0xdeadbeef;
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+}
+
+int main(int argc, char *argv[])
+{
+	struct sigaction sa;
+
+	sem_init(&ib_mtx, 0, 0);
+	trigger_bp();
+	sem_wait(&ib_mtx);
+
+	if (bp_triggered)
+		printf("Breakpoint test passed!\n");
+
+	sem_init(&wp_mtx, 0, 0);
+	trigger_wp();
+	sem_wait(&wp_mtx);
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
