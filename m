Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB979606A32E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wOwwpy9B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gQDA6S6h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EQ1Xls4ryU4PvQU81lSCasl8diV1BjTCjZ+0sqUIwn0=; b=wOwwpy9BW9Cqd7+Rp9Wq3W/uS/
	4JzKvLq9NY8PoNN1sSdBEOqfLy2tLoaBZ8H6bmrTS2n8iExcOTX0YGNs+MmDFr+sCz6QTTSbTbOhu
	V+7zzzaenxEeQxQUiIBGYS6T8mmBQjM+2d4Nxgt9vqtgwfFOaDsXF2UHl9a24+zNBkSIUPTp89MdM
	VGGaOezPYiZSYO7vE6hVPrazl8eGPLm4vx6HUNTRfBGxwga7GhbZvHLNaMucHzomkg7+5BrPcwjEZ
	hWAzSx35lKwk61QgE+0Ls3ieDRAk0klvBZSM9SgXv+UYSByRL+lNHZwZy5MyQtsT8s6+MDnowwHu1
	Th+jAH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNwD-0000000DGwq-2NRz;
	Fri, 06 Nov 2026 17:41:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNw9-0000000DGri-3y0P;
	Fri, 06 Nov 2026 17:41:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0lnq710318;
	Fri, 6 Nov 2026 17:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I4//nJhUHMl
	OJPir5PpFTp+7DmgIWdEmUeAExLmzuN0=; b=gQDA6S6hAR4VIlO9xAJNvIbQM6e
	GKxf4kCZuDl5jsWHF5/Ri9I6PGH5qQoIEp8rIKp+VgitZgfSn4BZPOOPb0PW7n8E
	Qf2iForPLLW5fDrR4ZUV2A2sVxKEgc4FThEh4erhYLn1QcxIfNlhPPya8kakR3wl
	a0YR75wfQRKX9A9ggl/rjxZ1KjQ00Dlfw+nE+Ss7rGwo1gFakOA3YtMZKpCm+xR7
	QMBmN6D4aZMduBAYd1XvMlZhGzg42VyrEUGcksRD4tvlFwyxB8xMRe7WZF5C81TB
	ZsvhbxTCwDlW2YTMtyKBqb8w3zr4UmVAW0pQchp6a0YPZAfOLYySLhkYBeQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pauxr5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 17:40:56 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HesTV3085169;
	Fri, 6 Nov 2026 17:40:54 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-vikrsi-blr.qualcomm.com [10.190.111.249])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A6Herwl3085160
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 17:40:53 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 4853235)
	id CE431248C6; Fri,  6 Nov 2026 23:10:52 +0530 (+0530)
From: Vikram Singh <vikram.singh3@oss.qualcomm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Liang, Kan" <kan.liang@linux.intel.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Beeman Strong <beeman@rivosinc.com>
Cc: Vikram Singh <vikram.singh3@oss.qualcomm.com>,
        Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v4 4/7] riscv: pmu: Add infrastructure for Control Transfer Record
Date: Fri,  6 Nov 2026 23:09:39 +0530
Message-ID: <20261106173942.3175069-5-vikram.singh3@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173942.3175069-1-vikram.singh3@oss.qualcomm.com>
References: <20261106173942.3175069-1-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX2+RCYX95CbcF
 ArP9BFxQtqJwe8TdDPqE3dJgyep2YkPvB08/BU53PulXCQJ5HrgQJKyhCIHL3+K0c0zCD82ow8d
 uSkwO5Ekbf1ltUefaMekGdIwq9t2RzulgC7PomIncLeAMku/rtaZfWZULs62GyDp8UXgaf8XJwo
 DiUKSwaint+CDtoyPcV8naMC8m4kFMwCztXCVnF3PGdLWl13itKBkIIkHW14poDoPbeEmi9MjjS
 e2Ht0bF0QS+zTx5ClY1flSaXW+rWPop5XbA8Qn0f/kle+xmcy+Z6c8qM0PYrHJPWJ10v93HMgPP
 4Iancszy/1tMmj5lud+lsN3WgN7gau3evi7GMcHMzAcM389QakflhOY/RIA3/mLxsnpBOfjl0vs
 ixeQrL1jyytdtdIIZ9vjzvN6fsyBCTkRa2Lignuhj7NVRMhYhMn5G+Ryw46QEnmPaeWkMG81BKo
 qk3uBz9EAolUE2LN7RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX/4NXmOOeHPYl
 BtrYqOzDToOsYNghH236mZDrsiECPDt+wV8jrIIbNaW/GGExHXwct4JL0pzT790d/+dtsWu6UMM
 O9Q4fOFwF3IEBKzM694/w2tJFcBQijc=
