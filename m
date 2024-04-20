Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF14C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxS8GkNrtwqKo19Rn/WTotshnwLP8I5uT7lMUni1bEo=; b=r3P1iPBzZzoJ+p
	eX/QDkVY3VCcUTy/TaY87pS3IRNo9PURbkUQfXF6kPwX4PMnCnIIjJjhCAOnc0qcwoysdwIQmevBT
	feCAbgBhCMhL/p9cmThMpJqraMpZUrRXMF3F7nhkJN6Xo+BDTUIrRYiYJfkzfKknOB2wXUXMRG9Zx
	L1iLSQEZe7IrlbkfE5zVR5ADLAE+Oc9LCkT9NclhYCQ94sGiR/cXfk5wLIDvah4rB27CQ5R3PuhmR
	HJ4Qj/NVVO7hMdGNCJGsRBFFq32zyWjMeyhhGumg//CXLqa6UkCMH5gnwO0UnFOC7RLvzlDZxIivG
	ALNdxHrU/Qk2oXC4EZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxn-00000007IuN-25mw;
	Fri, 19 Apr 2024 23:48:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxR-00000007IZ7-3eyP
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:47:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e2c725e234so28947285ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570472; x=1714175272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITt+KwUVR5JlR3QMHjofp/8j27l4zwoSN907Yn7Ybbg=;
        b=OwbpmBHkJxVxGzFBEtNXN8/pmlS3kvJN7zXgVawTlvytiPnudjDGYs2Mo+NKoi4pCp
         Huc3U+bGFVse2QgewlN5DDpF+XxoOMdHMNXRbleMUnaJf8d+avEsN8cvBfHsGvsaDzv+
         uNPmTrZhXe6Q+RRMh+HHXdE2IDJnQj6y7hjODqIeLXHS6rnAuLBJbQqriGXfJEQ0h6m1
         WbijrWMxbf0nQov/4MUFmK5tyuGaCX0VPsPkKTM69vN/+0rMZiKAWTrDTpQ6G5eHSvhb
         4GSeAJt3sZKOtiZQRT2QCTa6lk9KofgaTFYRt99IddJl7Q7FdNybD4MxwgG86fKbJ0h5
         LBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570472; x=1714175272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITt+KwUVR5JlR3QMHjofp/8j27l4zwoSN907Yn7Ybbg=;
        b=HptwwpOXcBfQfHKQn2Sb+4khCSt4gwWAVejhDqt3BTPk+ua/H38MFDmnVroRiqLjqM
         q03S4GLSiONUkcoYM9ny+Zrq2rve7G/Gz6AHS6akOErGzceuLTwPM3E5xgywmQoJNLxT
         B6mc9lOuQTdR1XYzG+dIsqw7a9btTuws9oFjcMSiuGIjMRj0f3lHtG3Yf/SPI/5Cyq7Z
         d7GQCwh+Ysu97uEjdKGFtPwe1ZJ6liD4CknhiH4AGc/NlQkl/9WB3HTRgH+SR89qAo7X
         TjQKWbT/yO23iMDXa+91+NcRf6gomqnbkJgHPGeSagl3VtUMYXetw4tb8kmkq6NdNSzc
         52vg==
X-Forwarded-Encrypted: i=1; AJvYcCWndUvj+I9KVMXqmMgO7W9Ir0iHlcZRSmLxwGQHjNG905f1h0m3li7lrcfrAj3cfhKN2ArBffnQzQEnxPpnxPf1TS/7rW0LXxISobSF/JcE
X-Gm-Message-State: AOJu0YzIVB+aj79GGGr8NOzXBDfC0Ald5M8EG+o+QTxypeQzUaKDjocN
	PPIY89AJpA+PQAD4PP+6jaT1q5HNmQ85tXS/KJL/bB0d7lSuc5QdpICb5Zdo0+g=
X-Google-Smtp-Source: AGHT+IH5QGSC9XYAm6rDKcSeLNzkHXWCmDzCWOnGmFWs22ruWfJPyGgW69pbeeyR0NhMBzdKPRq55w==
X-Received: by 2002:a17:902:e741:b0:1e5:5c69:fcda with SMTP id p1-20020a170902e74100b001e55c69fcdamr10097280plf.26.1713570471976;
        Fri, 19 Apr 2024 16:47:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:47:51 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	samuel.holland@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v8 04/24] drivers/perf: riscv: Use BIT macro for shifting operations
Date: Sat, 20 Apr 2024 08:17:20 -0700
Message-Id: <20240420151741.962500-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164753_954468_0885E198 
X-CRM114-Status: GOOD (  12.38  )
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

It is a good practice to use BIT() instead of (1 << x).
Replace the current usages with BIT().

Take this opportunity to replace few (1UL << x) with BIT() as well
for consistency.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 20 ++++++++++----------
 drivers/perf/riscv_pmu_sbi.c |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index ef8311dafb91..4afa2cd01bae 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -233,20 +233,20 @@ enum sbi_pmu_ctr_type {
 #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
 
 /* Flags defined for config matching function */
-#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
-#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
-#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
-#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
-#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
-#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
-#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
-#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
+#define SBI_PMU_CFG_FLAG_SKIP_MATCH	BIT(0)
+#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	BIT(1)
+#define SBI_PMU_CFG_FLAG_AUTO_START	BIT(2)
+#define SBI_PMU_CFG_FLAG_SET_VUINH	BIT(3)
+#define SBI_PMU_CFG_FLAG_SET_VSINH	BIT(4)
+#define SBI_PMU_CFG_FLAG_SET_UINH	BIT(5)
+#define SBI_PMU_CFG_FLAG_SET_SINH	BIT(6)
+#define SBI_PMU_CFG_FLAG_SET_MINH	BIT(7)
 
 /* Flags defined for counter start function */
-#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+#define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
 
 /* Flags defined for counter stop function */
-#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
+#define SBI_PMU_STOP_FLAG_RESET BIT(0)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 1823ffb25d35..f23501898657 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -386,7 +386,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 			cmask = 1;
 		} else if (event->attr.config == PERF_COUNT_HW_INSTRUCTIONS) {
 			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
-			cmask = 1UL << (CSR_INSTRET - CSR_CYCLE);
+			cmask = BIT(CSR_INSTRET - CSR_CYCLE);
 		}
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
