Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265FACD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMOyXlQdfo4kNo5W6gjoJ8FxXZ1boH+L+DghlcLkgJM=; b=TeLcOtZL+wzuY7
	cW2I8NMbqqm5+e934iOSUCst42Qk8vguxg+8Ecym/2I7S6VeUycnwWH4eHb67qFCySsxQnCRMpLDD
	/OinNlnhcJMudEf3pO6wvyhvAaKVLsWaJL7FLqZWv/J1fKxYZ1FZ4cVMu2syo++utYdSLmPpMFjhg
	2MWcxgRaQnms08VYvZWeM7M9D7aLqdGf9FlM80Rvjpa/cYs6y/4KZnyABklVXQnm1VynN6hJUrJen
	no6pgxCwGWK9pz9H2jLfNg2Zp3l8/e1rSQx30Ze7yDx8Ymg6G7gfitvaxqTMOm9gfp98t8LaPL2nd
	wP9SD7U3cm8xQS4op0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwlx-0000000FAEA-1Pz2;
	Wed, 03 Apr 2024 09:19:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvci-0000000Eief-3aqx
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 08:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ixjc/2duOe8tMNsDFapztE6WZpMRR0IqMx2Riyo3ljE=; b=M7K05KuRjuFwVS2jErIyv7IfaV
	l9hET2zsPs/BYeb9R90b7e5fRLv8pXKBK/J9HIqJyT25kVsNp9DDZIwBxIkH+FmGdrb3Kpa7eFU8O
	J0VMMgXhQ7NrzWTGO/Q9433XKjzN8IqXxCuXipFvfqIg8ECxHnB8enEjk+bWiqaC2OPmIkZP0wkCs
	XFATFcVMJYVKeHtg72NyklUTRbD7c1FefdhpG9QG21sGyhjeUaE5KsmuIAxN77PzTNsQ2PyEjYBjq
	ZUsVecL7c+qSECD664xhxhshoE3G6SKZYx3EY+e70bDPZKY8/FY2mGQpfO+rO+ZD9Rz/pHTrY5JQW
	GMG1WWSw==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcc-000000055aU-1vJ1
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e0bfc42783so51159635ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131520; x=1712736320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ixjc/2duOe8tMNsDFapztE6WZpMRR0IqMx2Riyo3ljE=;
        b=G0ohviLEEgf8tDNO3f33IBySIf0w76rtSPWvnlkaIKHUn3CGMSFjPS8cdkkpBp4guZ
         qFeGXxnZlamNA5r9nHpviI0WWSRRpEBBdA9Z50iH8YHENNfbFGDRNoydV8f9Fm1pNUoh
         INJfR4kpHcHF24yfG9xU/T03TzycQFb+uCfqu7hkUgdQ65U5WXy5iFYucvG9LjvPoQKc
         T7wvwVwYc4tu7GyNI2uxIOHCNk+tpEneEa6+IFHhz2U63fHQKqwpZNfnhXhZll9iHCF7
         4q9lP0FVtZyE5Wn9fsaBsVlkHZCqbb+cLd5HmCp0IyIXyHAyMkkRiSWAd9coedKVPAJq
         W+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131520; x=1712736320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixjc/2duOe8tMNsDFapztE6WZpMRR0IqMx2Riyo3ljE=;
        b=kdJAeFDhYZ1nFe3oiy/6n+4HJpH+DfDnXqgr34cK8HpPAZ+aZdMJU0aurelSO85mHr
         WgEmLpbwRd4X4VxsaJitNSLH4teiW+dLXigNhzbgucS4no6OmwT/PfyN7CyacVbFYAhV
         V4p1hWe9pNgOO3K/Au5bA1EGYVoRzlKaa1WAtpwc/g2sWHiRdS8kXFQbVukfOr65X2zc
         xE3T8FYlfWDu5Im6FoV0kI2b+n1yK74Ebs+oMz6OLE4GrtkZAaWtsw7ApC1fW/tCbQOC
         YQVSx+XWiH1cz5Tg5oBNH7BmZo16V7E5Hkroh5m+yj5H2799iBFj+1CBIWtld+HtY7Gt
         KmGA==
X-Forwarded-Encrypted: i=1; AJvYcCVaz35TAcbJsTUFJJgfcfCgxBbEq7od+SbGuhjrBAFYnm88jM2L0JSO3PwUCgD1Z3V3RoMM6GF3hFixKZYvxRIBeKxTufCOo8N578iyZTfw
X-Gm-Message-State: AOJu0YysweAxAI2iLJUW4wuRQOVaeAfKUj8IRLa8VBk3pw06Wwkg4Zq8
	aBBkDuq24apKvvNoiLM3SihVvqj7Vz6tSDID7WnYq9sPatYsKnXx6t+dBg461n4=
X-Google-Smtp-Source: AGHT+IFNP2TORKh7//FzhNMEZN9MBNitQSqhLOnah919WVqeHY+e2MYv0jsRIRUc8mtVSGHiLEDhcg==
X-Received: by 2002:a17:902:b701:b0:1e0:a1c7:56fd with SMTP id d1-20020a170902b70100b001e0a1c756fdmr13300312pls.61.1712131520248;
        Wed, 03 Apr 2024 01:05:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:19 -0700 (PDT)
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
Subject: [PATCH v5 04/22] drivers/perf: riscv: Use BIT macro for shifting operations
Date: Wed,  3 Apr 2024 01:04:33 -0700
Message-Id: <20240403080452.1007601-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_090526_550237_8B0D3CD6 
X-CRM114-Status: UNSURE (   9.78  )
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

It is a good practice to use BIT() instead of (1UL << x).
Replace the current usages with BIT().

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
index babf1b9a4dbe..a83ae82301e3 100644
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
