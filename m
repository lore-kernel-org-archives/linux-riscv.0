Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC7AC46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 21:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HB4vqe6DZrlPd5/82zTn+bdYiZXJq/sj52gC1tfiCXQ=; b=L7Ru7dmZWxDwGW
	bbR8D4fUaulsGOUK6SEuC3+Qxn5gx3ARHS1mXuQRDgQNNVCLuQTSeZmfWkOnA65Fwj/KQK/VGSDar
	W9eQycmqXZ+70swQ0ecI3MswkVxG7IcbZAlAK7EzVCIXtMXQuR5fkFZkQdinhr1NXQEHQeeyrpArS
	ZIvsgauwRu9oApqDejn4ngR1OnvSOSd1kzNWkmu+jKMdNSMZ3uBW/kbhTCZHEXDurMyZv09tsSPea
	59ZTs0sGXxjEEKDb5zUc2BSe4wsxJj9p9Q6am1hgswZlcTim/WmOb4oWx/I14UB1Q/4jn0XL9izjT
	8meWLhAdlkWL1SvlUAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKkA-001brm-38;
	Fri, 29 Dec 2023 21:50:14 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk3-001bk1-1w
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 21:50:08 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-59496704246so2366356eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 13:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703886605; x=1704491405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzy66lxPBsLKj7NzWfh0sHPmHGdfbEMoaok8d/cKAlM=;
        b=GgRaOk0g6reOOkaCEXe+IxekBEykTl6sPoP3sXlfBWLLTDMyk64G/Y/zD7U2tKOx4X
         3F1jzgrHDHNNVZ0T9cErNf00ArgMpFL0sOlFSG9wYgk+9Cvw8udUwnSNQsSDh8IY68u4
         hs9F2cWs+k60uX5w6/5VT8qKN87lj3cgpCufNyhhJo+/ETWseDN+RMtr6xX6mEAh/gDj
         SRumtf8STcinBqTnAcnJC4MlX2mjk1MjyzTUvSor3AsiOGz3JOwTU1QTaVHWAMFO7XcG
         9arVCj+lPkRQd21vjqQIYLm8NbTU7HZTdfpSLFOySFgc8JmosTRcGaBPETqgBw0+A/EK
         FVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886605; x=1704491405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bzy66lxPBsLKj7NzWfh0sHPmHGdfbEMoaok8d/cKAlM=;
        b=af36dPVgqVxy3mkDH860uZcn83goC1YByhUSOcahXA/VcPMf3MnEmMrJWxOvy59Fik
         UPSOeXFbrpkZqPeCTL/q7zSOhuhxl2ouWTEgg2aBG89+nUuCzQ55ecEnAOY1+BrpvLYB
         1jUdU6GP6oKU7dagE62ykaFz5DA0ubedONnUAoOVvmYFln1u6wPxuXPPzGCrjcFKhkge
         o8QU2hclPjFaV+xcc7/kUXVTycorMsuPnwMAFfT2NmkSIAxIaX7JST3ct9y2CYFI65em
         V1sAwPGkQsl2s+DYsTVUwEIlB0Ui6iyodiyQAeowcDGxkJ0bpWfIhuyssNHagGLNFnZ/
         N9YA==
X-Gm-Message-State: AOJu0YzpnE2a4T1T+c/wykXkrDZ8rwWdbmZvE9Tb4QLUAFGdiFiPOSTj
	vjCgjlvfPf5tSKBbKr2bxyP78Rs8QuDeCg==
X-Google-Smtp-Source: AGHT+IEtur4qNe8pb8V1uH0L25TQedsk0IjaWE3OpqgJ9z8PNa9Kv7iVaqWPAu9/vxyFbrEo/h0ycg==
X-Received: by 2002:a05:6820:606:b0:594:c97:2e39 with SMTP id e6-20020a056820060600b005940c972e39mr9339958oow.4.1703886605705;
        Fri, 29 Dec 2023 13:50:05 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r126-20020a4a4e84000000b00594e32e4364sm1034751ooa.24.2023.12.29.13.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 13:50:05 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v2 04/10] RISC-V: Add SBI PMU snapshot definitions
Date: Fri, 29 Dec 2023 13:49:44 -0800
Message-Id: <20231229214950.4061381-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229214950.4061381-1-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_135007_644605_225A9F23 
X-CRM114-Status: GOOD (  11.25  )
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

SBI PMU Snapshot function optimizes the number of traps to
higher privilege mode by leveraging a shared memory between the S/VS-mode
and the M/HS mode. Add the definitions for that extension and new error
codes.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 914eacc6ba2e..75e95a7d9aa3 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -123,6 +123,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
 };
 
 union sbi_pmu_ctr_info {
@@ -139,6 +140,13 @@ union sbi_pmu_ctr_info {
 	};
 };
 
+/* Data structure to contain the pmu snapshot data */
+struct riscv_pmu_snapshot_data {
+	u64 ctr_overflow_mask;
+	u64 ctr_values[64];
+	u64 reserved[447];
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
@@ -235,9 +243,11 @@ enum sbi_pmu_ctr_type {
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
@@ -276,6 +286,7 @@ struct sbi_sta_struct {
 #define SBI_ERR_ALREADY_AVAILABLE -6
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
+#define SBI_ERR_NO_SHMEM	-9
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
