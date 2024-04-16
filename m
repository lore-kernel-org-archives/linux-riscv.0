Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81183C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3T9tmlxANz6/sInaUoIJKgUYht0IbRe0UX+7ht4MYw=; b=akF6Qg4KUAiP7e
	g9XlNH3riMTYtrhG7i6bLZjjWbOdgUNtlyMvyZAtYRcyR5cu+F0Q6vW4KAznJmiLvACMeGotso23t
	bO7tKO3lPXF3oHW90eK2+gh0ZCNh1KVfZIURRGMcBz5yq0ZhmhpEk9fZgIpvzhJCfMJP1usrJ3YuM
	yzbLru4bC10axkYmNXWOvtc3njpWbmJYYOBlV9PfhRF0SXQGjaWqggnFr1GIUfymNttFNSlt60Wip
	SawNizIeOEFyLf24hB3qLxwRtgewwxG70P2suiDFzQHHVRV96ji9D8Q0uV/CoytKegmVkH42FNxN2
	M/RF3Sr0R8PCWTl0GzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwoki-0000000Dahd-2CkD;
	Tue, 16 Apr 2024 19:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnj-0000000DMQ0-3ct6
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 18:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kuiEup71RSFWQPf1rf4RZ6WG8aw8PhI/oCK0Eh5yTgQ=; b=MZsuukYL2RrpxCMCsgUy2HxKNR
	ZyOzZo3WoQTynrbzZL7iNeS5QrkEzMH3jbRY8Otta1mn66lA8mZL68USXZSEBBWr1pfDaQxoeqqPM
	v2jacoUkex+mCsNgeGJo8xrPF59yE30HSzqc4iWJmUvy/06EN7sVY7D6JUOMIBaDYwaabpxr9afUh
	jzfDrfG9rSQEEeiifSQFhHRF3eA4MkAkKujJLVvml2dT53GrQE2tkw0M7x5dhbI6I0oDC5wWUORsp
	jSC+9LdlU+wPyhU/VDBz86KKvxfMdA3Sa5cDzu3xfUSoK+1SXkUkOw7xVer3tle4vld8hjZaP8g34
	oG8Q8ygw==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnne-0000000BCEG-1N4T
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:01 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5dca1efad59so3274042a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293094; x=1713897894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuiEup71RSFWQPf1rf4RZ6WG8aw8PhI/oCK0Eh5yTgQ=;
        b=rpn72mTv4b2wSTxHouFoV3lC+jpBOa3ZCR7+MEWU48lGWd/JKb1OSDGJoPrhfhRhGh
         BBGoujeNax0NdoYFdMzvzYv7wWOejJ1C984QJ+fX//pEwsdzBhxwJjP10alxbeQq0f2n
         v43E2nzKQwMQwP24yL7TvLugW/rnEPw7xsnYSYqK45TDU/x0TQ2Nz6b1BlQZkueGIfJf
         tU0sJ8KAGkPTkQXPVQ/vRdfmeqh6y6CPGa7RbmSlxDzxEa1iiSxNCBfVbuln5pSadEdU
         VuLNJ/61xRweJxtaUzc7+qd7E6FMjKxovcVpisA1+uKsd6Kt1FDad7syB77F7szn6SxT
         FsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293094; x=1713897894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuiEup71RSFWQPf1rf4RZ6WG8aw8PhI/oCK0Eh5yTgQ=;
        b=BGbN3rMuLJes95302+gF1HwbmI8PNx+V49LIS7MiO2+AQl/I6fyLJ561R0z0Mjs6yD
         LM1/POJRJ2CbMXWk5TVhC3VjJwjvPTLLTjJSvRfdH1Yd0rfsDNwVgwWoWmZCG1RFasTK
         nh7Ko1cqaqtiTRyaY5PDhjsOEvkiTdNfhWI1dLIbxJVyhk6/r8ckwnxz96ZtZw75sm/q
         MIXxYKSBWmCY/KlnEjsZX3/YIx12NBZl/JP8S5RPgzZQFxzQybH2p+tl+nIZQCnrySDK
         dkKeR5uOV9Hg4oWknnM2tYvuenYbsUQ5BEy6r+uGr81lAPfI18Fb1UCzzoccnqU+hchj
         U7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnF7ZlEuvdnICFpXbOhavn1mGexbXr79jRxQbbsbgXQntdBqpzvWoWcBPIv+oNnFtR8TPpKhVf/1+Z50vs3cxQBbFDz4Iz9zhbsAjXsNil
X-Gm-Message-State: AOJu0YyWos50ZASS6JEfcN7M0eGaSyvrf+dmdgMumv3RLWIAmoFBl4np
	la3ptOYcPnU/IwHx77AhOytWVkBYQYODrP/VCe8ZVZS9Pd/p4PPYVqle7DYICXo=
X-Google-Smtp-Source: AGHT+IFUOmaHhHwroe47EwxqNzGwapgmI0FWodfq5R0EG3ViEdjmhW2QsjYr95rUk+wVWdwWIZqupw==
X-Received: by 2002:a17:90a:601:b0:29d:eea9:c800 with SMTP id j1-20020a17090a060100b0029deea9c800mr11091313pjj.7.1713293094327;
        Tue, 16 Apr 2024 11:44:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:53 -0700 (PDT)
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
Subject: [PATCH v7 09/24] drivers/perf: riscv: Fix counter mask iteration for RV32
Date: Tue, 16 Apr 2024 11:44:06 -0700
Message-Id: <20240416184421.3693802-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_194458_534978_D9C0A34B 
X-CRM114-Status: GOOD (  14.87  )
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
index dabf8a17b096..60bcd52f6da9 100644
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
