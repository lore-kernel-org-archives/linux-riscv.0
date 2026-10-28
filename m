Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034E6606A322
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QMdzPs8e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mYFwiD4o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A7qBcojm1lEblVg/BVXCO7wHDYoapYJ06KoOlxmxsuw=; b=QMdzPs8efu5kP2QKNblP5T/2jC
	e4exqZNvbWIFH/CICbV5MiQ5r+PYzzX9DtxsDYN+q9NWyTdo5PuiVLYXV1bDA4cH+wKEOP8lQoE5M
	3SmE8WQpPFEKFcEuh0dZqqRpwauEq/HmzRP1+09GbLpgKfWLssns2eyofkvmGWgychbBcqHwFaSp9
	PcRXlOB1fDqppawjCYWNskMU22zS218RQxxCQ0hsYqmQekz/rcdJWaoAvlnUJ0EZiResrMee5jjhg
	4QyIrsWfGvFMqbyvByiZgFoWTdPfRlHJFOYPJyrmwnu6mI42mlFbMViNhUM5C1LLkC0lBDTcajnPQ
	SQOeP2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6wn-00000007bl2-49YZ;
	Wed, 28 Oct 2026 16:56:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6wj-00000007bi6-3FUZ
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 16:56:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA0En2542994;
	Wed, 28 Oct 2026 16:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m/JsVpEQsP9
	8ERbyccS1/nZB1xOym4ueA6JXCxO5WIg=; b=mYFwiD4olL7qqh8eMrcHofx+9UF
	3fh813MBQ6E7OVpOw63j0O2pb+8hRUh5FwuW6XOpR9wg3TEhdBhJp42U8zorcImJ
	0pDvLwI/sUUS2qIuxzvG0r6NKsfCNVXUQeypW+2GjEVozKQYaNj643BYdYZtJkqt
	XN6cxnamERM3TP0eNtRHSEEa1pcTckNnhJF+FB0R5FrGs3FlQYSLSmk5jq5yGyCS
	8bTMEHAyggsb2Kmco9D8WaTOE3XCD7DYcfawTDn6A9tuYXXzF6ZKMSGnI/QI1YHC
	dZzG7vkLGbIVOUVlJ5yZ8fAzxTPBWdKQKHl/ehDo6r1RjHAHYFtLZyxBIVw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehrgex-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69SGtYoD1881524;
	Wed, 28 Oct 2026 16:55:35 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69SGtZ7g1881557
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:35 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 37DFD24B3D; Wed, 28 Oct 2026 22:25:33 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        Conor Dooley <conor@kernel.org>, Atish Patra <atish.patra@linux.dev>,
        Anup Patel <anup@brainfault.org>
Cc: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v11 5/9] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Wed, 28 Oct 2026 22:25:27 +0530
Message-ID: <20261028165531.940336-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: legSdVcPvTAmcmIvO3VuVo6FT63TTPSu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX3Kc7zMfRjwJ/
 U1EfAiIj3W8zCVN7AVYU9Omg9mQULncXgRFS5qOR+q7Ok3xrJ/GT0FYqJQ32JCn+TNZu3S+CRKx
 K+gZBFAMiHiH6dwQsOBn4BNX66O6PBXKcB51ERQ8Y+XgIU/V4hEtZk+ZzhAbljbOFYRRA5pi/PC
 69xAbJyUPt8uvDzAuuc1OesfCjDPxdl1p1097VXcdnkOC904DfxPhLZvIbI/FvFL64n67ISjDFz
 WZ7bP46eMhW39mY04BR6iFGyxGuUkJDnZONvO8mE8s4Z37W3U3dMSSrfKtPDJSlBxmk6V9YHX+h
 imewFPbvkt8va+wuaWzZuuqBeuxJ34j1i2TDerYL4/w3JpBoIzmBy303lNKm3+vwWnUC+uzbuMT
 EjMwk5nYtiu3XKwQjHMPmAII+Oj/S2IjaEk+2ODvRhaoEeIvuXd7oX7fX8YWQ6Lgju8uO7v2uMm
 45FHSppLjKl1jm78PDA==
X-Proofpoint-GUID: legSdVcPvTAmcmIvO3VuVo6FT63TTPSu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX8UBMwBZ4/aWr
 4Z3zEhlbVvT3jkLH5qHqqRSDlTdAn40tZOc0zvQYouOLVXnFzXJosNebNuB3l8yBBqMeDLNg+Nx
 GWhju46U1DrtNMG1ZFj/IZLEX6Gh8/Y=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2290b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=968KyxNXAAAA:8 a=x7ssyjL1-dtDjsuFruwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_095617_838010_9546E521 
X-CRM114-Status: GOOD (  14.68  )
X-Spam-Score: -2.7 (--)
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

From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..520495420462 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,6 +294,13 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
 	if (user_mode(regs))
 		trace_page_fault_user(addr, regs, cause);
 	else
@@ -314,8 +321,8 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/* Do not open an interrupt window before a nofault fixup completes. */
+	if (!regs_irqs_disabled(regs) && !faulthandler_disabled())
 		local_irq_enable();
 
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
