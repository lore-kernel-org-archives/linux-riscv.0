Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDBCCA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpQqMii0NlWUS1msJ3VtJIi4pV+Rd+alR38nPGVPeLE=; b=ovuAeKgELCcrA1
	mQ6qpUVTGs0yiXDiFTw0txHMsdppxyPgMpve8Z0Afg8N0LKUjHRMCEDxW6K21Q1rUPUiGUeBfUhtw
	6mQdSs3oCip+WgwzmcmxiXCPvSm2Nsl2paMUZbYw6MmdG87nSR/cVCrDGf4pSRdiuodsl+fh+PL+e
	2W1BuO46caM1bVDHAMJEcPWuHCYJAWSubTwZCVRvrU/hmn0rm/M9shjRdrlv0LSlPjwSJgVrtI9lR
	NJwlHYLJpM53Odo/kq+mAYLgk++qXEAauZu9YZmcwuRV/9nR8TthOi+J9D5v5cNXXnXhOHi0WP6LQ
	SfOJIR5FOVn8IRKi1tOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo14-00000005Aqy-1m46;
	Wed, 30 Sep 2026 06:42:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo13-00000005Aqm-1thI
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sMxi/Z81iYDfge4GQABNNwApMyHGie11g9z5WvCjmF8=; b=PjIX/PNmJG5mM9opNRqS7rbJ9O
	qO/BeJfUrnGm0JcSDaItpyyceghOq09LgkwRMjCBxOb3F0jmtiQR65HRIqWF/w2npKB72ZDplqhhR
	3lq+yjsfnAxxX0wdzqIUzv2ffkHWiW7DpQiTJ7Z1S2+5WNY4gNkQ7UlPdz0Uq15Qn3sPoDtk8Qjc9
	BsUfPGSWQ9vx18Q5sFbz9MNSxfCKdeNxo+4CI+UlH4/6fFPh3IRpTl5R5rBKK8LbekMyc08kbDgR8
	6xvJ/QNY/5sg/8Qhd1DlZ0A4Jq/qJ8xfxx+vt3NSWM9LdZDTRPp2XV118+40swS2h299/3esjPeEW
	iUhEO5zg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBnyt-00000003QJm-29Xl
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:42:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U68Td82012852
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sMxi/Z81iYD
	fge4GQABNNwApMyHGie11g9z5WvCjmF8=; b=MS8wrvSIUKSQiabcLyM0T9GfncL
	s+vfF3c606Zs9oVevSqQHOCgwoT81pB8CCYiWVjJ4tbtjLhRlW4S0IV10jRP48q6
	8GySLeIbXA00RTsul3zGyKXrdjyGlbL3pqdqMQhOPxzVtJW2/QZTDNSZCi0sOlxU
	zn9B/tYXM+T3+RyJhBIBeqNcKtBGOTP37YC46hDFuigDGMf+Fwfzfdl2hQe6DbEL
	E5mUwI/G+IQ09LBbJB0FIEGdS6yxzgXK5VOamRzbVXZXmMkU3R0zJilRvLS9jQAo
	zmARm3tx4cySanD+0uo3QOnYe7F+WbApK7r+7XpqURQS0HPJjlgR3UHQ3Uw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j0ejuk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:39:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-343eadc0ff3so624143eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750391; x=1791355191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMxi/Z81iYDfge4GQABNNwApMyHGie11g9z5WvCjmF8=;
        b=aHVAC0csuZoGlmOIpFvutkdmt1lwfITkjF6YCZDEFiBOWwxXNPVIC3WvUr6NqVfYcP
         4oNyf3JTFxFmPPAx8uOIFr/1At0ziJhediqfFbs0NM0vNsRjqS3JWP0qp2BRD0Jkfc8G
         suRgEV+hckO1fIk/nsBSN1vcgJXOct3/JFL832E4nmH+uNHML8lB71AV4zQBULo2bD4R
         YRTglqw5oSwXaSHgdMnNPopf+GzKATsHNij+x+MmaT4PD8eBnj54G3ApAlGMsRa+p6qE
         q3qJBymIcpJnCNk94GuC6H6egfpuyXjtusUY898ETLaO9lyjPjeopNzIEkv68bn8UzDh
         5aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750391; x=1791355191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMxi/Z81iYDfge4GQABNNwApMyHGie11g9z5WvCjmF8=;
        b=EmVC5I2jvKQzQucb+Vl67J+FkuI+kfrYB3dzed0zKsnwPegwI1XcZweifWWKobNQFC
         7vs8Xf8ZvN6lrJaDZp7bkt2Z6UWKcXH58I6XRgyNti8/q3B3YNUXfiEBiZPTZ5RhWDq8
         XSzSiX19AnIA74uuWJTPDMWYwxigpzRrhRXn64bOZr8btGEdDso9Bz6fpFP73SOStikl
         9fTa3DSqwQ2z6u4smSMAREXN7EArojlel5EsrFa6EeuVijoScvOVhgLDVkOVyIJzeHyg
         VhCYpjsH3u9chfUMLyUsnRiKChOMF5MzrLqKlhwivHSmsLtWv7FJzOtpUA/yG9/TjOPx
         HHHg==
