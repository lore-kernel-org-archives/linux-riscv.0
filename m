Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC98606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ha80WpBp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mThmeQuE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YFDJ/zI9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zXWAQlbgLxJADxAVFZWQUImCJVSqeiKnDmoq02ArGec=; b=ha80WpBpl8RqvAE7lEaFSmA/mW
	LP+6tTCDEc4/62FAHaSxrw83x3ETIjemTv95aVJkKV9cQkulPn/sf+hq/Dxh6KziqVHB53X4cKj6W
	CEQ3T2Ioq37KahAg+WvbNt6GJTq0xT8cV8AQv1W4MoPD1NwGScnWR/o1hGO7Mom6QGf8GJBtZ0hZf
	qvlF0bvm59nIgMQinxcFWYhroxtW3yXtQmTeS49mbaSsminJD+zVx2RZcbHnuIcjQE9ox8eVBvawp
	zBUSQ+8b3bc8S9081Y1w7zvu9oPBC7OyFW3/iBI07nX3s436iSdddIS6DUbnQAc6RTEytdoZ6Bijy
	1zqKLpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPtI-00000009Hc5-3cA2;
	Thu, 29 Oct 2026 13:10:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPtG-00000009HZv-2gEB
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 13:09:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe7Pw3944017
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O6c9DuoS8Ra
	0+zn4jvQnbBHB97ZOcmYxblC6VkPGOHg=; b=mThmeQuESdIY6WrYvkD7n2eL2Uz
	jQRhysl6BxROI9l/f8QPSOSD2v5Q0SuNSWJrTtuzp5/euixCrL/qDOd7eH6/y/7j
	IOhINyN3Wbr8aZpykNgZYER7Frx7iYyi5oa/OWPlYnGmE/7GzQLVOCuBlmKSEvPg
	vpTiNjhu5oNmMyIngsgpnrzviVLCRlCm4Tgp4RknKpPYOvajmSCRjm15CEuibAzp
	ywHPETbmJ8bEfcx9Vs6xbr502JRBC30IVNu/X4OIeGg7bBOhnXY5k3hUjmFB1g+l
	4AAv7oSwBMZ5U3vBQ8rI/PWOFYXE1sW547wDTo9ZWsMLJVDQTWHQVBSL7/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fgm8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd67466211bso1210232a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279396; x=1793884196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6c9DuoS8Ra0+zn4jvQnbBHB97ZOcmYxblC6VkPGOHg=;
        b=YFDJ/zI94EXyhZtupby5Ha3rQ3zxJxXLeYF+6cOa3e7/UEivOVV9Wu0trQtomdRY19
         ZBoWhIpr6jxmZfw51LGFF7c9Vkjs6Nb/D5BE1ObowzfpjpwX4S4KkPyj139o/yjOwzY+
         FzGRuUzLSwnQPtcXSIsyOt+5Aq0WkPRO9J5bfJ+TEoMImHvuT5GwMOseEwe2B/mbziTC
         2MQrz+gfggRz0ooN27KExwA89Tc6y7LMTzwOvnToCS59kNSvyC6cY5pHQM55VE+2wZfu
         W6Wnckn6qdWuduzkVhL8Znd6ecqQEJ+mItrKDRMgy/e5EWPZOVPwvzK85ocSYzL77qix
         v/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279396; x=1793884196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6c9DuoS8Ra0+zn4jvQnbBHB97ZOcmYxblC6VkPGOHg=;
        b=dASSwNaJELGErhz4HtP6mgNSFVOf6myMrYheoi6sVRLqA3L2KKeDPtYBmYTGFykhPc
         CoLEm40dvyBuCcKGiGJ38qoLqf1bA1+daV/DhRwCEGOWFCvIxz7VaaBkU4OkUr8BXW1B
         xz47aLjQzofUqiLEDpG5l/HCDqEHCBx37a2Q1CU69htnz3lT50ebUzhBrFjMLMfsNZ8M
         ALa3Fwi9OtzbPX/9qQJGj0tP/Ukzr218+ujlnjWV1txcPNk5X6aKV/8XHY8NTXIcMzNJ
         w4Es8sdrCVrnBt5hjBQXmeigIu8+bT9sxJmmhF3YmU3w4n4YDxVuaASiXeSozbI9lsOW
         jCxA==
