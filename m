Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CBCCD1294
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFT7JLsQmOpa4gTVV77RKkotkTl91TQyL0Rtuw12fEw=; b=XzW+XeX9U/NJpE
	AHbw3rtXSgVtArkFznJuT00QcJt9NiiJzHJELa1jZOoPBDaIhn8ZKOhxKBRvM479flME6GQC3hgbo
	x9QrKNxyPbyx51OvnVPtEMB/spYFCm2pm8iAmkV0Z2tBx8I5oJhCG82owUMmO8tgomIyjRKXjwZ3x
	j97BV5yd+Ur2CQ/3Y2zXWH7u310WeN5bPVPOUHny2UGoZD0CMd4OL2EIQSaHP8z+0kCqFUEjykmAn
	Mzq6j4yQlXz3l8OetpwbcdG9dL8T6Y4Tju4b1cS6L99CKF3GbmDMf/VhXvhi3N8ytIJO2gp8s8sDZ
	hiPBq1X/sp+SnMUWSXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwm2-0000000FAHr-39fu;
	Wed, 03 Apr 2024 09:19:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcp-0000000Eikf-0EV7
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 08:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4rw21DNPDWpaXnd5Gs3cWE2qTmUGGOZ0JnLHhYLDMiI=; b=aeDn/GHj/KD6GzzoqqFBDjM7NU
	BDvsrNW668L4b7YivpxEl4TF6ibzjuaGYAKWKFl7yL6o4erR/eV2nNfQiIU6QLeoSvNNS7qQyPkyP
	8Tv34ACStvHO1/xHRJTeCA+TuxfUSKDxOQwTKZt4dYycvtyNB+VAgpNHbq4xMQUsot4RW7Zjz6T/0
	Azxao+nBQR4/KJoU29LR+9v2+M4Ijm+lzECc1wLFVrxvcJBFbU7+cHyOMGzG8RbVL/UW0nw1BQG51
	q3OZd4a7FqOlvI3920/IHFk7MS+eXqumwOEXqO+H+265e8N3Av5G9iLKi4HF/ay4mnWJTDzBG2/sL
	PXM1ARDA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvch-000000044ky-1LRg
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:37 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so4589844a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131527; x=1712736327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rw21DNPDWpaXnd5Gs3cWE2qTmUGGOZ0JnLHhYLDMiI=;
        b=Kw37MUE7HEv/oJAV9q1Jhakkv0IZnbSiYDkqUunyxXd7961bWzWxdEZEqH1AT3kOVv
         W2RZIz4O7FjPbXAi31ggfW8h6muF6uDOqbGoYVzlEZAPkac5woA6fYfD/h4KYyxPMemF
         wEvv7BAeOCs+/NbHfxoWYXmzJGfp6j39hlB1hvynUT/sIVRc9ZJSHuYxTOWv8aj5Jkoc
         9i8cjUW8zh0AcHCramSkFvHtt6fN2FD0SMIQgOZCBwOILzhzfDd7ejpVLKbldQvEPrHI
         PzrogL+LY64RBYCRnH0U6uSwAxgg/P+iWbgPPgtXlBAoDGEdOgSLOx0TSlzhsoIY2qzJ
         HjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131527; x=1712736327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rw21DNPDWpaXnd5Gs3cWE2qTmUGGOZ0JnLHhYLDMiI=;
        b=cZRJBccinIeWjNJzrJUyM+4noaqXfpqNLC1d5ea07T4lq//YeP6fECu0n0bpR3OF2c
         xY1cA84RQttOVndgW/gbI3/agcJUtmdGQAlLqhxIZGc6y48/mNavNvXmPQIyvG/JG3hn
         XKS7hx8x/Od+Q3pTZFjv4zO/92Nw2AJBl6ORfp8l1uYScJttEdzs8Xp/MsaxsogSywHT
         WrVPqkBegRX3DUAjqTs1Yaw7yPpgvRfLnnuxeeCcX9EaqMHLVZi+mnuwlwFzSs8oQ2EG
         9Ahm6zBrAOPOizUSQhPSOMEUrS+/gbIZww7vvL9YqvTE7BkJwaZd5RsaRYQpONcUkaby
         qMCw==
X-Forwarded-Encrypted: i=1; AJvYcCW5z+4Dx6RtlJp9bbSvai/qkq569XJMgzn0PCh7zFYMQClgYSjx50FfwkmnUGrcDbkEPCvhhRA8ef9NdMGJtqFuUOTZNPwKA7jsO5xmqcd9
X-Gm-Message-State: AOJu0Yxw/ix6vpCked/1x9hagDGzgNUx4CD5Vg1MGr7RoUbiWjJAc7xH
	koyQFIfUPfOFy20PAUBQV+pbKJ2tctMZNfVxmtgx+SR5iDpBmYb6hsiSWgMPxE4=
X-Google-Smtp-Source: AGHT+IHZeguUWEErPiWxvNkeVU9lmGoRHX/48aTBnxr2DMrqRPKV9Qdy9c2zpt6UamZ4tC6ZYgwGwA==
X-Received: by 2002:a05:6a20:17a7:b0:1a3:34c4:b184 with SMTP id bl39-20020a056a2017a700b001a334c4b184mr13823636pzb.19.1712131527654;
        Wed, 03 Apr 2024 01:05:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
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
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 07/22] drivers/perf: riscv: Fix counter mask iteration for RV32
Date: Wed,  3 Apr 2024 01:04:36 -0700
Message-Id: <20240403080452.1007601-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_090531_629377_FF10ED8E 
X-CRM114-Status: GOOD (  15.00  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8c3475d55433..82336fec82b8 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -771,13 +771,15 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
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
@@ -789,7 +791,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 static noinline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 						unsigned long ctr_ovf_mask)
 {
-	int idx = 0;
+	int idx = 0, i;
 	struct perf_event *event;
 	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
 	unsigned long ctr_start_mask = 0;
@@ -797,11 +799,12 @@ static noinline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt
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
