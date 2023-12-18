Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE44EC46CA2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzQwxWYDT66UisjsjwtuRNDjBngBUi2ghevZRmovoUw=; b=2+LS2mYDxdLD1+
	AhY0Zt/kFxrqg/LpQ0u8bBQ0V0lshIsjdUlGMnelb20/cEK6MZ699S5U+y8HeMqArMVZ9V4TPKj4m
	I3uwthOB7sNjjlIGYcuwrEN4sgzFGvHpRydJliTr1O/QpA/fmCzmcCwK5vn6CKiRh8YkPL1cBmc8G
	osfVn0Ww/TNm3cktbVVRVJUVLxoT8DuMkiXdqJQxJNu6wvB+xk8CMzXMKtxZUNms7XKFOqbbgB/+I
	36Xgvkh1enVdIPLAE60yIdyW13ApiTFnjheiYqf7N16t33rlM0tciewD5Axp1ugTiIqd6KRHiJNwU
	RA1mBsI8NEua2b2V5PFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3y-009rMS-11;
	Mon, 18 Dec 2023 10:41:30 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3s-009rHi-2K
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:41:26 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6da5278c6fbso2245871a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702896083; x=1703500883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuZhnPGQBcArCwk7TKa9E5XMHvxU9EnFz3QAUH89JKI=;
        b=GRvyIgP7/4br3YildXY3iHWQ2PNae5uQPFjbx9UkOFot6tN/NwGb9XFhaNNyubgH0m
         lO/m6wH8D6HLrvl7gMf2Lig9GNKwWUXMDwNu4ZaVllFMRDCJoeRu4OTOkXYbmWKx+Zjn
         MGMUG+dJCcH4n1rCkmNlPPauXpeFpONyWHtzKPEHh4Rp20ggADoAPF4BsSXjYX6ZvrEP
         Fsh29gpReJFAkpQHM11WqHR/CRDgpdNwPy1sbBobO13rp4SvKmoNhEehzApFso+JW+TF
         X9QPwDz0ZBF6siS1kwi66xfLdwLOv/XMwEJYaKML/1cCOQdyuFiI4wPljQbQTLO2qX69
         zaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896083; x=1703500883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EuZhnPGQBcArCwk7TKa9E5XMHvxU9EnFz3QAUH89JKI=;
        b=ib94wrtfddZc5PpQHYLpKbPeI5kiBLmtaufMnUqmsWywf6kjmgq3cSbsKxPJAYNa/U
         nr3CRB22ZXJasQo3MpTq2qdeZ9wg3GoNNvIKJ7yi/k60m/dWXfH4cCnoMfW+fvOSt6Pk
         nGatbyoK8Z9QISC4NRLUCbyq4QfnUgOQQTX5VBPxaq3mi3bXsnC5sIXo1kjerx1znIM2
         bHLSu0kCE7cRJXohiQWYXwn7Uz0hdxlZNU8MY5MPfRJUx6HTF4RjzX/y0VNOU96dV0Q6
         irvPSdE7rbDWqpUkPnWLN9g/08d1Z09uZdcRaOI7ow+YuALriCaUnu83wvVVK3TM1ewH
         xMBA==
X-Gm-Message-State: AOJu0YwaC02VaLAxXiQ+ZnVISdwiAqfD+/GlHwqiAkrdFII/E3zo3Fi4
	zc1/2geIH//AKGHFO44JYssKMw==
X-Google-Smtp-Source: AGHT+IF6Ilh9KFK64k+SlLgRCkTr3HSZb02y2w9rk8KeaGdRb4uXnCguyVV8KmCSxDozdmEA37nryg==
X-Received: by 2002:a9d:744b:0:b0:6d9:d132:ef24 with SMTP id p11-20020a9d744b000000b006d9d132ef24mr16649366otk.25.1702896083511;
        Mon, 18 Dec 2023 02:41:23 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a1ac2000000b005907ad9f302sm574970oof.37.2023.12.18.02.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:41:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 04/10] RISC-V: Add SBI PMU snapshot definitions
Date: Mon, 18 Dec 2023 02:41:01 -0800
Message-Id: <20231218104107.2976925-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218104107.2976925-1-atishp@rivosinc.com>
References: <20231218104107.2976925-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_024124_906055_DA21A1A3 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI PMU Snapshot function optimizes the number of traps to
higher privilege mode by leveraging a shared memory between the S/VS-mode
and the M/HS mode. Add the definitions for that extension and new error
codes.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index f3eeca79a02d..a24bc4fa34ff 100644
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
+#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
@@ -259,6 +269,7 @@ enum sbi_ext_dbcn_fid {
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