X-Proofpoint-GUID: h0dyN4qyPG9XWno58-ZaVO19v8_mo26z
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aee1128 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WiPZLL71g15-92xXPrkA:9
X-Proofpoint-ORIG-GUID: h0dyN4qyPG9XWno58-ZaVO19v8_mo26z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_094114_201635_6018EBE3 
X-CRM114-Status: GOOD (  23.18  )
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

To support Control Transfer Records (CTR) extension, we need to extend the
riscv_pmu framework with some basic infrastructure for branch stack
sampling. Subsequent patches will use this to add support for CTR in the
riscv_pmu_dev driver.

With CTR, the branches are stored into a hardware FIFO, which will be
sampled by software when perf events overflow. A task may be
context-switched between overflows, and to avoid leaking samples we need
to clear the last task's records when a task is context-switched in.
To do this we will be using the pmu::sched_task() callback added in this
patch.

Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
---
 drivers/perf/riscv_pmu.c        | 19 +++++++++++++++++++
 drivers/perf/riscv_pmu_legacy.c |  2 ++
 drivers/perf/riscv_pmu_sbi.c    | 17 +++++++++++++++++
 include/linux/perf/riscv_pmu.h  | 19 ++++++++++++++++++-
 4 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 092e6c92dc2d..a1ae490d94c9 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -122,6 +122,19 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
 	return GENMASK_ULL(cwidth, 0);
 }
 
+static void riscv_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx, struct task_struct *task,
+				 bool sched_in)
+{
+	struct riscv_pmu *pmu;
+
+	if (!pmu_ctx)
+		return;
+
+	pmu = to_riscv_pmu(pmu_ctx->pmu);
+	if (pmu->sched_task)
+		pmu->sched_task(pmu_ctx, task, sched_in);
+}
+
 u64 riscv_pmu_event_update(struct perf_event *event)
 {
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
@@ -252,6 +265,8 @@ static int riscv_pmu_add(struct perf_event *event, int flags)
 	cpuc->events[idx] = event;
 	cpuc->n_events++;
 	hwc->state = PERF_HES_UPTODATE | PERF_HES_STOPPED;
+	if (rvpmu->ctr_add)
+		rvpmu->ctr_add(event, flags);
 	if (flags & PERF_EF_START)
 		riscv_pmu_start(event, PERF_EF_RELOAD);
 
@@ -273,6 +288,8 @@ static void riscv_pmu_del(struct perf_event *event, int flags)
 	if (rvpmu->ctr_stop)
 		rvpmu->ctr_stop(event, RISCV_PMU_STOP_FLAG_RESET);
 	cpuc->n_events--;
+	if (rvpmu->ctr_del)
+		rvpmu->ctr_del(event, flags);
 	if (rvpmu->ctr_clear_idx)
 		rvpmu->ctr_clear_idx(event);
 	perf_event_update_userpage(event);
@@ -385,6 +402,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 	for_each_possible_cpu(cpuid) {
 		cpuc = per_cpu_ptr(pmu->hw_events, cpuid);
 		cpuc->n_events = 0;
+		cpuc->ctr_users = 0;
 		for (i = 0; i < RISCV_MAX_COUNTERS; i++)
 			cpuc->events[i] = NULL;
 		cpuc->snapshot_addr = NULL;
@@ -403,6 +421,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 		.start		= riscv_pmu_start,
 		.stop		= riscv_pmu_stop,
 		.read		= riscv_pmu_read,
+		.sched_task	= riscv_pmu_sched_task,
 	};
 
 	return pmu;
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 4d6461d6a74f..097841bde9ef 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -114,6 +114,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 		BIT(RISCV_PMU_LEGACY_INSTRET);
 	pmu->ctr_start = pmu_legacy_ctr_start;
 	pmu->ctr_stop = NULL;
+	pmu->ctr_add = NULL;
+	pmu->ctr_del = NULL;
 	pmu->event_map = pmu_legacy_event_map;
 	pmu->ctr_get_idx = pmu_legacy_ctr_get_idx;
 	pmu->ctr_get_width = pmu_legacy_ctr_get_width;
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 76a43259390d..400de6bed369 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -796,6 +796,14 @@ static void pmu_sbi_reset_scounteren(void *arg)
 			  csr_read(CSR_SCOUNTEREN) & ~BIT(pmu_sbi_csr_index(event)));
 }
 
