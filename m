Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB6DC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:02:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 813A661970
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 813A661970
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=brABH7nluJMpdDxNBrJ1lnHGYOB3r2S8/4iEm6jpRpc=; b=n779arV0iEtHuv6gJpIsxbETV
	DtZbX/ujCjJ05373VRkGeOGEkGFj854tb3uj1tgcRLSg8o0U8J4M3wHyfQULgv037Lz9PtNdhj2sX
	nXMFFdor2yGCboS/10Ee+4ad8kK79fsBgtjh0aAqorFRbkD1mq5rqhfxyMtPhzZRFytlX5Vf5SgnL
	pnFRzrWM1dmeX12ZA++BIJJcqqsVGbLB1U3qpLmu5vXkAZPB5W0g1NQ9NIsSaUGqQO2+1e+j5QHVN
	KXmZGRrRQg6lYAhiqpXQpoUpaCY4WBsDCGUlgi+afJ7Xm0mquctT5UykQQGHaBMFBaCIBUyRmq/j0
	PfQUbEXBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNO7m-008IXK-ED; Fri, 19 Mar 2021 23:01:46 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNO7d-008ITD-3q
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 23:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616194898; x=1647730898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvhD1o7QLbuyiQ3irecBTTVFAEPFjiti9Nt3mhTF4+w=;
 b=Kly2dndeaY3xOjp+hse0f58u4bcfycoB9VMoM7+9XZuEIgzVnmKMrhGH
 nHT6bbjpQFwCcGqN8nVR3WzLCt1nNmHKEDfWt9Y+6TOWfR1+o9Bq1H9jT
 XdHU7kF6Fdyg+BSOjMQmFHB52t74TOgskGDPl+CpktIfDC1tm66ZEstZM
 jQcKXlSXvzwlz9jN7XT9NO+3xbFNCNXDMFRnroVp7wB4RzzIRc6edPJQx
 SBB6Gs18YQv0Fmfr0fBVtpwbueGxSp4s7bk9HFItfPIAwIBf5KsL1FVnb
 AygZ95jkAcbOam+gJmD9geQ9olPRQWicmmmh11NMei85Fe7BXLZHA5pOW Q==;
IronPort-SDR: dN8kxg5otcF4+zukKe3HfyO5K7Pox+CVU1uY1o59DLY/dFbRMyO2XCvyuvifIxldZsfGTvvzd3
 Vd8O1Y7rLctzp5E3Bt+odMYSVqniENlrf+rk9sBntljJ2OIkJNs+hVgHpSYNvwFHba6uzIksUt
 iLA1RACdKqNgOzCcohNasZNRGA/+UqwCsIHvCPTG3PdUtt9gIsdx0IngLnLt/f2BOFzTZWQIEn
 VBolNvx0aRWKMpX+3PngPhaYukxc9VR+ZpFS+PhQQ165WOaQeAFcx/ZsPh6p+UxltRyEdIU3pl
 zWM=
X-IronPort-AV: E=Sophos;i="5.81,263,1610380800"; d="scan'208";a="163715809"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 07:01:32 +0800
IronPort-SDR: IdijD8iRF2Lj/mPNg5A65ZC2K6icFq1wkgw7zGs3Ano/sD3lHjopd15dzq+htsQVX8/miMAgSV
 XuhFs9MZEsqvc8XgjVq1RrXAHMphMHpoU/38+D1WLqxaMUWt062W0BdEhHBFWJjDTquFhUhFcO
 hOHFiUhJIW0asmqqjXBcZlww3XtY7i8zD/EA5tdUOsvIdecs80aL7uj2yt0iIqm7HKpX/1N0hY
 Kd52ChULf7h5yE6NznycVZ228X0M2EwClMFi1ORiTTFnjXXH9dLcLcbVH0vf7JcS3jWJaeHBP7
 GmzIR3bBJtxzNR3g8fecDh/8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 15:42:04 -0700
IronPort-SDR: a/RK+GO7gWzwO5+wEegWwV0E55vPwk0jaT865Ui5Ia9HugZOXXbuzQHyG5ClNQoLyY9ak/iR56
 +XaxxVT85yXeyaAKq9sINCFC5b/GHxNzJm+Jcf+2UZW0tV3sS2lCmrGRb/Wpyvt2bgQYrg7R9L
 kNhKf2gJT9Amlv/BCgzi7LGP5xZjAqOxEXnsHHbirJLcttqlQqKeCT1y6mF/+V5s8W+jrblwbD
 4d0UmGrkgNXhWALwHqCj3KzIk7AYvYIvUZ6hnJLvJxavA7265zMxueGZf03480Yd6ljxkxj7dm
 FGE=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2021 16:01:32 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
