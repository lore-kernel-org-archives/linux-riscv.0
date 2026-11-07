Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E7E606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iId5feEW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbXY0gAz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DOt00m1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ewwaZJyiAAEd7domSTz5Cq8A0sowhBP0cGggaihVZvQ=; b=iId5feEWbpQmPaBGx/PpJJCg/q
	ojE2JkNxAihJkj8jpZBLXZ5SKrsWdt8ccyr7C9EniGG3tDkr0nnVX75PzYK6nueSLpVdGpCWlk1ti
	O7mtRzjmE9WXvA5Gnx6KAGmctUbUk8zPdU0jNoxTyVhLl8tl5MbcRkjKdOaPB6O05Z9G8ZvhmoKjW
	4c92QLVrtz6J0ZkYmolSXTFZVMgIIsX8itAWVdluUMBuphReiTSlBsqQaSaMdMUsAlxgGVv35mAof
	jWquJsORWRklxLGW8Bby7RA1qGRjID/HhnarEC+IW6nIwIB0qhIIq6DzZWpe0/NOfdyfMXzgiMXBF
	RcOqZJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWLj-0000000E5TY-31xm;
	Sat, 07 Nov 2026 02:40:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWLN-0000000E5PF-3kQH
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 02:40:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72B6v11521503
	for <linux-riscv@lists.infradead.org>; Sat, 7 Nov 2026 02:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L420166GSS4
	TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=; b=lbXY0gAz5PjhZ53/zvhjXNUzRVe
	2M8GWGe8UczDg43WWUJiAcU22wyjOmftVZWAKG/fBBUx6RC2ZGJdQW3zl20ggfIv
	jptojMcEOJJkSiicXOzxyARK0CjvbSqTYi+u3W5FtsBXHTygxuYYyIn+Hb0GWGik
	OUzC7GcOR/Pury2piCPxQeGZr/KFSXlNJdz/j00AzbYm085PJY1og9odi1OFxaJk
	4dNQhQEFGKqcZnxGD9CPfgqtcSu52bSU6cpcBgKDmki5xTBRzuqSjEfWPFLoo63G
	DLWGWbNaP2C7TaBPQgHdHyNjv41eQPUq9QOaAinxsUDhE5bouNUB/JXXAAQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnr9fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 02:39:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36cec75d8caso349119eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 18:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019188; x=1794623988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L420166GSS4TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=;
        b=DOt00m1Q7gGRCCmIL/X9+DLIpwFcOKPRDnHQUZcnDFGViVVi2OdFcw/XDEcwyr8kzN
         C0GWRprCo4jfS9Jo4xN7RsWjt9rAqvhZRppBkOcDW5VZBWTGPNhyWo6uCVrXkAxUGfZE
         xYSxu3TXDjQbODg2jeE0jshnW3VviSbBrXdt08ksSAIAZ2W5IytTBQhQKCnYVUhtnvuC
         XCcg8rcGYxiL0lwXfGas9GenUX/w/XUMfFrZbcZtXr/XA30hee6UAIymkEXKPN+f4oc/
         HoErpRxbWcH89L8iAazvYa5OYq/icQK0f/nXgq/V+vmNFwl7eBuUEg68LmCieUbyFXyI
         fXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019188; x=1794623988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L420166GSS4TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=;
        b=mK2cQltSUgJes+fRDf0HMySQzFJTbZp7UnpPirR9NH5W0AkuKVnbkn9rK/Mw70QkGl
         oBAHL52gZ22oHomcgSfr4nif1oK4kLmTQO8hUhR1rC8r6iw3ZKFk4OYmWriRc6bTJSEi
         8pD0K/8oIUCixWo9fiuewy4qZyhqwK8NHlW73kkJ6DVpblqm6JhhwFFd3o7UnC5ArUPr
         4imzRtBMoDqeD6u4bvviLIR7NMf6QB3I5yB4HChdXHNTqZa5x4qUhXIoRJvkWQkyrZuH
         MrdcYMZ3MjBWhKyZJLwXYW9u6q1kY7wbyTNbpMgSHEASm8yPb81PM9HwbVmv7WnKfQgi
         5rHg==
X-Forwarded-Encrypted: i=1; AL+hErHurQYRHpzHDPl0ys+hLjQNasojAmuQXHhKKHEWFoBCtMioOyV2/Njr6vdetd9eL6omVriNinUYhzgXvQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/fU/1A7uj97uZ8ZMPbxHko1W4/pyRDPHwSg+qXqAMUR0pGdxWJ
	cdMb7BPXwAFxIADF07z/YniNbwHbo25R7FhJT421lk6Okbe3X8cTG4TH0AE+4/9HgsT3BEGiMBt
	5oXjINIG/ANFWut7/03IhBU4eYZXy+GS8KWpAYJV6K8beRXkV5bOjE5zBEuL1tIPTHQWKrE0=
