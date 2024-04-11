Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E02CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cin1ldJdDPmIJJteR1liF2UZpvff1ImIdVXd9/ftSro=; b=F7EHN6kyPy0xHA
	ZxSTTa7oJ2SGultTTJC5q5xePo4noFq2gJ2V2cuzJpjuYrK/F4FWweuOVbJYWPiccS7Ss2Lz8Q92Z
	DmbThJ4/ffMUcQeRVL1S9ou42uI+HrQjJsaVBLaSx5FLGWCU3J/Wm2eSLs0Gj/6xReaaqzlyQv8VQ
	Xpo2qLjPXZQdAnBWYvv142NSDexpDoyqJ04nUD5Huo3qlOC8vsR7r1S2jPGqF57mGEv6DyEINx5Uw
	kffz2bb9qnLVSJmucd5QNP1bT38LjHM0JedeZnl11MirH7+6hSFSeFUXDmqkolIqBSERbExzLhR67
	lyLIuVZyhH98oqg3Qxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzd-00000009ZpW-0MmR;
	Thu, 11 Apr 2024 00:08:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzJ-00000009ZZq-03An
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e3f17c6491so35810925ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794100; x=1713398900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0lXa0RA4+kQWkomLRJk1QW7kf666EFgaJ2j58l79bA=;
        b=O1kk5xyH7OnIrwbvXbEtsyUYdZAslz/5McswK4/QLOSFgD4fcedR5iNwZIp9f3mZ0r
         7n0TJys7hKDKBF6n4r/z7sT6ztkXMtCV21Ztq4H0LDa5GVxxdKFmYr8LOQhvpcGkLGJO
         sUiSqNw2mpuHH6Zr2oOa2LPojccmO/26zdxAgUPCkqrxY7y4i2G7BloMY9zKSUsB/WjS
         EkzY/UV9t8r0+EPsHDLhaEUIuebDX5LIbsjjiGYHMN6kA//M3TNbRyYHRJVCea3IuK97
         4tFJOjWZmPHXWDZcSTW9+b5zEhfBqnm1XZZjh8A1Z5fFFZirih9KISF4nbu9Zu9OjZqF
         Z5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794100; x=1713398900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0lXa0RA4+kQWkomLRJk1QW7kf666EFgaJ2j58l79bA=;
        b=Nl5vcywXj2ovjqRPBqTWaXvxx/04DPhdUfBoN4DomvR/0yfFfTwJApfCe3Yqo5MIx4
         7TwUvgVUvqu3PQGG00WOXKNERizSvTmXk4VeMqccSZlPUUopzRGtOCXudXEas633lQzq
         uC5moHpzBq1LF3lfuvli0UPAX8x7jNhmjvBes8SPZ6/dVQnaR2lvC1xx9PS6nQMzJxZL
         OKYAuWaihNBtxBMXoYEkSXhQpvzAhLOpJ8iEUEUkF6EBiGD7UNiBuupaqbqJSm9psgzP
         P8W15DhtqCkdI5S+v36G0qYhEkxJoNQDliYyNOf4ycFOeB9mZ5F7B7drYb3UKTCI06XH
         cBrw==
X-Forwarded-Encrypted: i=1; AJvYcCVuMzoQ0lO6O9crlgDlglXpXjqdg63O3wY8qns/ENvpAfv8d6+5PprJ/LZwqIKm0jzBqodnmMHfsrBXl8Jljo8P5M7Zu75MbaH/CEYSPyRk
X-Gm-Message-State: AOJu0YxGxKqfe53O5S2w6G6ZA2EOEyHjGwNxEHnl1bxZoq/XQvcTQAF/
	J4rcAdgmZBsyuC8HFnF2bQxn013238D7c/ADPg/B4vFa0uWyakLJltZ3KuyinsE=
X-Google-Smtp-Source: AGHT+IG4zwixXE+Dj2Z6xxpk3Mi1/VNCBH2ZloMZOp3yafHfcqNRvPGneczPVceqD8IMMcr1Pkob/w==
X-Received: by 2002:a17:902:e886:b0:1e0:11a4:30e0 with SMTP id w6-20020a170902e88600b001e011a430e0mr5583510plg.19.1712794100294;
        Wed, 10 Apr 2024 17:08:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:19 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
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
Subject: [PATCH v6 05/24] RISC-V: Add SBI PMU snapshot definitions
Date: Wed, 10 Apr 2024 17:07:33 -0700
Message-Id: <20240411000752.955910-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170821_731121_2D1AB6F3 
X-CRM114-Status: GOOD (  11.87  )
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

SBI PMU Snapshot function optimizes the number of traps to
higher privilege mode by leveraging a shared memory between the S/VS-mode
and the M/HS mode. Add the definitions for that extension and new error
codes.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4afa2cd01bae..9aada4b9f7b5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -132,6 +132,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
 };
 
 union sbi_pmu_ctr_info {
@@ -148,6 +149,13 @@ union sbi_pmu_ctr_info {
 	};
 };
 
+/* Data structure to contain the pmu snapshot data */
+struct riscv_pmu_snapshot_data {
+	u64 ctr_overflow_mask;
+	u64 ctr_values[64];
+	u64 reserved[447];
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
@@ -244,9 +252,11 @@ enum sbi_pmu_ctr_type {
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
+#define SBI_PMU_START_FLAG_INIT_SNAPSHOT BIT(1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET BIT(0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
@@ -285,6 +295,7 @@ struct sbi_sta_struct {
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