X-Forwarded-Encrypted: i=1; AKwUvBzYN35WA/W2I8V7XwvGJRN4IcAvNDBBhh96XHEXvtZSuHW6hSDTh2cEpLmmmL4ilibhWC/xokSX/z/V1g==@lists.infradead.org
X-Gm-Message-State: AFuF++ntVnwJw13N92n6tJKzHPLwKHzNmDwnCor/SF+n7DmBpSQl6rCW
	CRViq5S+55F7gKGNlfLCvxl+lWLJU/RHnxXlsvFHipbj07hU4dsCnObHgYZPHJqFM4YsFtpAvd2
	zEqVyNI/nmPqE3RiX1dfXEPhRmZZ/DVA+x1jd/0IPyNRCiJFL/7ioWmicuuMCfchVlewDO28=
X-Gm-Gg: AYBFou1qBPYoBdfj4qpRc/hSepSfrrAM/TLG+nTw9GReCqzvci1SV50I7Wbx04sX8CI
	8530/U4xhf5LdPfZDdKSycsJNviiSSxKszavnTJh0KBWfCHyaKd0wQV8gv1IreigQ9qNc4Kv3P+
	3RvucdHj9UM9krvloBUupqgukcBXjfEDCoDkcr1qB6vkHHZe9E6hNMIEjlZSxM5W8pTh08I9roh
	yfJ9+uPg6ELbLjfhbwXzEGAnG8oIo+5NWVasSxq6UG7CEAo5K5Dg6m5oLHuEkx7KV/XcTPbMuUD
	yHclbCjlsCAp9Dc+CzvU8nbuU1qEiB1GulA6jqD2bMOrE0zd9HjcuFNrwKlASoLgaeg33GJYdwG
	ZnCzetb7u3uRZq2k60oTWnMHJtGe6w0asS6m2oujd5Jj02uQZt0LrwWmdBh8VbG91QecrU+O8do
	9rp9eomwoh7TIgnUO3PPLCeMhR
X-Received: by 2002:a05:7022:ba5:b0:147:5261:ee2e with SMTP id a92af1059eb24-14d398ed392mr413091c88.21.1790750390980;
        Tue, 29 Sep 2026 23:39:50 -0700 (PDT)
X-Received: by 2002:a05:7022:ba5:b0:147:5261:ee2e with SMTP id a92af1059eb24-14d398ed392mr413022c88.21.1790750390306;
        Tue, 29 Sep 2026 23:39:50 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:39:49 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 4/8] selftests/breakpoints: extend riscv test for ptrace hw break/watchpoints
