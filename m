Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F53CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7q/HoCUA+yQaSnXNLsDfXTuQoCbVMTF3LVsfjrVPIc=; b=Q+AX8BNA403iN4
	qjacM7uhu0pj9ZmEJqAGbHd9rWHlz0Bl9/71HLum9ksRZXRFd2MuZc/HWfNY6G9Tp2u3y4gnUyAJ1
	EsG7y0tC5jJ/ORNlp4E0T9zPk9mZlUqSBTxJFwwR+H0HOkXWVq60IhvdQkNHLdeleRmkCNFkCIskA
	jvyr+YHsGk3PmkAXfauPONlxhpWcMg6Yn2OMNK0HeGS9h+hw+RgHpOY2ht6BZnZRbDrDafxHtWODH
	aKAN+7XxRmuOSOK7QCUkjPPZYwUjIt0/i50XjyvzwkTm9fNnTjsMpjcYXiIc1ntfDkvxfEJtBJGD+
	Ih7VRPIn4Kis3gBW6y4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui19-00000009bDj-3JjF;
	Thu, 11 Apr 2024 00:10:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0A-00000009aOP-3IyE
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Apr 2024 00:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JsjqhFGYXnwJEbG5VdNtPW4Uvi+s8iNjRkGrxpWiI64=; b=JauJ1MEOBrcn57ZVvVHhEHACiW
	q4lsbu+MlOip18fpo8FJAo/8uZ6Tw0ckHeM10bya/hv5Uyxk7suTTgIPwaGRuW5dn4Lap6K00R+fb
	I5hXK7hO+rTsniFXL4TYQH4E77eOQyC8Y+T218/71V96tK1opiK22cLH4lWaCBa0rlAtvszTcbrDx
	uAkYzZae0PZDuYivS+mmESwe+AYeMSca737pAMXhE6TEbb2+33wVDz9eoSiqAtJToGfAHolfc7WvU
	dTcTeIrfXBWbd1M2asKVcamWFvp/1F7ygnXT63iDVA0ln5hCYQYKA/+CmXewKDgwiepKLgVsM8Jbu
	GyBJNJrw==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzz-00000008Jn3-2mhU
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:09:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e2c725e234so2636805ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794111; x=1713398911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsjqhFGYXnwJEbG5VdNtPW4Uvi+s8iNjRkGrxpWiI64=;
        b=CKsMfwbFSoSEeQ2ptKzIZjO8h0BqSFSJOxKv1ClwenAJHcT8Xsnxhis9jdCZoelH7S
         UOZw1l6gD0bdBJeFGgJMYPC78RTdfpBGGRBW+Vb/PL9l03o+Y4dcKxlqfQOO2yjO16yd
         2Mn9ll9rDJT+n9YEyPZYZjqTTVTCDiCyymycWQPYO9sXrYdRs8SPhcPtV5jOdvHDttNU
         Zt3xJxtBbEvenWucLaplt2PhDwAUeLaA3buFOBN31WwwH3J09UBACFJlOLUe8rTf40ui
         DzP6AM+sDVRrxUdBoT2KPsb4ALIaiQGCQYeO3/AESwk8sU0yoXDlMluNSPcHsZlsXOoL
         vrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794111; x=1713398911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsjqhFGYXnwJEbG5VdNtPW4Uvi+s8iNjRkGrxpWiI64=;
        b=BXjQ/AuRF5nK8sqZTNeSV0WsTpouAZgvziIfwkc8YIz50FJR+QhhAoA1rP2cwXis9n
         c2ji5ZCFrUxSBV9rFZ808ahCGBdbPld/xlFIsS2Me6VSZEJ/GBTH6KZyoirG9seqqceS
         VfNmpPtRG+36vdc/uPAut9uaB71mxCla0UI0NziA11Cco2Tgppi76bbs1TFZXDIVCfki
         x9pLjIGxOmguUdAPwE33ZAt0+uZFPlZi65IavMVOzHvVMQosK2/llmpqtx0xTurQwjyh
         YB7FEd3Zqn+00O/Ro1bEZhLDap9q66xMB3DyiasRcYwIZm51mo2ANxoGKhObtTJeweSe
         mUfw==
X-Forwarded-Encrypted: i=1; AJvYcCWetWZ5YDCj15e9pMmyvPNbxw4auAoPYr+T255B28yAGNEvNuFvnVdEuQfaJO4RhCWLJkX5VhzmMr48YLT0MxMdRgF56t8uSNjxVJb953KS
X-Gm-Message-State: AOJu0Yy7Rwl0kZQeM8iM5kEGg6MMXpowXKdQ6FNezaUE7PxtQdGc4pat
	EOoHKbJ/2deWudlLPjJmff7C8cHbZw4vm+pYy7gVq5ggwOiYnm+tmFd3/9gU39Y=
X-Google-Smtp-Source: AGHT+IGuFutR246dxqGbmU1WdGFmdIotjRuJtHTIKb2Ia1SDWO/lAEbkSs2TMc+GghFhVq0a3R7XvA==
X-Received: by 2002:a17:902:f94e:b0:1e4:7bf1:521 with SMTP id kx14-20020a170902f94e00b001e47bf10521mr1213882plb.19.1712794111648;
        Wed, 10 Apr 2024 17:08:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:30 -0700 (PDT)
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
Subject: [PATCH v6 09/24] drivers/perf: riscv: Fix counter mask iteration for RV32
Date: Wed, 10 Apr 2024 17:07:37 -0700
Message-Id: <20240411000752.955910-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_010905_804138_E27293E6 
X-CRM114-Status: GOOD (  15.07  )
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

For RV32, used_hw_ctrs can have more than 1 word if the firmware chooses
to interleave firmware/hardware counters indicies. Even though it's a
unlikely scenario, handle that case by iterating over all the words
instead of just using the first word.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index e2881415ca0a..a6e74f4ad1c2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -772,13 +772,15 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 {
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 	unsigned long flag = 0;
+	int i;
 
 	if (sbi_pmu_snapshot_available())
 		flag = SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
 
-	/* No need to check the error here as we can't do anything about the error */
-	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0,
-		  cpu_hw_evt->used_hw_ctrs[0], flag, 0, 0, 0);
+	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++)
+		/* No need to check the error here as we can't do anything about the error */
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, i * BITS_PER_LONG,
+			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
 }
 
 /*
@@ -790,7 +792,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 static noinline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 						unsigned long ctr_ovf_mask)
 {
-	int idx = 0;
+	int idx = 0, i;
 	struct perf_event *event;
 	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
 	unsigned long ctr_start_mask = 0;
@@ -798,11 +800,12 @@ static noinline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt
 	struct hw_perf_event *hwc;
 	u64 init_val = 0;
 
-	ctr_start_mask = cpu_hw_evt->used_hw_ctrs[0] & ~ctr_ovf_mask;
-
-	/* Start all the counters that did not overflow in a single shot */
-	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
-		  0, 0, 0, 0);
+	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
+		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
+		/* Start all the counters that did not overflow in a single shot */
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG, ctr_start_mask,
+			0, 0, 0, 0);
+	}
 
 	/* Reinitialize and start all the counter that overflowed */
 	while (ctr_ovf_mask) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