X-Forwarded-Encrypted: i=1; AKwUvBxq2hFfazeFNlMO1jk1cQcE7e0URA6YFAd9uvEEKFaC8Ji0QuPmEAP6PzjZVoz3b3/WEoOo4X/jROPBZw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJOfd45BALu+omtzGTLUnldPp+6Wq27daaoAydjI9lIiicMqAXB
	K8JcLVKtrjiKJFgIsBaa7FLbHzkHtk2GqGGtoZqQPe5P6cx/pNWBKSaY55QHD9uP8aAvU8I5w/4
	qeVxVx8zyKXtXDRE9iicTqXUSl6EJewotTGztp2tn8IK28oELIFHMug5CnPJPh1JT7DwUJ9M=
X-Gm-Gg: AYBFou3KtqAIPfNyF+a1AiqBy8nf9ZVmXNbF2/RP8vCK7b0Efet1Mq5XTL6y/udx/cU
	vkilDysGv4gCytcs9lc40+snEruHVSixdY3jX2KIk8HvlZ3LjZy1ayPeyxVoQg+IHIkI6ZAZWS+
	KSlv6xak6SOzZ6g+guPQJKVf+hWByV0g+2rOG7VvxGjd4JlRtZgNm4qnvEX+OxgTo7ke4o4Bpsp
	0DxIkdOiXyogiKi47p/F3/z5bEPEhluAOQwv1AXqZ0mWuF4UPybgHaTwCSSh6qUHG4ZHzLvU0Ce
	IaOoeYra4MR7nqdMEEh8DJLacUAqymf7td+24Us3KT4sdfiFnCsyOy+M9jDyi/C1kk4H/m4kZuA
	uNtzzldVzQfuMkj5VYS6SRlOH325Z9nriAN6MHod5HHsPRfSWccdmtFp1l2i45I8DZB8yYhdgPD
	Ai9nc4GlcwnJ563gBQBZa5Y2D5xwtTBleGAXZkUUwCyIGgEjSCCvahKOXQSXohRreF2gElShrPm
	A==
X-Received: by 2002:a17:90b:1a86:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3ae5809fc90mr4441871a91.25.1793279396426;
        Thu, 29 Oct 2026 06:09:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1a86:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3ae5809fc90mr4441841a91.25.1793279395747;
        Thu, 29 Oct 2026 06:09:55 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:54 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 4/4] perf/riscv: Use Sspesa for precise sample attribution
Date: Thu, 29 Oct 2026 18:39:13 +0530
Message-ID: <20261029130917.3714691-5-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX05VhdsbKHGkB
 HAJlvf8ImTMbl+v+Z2BDadAKFCztuukNPH0O08I7tbAscxmFBb5g+0/I2EsyHlsDLQS3EimkycU
 9VknL4fkl9JJnDkRheHLiUxmAtxI+wAHPm2VcwClH3lKUXabLKzdFZ+0FEhYGrH7R7LkGbJiXPg
 MViVK2ddnR6abRcbJDExi9zHJ9Uq2OLNi0in9CjuUrL4T+Uu2dl0s9DkeEG/7LNF79SO2f3PyqP
 fMto/2FUhId2OQUxGKefzRwVXIGZ9V3+hiY9eCmfVHtZnFvuceBmSHxU4W6s1e3A3mSuBF/mHp0
 3ASETBR0V4H0AggAvtof6mgY3BMECXIG5ik+xiAsjyIc+AiQTFgPpfe+LpISTwX40p+D6PThe5G
 TTQlkXrIH8EachWM2Sz+QfvabFzIKqnGcugPtbAcBGKF+or8wGI8+mzPiMCGazNAMmke5ZEB8TB
 2chmgu8eaJzeBysCx6g==
X-Proofpoint-GUID: qM9gZayD1szdPcxg2SHoqlj4SfnaLe_Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX/EghaTwChYoU
 UfN+A8P2TgmTdwzO4o9NhuEDqyDkXuvYa161EEj+SLEdtVcjI314lrLIgXG2wA4PAbRlQGmVeC1
 o307D0uXVmuycVa23UtQK0DWpAdq6HI=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae345a5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MPwlUwCX0KYMQ8BLyxAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: qM9gZayD1szdPcxg2SHoqlj4SfnaLe_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_060958_800194_ABCDF142 
X-CRM114-Status: GOOD (  28.37  )
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

