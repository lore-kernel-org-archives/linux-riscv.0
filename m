Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E9FC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ur31+YqdqP/wq+8EPnLgM6ZB8mVmK1PzRUj9dCgmPGU=; b=GkVvT4zszGKVTp
	kiETkJZ8XppvG8f1s51Tp3xcEOXragX5tJzKNyyK1cauydKrq8b7LhutBOAgmN8eczTQFZ9w1iAAm
	FnG7n1Je/YgzwV/YdQokX1wKS+l3tQtwpJ/U7SfPubu90I4QGk0hrmKinogoJopJfoiW/3sMD4kgG
	qhKUChJ2ZZUbVo+pPUor8azaeev3psZC/pTpbDFJRcAN7dwA89x4GUbhwel0Ui4UJ67eRwAH/cJn9
	yxKBvxs8knKxsXf7BaV7fzVlHUCIiwkc3KjnbLk/LbTMYca+k42jtFZlK/b3Ocv5Qy3Dq0TxsxLO+
	QwvftlWUV2OqE5TXnWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7sw-0000000FLAR-3xm2;
	Tue, 07 Jul 2026 15:38:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7sY-0000000FL77-0CKh
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 15:38:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT9Q14193988
	for <linux-riscv@lists.infradead.org>; Tue, 7 Jul 2026 15:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6k6DNhpCY4fsn9OaVVgkXDjDkr0BVivqwm/
	il5dVluk=; b=ObqMOpbrRS/NvWShM+eiA3JxPX6ZU1+ch4sHBwDRA3oqSPx6ZR3
	79nk9Xq2BwotkEdo+OoW2cul3sIZyftqf4p7TvrCD+GN2dhVp57l7lNcwBThr52z
	UGADG/m8BvA77KfygTRC6gVlT90f8xVR0RqT1JEWTydXVdZvLsKF1UtuYNmoyGl4
	TOXJX3aCtpKdICEYingHwxyQr6pzTT63P23GTJYT66m3Ku5lNkAZmn3vIrB1yjgE
	v8BtSvQe4kZz9bFDYn7IAhNhBtoRP0Odk0mQ4nrDnzG2PKMzrDVdwfL/os/CIUFV
	XgFqkApH71hHuaKeWochoKx9/qoSxrar0oQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9aa8p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 15:38:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9e994869aso70891295ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783438711; x=1784043511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6k6DNhpCY4fsn9OaVVgkXDjDkr0BVivqwm/il5dVluk=;
        b=OJs4n9EX9HY6jIB5KqPF67PooVl+Atuf3lz55GZQWKy7jX0cpaiKENY1Q0sglSElth
         8X3quPiq2cjzdokD29ZsDzevziBDoMsV5dWRoM3xnbv2fbWiWw6i+5gtsv8hclBW+ARS
         JvyHU3dqGo0Tj29a17j+l9Apm6WhsCKnY22/+HOhICP24Pm5IfcZRhrqaYtvlFfQmkHw
         2JgURun2PT0ykFYe81t+9uEeImFuexjw6xX17XN4ntCzzknK2N2wUnV+9qqcx2kfQGUJ
         zYDOx2HdAkrLx0yY6Vrek+ZAV8evQj1wNVDnvmv+ybudFt1ZI0JAFuWUiSS55pp3oYhi
         5NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438711; x=1784043511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k6DNhpCY4fsn9OaVVgkXDjDkr0BVivqwm/il5dVluk=;
        b=jBnTKIbY0djLDySDl+qh9zkJiCzMcfDb4eL9fd1Q08rnluIaDkSaLfPBeMHsX8UHOG
         1xH3UOyby58tijTdCnOwSgHWAuILDkzHZRtiBTYk8D2B4t2/SDg8IT31FJH8AbJZLJf7
         b8rSlGfrqeKSnNf1ekJC3m/NzzKj8wHpJSf8YVXyRwGiW5rq9AZZq3+Z3oFxrU+HDHTe
         ILkbPtT/VyAWofXutkiFwoBCbIJTedTn/4I6Ofch1/vxqTkd1sVG9mDlqlLohAQby699
         029EgyfAh1V2JG2noHy4GEAcCqnHqEuhDSBUf6r+H5QlIQUjQ0RKiFFS3uh+Ez6Inown
         +e6w==
X-Gm-Message-State: AOJu0YyiRvGwGlhN/x4frbOfv4yCSwWkHncJ3EuJH0fA714qi8Slt+i5
	UMIbRWgEq1youf+FRclbqQWLKCKKxw2NSSAjsF28xJKcBwo2OsJjw2/2duSamvr/u/i6wrmaQVh
	RCu7x81RVMthSSSTnNVREsZFiEQJtQf4lvHrg1lncJYnNBwhp8AEXdBqdID21+jJYkH5GMyc7nY
	NwGM8=
