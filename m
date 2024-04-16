Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32941C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxS8GkNrtwqKo19Rn/WTotshnwLP8I5uT7lMUni1bEo=; b=iAjDd/YhGaf513
	zzN7X7YteErGLz/itN0igqlWj/D9Tpd9l9XfRLfZsp+bEKwdCTKg8kc8zFjuHB/jBIlijTFHUlDKK
	EyALDKYnHq1odOjr2FR/BkJ5va0ojhM9k79Vf0WJS5e5KJZnsGX1gTuENlqTCCy+JmA172HqgV9Gp
	2JVCsh0VdS8dUfvclxSLUTnvNr5NHpBGX+NNqBUs1MjT0IAdEZm5JjVVfzInd0r5pb+l3WE/XpUm5
	LqPa5OaKtBtdM0KuWocJuXzK+REZ1hEO78ZaH78tZP7q55Lhon90v+6UiI15ps05XZcXtsnvXhwcD
	ThHejtu1tadTPw63TxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnh-0000000DMNq-1LM6;
	Tue, 16 Apr 2024 18:45:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnU-0000000DMEZ-1UTQ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:44:55 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2a2da57ab3aso2641437a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293087; x=1713897887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITt+KwUVR5JlR3QMHjofp/8j27l4zwoSN907Yn7Ybbg=;
        b=GlpYEptOJlmOabXe2Jfu2vdpYJCkBOL2YenkgWh2owR2VRvLgQx22SAwqnrbi6MZ7f
         sO27AnM4RikQc3XyLzCBw9SUPoLa1ppQU5hDIkRGZvLzUjSL/k0RqEaWA/IgkEPjqUxM
         beELi1sVIi3VFMyihVEP8E1nhG9BegVAuyncpaihu+PPbZeIE1gA6QR514RyiV6FH7B1
         JwjP3IT9eDZ+UVYqspf49BZ1C2QxiwZaidZBazZNKItTOlATESY3X8c/iZ2dRaBVgRM2
         Do+o7uJywNgutatpE3qs1JvpoMDPO+fCWgOMzRlLFGg+ka1iJCak0kkFoAx8CzzWuVDF
         Gkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293087; x=1713897887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITt+KwUVR5JlR3QMHjofp/8j27l4zwoSN907Yn7Ybbg=;
        b=oMEy0AxBNfeZ0weoElF6ePdDtCtUv8ky17k8ufk/mp8dAo9C6jEgv//cE2n1FwLQJP
         VckLOdKPPLh1qBlYsn5bMjixHAdhbCAm/JNemuyESQa9FTWu/ha0I2WSVnkx5l9iZOqU
         sK9hG5Ft7AuqfwQ+gQb3pBxr2KUGaTF1ZkNwC3VCFBSL4fFtxd+p3oNwl+EGgC6YdVOR
         RIo6a/s0lamTdAp7smOTmQXTQOOwX+oihPaf6n3IuhaR3cL3XiBFSsw4XKvMlUEG9d+8
         LIkskat8MOKf9SvyuK9AELFbn5ORmY1Gr8Af+Qp90vC7vayoOeX3fn5wHqu9KU7N6wi4
         Yi2w==
X-Forwarded-Encrypted: i=1; AJvYcCUbXRBaP/CbwctLL3xgbt3pEBalHb9pg9sIOvL+MZZND2qw1RqwWpV5wW3nu385C2IDAWHcX9Yh22dUZcti0kj4JoF5H9W4ZYzyInlNBgQf
X-Gm-Message-State: AOJu0Ywap/7Toig6AVcrLnRi4E5vt/j2jqWH/Psk22lbyAiXeMGtXwag
	V4M2AnNuuye0j5A8D6im7t9ZHMAIiVuoD3mtutJuFkVAuoVGTG0EGNlVN5H/BBI=
X-Google-Smtp-Source: AGHT+IEnYtzsA7elyzf5DNngEcjjYE+bmd13QVJzyjcon3lkT0mRIoKa/EFd9tely84aFZU2X/E/ig==
X-Received: by 2002:a17:90a:17af:b0:2a5:4537:ee67 with SMTP id q44-20020a17090a17af00b002a54537ee67mr10405072pja.49.1713293087083;
        Tue, 16 Apr 2024 11:44:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:46 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
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
Subject: [PATCH v7 04/24] drivers/perf: riscv: Use BIT macro for shifting operations
Date: Tue, 16 Apr 2024 11:44:01 -0700
Message-Id: <20240416184421.3693802-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114448_586188_C8118719 
X-CRM114-Status: GOOD (  12.43  )
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