When the Sspesa (Precise Event Sample Attribution) extension is
available and a counter overflows, the hardware records a sample PC in
shpmspc register and the counter ID and additional implementation-defined
data in shpmsdata register.

In the SBI PMU overflow handler, build the perf_regs for the perf
backend. The regs->epc should be derived from the shpmspc and shpmsdata
values. Along with the regs->epc, PERF_SR_PRECISE is also set if
ssplcofi is present and the event supports pesa. If sspesa is not
available or for counters that don't match shpmsdata.CNTRID, fallback
to epc for PERF_SAMPLE_IP.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 2991dd92def2..c42122f0e676 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-pmu-sbi: " fmt
 
+#include <linux/bitfield.h>
 #include <linux/perf/riscv_pmu.h>
 #include <linux/platform_device.h>
 #include <linux/irq.h>
@@ -60,9 +61,16 @@ asm volatile(ALTERNATIVE(						\
 
 PMU_FORMAT_ATTR(event, "config:0-55");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
+PMU_FORMAT_ATTR(pesa, "config:56");
+
+#define RISCV_PMU_PESA_EVENT	BIT_ULL(56)
 
 static bool sbi_v2_available;
 static bool sbi_v3_available;
+static bool sspesa_available;
+static bool ssplcofi_available;
+static bool (*pmu_sbi_sspesa_derive_pc)(unsigned long *pc, unsigned long sdata);
+
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -70,6 +78,7 @@ static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_firmware.attr,
+	&format_attr_pesa.attr,
 	NULL,
 };
 
@@ -667,6 +676,29 @@ static bool pmu_sbi_is_fw_event(struct perf_event *event)
 		return false;
 }
 
+/*
+ * Check if this event can claim precise attribution on this platform. Only hardware raw
+ * events can claim precise attribution support.
+ */
+static bool pmu_sbi_is_pesa_event(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	if (!sspesa_available || event->attr.type != PERF_TYPE_RAW || config >> 62)
+		return false;
+
+	return config & RISCV_PMU_PESA_EVENT;
+}
+
+/* Check if this event can fulfill the precise_ip level requested by the user */
+static int pmu_sbi_precise_max(struct perf_event *event)
+{
+	if (!pmu_sbi_is_pesa_event(event) || !pmu_sbi_sspesa_derive_pc)
+		return 0;
+
+	return ssplcofi_available ? 3 : 2;
+}
+
 static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
@@ -678,6 +710,12 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	 */
 	flush_work(&check_std_events_work);
 
+	if (event->attr.precise_ip > pmu_sbi_precise_max(event))
+		return -EOPNOTSUPP;
+
+	if (type == PERF_TYPE_RAW && !(config >> 62))
+		config &= ~RISCV_PMU_PESA_EVENT;
+
 	return riscv_pmu_get_event_info(type, config, econfig);
 }
 
@@ -1073,6 +1111,77 @@ static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 		pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
 }
 