Subject: [RFC 5/6] RISC-V: Add RISC-V SBI PMU extension definitions
Date: Fri, 19 Mar 2021 16:01:05 -0700
Message-Id: <20210319230106.2186694-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319230106.2186694-1-atish.patra@wdc.com>
References: <20210319230106.2186694-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_230137_483726_017C71B5 
X-CRM114-Status: GOOD (  13.89  )
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

This patch adds all the definitions defined by the SBI PMU extension.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sbi.h | 80 ++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 99895d9c3bdd..01b261bc6b68 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -27,6 +27,7 @@ enum sbi_ext_id {
 	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
+	SBI_EXT_PMU = 0x504D55,
 };
 
 enum sbi_ext_base_fid {
@@ -70,6 +71,85 @@ enum sbi_hsm_hart_status {
 	SBI_HSM_HART_STATUS_STOP_PENDING,
 };
 
+
+enum sbi_ext_pmu_fid {
+	SBI_EXT_PMU_NUM_COUNTERS = 0,
+	SBI_EXT_PMU_COUNTER_GET_INFO,
+	SBI_EXT_PMU_COUNTER_CFG_MATCH,
+	SBI_EXT_PMU_COUNTER_FW_READ,
+	SBI_EXT_PMU_COUNTER_START,
+	SBI_EXT_PMU_COUNTER_STOP,
+};
+
+#define RISCV_PMU_RAW_EVENT_MASK 0x7FFFFFFF
+#define RISCV_PMU_RAW_EVENT_IDX 0x20000
+
+/* SBI PMU Hardware general events */
+enum sbi_pmu_hw_generic_events_t {
+	SBI_PMU_HW_NO_EVENT = 0,
+	SBI_PMU_HW_CPU_CYCLES,
+	SBI_PMU_HW_INSTRUCTIONS,
+	SBI_PMU_HW_CACHE_REFERENCES,
+	SBI_PMU_HW_CACHE_MISSES,
+	SBI_PMU_HW_BRANCH_INSTRUCTIONS,
+	SBI_PMU_HW_BRANCH_MISSES,
+	SBI_PMU_HW_BUS_CYCLES,
+	SBI_PMU_HW_STALLED_CYCLES_FRONTEND,
+	SBI_PMU_HW_STALLED_CYCLES_BACKEND,
+	SBI_PMU_HW_REF_CPU_CYCLES,
+	SBI_PMU_HW_MISALIGNED_LOAD,
+	SBI_PMU_HW_MISALIGNED_STORE,
+
+	SBI_PMU_HW_GENERIC_MAX,
+};
+
+/**
+ * Special "firmware" events provided by the firmware, even if the hardware
+ * does not support performance events. These events are encoded as a raw
+ * event type in Linux kernel perf framework.
+ */
+enum sbi_pmu_fw_generic_events_t {
+	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
+	SBI_PMU_FW_MISALIGNED_STORE	= 1,
+	SBI_PMU_FW_ACCESS_LOAD		= 2,
+	SBI_PMU_FW_ACCESS_STORE		= 3,
+	SBI_PMU_FW_ILLEGAL_INSN		= 4,
+	SBI_PMU_FW_SET_TIMER		= 5,
+	SBI_PMU_FW_IPI_SENT		= 6,
+	SBI_PMU_FW_IPI_RECVD		= 7,
+	SBI_PMU_FW_FENCE_I_SENT		= 8,
+	SBI_PMU_FW_FENCE_I_RECVD	= 9,
+	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
+	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
+	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
+	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
+
+	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
+	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
+
+	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
+	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
+	SBI_PMU_FW_MAX,
+};
+
+/* SBI PMU event types */
+enum sbi_pmu_event_type {
+	SBI_PMU_EVENT_TYPE_HW = 0x0,
+	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
+	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_FW = 0xf,
+};
+
+/* SBI PMU event types */
+enum sbi_pmu_ctr_type {
+	SBI_PMU_CTR_TYPE_HW = 0x0,
+	SBI_PMU_CTR_TYPE_FW,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
