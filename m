Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42919606A332
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X/wBAN2x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=chk0Ta9J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gz+JS2zJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cUAOwINAnAGH2kjEFi7lSptVl9LYzt2itEQ5wz1ztjg=; b=X/wBAN2xEkkudHTg7udJ+LlXH+
	KlGsV5Y6sWjX+sFJflwWBO5zX1GhMbaxKo6xmGKx9P+fGatcVNLGR950+Wk7nXmJyVcTfescK3r9c
	IqTmloMHt2dOqpnohOiNzKNZxoBMfAHSL1xFCBkmmShODuC4IB/t/SZkLd3dq2CE6R2k6Ad5g1hQu
	XskTxZqB8Cf0YjmlaENXKldIu42ppxl/40KyrQQ9GD9E2IeUCVo+WBqa7blLspTCpO+rLQ0vt9gr+
	SsssXFTZuS1J/2DYJ29zU+2l0A2LVODCg5n2pa0VFlvCRpN00pYfOi2nFX0xIsZ7qDNiaL/RnNx+O
	2XnCXmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcL6-00000008Rfh-3PIa;
	Wed, 18 Nov 2026 09:52:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcKd-00000008RCa-0YF9;
	Wed, 18 Nov 2026 09:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yo7l02eWJ43V8owpF5AEyt3Se1FwVEY9Eld0+rbtHFI=; b=chk0Ta9JoS3JGhCAjIYy3CiT7g
	09+/V272Vac91xDjRIOB46af133CQWh0OEZsHuh08N+vNsxgXipQareqrEKpjXuOzcTTVyZH6+bFO
	1sw9voRXxXXxCV5bI6CEgWc5wi8qIJS3NS4/A5mUQaLK1R60pYCE9GS6fcdUiKtyBmNt8iJ1GX4lq
	oyBS8vwVid4FYdetgD6G537oRU8xtJFKcrjrSTEHOdoJUpwfSrWcITqG0/oI2JwlMO4iZziGgtdF0
	/NGNSZCXhoidSxLbVxjnlGGZzEbYz9qWx1A364rjkER79fM/RbN+x99HzUhFNk6Gc9/e2sX1d7H42
	38cwdGhQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcKZ-0000000Fszt-2FjN;
	Wed, 18 Nov 2026 09:51:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9k3sU3353924;
	Wed, 18 Nov 2026 09:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yo7l02eWJ43
	V8owpF5AEyt3Se1FwVEY9Eld0+rbtHFI=; b=gz+JS2zJmynFmfTGNkWoaScqUoG
	h/UJEHetWrHbweKtKYOYpAvxN0cVJRBa9F6rTWQzJvOwOcjNQBoQ/sIVMjfg4EHi
	oYYxAedxUYz4Hh1w7lPFEHFFo7m0/RUAU+gyyUSxjON9gyvqluo8XPTh3h+mlhi2
	2q3k/0JQW00RnAw9kSjh4vBTZBl2OLgmXGHC4C0rigQ3QsnDQUoYB3k7z+4R171c
	4A66spRUSr3WE/tqhV42tusTYUCUGJyxXi0Y3+0D9ZzHAiMiqRamS0vy3gwn+IqQ
	Kc0UuMtX8n1ajwtyTnOW00YLtj/oL0VGmMFDT9ay68wVDwzKb+XvxpCwrzg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatebt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 09:51:18 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9pFJa376006;
	Wed, 18 Nov 2026 09:51:15 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-vikrsi-blr.qualcomm.com [10.190.111.249])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AI9pFrS375997
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 09:51:15 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 4853235)
	id EABC124881; Wed, 18 Nov 2026 15:21:14 +0530 (+0530)
From: Vikram Singh <vikram.singh3@oss.qualcomm.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
        namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        atishp@rivosinc.com, anup.patel@oss.qualcomm.com, will@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        beeman@rivosinc.com
Cc: Vikram Singh <vikram.singh3@oss.qualcomm.com>,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH v5 4/7] riscv: pmu: Add infrastructure for Control Transfer Record
Date: Wed, 18 Nov 2026 15:20:50 +0530
Message-ID: <20261118095053.3871267-5-vikram.singh3@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com>
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd7516 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=W-_n0kkjAAAA:8 a=asR4NJMkVcE6PeAdEdMA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: WqGAuotJNNT8J_Rv5lF-LdmXzZhLxZ4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX7RqnvrOaA9As
 565pboxuMSe6+li0gj/DwaWIPkbsOwp90eXp3Vi5V8+6er5CPSiRiH6ktIqvyIg1lXzPqFkByE4
 25ONgHzgFOVB7J/JoHEKF1pfnd9Xsm5H6Nfr6Xt4Pvh6ix9MhYL+nO0vnroNG7hUdJxvayr4BH2
 JcG2xZaXSrvsLjL/XYWfc6Qy0q9xTFrtkCnDj829Mk6O4APet/0ZB6vTfAfy4DcfXN5ypHKN4vu
 ELKtfhK7tqebj01zMUIccGKaAy6ojkCwWc/QsZ/11kXEsoP/KltiKu7FGRcBi00hJskVMgh1bHG
 HMfaG3qJAURu6w5bct5QYhZWLNSob26zOGkDbAJf6XovyJgvm1oDP2LoV4DLQvazhr+mWaM+dZ4
 t3SB7VrlodFGZ8v55w8nsgXH82hLy/jxi/vGxC8zJxIFiHWj9rvOzCWwIMHwmjv+zhHzb8OsfUQ
 Cfmu+9eNbSPhwMsxQ8w==