X-Gm-Gg: AYBFou3PeAXvtkICAfJxRKID1Gnd3tV1WuwmgsV/NkuOxsBIQDDmB5oLZTzcQqW9CKn
	3lcQuN//CMXDBJcRcajIvgL1mzLrvFhN1fVkX7fX/IbMA3felWRQDLuFd7EevbVGvudCMvw7Mue
	57KsaiuFp2Ec3auyCblvCfKH0foa3Pk34L/Lqne5HeFEBl2PeSHs1uQtS1ZjCnTmc/+/f2ZDTwZ
	HPwMY7V7te5H/yApOFwjgiq1phgaat130IDtk0PJLESv/uXgDZNk+Cyok2G8L7vzp/IBafR/gGL
	+KkGPyDOrB3z/ug6c4vbcVNVwZO3riNGVvQiyh8v9Sy5g9SZM1az2KhajG6zH6lt6fs2XFs05Xu
	RnXyHPGTkbMkTJprkFDBWRbPYYlOk9pTgR695SCunGHFmwl/usSmRJZNZJ/HWw+1DYYTBqyNKo9
	ddEg9ckZ0itAbbgr8t97l847Cr0ntunwcs29yOM3UA1AsIvL1OIy+PQ1s3Wow775/uaA6rZlBHy
	w==
X-Received: by 2002:a05:7301:7c0b:b0:370:7fee:497f with SMTP id 5a478bee46e88-370f8269e21mr1593325eec.26.1794019187440;
        Fri, 06 Nov 2026 18:39:47 -0800 (PST)
X-Received: by 2002:a05:7301:7c0b:b0:370:7fee:497f with SMTP id 5a478bee46e88-370f8269e21mr1593255eec.26.1794019186655;
        Fri, 06 Nov 2026 18:39:46 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:39:46 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 2/8] riscv: Add breakpoint and watchpoint test for riscv
Date: Sat,  7 Nov 2026 08:09:11 +0530
Message-ID: <20261107023917.40606-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: T_G8fVJTI7f-nsBWA_9xS_9HA7TfHB-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX/9BZHIOKQCG6
 ymWXTmIGJWkCGaOo60P57sDVhMmuk3LsEU7virgM6ZDDalToZDQ64+R/Y4bE/ckBfD/KEAT1usg
 +wfcDlTVKHC0+z2/WDyTLYna3OT+HDHkxtnFzlaxOe2hZhTolVU79sQEobRGqiEyqZT5VOrmDAX
 0ZVoAhanoEcqwr//iEVfsZN7Xs342nPTvRB53o1z9tNeNk0LjrZsBKY6CZhR2NH4AOdd5az4bAl
 um4pX1I0kTw8u19vssevOG4EukHeiHUbYpetHiizxr0IkD7yPcZJlNbTs6QOUsAGOzl9TBim+Xw
 NGtS21qxCr5Yj56P8eOCzs88eyhvU6GVvsjgJ1VlbKbWGUkKe+2+aJVU3B24tkvVk4Cuafl/jRE
 ReOZOSXvTXjbzDr0sja+ju+zQyMUk9dBlHpTnrODOMOj0x1UdChE5FCVQjHjOkU6n1EuWObRT6a
 pR2vCzpqo88L1rwpovg==
X-Proofpoint-ORIG-GUID: T_G8fVJTI7f-nsBWA_9xS_9HA7TfHB-7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfXy/nvE0wkUZ3p
 Mfy0r3xaPwkgWZWOkdEnI4/PTFjI/jN88CQmHlGietUnEtnsseBnar+cLlDFNmzeBIul6D72PDd
 IAsRJnzqnWISGw+8h/Uu9Gaa+iyWAls=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6aee8f74 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=2Ls8_GQA_paks6FoIQwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_184002_553517_01BC5BAE 
X-CRM114-Status: GOOD (  23.31  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add self test for riscv architecture. It uses ptrace to ptrace framework
to set/unset break/watchpoint and uses signals to check triggers.

Also add $(KHDR_INCLUDES) to CFLAGS for the riscv test build so the
UAPI headers exercised by the test can be located during compilation.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/breakpoints/Makefile  |   8 +
 .../breakpoints/breakpoint_test_riscv.c       | 215 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 73b69e8dcba1..baf97e8c39f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24171,6 +24171,7 @@ F:	arch/riscv/include/asm/perf_event.h
 F:	arch/riscv/kernel/hw_breakpoint.c
 F:	arch/riscv/kernel/perf_*
 F:	drivers/perf/
+F:	tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 0b8f5acf7c78..1f28f50e8f85 100644
--- a/tools/testing/selftests/breakpoints/Makefile
+++ b/tools/testing/selftests/breakpoints/Makefile
@@ -12,5 +12,13 @@ ifneq (,$(filter $(ARCH),aarch64 arm64))
 TEST_GEN_PROGS += breakpoint_test_arm64
 endif
 
+ifneq (,$(filter $(ARCH),riscv riscv64))
+TEST_GEN_PROGS += breakpoint_test_riscv
+endif
+
 include ../lib.mk
 
+ifneq (,$(filter $(ARCH),riscv riscv64))
+$(OUTPUT)/breakpoint_test_riscv: CFLAGS += -static $(KHDR_INCLUDES)
+endif
+
diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
new file mode 100644
index 000000000000..a8a94a788142
--- /dev/null
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -0,0 +1,215 @@
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
+static __attribute_noinline__ void test_func(void)
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