Date: Wed, 30 Sep 2026 12:09:15 +0530
Message-ID: <20260930063919.608911-5-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=cqgOAF4i c=1 sm=1 tr=0 ts=6abcaeb8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=07_doiqUAAAA:8 a=vV4cC3RZRCDA8ntysFEA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=S1vEknPFSxWy9jUyH7lK:22
X-Proofpoint-GUID: 9kLPeHnuU7pQdDOEKANghBgW3jvpaRYl
X-Proofpoint-ORIG-GUID: 9kLPeHnuU7pQdDOEKANghBgW3jvpaRYl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX5lP+Pb5gUFal
 fojuwQqREqNxgMBooiU/yYvCLem1JWXvL5ZOB5WyaYuah8cQ0T0KAeCGGcU/Kj7Vz9XwXJs3Gcg
 4AfGcnpVh56Ea9PyUyjvPYyTX3Aieoo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX0rQIlQ578Amj
 xtcFpsJgB4IjvXxkGs0kFW+NsUACtKcfPmU8RCTJ2EnpOJIPdDTzia6xXJs1VisLDR1vWrQL7ep
 OV6Jz29rXbYbOFrb5R3g7I0BoIeGvbuDtj6rqcvydasDzDEy5aG5nki/x2fz13p95cIB5qYlw5Z
 5aIiqktMVpH+oGDyVRcpdne+axnQmDRdmqPxHWMlD7V8TUNy01sCh+pM0vNEm13Y5/3EbDa8B1M
 fWovnqFpdRIXUL2504Ld0jlaYPNgCBDWInFKlilGenocBRmmGSTb8OJLRx34LkYmRopIYm3aSUQ
 7RlxxoANHGyHlkCCg1a5dcBSOZlXbgY+7AWr7ydVG3orjVOi7pAXbMX6tufUFmlerThafZofHm6
 Sba6r/bedUj2KjB5hEO/h3yadZwgsFJjyPLF4nQzVDzAVExr8eeMw2L79iQLhjxzp1bEAhxyuTl
 BY/azScs4xjB66LC21g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074005_895842_6E6F723F 
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

Cover the new ptrace-based hardware breakpoint/watchpoint support
added for riscv: exercise the PTRACE_GETREGSET/SETREGSET regset path
as well as the raw PTRACE_GETHBPREGS/SETHBPREGS interface, alongside
the existing perf_event-based tests.

Also drop a leftover #if 0 block duplicating the HWDEBUG_* control
field macros already defined in uapi/asm/ptrace.h.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 .../breakpoints/breakpoint_test_riscv.c       | 594 +++++++++++++++++-
 1 file changed, 572 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
index 0649940b709e..13d6b3ff1b6e 100644
--- a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -9,6 +9,7 @@
 #include <linux/perf_event.h>    /* Definition of PERF_* constants */
 #include <linux/hw_breakpoint.h> /* Definition of HW_* constants */
 #include <sys/syscall.h>         /* Definition of SYS_* constants */
+#include <asm/ptrace.h>
 #include <unistd.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -18,18 +19,576 @@
 #include <fcntl.h>
 #include <signal.h>
 #include <sys/mman.h>
+#include <sys/ptrace.h>
+#include <sys/wait.h>
 #include <string.h>
 #include <semaphore.h>
 #include <errno.h>
+#include <stdint.h>
+#include <stddef.h>
+#include <linux/elf.h>
 
 #ifndef noinline
 #define noinline __attribute__((noinline))
 #endif
 
