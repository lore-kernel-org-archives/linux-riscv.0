Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CFCC55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 13:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqv0wD75JMoelqdXXoNFiXUG8Mj+7qfcpKPwXo8rtLk=; b=E3mOXfT3eyJBxw
	SUSkK/8Td/fDkctGy9148kp2wPE/0HM1O7KCk0jGEXZkErlTkeZr2ZIp1A2nA9gMLVgavi2MxchO6
	4PRP87HqhPc5RPk2lW0Iq+mADKQEvG27yISc4vysPnrcCUZKQi12ZyI0su62KdxuaSUF77zm1vdmn
	NAo3CnJmZgqrJ3akunjtNU8MHKwR4YVyWFOro4LwPn/m5DQF1URsaIe6H5H8ljxHOQqCZ8LBNh9EO
	6l1PGQByzVPdveFEjyEfbp02ki0Nt7b3kVWOqrms6gcqmfJ1UlZLIW1RStGFAe0cu+kJSzHhAvLw5
	TfTC4Tr3zVKhfERdw7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt35-0000000HFcf-1UIt;
	Mon, 03 Aug 2026 13:49:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt33-0000000HFaj-0SbZ
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 13:49:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673DRT7g1250235
	for <linux-riscv@lists.infradead.org>; Mon, 3 Aug 2026 13:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ShQBno9gsVG
	rzPPyjW7zHkWoz0rbT24OP8r/WauE3gQ=; b=VogTMB9HV57MIBinon3t/yMuElw
	RWBFl8s9+dFyMShr07l7rLxRJVf9wZRw3/tFSabBIsy7nVPlfamn72RS/kzWznCs
	JU32FHn9tFFY0KoHyTwhZfxQ5s0kFV4EyUbJoXbPj6TmUzKikrrmyayXq4rMEvPu
	2cS2yDjuLw2GntknBEba4pZ0eaKEjqgNP2+qCr74u63hIfrxpuST3QvtTtxZZacf
	lMOJ0QokrptP5A+H5MEcqB3h8YJqn8mAY6eemKtOTeNUs/0ZXG/4X7iKu9aPirbE
	bL3A07RRXY306SuEN+1H9uZMPe6KWIYYYouAXXvesbZzwMvwVZCUQ/QKXsg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd9t9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 13:49:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso5435161b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785764984; x=1786369784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShQBno9gsVGrzPPyjW7zHkWoz0rbT24OP8r/WauE3gQ=;
        b=KmcUXvqKUOJrxfcS9owLE+9pDCBbPx6c/cNom4EiUjlFuUgkEdJU/Fc1M1ertPpZFv
         +/l1TlTRTdva7TvX/Cc4pIXmSNKb9X4E+qcA1hevY1ZZNXfhkj/Wjg64ztLcgjGoN91/
         vc7RkoEXOXTcOIpwVcucCni8+Y5TgrvMrIHYqHvCIJXEI0FIim7k4l/Gm5s4RhHx3j0K
         y6Xtv2+P9tP9yqhWNauNYbPZB/IjX4RqArr1KCbxl0Sc0ieKL9Rv8yqajj8bhn4zNeUc
         lsOMIrhHKTv60y0V3e3jqPiWNIKjOeH20i2fd060nYrux/ZNfMLV0Yt89VMy0MMfPWp8
         bgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764984; x=1786369784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShQBno9gsVGrzPPyjW7zHkWoz0rbT24OP8r/WauE3gQ=;
        b=HNJ9UbJdb2hOmE06flfThbFcddX4UQVWtsQU9p2Gj6xaSoLM1VtrcDgJzUgJX7lrV5
         5Nc+OZXo4oZ62mA8Iol6uXa2bYp91DY7CowHjIyW9oxOZmzDjTNqXdVI3jmwWRqvApiY
         9Xqf8dn3YPe3TZEdj37nIAMG+v0hEAjhahJoijqj394p0fcUDBNuMALzAMbKNk4C76CR
         6zv/o9eCjnYa7F7plE851Zo5nG+eF77kGB9VhKeLtZ6sQ+ZhL43nspcpboXUFIfeFKaI
         1Jub4wCnyXaviyQLU2kqf7CBbybxrkuvVPIlZOcRjEtGzyMwjVdfgEGHWvRseej0R2Zf
         CH+g==
X-Gm-Message-State: AOJu0YyJG5PKYg74MrRYZxV2IiNY1Gn7LDYbEx6qG/qAR71vJ+Pn2cSY
	2/jaTpGArkpfMeTSZFunFse1T1ecpPfbbaSRP15wA29FtDDA8QTq6uTpD/FrRV8EaGdw8nZ51Dy
	vZzn42dmfoVFEAOvzqCo0zD42nvAVjQwMgG/YSvlv5S+9VTu5PuCn49MrlXe6SmwFG68hsxbbHR
	ZUM/I=
X-Gm-Gg: AR+sD11h949mHG7R9KOJWa/J4PqBoqB/OLfQknBfhpME+a+N6IsshzOgelLBsqPNDzs
	legJpGuCZr5FiF6RtjhRo5iCUJEwyf6j2TjNv59mgebDYYTXe7BLlwpuyv0i6wwNESFKk0VyDDG
	bQRpiJPMkhJ2tvtFVVrkJPoA/3oXxDwP+2D5dy7wGE1jJTcPvnCybo5xgoEmJ+Fo6geujYNvAWf
	tF768afbBEfVPIL8bva2gU63pM4V/GYl7MtaFmkhLhi+2GmlVuNhcGU/NE3v8vtQFl4FW+J9Hx8
	zBJx3fQ6mRL0Hed5RzVXEQki5EBBr+rkGdZW6RJMBBtblqFoiCKa5g/emux7Vurc7ol/X2hO7xU
	zvb/D1Qk1iZ4Bt/gc/fxIG/VTpC3iFc+1gQLfTEbdzLEkYnV9nGeq8+98CbA/YSnyFkf16v7/OC
	Wg3SJNux7Mv5AW7UfjeWEE05Sc
