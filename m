Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F85C5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8tJpMLX9zci4xyoQTfJ/yXrZiJyMq1a9QQV08zRfr4=; b=1MFjG7EqWdbRgn
	wGdbsy/RUVyRG6UKOdLzgnXoG2/Tj9YXvdy5zWG+gvL2ldQ4htjgcaEEthrrW/P3Kq3zLMbor2TPt
	ws7TwLZMaPzW93C0w7IhNVp8gE+jRmIK9YsjetrFK0xVCgtXptsd/3z/fu+jDuwL6kdVJivnKmfqr
	zKnPnBZnvjiLFU7kozKcPpHFLEq7MjYz70BP2vmMuSLmA8inDFDkBGF/4lBfUt+fw4kr54QM5YX9e
	3qTmcIfKdruLV2fX+mQhwsFuuyhPxd7IFh8v0FJk+5ga57Qdtp0PgLxtp7o3WB4KAlyy/xu3u4gMq
	JYaOi5EHZVtIEiWdDtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUoS-0000000BWP3-12tQ;
	Thu, 29 Feb 2024 01:02:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUo1-0000000BW2c-3pJp
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:01:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dcce5e84bcso3970655ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168509; x=1709773309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bg0Ox/oYKnbNuFBhdI6ydLs8+8yl3bqZRH2qF1RxaPE=;
        b=WjHlRLJAVPtt84rwqPr5ppeg+ai4wzRzQEMBFmfqDjz5oQCJ6NFib5hsIFHNcd2Y1Y
         bUtunbGIRnDexQPwERTrIjnMXYRjKWfjpjFMcI+N+5VclSTs/sr9la89fU8A6XS96pTp
         oCKNsum70zqAntkEpBvyr+5ZATg2Wh/s205XZqoBkG/03E03DDJAOZQ7DTV4t5Qdgq+r
         Zo0Rnnhma3BZyvNyVuJ/2Ob6W8zff+hiW5PP12SQiDlkM6VMj6zaFE5LEjmr40ZaKQve
         LNiyTm9Vj4ZzaATdvqeLQXpRzdlbM2k+UX6nWgRC2XMh+CC8+MBuFJio1eSQmVQZmNK3
         kAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168509; x=1709773309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bg0Ox/oYKnbNuFBhdI6ydLs8+8yl3bqZRH2qF1RxaPE=;
        b=laMOGgf/f1J6ZxHXGAkUb1zpy3UrkIaY/X5WG2/TUG9NuJ1nHntcfCyS3F4U2YKCc3
         9vxB7Wgy3z4n+by6WHoFj6ezHxAOklLmpvSxwtvJfEr8xBOZYfGHpxefWdKqq6zA7tm1
         zTB+cdI+iZh3DNDAkcnXDyfCukBJLGgfc6RIckAG17dJmVejvO6CVjgV1PXggGkjDI+A
         U6bf6t5l9ARr5lqSMgXucqjBqYM1DTjJAUjkwolvLzQxsKikkX4hSLXWftHw9lPN5ZWz
         V8ve2w27VXUmtRuPA9zls8laYnmee/h3PwAvGjbuXqHW5uwzY/33Ew3aZh2gtV/JkTv/
         ZtPg==
X-Forwarded-Encrypted: i=1; AJvYcCXkCSQytHUbEKBwzEBrRP3Dx3zYDpeaHSlxy0nwD8z39exrOsnbTskuAPisxLAbJiYqgGA355CfKqbpVHhifj+/gIGOAU5bmjE2tiXjbPkh
X-Gm-Message-State: AOJu0YzZoVMXnTAwpjmEffFD6y3hTY4HX/5N+OGno6B/VVM3FkEfNT+K
	86R/J++vA90mT1sMNOhLOhXjHA/m9g31o40dC7sh8ZQ4kqRDpc0MwR2679SGt6Y=
X-Google-Smtp-Source: AGHT+IHAnIYV5Rew8z2wjdklNXOjsKF3XTvJkAk8FD0YrnnyBOoQ4ey66/haaO2Eu8pqRt8AdGvtGw==
X-Received: by 2002:a17:902:ec8f:b0:1dc:696d:ec64 with SMTP id x15-20020a170902ec8f00b001dc696dec64mr829830plg.22.1709168508693;
        Wed, 28 Feb 2024 17:01:48 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:01:48 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/15] RISC-V: Add SBI PMU snapshot definitions
Date: Wed, 28 Feb 2024 17:01:19 -0800
Message-Id: <20240229010130.1380926-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170150_069999_20609751 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
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
index ef8311dafb91..dfa830f7d54b 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -132,6 +132,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
 };
 
 union sbi_pmu_ctr_info {
@@ -148,6 +149,13 @@ union sbi_pmu_ctr_info {
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
 
@@ -244,9 +252,11 @@ enum sbi_pmu_ctr_type {
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
@@ -285,6 +295,7 @@ struct sbi_sta_struct {
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
