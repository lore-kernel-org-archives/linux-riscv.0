Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B24C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 05:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFn7gEDHlVPERRY+TiQ3/YaeIoBPdTUNVF5oKD+i540=; b=YVYVj9Fcb+7wLg
	5PvaKG2SUn0AiorJA6sUFTMMWeMBknAcHHMbuujj/u2bzEMHOGicWrCbjw7y3zk5sugAEKZk9vXqH
	I/ScgyYB4qNA3R+zn/mc1vlgaWAgzsY6FbD73XmvaUFIp6lNrrSgX3QZNrzaQLSgIsU9N7NXsweul
	/EoXBjNm1XoEQMcDCNAO5j+p4cYJ15nfiWeY9USJx4qLuDjznLe7B1H2kU2fnot9lEwXg/JA3GdlS
	PVFzc1abqLXrdXTbv1TfYePe0P/rSDfmmoBTN4xhVoxSTmup+chrb0tg+eAxkXT2oqcdknCjY4xu4
	EpGqoZ5jL9XlEB11Jvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0zuC-00Ehkx-OW; Sat, 25 Dec 2021 05:47:44 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0zu5-00EhfX-VZ
 for linux-riscv@lists.infradead.org; Sat, 25 Dec 2021 05:47:39 +0000
Received: by mail-qk1-x730.google.com with SMTP id b85so9849317qkc.1
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 21:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yqsKo6IdEGj9e3MaRr2zkty0PbGutqPpOXG8Gb5DfDw=;
 b=kravuT3fmNO+X6SyHkQ8gEN8gruRto5Aunjp+M91xMdn+8Nx8/RORr3yNP9mrUA2Lp
 65d1nXYtRpT1rzlDKEpHFEgRiadaTF6rjg8vveiAOmmNjijVyAfO6PBtFs81ssUq5TzR
 MMZUTc2gXPcQakmcs25SE+666eB4fZ7Ccu/A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yqsKo6IdEGj9e3MaRr2zkty0PbGutqPpOXG8Gb5DfDw=;
 b=jlMb2IvN5VKLdMojUlbCuNbZex78ebQwSXyJfwa5uLnb3ywUrvaZo9nHS/BmQiXDJe
 HVLmB/ms6IdtJCchxCuzXjrNVHFheLv5+LQzI0wIS74/EHFw2Lx9YnnSECzLe9Klfg+X
 5WGOeikkOmI3FdJoct/32jI4UhkfllXvp43GyHjJ11zB9U4FR2YH3RUA4EfoGbN7cdzC
 rD5Xk0Ku9PMzmu8km5HjxliLqA7dc29rDsC4OBqUQecOLa6eUIwPIUo+bO+dtfCEHGdR
 nxwba1wzze8z7XB91XLG8278DeZA3rpsvw1Wk0QtrJFMsdxYoGFnjpVQvVOt4HvEpTen
 b7lg==
X-Gm-Message-State: AOAM533azHb7tNPwliNE9hiMtOToGC5MgL/LbI/l+0042YhQxLBqHtmq
 FZaIdhu5FjLv+kfye96RG3h1
X-Google-Smtp-Source: ABdhPJyQq9IjJtbMdbN9LssYIezVQZfndLl0+bgQGCavT8fEnqnfs6XnLJUZ4rMYQ13657KD94ymqQ==
X-Received: by 2002:a05:620a:2550:: with SMTP id
 s16mr6772218qko.232.1640411256927; 
 Fri, 24 Dec 2021 21:47:36 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id c7sm8492780qtx.67.2021.12.24.21.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 21:47:36 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [v5 5/9] RISC-V: Add RISC-V SBI PMU extension definitions
Date: Fri, 24 Dec 2021 21:46:43 -0800
Message-Id: <20211225054647.1750577-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211225054647.1750577-1-atishp@rivosinc.com>
References: <20211225054647.1750577-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_214738_047691_D0143A2C 
X-CRM114-Status: GOOD (  11.99  )
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

From: Atish Patra <atish.patra@wdc.com>

This patch adds all the definitions defined by the SBI PMU extension.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 97 ++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0d42693cb65e..afb29ee1f230 100644
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
+#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
+#define SBI_PMU_CFG_FLAG_SET_VSNH	(1 << 4)
+#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
+#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
+#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
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
@@ -82,6 +176,9 @@ enum sbi_hsm_hart_status {
 #define SBI_ERR_INVALID_PARAM	-3
 #define SBI_ERR_DENIED		-4
 #define SBI_ERR_INVALID_ADDRESS	-5
+#define SBI_ERR_ALREADY_AVAILABLE -6
+#define SBI_ERR_ALREADY_STARTED -7
+#define SBI_ERR_ALREADY_STOPPED -8
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