X-Received: by 2002:a05:6a21:6e46:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c91a972ec7mr12617721637.26.1785764983707;
        Mon, 03 Aug 2026 06:49:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e46:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c91a972ec7mr12617680637.26.1785764983204;
        Mon, 03 Aug 2026 06:49:43 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm39278870eec.30.2026.08.03.06.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:49:42 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org, thecharlesjenkins@gmail.com,
        jtaubepe@redhat.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v6 4/5] selftests/breakpoints: extend riscv test for ptrace hw break/watchpoints
Date: Mon,  3 Aug 2026 19:19:12 +0530
Message-ID: <20260803134913.2013674-5-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfX9R6KtY+e+lN/
 hIbcuIKOkWtaPsQfVO7QL/wyIdky2DLZB1EnsSpEe0SuPsSXxNqE8Vtdtpok2rgAtKcd7RJ2Ffq
 mT9kBeAo4wyRvBYBV2vM2yH2kNX7cqs=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a709c78 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=07_doiqUAAAA:8 a=vV4cC3RZRCDA8ntysFEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
 a=S1vEknPFSxWy9jUyH7lK:22
X-Proofpoint-GUID: d6YnQ4S2q8x0DBYYi38X0MmMeqzYeLfC
X-Proofpoint-ORIG-GUID: d6YnQ4S2q8x0DBYYi38X0MmMeqzYeLfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyNCBTYWx0ZWRfX96mRuwvccKs0
 QKNVIFT1HzHOAJBUX5cdqvJByzfg7f4GulhdTYOU6lG8KXal7BJ8M2sFcyZBHRlKaHxgW3mgq+b
 3zdqBqaZTUUO/EVG9IEeTf/qz6QZGCghm/+1sRAYpc6kRcGSHR6Nv1MmDJiJ+ky5Yargbc32gQH
 1qALccgGJsM6NwZbhKaquQaCwk/Dwomotva/hLhS0+VD56vDWeeq6a7sfdTWHxEnI2mN0qSYYk/
 Kew09+V3lcwbg1C8rUMtUDriz5RAgRdCCXnkheaUwm0znJyvgDRqMo+/Ez0hpjIU0pUzBIuGbVI
 g4yW8lCBR13wTgzuRAifdPmyaJDpjyxG/TuTJrToBrjFMCP+PgJero8RyJ2s6FqBT3t41jItbMH
 1HADhrBclnhxBTJPkSDoYn91eJ9kV7oaOZFrfGv2FL4BVWpKCumFCrQxpEXT+z8DgGO1pJFs/xf
 WuyoYzoSJqgEjX8coNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064945_184289_F716D46A 
X-CRM114-Status: GOOD (  18.69  )
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
 .../breakpoints/breakpoint_test_riscv.c       | 590 +++++++++++++++++-
 1 file changed, 568 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
index 0649940b709e..ee6641531fa7 100644
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
@@ -18,18 +19,572 @@
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
+				       "ptrace(PTRACE_GETREGSET): Number of watchpoints: %u\n", dreg_state.info);
+			ksft_print_msg(
+				       "ptrace(PTRACE_GETREGSet): addr: 0x%lx control: 0x%x\n", dreg_state.dbg_regs[0].addr, dreg_state.dbg_regs[0].control);
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
+			       "ptrace(PTRACE_SETREGSET, NT_RISCV_HW_WATCH) not supported on this hardware: %s\n",
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
+			       "ptrace(PTRACE_SETREGSET, NT_RISCV_HW_BREAK) not supported on this hardware: %s\n", strerror(errno));
+	else
+		ksft_print_msg(
+			       "ptrace(PTRACE_SETREGSET, NT_RISCV_HW_BREAK) failed: %s\n", strerror(errno));
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
@@ -56,7 +611,7 @@ int setup_bp(bool is_x, void *addr, int sig)
 
 	fd = syscall(SYS_perf_event_open, &pe, 0, -1, -1, 0);
 	if (fd < 0) {
-		printf("Failed to open event: %llx\n", pe.config);
+		ksft_print_msg("Failed to open event: %llx\n", pe.config);
 		return -1;
 	}
 
@@ -75,11 +630,10 @@ static void sig_handler_bp(int signum, siginfo_t *oh, void *uc)
 
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
@@ -88,28 +642,17 @@ static void sig_handler_wp(int signum, siginfo_t *oh, void *uc)
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
@@ -119,14 +662,14 @@ static int trigger_bp(void)
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
 
@@ -151,14 +694,14 @@ static int trigger_wp(void)
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
 
@@ -204,7 +747,7 @@ int main(int argc, char *argv[])
 		return -1;
 
 	if (bp_triggered)
-		printf("Breakpoint test passed!\n");
+		ksft_print_msg("[perf_event]: Breakpoint test passed!\n");
 
 	sem_init(&wp_mtx, 0, 0);
 	if (trigger_wp() < 0)
@@ -213,7 +756,10 @@ int main(int argc, char *argv[])
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