+#include "kselftest.h"
+
+static int test_func_sink;
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
+/*
+ * BREAKPOINT TEST USING PTRACE
+ */
+static int do_wp_child(void *addr, size_t size)
+{
+	if (ptrace(PTRACE_TRACEME, 0, NULL, NULL) != 0) {
+		ksft_print_msg(
+			       "ptrace(PTRACE_TRACEME) failed: %s\n",
+			       strerror(errno));
+		_exit(1);
+	}
+
+	if (raise(SIGSTOP) != 0) {
+		ksft_print_msg(
+			       "raise(SIGSTOP) failed: %s\n", strerror(errno));
+		_exit(1);
+	}
+
+	sleep(1);
+	switch (size) {
+	case 1:
+		*(uint8_t *)addr = 47;
+		break;
+	case 2:
+		*(uint16_t *)addr = 47;
+		break;
+	case 4:
+		*(uint32_t *)addr = 47;
+		break;
+	case 8:
+		*(uint64_t *)addr = 47;
+		break;
+	default:
+		ksft_print_msg("Unknown watchpoint access size %u\n", size);
+		break;
+	}
+
+	_exit(0);
+}
+
+static int do_bp_child(void (*bp_func)(void))
+{
+	if (ptrace(PTRACE_TRACEME, 0, NULL, NULL) != 0) {
+		ksft_print_msg(
+			       "ptrace(PTRACE_TRACEME) failed: %s\n",
+			       strerror(errno));
+		_exit(1);
+	}
+
+	if (raise(SIGSTOP) != 0) {
+		ksft_print_msg(
+			       "raise(SIGSTOP) failed: %s\n", strerror(errno));
+		_exit(1);
+	}
+
+	bp_func();
+}
+
+unsigned long var;
+
+static bool set_watchpoint(pid_t pid, int size)
+{
+	uint8_t *addr = (uint8_t *)&var;
+	unsigned int control = 0;
+	struct user_hwdebug_state dreg_state;
+	struct iovec iov;
+
+	/* Write watchpoint */
+	control = (HW_BREAKPOINT_W << 14) & ((0x7 << 14));
+	control |= (HW_BREAKPOINT_LEN_8 << 4) & ((0x1f << 4));
+	memset(&dreg_state, 0, sizeof(dreg_state));
+	dreg_state.dbg_regs[0].addr = (uintptr_t)(addr);
+	dreg_state.dbg_regs[0].control = control;
+	iov.iov_base = &dreg_state;
+	iov.iov_len = offsetof(struct user_hwdebug_state, dbg_regs) +
+				sizeof(dreg_state.dbg_regs[0]);
+
+	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_HW_WATCH, &iov) == 0) {
+		memset(&iov, 0, sizeof(iov));
+		memset(&dreg_state, 0, sizeof(dreg_state));
+
+		iov.iov_base = &dreg_state;
+		iov.iov_len = offsetof(struct user_hwdebug_state, dbg_regs) +
+			sizeof(dreg_state.dbg_regs[0]);
+
+		if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_HW_WATCH, &iov) == 0) {
+			ksft_print_msg(
+				       "ptrace(PTRACE_GETREGSET): Number of watchpoints: %u\n",
+				       dreg_state.info);
+			ksft_print_msg(
+				       "ptrace(PTRACE_GETREGSet): addr: 0x%lx control: 0x%x\n",
+				       dreg_state.dbg_regs[0].addr, dreg_state.dbg_regs[0].control);
+		} else {
+			ksft_print_msg(
+				       "ptrace(PTRACE_GETREGSET): Failed\n");
+			return false;
+		}
+
+		return true;
+	}
+
+	if (errno == EIO)
+		ksft_print_msg(
+			       "ptrace(PTRACE_SETREGSET, NT_RISCV_HW_WATCH) not supported: %s\n",
+			       strerror(errno));
+	else
+		ksft_print_msg(
+			       "ptrace(PTRACE_SETREGSET, NT_RISCV_HW_WATCH) failed: %s\n",
+			       strerror(errno));
+	return false;
+}
+
+static bool set_breakpoint(pid_t pid, void (*bp_func)(void))
+{
+	struct user_hwdebug_state dreg_state;
+	struct iovec iov;
+	unsigned int control = 0;
+
+	control = (HW_BREAKPOINT_X << 14) & ((0x7 << 14));
+	control |= (HW_BREAKPOINT_LEN_8 << 4) & ((0x1f << 4));
+	memset(&dreg_state, 0, sizeof(dreg_state));
+	dreg_state.dbg_regs[0].addr = (uintptr_t)bp_func;
+	dreg_state.dbg_regs[0].control = control;
+	iov.iov_base = &dreg_state;
+	iov.iov_len = offsetof(struct user_hwdebug_state, dbg_regs) + sizeof(dreg_state.dbg_regs[0]);
+
+	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_HW_BREAK, &iov) == 0)
+		return true;
+
+	if (errno == EIO)
+		ksft_print_msg(
+			       "ptrace(PTRACE_SETREGSET, NT_RISCV_HW_BREAK) not supported: %s\n",
+			       strerror(errno));
+	else
+		ksft_print_msg(
+			       "ptrace(PTRACE_SETREGSET, NT_RISCV_HW_BREAK) failed: %s\n",
+			       strerror(errno));
+
+	return false;
+}
+
+static int run_ptrace_wp_test(void)
+{
+	pid_t pid = fork();
+	pid_t wpid;
+	siginfo_t siginfo;
+	int status;
+
+	if (pid == 0)
+		do_wp_child(&var, 8);
+
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg(
+			"child did not stop: %s\n", strerror(errno));
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGSTOP) {
+		ksft_print_msg("child did not stop with SIGSTOP\n");
+		return false;
+	}
+
+	if (!set_watchpoint(pid, 8))
+		return false;
+
+	if (ptrace(PTRACE_CONT, pid, NULL, NULL) < 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_CONT) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	alarm(3);
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	alarm(0);
+	if (WIFEXITED(status)) {
+		ksft_print_msg("child exited prematurely\n");
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg("child did not stop\n");
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGTRAP) {
+		ksft_print_msg("child did not stop with SIGTRAP\n");
+		return false;
+	}
+	if (ptrace(PTRACE_GETSIGINFO, pid, NULL, &siginfo) != 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_GETSIGINFO): %s\n",
+			strerror(errno));
+		return false;
+	}
+	if (siginfo.si_code != TRAP_HWBKPT) {
+		ksft_print_msg(
+			"Unexpected si_code %d\n", siginfo.si_code);
+		return false;
+	}
+
+	kill(pid, SIGKILL);
+	wpid = waitpid(pid, &status, 0);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+
+	ksft_print_msg("[ptrace]: Watchpoint test passed!\n");
+
+	return true;
+}
+
+static int run_ptrace_bp_test(void)
+{
+	pid_t pid = fork();
+	pid_t wpid;
+	siginfo_t siginfo;
+	int status;
+
+	if (pid == 0)
+		do_bp_child(test_func);
+
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg(
+			"child did not stop: %s\n", strerror(errno));
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGSTOP) {
+		ksft_print_msg("child did not stop with SIGSTOP\n");
+		return false;
+	}
+
+	if (!set_breakpoint(pid, test_func))
+		return false;
+
+	if (ptrace(PTRACE_CONT, pid, NULL, NULL) < 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_CONT) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	alarm(3);
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	alarm(0);
+	if (WIFEXITED(status)) {
+		ksft_print_msg("child exited prematurely\n");
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg("child did not stop\n");
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGTRAP) {
+		ksft_print_msg("child did not stop with SIGTRAP\n");
+		return false;
+	}
+	if (ptrace(PTRACE_GETSIGINFO, pid, NULL, &siginfo) != 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_GETSIGINFO): %s\n",
+			strerror(errno));
+		return false;
+	}
+	if (siginfo.si_code != TRAP_HWBKPT) {
+		ksft_print_msg(
+			"Unexpected si_code %d\n", siginfo.si_code);
+		return false;
+	}
+
+	kill(pid, SIGKILL);
+	wpid = waitpid(pid, &status, 0);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+
+	ksft_print_msg("[ptrace]: Breakpoint test passed!\n");
+
+	return true;
+}
+
+/*
+ * BREAKPOINT TEST USING PTRACE_SETHBPREGS / PTRACE_GETHBPREGS
+ */
+static bool set_hbpregs_watchpoint(pid_t pid)
+{
+	struct __riscv_hwdebug_state state;
+
+	memset(&state, 0, sizeof(state));
+	state.addr = (unsigned long)&var;
+	state.len  = HW_BREAKPOINT_LEN_8;
+	state.type = HW_BREAKPOINT_W;
+	state.ctrl = 0; /* enabled */
+
+	if (ptrace(PTRACE_SETHBPREGS, pid, 0, &state) != 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_SETHBPREGS) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	/* Read back and verify */
+	memset(&state, 0, sizeof(state));
+	if (ptrace(PTRACE_GETHBPREGS, pid, 0, &state) != 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_GETHBPREGS) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	ksft_print_msg(
+		"[hbpregs] watchpoint readback: addr=0x%lx type=%lu len=%lu ctrl=%lu\n",
+		state.addr, state.type, state.len, state.ctrl);
+
+	return true;
+}
+
+static bool set_hbpregs_breakpoint(pid_t pid, void (*bp_func)(void))
+{
+	struct __riscv_hwdebug_state state;
+
+	memset(&state, 0, sizeof(state));
+	state.addr = (unsigned long)bp_func;
+	state.len  = HW_BREAKPOINT_LEN_4;
+	state.type = HW_BREAKPOINT_X;
+	state.ctrl = 0; /* enabled */
+
+	if (ptrace(PTRACE_SETHBPREGS, pid, 0, &state) != 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_SETHBPREGS) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	/* Read back and verify */
+	memset(&state, 0, sizeof(state));
+	if (ptrace(PTRACE_GETHBPREGS, pid, 0, &state) != 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_GETHBPREGS) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	ksft_print_msg(
+		"[hbpregs] breakpoint readback: addr=0x%lx type=%lu len=%lu ctrl=%lu\n",
+		state.addr, state.type, state.len, state.ctrl);
+
+	return true;
+}
+
+static int run_hbpregs_wp_test(void)
+{
+	pid_t pid = fork();
+	pid_t wpid;
+	siginfo_t siginfo;
+	int status;
+
+	if (pid == 0)
+		do_wp_child(&var, 8);
+
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg("child did not stop: %s\n", strerror(errno));
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGSTOP) {
+		ksft_print_msg("child did not stop with SIGSTOP\n");
+		return false;
+	}
+
+	if (!set_hbpregs_watchpoint(pid))
+		return false;
+
+	if (ptrace(PTRACE_CONT, pid, NULL, NULL) < 0) {
+		ksft_print_msg("ptrace(PTRACE_CONT) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	alarm(3);
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	alarm(0);
+	if (WIFEXITED(status)) {
+		ksft_print_msg("child exited prematurely\n");
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg("child did not stop\n");
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGTRAP) {
+		ksft_print_msg("child did not stop with SIGTRAP\n");
+		return false;
+	}
+	if (ptrace(PTRACE_GETSIGINFO, pid, NULL, &siginfo) != 0) {
+		ksft_print_msg("ptrace(PTRACE_GETSIGINFO): %s\n",
+			strerror(errno));
+		return false;
+	}
+	if (siginfo.si_code != TRAP_HWBKPT) {
+		ksft_print_msg("Unexpected si_code %d\n", siginfo.si_code);
+		return false;
+	}
+
+	kill(pid, SIGKILL);
+	wpid = waitpid(pid, &status, 0);
+	if (wpid != pid) {
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+
+	ksft_print_msg("[hbpregs]: Watchpoint test passed!\n");
+	return true;
+}
+
+static int run_hbpregs_bp_test(void)
+{
+	pid_t pid = fork();
+	pid_t wpid;
+	siginfo_t siginfo;
+	int status;
+
+	if (pid == 0)
+		do_bp_child(test_func);
+
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg("child did not stop: %s\n", strerror(errno));
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGSTOP) {
+		ksft_print_msg("child did not stop with SIGSTOP\n");
+		return false;
+	}
+
+	if (!set_hbpregs_breakpoint(pid, test_func))
+		return false;
+
+	if (ptrace(PTRACE_CONT, pid, NULL, NULL) < 0) {
+		ksft_print_msg("ptrace(PTRACE_CONT) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	alarm(3);
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	alarm(0);
+	if (WIFEXITED(status)) {
+		ksft_print_msg("child exited prematurely\n");
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg("child did not stop\n");
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGTRAP) {
+		ksft_print_msg("child did not stop with SIGTRAP\n");
+		return false;
+	}
+	if (ptrace(PTRACE_GETSIGINFO, pid, NULL, &siginfo) != 0) {
+		ksft_print_msg("ptrace(PTRACE_GETSIGINFO): %s\n",
+			strerror(errno));
+		return false;
+	}
+	if (siginfo.si_code != TRAP_HWBKPT) {
+		ksft_print_msg("Unexpected si_code %d\n", siginfo.si_code);
+		return false;
+	}
+
+	kill(pid, SIGKILL);
+	wpid = waitpid(pid, &status, 0);
+	if (wpid != pid) {
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+
+	ksft_print_msg("[hbpregs]: Breakpoint test passed!\n");
+	return true;
+}
+
+static void run_hbpregs_tests(void)
+{
+	run_hbpregs_bp_test();
+	run_hbpregs_wp_test();
+}
+
+/*
+ * BREAKPOINT TEST USING PTRACE_SETHBPREGS / PTRACE_GETHBPREGS - END
+ */
+static void run_ptrace_tests(void)
+{
+	run_ptrace_bp_test();
+	run_ptrace_wp_test();
+}
+
+/*
+ * BREAKPOINT TEST USING PTRACE - END
+ */
+
+/*
+ * BREAKPOINT TEST USING perf events
+ */
 static int gfd;
 sem_t ib_mtx, wp_mtx;
 static int bp_triggered, wp_triggered;
-static int test_func_sink;
 static const int wait_timeout_sec = 5;
 
 int setup_bp(bool is_x, void *addr, int sig)
@@ -56,7 +615,7 @@ int setup_bp(bool is_x, void *addr, int sig)
 
 	fd = syscall(SYS_perf_event_open, &pe, 0, -1, -1, 0);
 	if (fd < 0) {
-		printf("Failed to open event: %llx\n", pe.config);
+		ksft_print_msg("Failed to open event: %llx\n", pe.config);
 		return -1;
 	}
 
@@ -75,11 +634,10 @@ static void sig_handler_bp(int signum, siginfo_t *oh, void *uc)
 
 	bp_triggered++;
 
-	printf("Breakpoint triggered!\n");
 	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
 	ret = sem_post(&ib_mtx);
 	if (ret) {
-		printf("Failed to report BP success\n");
+		ksft_print_msg("Failed to report BP success\n");
 		return;
 	}
 }
@@ -88,28 +646,17 @@ static void sig_handler_wp(int signum, siginfo_t *oh, void *uc)
 {
 	int ret;
 
-	printf("Watchpoint triggered!\n");
 	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
 	wp_triggered++;
 
 	ret = sem_post(&wp_mtx);
 
 	if (ret) {
-		printf("Failed to report WP success\n");
+		ksft_print_msg("Failed to report WP success\n");
 		return;
 	}
 }
 
-/*
- * Keep a real instruction address for HW execute breakpoints: prevent inlining
- * and force a visible side effect so the function can't be optimized away.
- */
-static noinline void test_func(void)
-{
-	test_func_sink++;
-	__asm__ __volatile__("" : : "g" (test_func_sink));
-}
-
 static int trigger_bp(void)
 {
 	struct sigaction sa;
@@ -119,14 +666,14 @@ static int trigger_bp(void)
 	sa.sa_flags = SA_SIGINFO;
 
 	if (sigaction(SIGIO, &sa, NULL) < 0) {
-		printf("Failed to setup signal handler\n");
+		ksft_print_msg("Failed to setup signal handler\n");
 		return -1;
 	}
 
 	gfd = setup_bp(1, test_func, SIGIO);
 
 	if (gfd < 0) {
-		printf("Failed to setup breakpoint.\n");
+		ksft_print_msg("Failed to setup breakpoint.\n");
 		return -1;
 	}
 
@@ -151,14 +698,14 @@ static int trigger_wp(void)
 	sa.sa_flags = SA_SIGINFO;
 
 	if (sigaction(SIGUSR1, &sa, NULL) < 0) {
-		printf("Failed to setup signal handler\n");
+		ksft_print_msg("Failed to setup signal handler\n");
 		return -1;
 	}
 
 	gfd = setup_bp(0, &test_data, SIGUSR1);
 
 	if (gfd < 0) {
-		printf("Failed to setup watchpoint\n");
+		ksft_print_msg("Failed to setup watchpoint\n");
 		return -1;
 	}
 
@@ -204,7 +751,7 @@ int main(int argc, char *argv[])
 		return -1;
 
 	if (bp_triggered)
-		printf("Breakpoint test passed!\n");
+		ksft_print_msg("[perf_event]: Breakpoint test passed!\n");
 
 	sem_init(&wp_mtx, 0, 0);
 	if (trigger_wp() < 0)
@@ -213,7 +760,10 @@ int main(int argc, char *argv[])
 		return -1;
 
 	if (wp_triggered)
-		printf("Watchpoint test passed!\n");
+		ksft_print_msg("[perf_event]: Watchpoint test passed!\n");
+
+	run_ptrace_tests();
+	run_hbpregs_tests();
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
