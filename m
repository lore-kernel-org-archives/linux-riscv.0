Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63F6CA0FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvRbD8KjITI9kjgsYn6rPwd9Z2Ji4PqD/HRZDoZhf7A=; b=NQHs2LpEXdoUoJ
	s/3W3g1El4wxDaGBv8C80nI5UDyI5di7bIR4m/uRTt8nMUbh8SvM7EEMwlcrCIVDTWXZuqakauAD2
	WsgSnnzLmON9bbrh3rPqXN4x/rLU5x1rI4PoJ5HQHPdVbibxuFOW3vwqENZDI3SCb4Bo6pgtM2elI
	/EY4UNuFkNw0KcBBt02mw76nv48FILuK07aIiSHSDg74Q64Ljto9dZtBMEz4SyBu3hyHXxpHNp1BC
	TCRY6N+gTjS52Fsb0N3mERAkNSp6+p+wCvHYycuF3KE0g9nfZ0uRmGb7jPGSXyOHFVGt8NRPtnr+d
	chjCfNug/g8gaEEbA19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ad-00000006fe6-1aXK;
	Fri, 29 Aug 2025 18:49:55 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hu-00000006407-121J
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:12 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7718408baf7so2109324b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478469; x=1757083269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=YuvlSVGvaAm6liLZ9WmL77dXRFZfVzqLIoKAnDrSL+kvb3QZhGhSoUJlhssEPoBSmr
         WB83hcVr5LxGnff8YrqHtnb1rXz33f1yId1XtWMHH+tvYdcT5iOAC0pz7WaYTsYVTU9d
         27ugoCTl/WRWMZtSRgqW/6VDXZ8ma1j0Q1rlbOM5WqMOcaSze41Bgpw5JEwYKpmwsg72
         WW0ri/O+8yrdS8Ofj5mJAPPCjnv4iiujsQq8XNATZAT85NLMUrngy6ExedPYP/BnFKwn
         8Af/mv/9fYa2xLrHpbbUJ/O6j6xTPA1xUzNabEFtg9bpM5xngpSrseT9EZD10HNZpSom
         XVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478469; x=1757083269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=THnT6RknE5PGo5wcc+xKcd+p2B+15QzOVLhHqLy40k5XJUX7LIj6qLKFbJUfnz2u1k
         tibIQpxqTQEk75hjbpmWsGWnA6CfLEqSnv6FPGUnzqrnu1JgIMIZ30zKZeQA1zzIaALy
         IWzhdmuzRj8ghnk9zVV+2kvteMHFNxTneq+4nyYhdB2tPcZ6tMlC3peAw3pcT55EOFCV
         PGs02iccrpnyDlP17B0/EMA+TzPU3vFBRW2nS2Cb0AJqMK/0VfWyfNz0v4dqggf6oslf
         MuGm7iJbSSfNvCtrUuCWWqnTqEqaIk7nEFLByJg07PORnd5fmfs/UogRJq6Tn2lAUbV1
         MLyA==
X-Gm-Message-State: AOJu0Yxzk4N2gPKDw3BHUjcL95vZ23dm6V3naggRmWCpwrU6Fofm8/K9
	i8FczYragPhH45EnN1B+DR61sWlgKQkLv/vlSI7UFE/pH6Aw3cLtfjnxm7iFG5WfOtY=
X-Gm-Gg: ASbGncsZ00PZvymdHkVpmoa9JlRvMJGXLbfupiDGqrONGcWPy6rojgk27bKLJezNtBw
	/NJNwFfxU7my5XOH/EqcMwMdPvP1d5uS+zeAmkDND43Z4Xw9DLecbFgFDrFI/IBUAK/j058smvg
	rexA7/qh4MuOi0TM7M2vkPckXejlHY0RCVgwIwxZ5DsRJu7KKZt4GGy7ebCid6leX5MOuewi3g7
	qRhq8AD1a31bBxB12nRgmBXiQxD8hQ0iax4qPcUvUZNpJX1v7iH01/lo1urBy0yFEa3/eRfQEEL
	Nd2/789uX1E/ir0ggMMynUVtiAGCd84WrAD56XX2/ChhL2BquLquPnrHCrUC1r5uPgUyLc9rB5T
	t09tgvlghhq2w54br7KCBX2vkrHHRWWyh2XM=
X-Google-Smtp-Source: AGHT+IEyDQaVO7hw6M+jmWcVL/199fQHjMH7i3C/32jO0Trqcu+fqIoi/CB4Tct+03RcyOTn/ZKedg==
X-Received: by 2002:a05:6a00:2306:b0:76b:e868:eedd with SMTP id d2e1a72fcca58-7702fc059c7mr38073588b3a.24.1756478469428;
        Fri, 29 Aug 2025 07:41:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:02 -0700
Subject: [PATCH v5 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-1-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074110_288385_07D30624 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

There are new PMU related features introduced in SBI v3.0.
1. Raw Event v2 which allows mhpmeventX value to be 56 bit wide.
2. Get Event info function to do a bulk query at one shot.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..cfd6946fca42 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
+static bool sbi_v3_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1452,6 +1453,9 @@ static int __init pmu_sbi_devinit(void)
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
 
+	if (sbi_spec_version >= sbi_mk_version(3, 0))
+		sbi_v3_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