X-Proofpoint-ORIG-GUID: WqGAuotJNNT8J_Rv5lF-LdmXzZhLxZ4A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX5m7yYIdN+dGs
 9YsBPmDVDnxwZlUgE4m0NWfexoL7X8UpNTG36Yyx8aZjbnlG5PpTAym+pCKtyVykm2ppUt+4JZh
 ThXJh7ge2VARmARPB5u22IWqZfQbWWQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_095156_008958_53F1B29E 
X-CRM114-Status: GOOD (  22.00  )
X-Spam-Score: -0.8 (/)
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
Link: https://lore.kernel.org/r/20261106173942.3175069-5-vikram.singh3@oss.qualcomm.com
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/perf/riscv_pmu.c        | 19 +++++++++++++++++++
 drivers/perf/riscv_pmu_legacy.c |  2 ++
 drivers/perf/riscv_pmu_sbi.c    | 17 +++++++++++++++++
 include/linux/perf/riscv_pmu.h  | 23 +++++++++++++++++++++--
 4 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 8e3cd0f35336..d4826eb73b16 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -157,6 +157,19 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
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
@@ -269,6 +282,8 @@ static int riscv_pmu_add(struct perf_event *event, int flags)
 	cpuc->events[idx] = event;
 	cpuc->n_events++;
 	hwc->state = PERF_HES_UPTODATE | PERF_HES_STOPPED;
+	if (rvpmu->ctr_add)
+		rvpmu->ctr_add(event, flags);
 	if (flags & PERF_EF_START)
 		riscv_pmu_start(event, PERF_EF_RELOAD);
 
@@ -290,6 +305,8 @@ static void riscv_pmu_del(struct perf_event *event, int flags)
 	if (rvpmu->ctr_stop)
 		rvpmu->ctr_stop(event, RISCV_PMU_STOP_FLAG_RESET);
 	cpuc->n_events--;
+	if (rvpmu->ctr_del)
+		rvpmu->ctr_del(event, flags);
 	if (rvpmu->ctr_clear_idx)
 		rvpmu->ctr_clear_idx(event);
 	perf_event_update_userpage(event);
@@ -402,6 +419,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 	for_each_possible_cpu(cpuid) {
 		cpuc = per_cpu_ptr(pmu->hw_events, cpuid);
 		cpuc->n_events = 0;
+		cpuc->ctr_users = 0;
 		for (i = 0; i < RISCV_MAX_COUNTERS; i++)
 			cpuc->events[i] = NULL;
 		cpuc->snapshot_addr = NULL;
@@ -416,6 +434,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 		.start		= riscv_pmu_start,
 		.stop		= riscv_pmu_stop,
 		.read		= riscv_pmu_read,
+		.sched_task	= riscv_pmu_sched_task,
 	};
 
 	return pmu;
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 1b8e4789cb3c..5214e90c61a6 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -115,6 +115,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	set_bit(RISCV_PMU_LEGACY_INSTRET, pmu->cmask);
 	pmu->ctr_start = pmu_legacy_ctr_start;
 	pmu->ctr_stop = NULL;
+	pmu->ctr_add = NULL;
+	pmu->ctr_del = NULL;
 	pmu->event_map = pmu_legacy_event_map;
 	pmu->ctr_get_idx = pmu_legacy_ctr_get_idx;
 	pmu->ctr_get_width = pmu_legacy_ctr_get_width;
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 21a2078eab98..b14b3acf7567 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -825,6 +825,14 @@ static void pmu_sbi_reset_scounteren(void *arg)
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
@@ -885,6 +893,12 @@ static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	}
 }
 
+static void pmu_sbi_sched_task(struct perf_event_pmu_context *pmu_ctx, struct task_struct *task,
+			       bool sched_in)
+{
+	/* Call CTR specific Sched hook. */
+}
+
 static int pmu_sbi_find_num_ctrs(void)
 {
 	struct sbiret ret;
@@ -1506,6 +1520,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
 	bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
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
index ecaa40370830..c748a06ad751 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -28,6 +28,15 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+struct sse_event;
+
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
@@ -47,6 +56,11 @@ struct cpu_hw_events {
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
@@ -60,17 +74,22 @@ struct riscv_pmu {
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);
 	void		(*ctr_clear_idx)(struct perf_event *event);
+	void		(*ctr_add)(struct perf_event *event, int flags);
+	void		(*ctr_del)(struct perf_event *event, int flags);
 	void		(*ctr_start)(struct perf_event *event, u64 init_val);
 	void		(*ctr_stop)(struct perf_event *event, unsigned long flag);
 	int		(*event_map)(struct perf_event *event, u64 *config);
-	void		(*event_init)(struct perf_event *event);
+	int		(*event_init)(struct perf_event *event);
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