+static void pmu_sbi_ctr_add(struct perf_event *event, int flags)
+{
+}
+
+static void pmu_sbi_ctr_del(struct perf_event *event, int flags)
+{
+}
+
 static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 {
 	struct sbiret ret;
@@ -855,6 +863,12 @@ static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	}
 }
 
+static void pmu_sbi_sched_task(struct perf_event_pmu_context *pmu_ctx, struct task_struct *task,
+			       bool sched_in)
+{
+       /* Call CTR specific Sched hook. */
+}
+
 static int pmu_sbi_find_num_ctrs(void)
 {
 	struct sbiret ret;
@@ -1506,6 +1520,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
 	pmu->cmask = cmask;
+	pmu->ctr_add = pmu_sbi_ctr_add;
+	pmu->ctr_del = pmu_sbi_ctr_del;
 	pmu->ctr_start = pmu_sbi_ctr_start;
 	pmu->ctr_stop = pmu_sbi_ctr_stop;
 	pmu->event_map = pmu_sbi_event_map;
@@ -1517,6 +1533,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	pmu->event_mapped = pmu_sbi_event_mapped;
 	pmu->event_unmapped = pmu_sbi_event_unmapped;
 	pmu->csr_index = pmu_sbi_csr_index;
+	pmu->sched_task = pmu_sbi_sched_task;
 
 	ret = riscv_pm_pmu_register(pmu);
 	if (ret)
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 08fdcf6baf4e..58bafa173868 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -30,6 +30,13 @@
 
 struct sse_event;
 
+#define MAX_BRANCH_RECORDS 256
+
+struct branch_records {
+	struct perf_branch_stack branch_stack;
+	struct perf_branch_entry branch_entries[MAX_BRANCH_RECORDS];
+};
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
@@ -49,6 +56,11 @@ struct cpu_hw_events {
 	bool snapshot_set_done;
 	/* A shadow copy of the counter values to avoid clobbering during multiple SBI calls */
 	u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
+	/* Saved branch records. */
+	struct branch_records *branches;
+
+	/* Active events requesting branch records */
+	int ctr_users;
 };
 
 struct riscv_pmu {
@@ -65,6 +77,8 @@ struct riscv_pmu {
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);
 	void		(*ctr_clear_idx)(struct perf_event *event);
+	void		(*ctr_add)(struct perf_event *event, int flags);
+	void		(*ctr_del)(struct perf_event *event, int flags);
 	void		(*ctr_start)(struct perf_event *event, u64 init_val);
 	void		(*ctr_stop)(struct perf_event *event, unsigned long flag);
 	int		(*event_map)(struct perf_event *event, u64 *config);
@@ -72,10 +86,13 @@ struct riscv_pmu {
 	void		(*event_mapped)(struct perf_event *event, struct mm_struct *mm);
 	void		(*event_unmapped)(struct perf_event *event, struct mm_struct *mm);
 	uint8_t		(*csr_index)(struct perf_event *event);
-
+	void		(*sched_task)(struct perf_event_pmu_context *ctx, struct task_struct *task,
+				      bool sched_in);
 	struct cpu_hw_events	__percpu *hw_events;
 	struct hlist_node	node;
 	struct notifier_block   riscv_pm_nb;
+
+	unsigned int	ctr_depth;
 };
 
 #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