+/*
+ * Build regs for the perf backend as follows:
+ * 'U' mode samples - task_pt_regs
+ * 'S' mode samples - irq regs
+ * 'V' bit set - fallback to irq regs for now
+ */
+
+static bool pmu_sbi_sspesa_regs(struct pt_regs *perf_regs, struct pt_regs *regs,
+				unsigned long pc, unsigned long sdata)
+{
+	int mode = FIELD_GET(SHPMSDATA_MODE, sdata);
+
+	/* Virtualization not supported yet */
+	if (sdata & SHPMSDATA_V)
+		return false;
+
+	switch (mode) {
+	case SHPMSDATA_MODE_U:
+		/*
+		 * Hardware indicates 'U' mode but current task is not a userspace task,
+		 * so perf_regs should be left untouched.
+		 */
+		if (!is_user_task(current))
+			return false;
+		*perf_regs = *task_pt_regs(current);
+		break;
+	case SHPMSDATA_MODE_S:
+		*perf_regs = *regs;
+		perf_regs->status |= SR_PP;
+		if (user_mode(regs)) {
+			/*
+			 * shpmspc was recorded in 'S' mode but interrupt was delivered in 'U'
+			 * mode due to which perf_regs can't retain 'U' mode stack frame.
+			 */
+			perf_regs->s0 = 0;
+			perf_regs->sp = 0;
+		}
+		break;
+	default:
+		return false;
+	}
+
+	/* Update the epc to the more precise PC derived from shpmspc */
+	perf_regs->epc = pc;
+	return true;
+}
+
+/* QEMU hardwires shpmsdata[63:8] to 0 by default and so shpmspc needs no adjustment. */
+static bool pmu_sbi_sspesa_pc(unsigned long *pc, unsigned long sdata)
+{
+	return !(sdata >> SHPMSDATA_METADATA_SHIFT);
+}
+
+/*
+ * Following is a tentative guideline in the spec that if shpmsdata is not hardwired to 0 and no
+ * custom algorithm is reported then software shouldn't report support for precise attribution.
+ * The pmu_sbi_sspesa_derive_pc is responsible for implementing the custom algorithm and must be
+ * set per vendor and implementation during probe. If it isn't set then precise attribution is
+ * not supported for that vendor and implementation.
+ */
+static void pmu_sbi_sspesa_setup(void)
+{
+	switch (riscv_cached_mvendorid(0)) {
+	case 0:
+		pmu_sbi_sspesa_derive_pc = pmu_sbi_sspesa_pc;
+		break;
+	default:
+		break;
+	}
+}
+
 static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 {
 	struct perf_sample_data data;
@@ -1087,6 +1196,11 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
 	struct riscv_pmu_snapshot_data *sdata;
+	unsigned long sample_pc = 0;
+	unsigned long sample_data = 0;
+	int sample_cntrid, cur_cntrid;
+	bool sample_pc_valid = false;
+	struct pt_regs perf_regs, *sample_regs;
 
 	if (WARN_ON_ONCE(!cpu_hw_evt))
 		return IRQ_NONE;
@@ -1115,6 +1229,21 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	else
 		ALT_SBI_PMU_OVERFLOW(overflow);
 
+	/*
+	 * Sspesa records the PC and metadata of the overflowing counter in
+	 * hardware. The PC is precise only for events that support precise
+	 * attribution; otherwise it is best-effort.
+	 */
+	if (overflow && sspesa_available) {
+		sample_pc = csr_read(CSR_SHPMSPC);
+		sample_data = csr_read(CSR_SHPMSDATA);
+		csr_write(CSR_SHPMSDATA, 0);
+		sample_cntrid = sample_data & SHPMSDATA_CNTRID;
+		if (pmu_sbi_sspesa_derive_pc)
+			sample_pc_valid = pmu_sbi_sspesa_derive_pc(&sample_pc,
+								sample_data);
+	}
+
 	/*
 	 * Overflow interrupt pending bit should only be cleared after stopping
 	 * all the counters to avoid any race condition.
@@ -1161,6 +1290,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 		riscv_pmu_event_update(event);
 		hw_evt->state |= PERF_HES_UPTODATE;
 		perf_sample_data_init(&data, 0, hw_evt->last_period);
+		sample_regs = regs;
+		cur_cntrid = pmu_sbi_csr_index(event);
+		/* Update the regs if the current event caused the overflow */
+		if (sample_pc_valid && cur_cntrid == sample_cntrid) {
+			if (pmu_sbi_sspesa_regs(&perf_regs, regs, sample_pc, sample_data)) {
+				sample_regs = &perf_regs;
+				if (ssplcofi_available && pmu_sbi_is_pesa_event(event))
+					sample_regs->status |= PERF_SR_PRECISE;
+			}
+		}
 		if (riscv_pmu_event_set_period(event)) {
 			/*
 			 * Unlike other ISAs, RISC-V don't have to disable interrupts
@@ -1170,7 +1309,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			 * TODO: We will need to stop the guest counters once
 			 * virtualization support is added.
 			 */
-			perf_event_overflow(event, &data, regs);
+			perf_event_overflow(event, &data, sample_regs);
 		}
 		/* Reset the state as we are going to start the counter after the loop */
 		hw_evt->state = 0;
@@ -1500,6 +1639,15 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 	irq_requested = (ret == 0);
 
+	if (riscv_isa_extension_available(NULL, SSPESA) &&
+	    riscv_isa_extension_available(NULL, SMCDELEG)) {
+		sspesa_available = true;
+		pmu_sbi_sspesa_setup();
+	}
+
+	if (riscv_isa_extension_available(NULL, SSPLCOFI))
+		ssplcofi_available = true;
+
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
 	bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
