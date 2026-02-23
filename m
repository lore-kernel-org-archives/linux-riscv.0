Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DCBEF5877
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 04:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3S4tVBUNKKalbkRrJvGD5pvWWPTpzc2m1Qmsss+VEKY=; b=M6xCDtuUJ2Q1lv
	1kw8VANcEGI9D4AKoDcsP2mroR3aUjXhhcLttuMO6r/pKImoVwBEwUZCLvEKZEZq6rqGFslrv/XsO
	s/r6WBxq5WwY6sDLaqe1XTch1RxFs3PBVj8AvY/kbN8st1KoWTepPodmFW2PJD5DISWvVuRHnY2y3
	scBWTGH9IdcPWGWci1oqaf+AtG7WmRs4bV/sVslZLm1KHzGMpVLK/jrepRFdUOZOKy5MX6+84C33s
	WjhjyXRD+aSQGaL6bgWYi3egLuklRC1Y2H2HlvXMukks6TKLVsD9EYHGy7VBYTNbgrTu9DHApUPJ+
	nHSoTjiQLJydCt7c3jFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuNt7-0000000HDwr-0SsW;
	Mon, 23 Feb 2026 04:49:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuNt3-0000000HDvv-33ik
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 04:49:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLr4Do1378896
	for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 04:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=egzfNbh3HAJ
	iRnCnPia61D3MzSNiVuhX7/RNpQxB+r4=; b=jnZglraS82aPNBUugtut+006vLW
	QRhLfA89u/ArYkohAAQKwylwsAR8OTr5RVkyVkovrJaBlLRCipK2izxd1TbZOjPI
	NaEYRc5HpCtLbqTqT+WfHubydTy65uv98hCSz/x4PD3XuFNxsRvFkJCB9dKYK4Mk
	4m+c+ocJVWuJwwKSfbzbEcXPL+8MkYsQQF9t5GnQsZQWgnBRaiHV0lQj8fiTCGU+
	p2aBd4l9j+DMrkrxNhXb39Mvv/X6xhaZRsKtjbI9cMdRUZ7s3HHcQ68XgSsKnCKj
	CIdyJzylj7hD9GXt+dDCGTaYeIa/pgCV131XqbmyHhwiNVdTfRtNGY3i9EQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7udf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 04:49:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad6045810so40972555ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 22 Feb 2026 20:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771822176; x=1772426976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egzfNbh3HAJiRnCnPia61D3MzSNiVuhX7/RNpQxB+r4=;
        b=ddfrWVI8j2ONhL16bYH7YiLEKctIXFvYpP7haurw1QAX6KM4WdPoyAx6+2G9+/FYY9
         wtBW+GYOIUC7QKTbD2QctXc2NHGcpfwUUjtyc54Fi/OPF0Q17iYEei0jgrI5zPAgXHmP
         KdyV+ibpzK6yLwE9J8gJ5IOqvzJQP+zK6KmL6KPgRl2rxTtTl3BkSG2gJWSvcx4/r73l
         ax60PDqUJweYWOl8Wik7L1NcYjXGnNP1KRPZ0QbE1KE4jOWcLpcRGUzemYraPMvcn5Rl
         ujZZhXTRdi+kQ/kD1Ww2FmP11/Z6tgQc95lRgfRD/K0IWYNwd7kh66lJws9H8B7Qhg3+
         vdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771822176; x=1772426976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egzfNbh3HAJiRnCnPia61D3MzSNiVuhX7/RNpQxB+r4=;
        b=M9fTPtsrlCOvk1ubNkGHWa3u7/eX37j98Xby1y1M1QlLc3V4Hb3O1yGcOqia31GU6J
         +R9nN581oDJpxdTGGBXcOjR5tj+0grM5y8Q8RzQObXdQm9VtcR7DVh7q0rsh1j15rWb3
         wqW38LI1LqCprIoeqfatsKBEWCdvQ4xTyO1ePEmRd3yhc1nmHj69L2kJya0T9jEhlG6r
         8DHJ7UWc251Q9/gDkBKmVOPdMLitPFbOnzq80iKotaNJbHmWDnEwk0dn7BElkOUXe+SW
         ofeCq5Nd5xISTZX+RIdyeNZ0RO0gznr/4bxryE+n8HyzhEQErhGXav7XSQCu0b/gM04a
         lkpQ==