X-Gm-Gg: AfdE7ckxhymmsM88/FE1r3AisvS7a8tQrkK3QXTyrT33gC901P/fp5Z2a7G4H7AyeW9
	YcyjCsBcteR23N2cGZxvZLWeVlkGC7J3855DQu0ZhhCv5EFbRfIlYGCl3cpuzdRAXChUvEGjIBH
	WPbEL679lldgkpb94HXOu5PFi/uIOEY1m2kL0bqDSP/MIN4m7lGkLQKsqm6vHxtE9kRGJ/wXelt
	8Hblykj4pf6P2Yl9m/YbBSPSujGhoU3x11091ECQhlG1bpntxqBrvUkyjAvxJiCY2Sb636QyREQ
	JnbiIUdZklUvzhw1CBAGx25ueCYlPzCCeg0inFhcQmIkmk9FneKRuk9hF+xIPV8N1zI/bFvjq3e
	tb1ktrM+7PXAjSBazENJ+dHx0DMbxJRuptaHf0wm/bxV9+q4=
X-Received: by 2002:a17:90b:184b:b0:387:e0cb:7f3 with SMTP id 98e67ed59e1d1-387e0cb0926mr3349261a91.39.1783438711254;
        Tue, 07 Jul 2026 08:38:31 -0700 (PDT)
X-Received: by 2002:a17:90b:184b:b0:387:e0cb:7f3 with SMTP id 98e67ed59e1d1-387e0cb0926mr3349228a91.39.1783438710813;
        Tue, 07 Jul 2026 08:38:30 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm2098326eec.20.2026.07.07.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:38:30 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, Andy Chiu <tchiu@tenstorrent.com>
Subject: [PATCH] selftests: riscv: Bypass libc in inactive vector ptrace test
Date: Tue,  7 Jul 2026 17:38:27 +0200
Message-ID: <20260707153827.175245-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: dRLdEFQIEJdSBg_eo2db1tJQt_8SnELa
X-Proofpoint-ORIG-GUID: dRLdEFQIEJdSBg_eo2db1tJQt_8SnELa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE1MyBTYWx0ZWRfX/NL1CvkDr3B+
 4oUOooyMiHZ/bhFPF9E8wr2xyWvoYech/aYGyK+4qEviBWvmixb+xkzGHsYNu6Pt3W1LEL0jWLf
 DuUef2/5IYNN8JkLOobC2FMoC33R8D8=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d1d78 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=t9496tuAAAAA:8
 a=EUspDBNiAAAA:8 a=rDID_L0gX1M31e_C9isA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE1MyBTYWx0ZWRfXy2iOyWYRgJ6A
 PyZ499ZZPgGbjuv6ivH7YykJY+YM1F8tAu+Ew321A3rJtzP4NZ2WtGNyJH3x4GlUzx2cEBK+3Np
 VXZvujWOJw8AkvBCLMiGoHxHiJ1KpJhvDVY2dl+ga0h++HWOUwovH0/Qu83W063S4p7Z7THsedo
 R/CoYspnlo5oW7Bf49z/nyR/hpCIaFZpitBkYY3f09krhMjiVqIrXWkyL0/fi50y+aQAdOP2t+k
 qiPBm6btZLsBDQQeZ/e+4TXaIWnuMN1j/eeITObgMD5rvbrnJeDF16Jvbe21e3EwmMRaH0J0mwz
 wpDiu1pv+G4VnzHKD5F33fGj6VVhT3MdleIoiRimQyDIFIbAXj3nF/gl7w5SNEyn07OoPcMlNCJ
 Dmg7mClOR8rovfqHwEX5xD+OPI93hqyHRA5iqiiOgm7e59HCmLdaJlRwwKbOIl076QTnVy2RTsJ
 wqGGsVkf6zwMnXv9Pcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_083834_231434_E0722951 
X-CRM114-Status: GOOD (  14.33  )
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

The ptrace_v_not_enabled test expects the child to reach its ebreak
before it has used the vector extension. That is not guaranteed when
using fork(), because libc may run child atfork handlers before
returning to the test code. In those cases PTRACE_GETREGSET for
NT_RISCV_VECTOR then succeeds instead of returning ENODATA for
inactive vector state.

Use the raw clone syscall with SIGCHLD to keep fork-like semantics
while bypassing libc's fork wrapper and atfork handler chain.

Cc: Andy Chiu <tchiu@tenstorrent.com>
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index 74b6f6bcf067..b038e2175c80 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <sys/ptrace.h>
+#include <sys/syscall.h>
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <sys/uio.h>
@@ -25,9 +26,9 @@ TEST(ptrace_v_not_enabled)
 		SKIP(return, "Vector not supported");
 
 	chld_lock = 1;
-	pid = fork();
+	pid = (pid_t)syscall(SYS_clone, SIGCHLD, 0, NULL, 0, NULL);
 	ASSERT_LE(0, pid)
-		TH_LOG("fork: %m");
+		TH_LOG("clone: %m");
 
 	if (pid == 0) {
 		while (chld_lock == 1)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
