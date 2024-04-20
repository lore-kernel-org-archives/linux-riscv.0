Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE056C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gL0DTF7G3wj0Nt5kWSc6Af4TJPN12NvoH+U8iwq9CI=; b=1J95c1pUy4ZhkP
	ZPx1TPuV/TD4LTGiMdIfEOYV9JK+OjfFoBUFofBMaHooqKBLThVpjqLcYfQIm9fTmiGlTDFPDVbW0
	whpmoUu7Q+pP8C6jC7ik1Hib4mt8AGF9Gu7IPrX7OJHGVrCfQTQnu6vArv7SCyir6d9447ZQCXfFD
	ub15q1i1N0OxdZqJMhFKGHlk+gtH9vAScLNcKlKbDkZQwX1PP3N7czALNvVFhocXG5ajpanQ/2tub
	gSpVykrKSKh0qPyh3waKzK4XharqCgpkEFdbXRunObiaUy4Kmo8BCfFd/sxonj+yClwOguB7VrV8W
	6Yl0FPzxoMc9TZQg90iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxy4U-00000007Ml2-0EXX;
	Fri, 19 Apr 2024 23:55:10 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxy4R-00000007MjK-187t
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:55:08 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ecf406551aso2312633b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570905; x=1714175705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkOPph+llp8Otwcwt9B3eiemeK+kGnMbysCIlXdxbFk=;
        b=OKC6u8VTAprUleymZMEo042uCFyjhvbT/Ckjaj0tYRNwH4WTkxIPv5kMhNGHEXNjtJ
         /2Eh0Z+6Qg3QTspohMJNb0Rou9d7l3gepU5PP3Ejiga5LOHaZS0nBjMKILZFX50QqNeL
         T5U5H714YfFHpw3Fc4XGnrH5z4nKnDVgMSpOyTADsK8t5Qi/+QYfXfxNqNjsOQtGKlhs
         b+OTyaDMWdWZZp6L8YHqekUFrtbYGvnhvc51Fp4tlF12WtbqYeEDr09QqUI+LhYak4L6
         hXos1uY8dwY4nsZ8iTo68fnmbU6Hg78E3lPpwvDvGmugh2do8CPbN2LRZL4BgCXWSPje
         jHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570905; x=1714175705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkOPph+llp8Otwcwt9B3eiemeK+kGnMbysCIlXdxbFk=;
        b=ZWNpWREVN8eT5E2R2WQTsMaJ00IEH5zHyvXAs2LQD2R24lTNxeV0BJ+IqU93R/pq/E
         fhCHUVUbuEiVHbXuVP0Bdfn9dcSKzcYXUZkf+BIqfrBa8hGk5NvQ/mlhCdWSvqQ2dNSB
         zh12bgjCGvOWBPnAr/zCFxMme1Ba6ju6yXAyCQplrCu3/Ey9Xzlv4c+212T5wdjyjPD7
         cdB/3hXuF5CELVe9mQr4JNiIxqm8R9z/qL1DYBWw/mw2wB/jeYeg8tqMrssBTohPvjqP
         r8vJJdxcVnfRHj1r8QasFYliuis3Bq/GHzRdbBQ5GcTPae5oi5J1I4moCu8ISFa3Ic7F
         W2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXXWgbG538jZU8uuM3GLBxqD+5XDF2fftYvJQ/EWarI3wzmE8VuFItf3rfm6l7RhrnZaGBC5LondPG3EYSA/iJLoukGJ+F/m1kTXpnYahhA
X-Gm-Message-State: AOJu0YyMn3iMA0p2gQsjq1eDKK/Juw9ZTKam083VswrhNHK26ZkaF4Pa
	LIcIC8KAqpbO0cVdZYo64ATd7u5GYfD6XAVaGFkgVOwg4trEG9cj8iVXCytlqbqvxWibWmTCcMX
	f
X-Google-Smtp-Source: AGHT+IH1qz0aQ7clqAJJ4fHpFjaj37g2CZsxbNmpL8sCd2e71ca+suKQb30C+gPwakigrEbB4x5ueg==
X-Received: by 2002:a17:902:784f:b0:1e4:a120:14f3 with SMTP id e15-20020a170902784f00b001e4a12014f3mr3799131pln.51.1713570479336;
        Fri, 19 Apr 2024 16:47:59 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:47:58 -0700 (PDT)
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
Subject: [PATCH v8 08/24] drivers/perf: riscv: Fix counter mask iteration for RV32
Date: Sat, 20 Apr 2024 08:17:24 -0700
Message-Id: <20240420151741.962500-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_165507_385579_AD8141DD 
X-CRM114-Status: GOOD (  14.68  )
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
index f23501898657..4eacd89141a9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -652,10 +652,12 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 {
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
+	int i;
 
-	/* No need to check the error here as we can't do anything about the error */
-	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0,
-		  cpu_hw_evt->used_hw_ctrs[0], 0, 0, 0, 0);
+	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++)
+		/* No need to check the error here as we can't do anything about the error */
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, i * BITS_PER_LONG,
+			  cpu_hw_evt->used_hw_ctrs[i], 0, 0, 0, 0);
 }
 
 /*
@@ -667,7 +669,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 					       unsigned long ctr_ovf_mask)
 {
-	int idx = 0;
+	int idx = 0, i;
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 	struct perf_event *event;
 	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
@@ -676,11 +678,12 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
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
