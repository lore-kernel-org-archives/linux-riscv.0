Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24535CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxS8GkNrtwqKo19Rn/WTotshnwLP8I5uT7lMUni1bEo=; b=tAvp4lwV6HAWrR
	p4vX2kYrsx9V0JyqyIadNc6Oox3Rrcg7EUIk2flLrmF8IWAr6z+jsRts2bV784rx+XDX8zZZU1S94
	Qim18UcfUeheWGMX7P+2uJAbouIxA/9y0WhxBZJrDcFkerUeXxgm/sk1CVbReyEihBAudwGNOEPxU
	70D8mPUSBJqYcNx3KOa2WPqfU3dM7StRuTgxzWGbVIPUI73NNEzYrq/hPKHfewUgg+o2K+3uTw29h
	/xH4EOH6S0ESDjqPNZPzaWnHH65a2ftpBBp9U45m7D4eAn8QOcR8Rk2Wx5QbXmR/Lc3xcYdssXRG9
	q3fc50h5qRoZMGDPQNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhza-00000009ZmZ-00al;
	Thu, 11 Apr 2024 00:08:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzH-00000009ZXG-02vB
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e50a04c317so5585635ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794098; x=1713398898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITt+KwUVR5JlR3QMHjofp/8j27l4zwoSN907Yn7Ybbg=;
        b=tLTIYQiBhHcsVtXcHDj5vdzY10jfJrbpquY0q7QXOBoobIWkAdn7FDTjFafJhe35eQ
         MQL4VXt8V5SjMymQ5FbGJkNTF3RmwGj9mgdre77mOM8nBDKFz3qjXDKppnLYhL/58V8q
         LOjjJRJvOdfsgNZNyQ0Ei0rvx649y7CyP6gGyMQZwOzFUcAL5y899VIfrw1Sm4HpNAnJ
         JdKAbENy/SQffTYngR1Fkx7lKRtdCjS5BuM3EqlV6El6cYrZuHo+wLfPlJ0PM0fxLcNo
         DaRW3kVzRG4qoe38ynwNzMTQJlNU+ASlSzZDyxGeezUBu7j0+BWJZgSFpKDGnpJD4ScQ
         2zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794098; x=1713398898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITt+KwUVR5JlR3QMHjofp/8j27l4zwoSN907Yn7Ybbg=;
        b=gc+L9s7vaXXx541osa9H0RBXjwhaW5JPKGX49YdicbIXaeUBitoOOt6V61sMJoSToW
         jHaIBM32N47bta5kXlpX85FoMulN+4WVdoDggmiGnOxZa/Z6ql2ytzkXmNngWw+YJ5Vi
         O84BE8mvjsiI1tSILJAM3aZlLSXiRWUfRztp8VVdLOFw/N+6rmkjai3l6nYF42Jr2H7z
         8d17n1vdnzf2p7uYyfBAwfbtxO+b+T1MYXM/ddA2DkTpmipHHhRRjBm1440/jpGBAHn6
         2uPnrkw8uQTZR0H41r5+cOYam5Opm6N3BGAxo1Au+ACPi1VsBlqfPGRUmkVElM8YYu4Z
         HE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbqLUK5/EzCTQtBQFlv/1PPd5hr74mdq5zrphHk20ltNmrynyXat9wZOP8wzkqUnaglFbQVW/VVkzYFIULuH18dAN2rIyE4nVxQVQVPPMn
X-Gm-Message-State: AOJu0YxkVBAjs6ohwkoZE+vb+8gtkFCdXoc81jptCnLI98ogSDMJ+cUe
	sIt2Vs3bL3Mqgauy2K3A3IfEF9ERLy3z15KPnp/gOdmUpADB2r6DaqB8m35IA7A=
X-Google-Smtp-Source: AGHT+IH+Fv4XZX4/gx4XiswGPlN/TrMeCjxrmPnpJT+OZm0Rkqi3ood4AZl0My6G2DmtNin0INwRaA==
X-Received: by 2002:a17:902:d510:b0:1e3:c610:597d with SMTP id b16-20020a170902d51000b001e3c610597dmr4245035plg.60.1712794097994;
        Wed, 10 Apr 2024 17:08:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
Subject: [PATCH v6 04/24] drivers/perf: riscv: Use BIT macro for shifting operations
Date: Wed, 10 Apr 2024 17:07:32 -0700
Message-Id: <20240411000752.955910-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170819_133100_41BBBBF7 
X-CRM114-Status: GOOD (  12.54  )
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
