Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25753C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YREJ6PpENUIkNKoqdHALpOWrynCDQ+OzxnYC8h8jIw0=; b=VfueCRt2Tq1fn6
	5a3wIERqqsk/GggVxzMSxixDW4AuxrrmwUasaT6DZ/1h1QZVYYCANSUFIm1EzBlHGtLcgNK4KSJsq
	PuY3J9CimC5FNwefhXScUclszpYzqrK0OOljPFKmGt+x+km8H2LreyM0+Fxpqeao0mE0obGl6b3Xg
	nUE2YqFgD5xYCqBxN1USq30ytuK4kwIlvhzJUXFyk/A7OiShcEdlgq8fRmr1vcdUX0A26PolVo+ej
	1bOP5wsQlAg3znBcxWUGkorqcinYhDee93TH8cTD6tscGUArfq96dzDa+aQ6DDfP8hdJGUQELvmYB
	46qb9WFs8h8DqfGK8yDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPb-00648B-18;
	Tue, 05 Dec 2023 02:43:51 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPW-0063xA-0W
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:49 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d9a6f756c3so843462a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744220; x=1702349020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARpkTD0DGKCutL1TwjMjDMoOjcqYmkFa31lyR5g4T2Q=;
        b=ZNJFX4HnFjgAVPCl8ufHjsv4WEnWdz5PzjMdeGMYxTwVeXr+ugZjf7vko3IWor/069
         ddwnTq18JP006yDWCvSQQd25S04IEMkVPE+krYRMesaZXO17I2h4EkQCKStqefwEJnZj
         zof32oJ+xeg8QDGOgS/SHlWVJBVNkka0A0j+WpDrILsvRa7CrpOs8YKloOMw+Xc0UyCL
         i6mbWVJwj3REHokyrRgIxNHDlEePx45kLwE0g2ypZ6GvEKhm4Chh1ZVj3h8hEoVkUpVL
         OYUs9ftQcY/ZUF+gG7EVApHr8Jj+ia3HHtOUPztJJ2OTyV37FvruYqCQTIk54LJhBhCo
         f9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744220; x=1702349020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARpkTD0DGKCutL1TwjMjDMoOjcqYmkFa31lyR5g4T2Q=;
        b=lU+SIGHhnmbfOQi1JZf+Rkjlqg1dB2ExJgVWtbrj9Fg2Yam7BCpefSxkfam/AeWN7u
         WmrouueKZ9n8t/IyBm7fdZF2HmLn/fqcdhYPNfRfswTx8q7EepUCRvPNSZsxrSkdi5A+
         ROjxTfz+/wVEz8pdYr+uUA1TDrnJu5bJIKpvPTkzBax+oM7jXaEexUu55PVixrtcuXcr
         D9AmyqMRxzCbXrh5+J52CzcElJgNQ5JKcK7uR3a06qW6bqCRF1iPLVgtbsvehmRI84PY
         iiIiAyP6aaWy8aO8kTdY25VLOpTGQZFWei4jdnHBn4FxsgjBEaUe56dT9IKuJYTuoYTg
         U0cQ==
X-Gm-Message-State: AOJu0Yx3Papb35hZML+J8/kbNLIo1vshtgg05e5eyOd6/ryGtRjw222d
	3qFmZ1xDD73DyImckH7Q7VjbfQ==
X-Google-Smtp-Source: AGHT+IFXeXXz41Hsj4C/GCefAovxqAXWbbpNAzmIuIuJp4iWAyn+2eqWNtIeCNa4tWlwO/mFe0g5LA==
X-Received: by 2002:a05:6830:61c7:b0:6d8:74e2:7cdc with SMTP id cc7-20020a05683061c700b006d874e27cdcmr7785693otb.55.1701744219906;
        Mon, 04 Dec 2023 18:43:39 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:39 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 5/9] RISC-V: Add SBI PMU snapshot definitions
Date: Mon,  4 Dec 2023 18:43:06 -0800
Message-Id: <20231205024310.1593100-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184346_684992_F8AA1257 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI PMU Snapshot function optimizes the number of traps to
higher privilege mode by leveraging a shared memory between the S/VS-mode
and the M/HS mode. Add the definitions for that extension

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index f3eeca79a02d..29821addb9b7 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -122,6 +122,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
 };
 
 union sbi_pmu_ctr_info {
@@ -138,6 +139,13 @@ union sbi_pmu_ctr_info {
 	};
 };
 
+/* Data structure to contain the pmu snapshot data */
+struct riscv_pmu_snapshot_data {
+	uint64_t ctr_overflow_mask;
+	uint64_t ctr_values[64];
+	uint64_t reserved[447];
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
@@ -234,9 +242,11 @@ enum sbi_pmu_ctr_type {
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT (1 << 1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT (1 << 1)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