X-Gm-Message-State: AOJu0Yzn1rgu0q8kvOhNo0VC2vW+7vnYIydkJ4vOLd+IUVK1qgpasuvQ
	OrE0OjUuXApq4GmTlMM2/S6OYIYGHzHecSQNTzPgx5EtaRC4d8xz07fPw5tedLroAL1YvPsEqXz
	VYvzgpTn7CKHptbmb1lacz01fH/Lunl8fRlWz9PQy+jJ6H54U9AX54DBdEFwbLj5dRQyq92iSSC
	g7uEA=
X-Gm-Gg: ATEYQzxoIorcDPtcJ/KqY+e7near/pcORwWr7tYwo9tcoBmjOEJd0mR+uM6eEgXrVJn
	biLlQ+GZ3wnCobiRK8cD/XCzjSnM3/9cGkqsvlrBI7VD+pQ/GecLgzpPc1W0bZ0v878YfLHTdx7
	vFxlMfY1YDYgLUfXukRWEMusvJ2h4cQfqUlzBIESuYFqmo2wW0UmrMblUMQPGGk1b5UNc72bbZD
	bw7/ZpDOHKLKodLnjC9W0xe8mxL4M2jm5ufQypIaaHkjXpF8yYSSJLfbUntSJaa6VIz0aIgQViF
	POWnTsX3L6tHUNG7EG9E6OZ2ZxKKc3bw72g4HkQovRjyggZqrJBf0Pd42iLsJ8uPkfQuEk79WjK
	ZEoK27g4wbiU84EOxpMrL+yTTheez8DNQjqQqKgXNFkgxLPYXRkuyGvwhHP/8Ma4PSe+TBsj5gL
	2r5m1jkKwUN72xEAr4bJntQrMdI5txL+gtDBvOS/8G3YJoIA==
X-Received: by 2002:a17:903:124d:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2ad744edc09mr76376625ad.29.1771822175471;
        Sun, 22 Feb 2026 20:49:35 -0800 (PST)
X-Received: by 2002:a17:903:124d:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2ad744edc09mr76376395ad.29.1771822174972;
        Sun, 22 Feb 2026 20:49:34 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a2a768bcsm5623954a91.4.2026.02.22.20.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 20:49:34 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 2/2] riscv: Add breakpoint and watchpoint test for riscv
Date: Mon, 23 Feb 2026 10:19:18 +0530
Message-ID: <20260223044918.1359983-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA0MCBTYWx0ZWRfX6Lw0/Lkj8e44
 zaY5eHURtPN4IbqXGYNmgePTnMICeLn6T0u1iO1NUlbZeKTWdGAuWWui4Hx2zNDioG/yQHvui6l
 /ZIoSpvzvlLGb2U043xueKyobeHaozi8f4hAvmx5e7LHpBWmKoLFJztMHBQ4Gci/NVXpKTn8Vea
 kS1BX++K/QmA5VTPw2fK/J62KWBx63eDfW1DnIt7YzcaYESh8cFuEgWUYZw7F17jaTxhNf3voe0
 GIXx+EnTby2bufWKU/ORRaF2BOBDiDuewEeUddpH9Lsc0oBawmUyxTFTzrpeBnelrbX15VldJSu
 +mh08ZC0qoEnXOo+Odg0DPalZksrSl0pOr8lVibtm42v5mC5wjGnvQ28Mg81CPNHRh0Yq3ifYBg
 p4nhp/hx+sKMakerSRbydK9kmMhet3ZuZE4MUTPSRYfZXzbhK90Cle0Jo/QzkBPNkTIX4Zj4Wov
 ZhnFTuxYB1u5TYk6D5Q==
X-Proofpoint-GUID: wqsH5DwduPduwGehG30yzGJKLtK0x4t_
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699bdc60 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nrFWDfrXf5gqSM9dz-wA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: wqsH5DwduPduwGehG30yzGJKLtK0x4t_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_204938_673646_87C4722F 
X-CRM114-Status: GOOD (  18.21  )
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
 .../breakpoints/breakpoint_test_riscv.c       | 174 ++++++++++++++++++
 2 files changed, 179 insertions(+)
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
index 000000000000..e07f6fb1cfbd
--- /dev/null
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -0,0 +1,174 @@
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
