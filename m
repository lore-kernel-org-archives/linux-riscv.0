Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3CAC2B9F7
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B6A0613DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B6A0613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MaNoD4c7pAg2AG+hRiMlMqdtvDoLfw97ulNDlOigjY=; b=LcVK7/A9Ta92W7
	PXGr7CRQbTu1Mb5RSJVLIALHDquHaQ3rxJS0FyjqTM6EIRrTL0+OcEMwbCy5+hBMZK8PaEmQFC+jM
	DFdOK0XC0pONXklgaDI175LjIWd4JkOUHmRyRjHX8QkL7yyI6+zOZ8UJLwZhlPX9AgkUrjGzP3aA9
	NjFpmyME0B94IkE0o09zIPaIiG2O35jBPx5VsqRdovy1wH4NZLRN2I5lPBUJAzfZVaOKh1wN+8S9/
	F5wQy3TZ4h70qeu2TF5SNVuhLbNTh2f5aU6LfaSbg/2XZeAFS+pI5TocxSnxQ7dtBzD+HGwwI8KcY
	vrYVIPO5kajv9+QEfarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhUT-000NPa-5k; Fri, 28 May 2021 18:45:49 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhTY-000MnL-7D
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 18:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622227493; x=1653763493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UzQit8vvo3jY7pyeyhpVhnucH9bPaiaNXneEyvn1kdE=;
 b=EHYd4GpGRyYsBnQvtsbR9D2DCZ34/ddwO2KeMD9M3RysE3sqoeaRHndH
 eBfRtbsdaiWIiVPDQfvPCks8mVB1+gyIgHcGGyTUzRd5audNyfbuDS3wu
 IqZ7P1bTADFAtHptz4SSGbE+ggZt/VfpLLOebokTQ1lahlbFND41epLS1
 V4SxICbHOXld+t2sKjA8GpC5NYY/z+x0XHhfo8KIYMoiljRoSxT+Ve49N
 Wrk01tMoMSml05gaNKTrUdKoW3VAihLPjHCQ32ELqXfMyKxpZNYuIslAR
 8dNDbXtdVbmXrW3y092R0SuAk1yRiYDJrpwPCBDfiYp01mYRMGSTf8VTS A==;
IronPort-SDR: 7qsanU6rlbOGyfZ8ZWlmAQV8GvuTgAbx9TbgLq6vJ9+GH+afOipxo6bpH0WispyEpxMno8uqqD
 IjpkkB/aOUjjfnjjy7NecVHP5QFi+Honeu7iqUa0h3SifG1NQPR+iXQY5enPeO8Zcg1m7sIVrc
 zxcWhNRhx6w2no9zS/mMrybrBA/P/6Z+LFOsAKN9ei+7D8UPCcgnbXb25AbhNwqi/68vAdsD/s
 MZ/dbMboWByK6DbHD9UM4e38ZRO7jFGVk4vJu3KinaRJVjZtKbJvPXOZ2f9RkIMZgTaKgabpwu
 rDE=
X-IronPort-AV: E=Sophos;i="5.83,230,1616428800"; d="scan'208";a="273763765"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2021 02:44:51 +0800
IronPort-SDR: Kl/YOMHTnxfd2AGeZ0AFUkii/56NnMs+3pceSwg05l6Hrx/tBsAbVgZ2NhDPa20qPnVU5NOI4E
 z4HDs2fIauNgo5hFiVmlITY9X0hQlNufmeOIzv/nXN0uBK4+yopo/TnZaKI4YAdvD2aS92NVjG
 PZdGg49g0ZxgWk0mQOj8JmXlQ6iCjor/ApNZIXEHBvYY29zPQa25MSSci1cL0gJYuspM9WsfiP
 qdMpjHcqYTa+UIfqd74RvbArmQjhgtV9m9UEEmsf9E0jvsXIzIl+s6akpSGEt77IR+IKj/zd0x
 q0SPqkZ0zs9RObcRnqWI7ZRW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 11:22:51 -0700
IronPort-SDR: ChXQfyg95hi7tLAmWBjJvvM5CNe9wONH9Yer0YGAUWM0eQ3T3gINuf60oCNlCMSFaoB/WwrI+L
 V4ymahnUO9GeyA8cF2U+FwkwggvY6VIQtRZx8nOFY7S0LqCJGa6MssBoIlsK9AS09vfAGP328K
 nxjC2gFdo5qvy21DxhxGodAnOlIsIfkR+rOG9Pr4YGuRTUGIeATK/erV9H4eIrtVifdwS1kVa3
 dmCkkmmoGjlehuEzzTOaWtAhwQd/MkuERPdiYSx+ZK6WaonGeWbm3mg945jTF2Zyo9e6J9hpHJ
 WEc=
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.wdc.com) ([10.225.163.91])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 May 2021 11:44:46 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 bpf@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alan Kao <alankao@andestech.com>,
 Nick Hu <nickhu@andestech.com>, Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC v2 5/7] RISC-V: Add RISC-V SBI PMU extension definitions
Date: Fri, 28 May 2021 11:44:03 -0700
Message-Id: <20210528184405.1793783-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528184405.1793783-1-atish.patra@wdc.com>
References: <20210528184405.1793783-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_114452_392885_2F756C46 
X-CRM114-Status: GOOD (  12.99  )
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
 arch/riscv/include/asm/sbi.h | 94 ++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0d42693cb65e..9a1cb78df15c 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -27,6 +27,7 @@ enum sbi_ext_id {
 	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
+	SBI_EXT_PMU = 0x504D55,
 };
 
 enum sbi_ext_base_fid {
@@ -70,6 +71,99 @@ enum sbi_hsm_hart_status {
 	SBI_HSM_HART_STATUS_STOP_PENDING,
 };
 
+
+enum sbi_ext_pmu_fid {
+	SBI_EXT_PMU_NUM_COUNTERS = 0,
+	SBI_EXT_PMU_COUNTER_GET_INFO,
+	SBI_EXT_PMU_COUNTER_CFG_MATCH,
+	SBI_EXT_PMU_COUNTER_START,
+	SBI_EXT_PMU_COUNTER_STOP,
+	SBI_EXT_PMU_COUNTER_FW_READ,
+};
+
+#define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(55, 0)
+#define RISCV_PMU_RAW_EVENT_IDX 0x20000
+
+/** General pmu event codes specified in SBI PMU extension */
+enum sbi_pmu_hw_generic_events_t {
+	SBI_PMU_HW_NO_EVENT			= 0,
+	SBI_PMU_HW_CPU_CYCLES			= 1,
+	SBI_PMU_HW_INSTRUCTIONS			= 2,
+	SBI_PMU_HW_CACHE_REFERENCES		= 3,
+	SBI_PMU_HW_CACHE_MISSES			= 4,
+	SBI_PMU_HW_BRANCH_INSTRUCTIONS		= 5,
+	SBI_PMU_HW_BRANCH_MISSES		= 6,
+	SBI_PMU_HW_BUS_CYCLES			= 7,
+	SBI_PMU_HW_STALLED_CYCLES_FRONTEND	= 8,
+	SBI_PMU_HW_STALLED_CYCLES_BACKEND	= 9,
+	SBI_PMU_HW_REF_CPU_CYCLES		= 10,
+
+	SBI_PMU_HW_GENERAL_MAX,
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
+/* Flags defined for config matching function */
+#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
+#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
+#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
+#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 3)
+#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 4)
+#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
+#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 6)
+#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 7)
+
+/* Flags defined for counter start function */
+#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+
+/* Flags defined for counter stop function */
+#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
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
