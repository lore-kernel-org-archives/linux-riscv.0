Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54A2E7717D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 00:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6XuRM/bJVNvCLiYXn9Y24qre+CFS26aLYe7EGj0ZPY=; b=YhOT7mMI4zv+Co
	kQ9jf82FGxMNHSgyXfmp1nNWGsv4qB3mnoLhmWLUVzCNbmScBbL7bYZmhjKwYa1RYNtq6OtCbc+MN
	5dUAv1pu4uXLQsrwtIkneVHyMM+OwL7/5T7TyWbJW3SQkAST5S4uVDoLMq9s01Cic/OXuGSxSX0hz
	lkllpGpf0dtuNnNSoOadq+ecMMmNsR9EPE1vZpsJ1Zmmm3GdeKf0uN/EGNOLAtHR2IGQnFq1YHaYR
	rbnPHYo6HZgfdqaXc1dP/PCcLwQSxaovCZ5oZJ4GNE9xIdoZIIzLGmpfSgQfojrfqRdilJTghyBR0
	7d9CiOuA/XrsMv7DVlqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnkH-00000009e2v-3W8b;
	Tue, 10 Dec 2024 00:04:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnkE-00000009e1Q-1uju
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 00:04:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so1394121b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 16:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733789093; x=1734393893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0pKu4QEUWyKrGc51Cv9urYoL6jDqPoRBL3/5PZAkyU=;
        b=BHJkWnMv+ih+FbuUXVaUBiK5pdcSAHA4zjn9c/MbZ8WGwsJbajFsFHjMFhmVzJ92CZ
         Fsl16H7Fvqx2T6NczOtlRMI3gbWA5mNAVHfErKEpbvHyXeE0nVIzd0CMhBTonK/zZDgM
         HrDgKCjCSZ50ooag9UJPjgpQhdHQPb8mQCI3wkts/BAI8jT/G7vAO2BfCAlglpCE9Di4
         QfXIkvArUd31F7+aMV3xKvaLrtwLPNB6224siYjefdc3cBWSKYJqEhn2TJi8GpH6HOks
         FPwoRdOiIoKWxJc4LecrumQOWnrVVM66WAJ3JDd+Xyt7j64bszshKp7s35YXRqarQ722
         rfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789093; x=1734393893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0pKu4QEUWyKrGc51Cv9urYoL6jDqPoRBL3/5PZAkyU=;
        b=CoLuH9fiY9TcJefHqB/ljqzs8Krn+OW8z3rQDNulnHenQJWH/tenJQTGMlWklp+Gj/
         /a5Ga3sa2BZWiv1b81nMx8URMt5mKNsw832+L14iz8UeZSv2zTnHhhoq5Aur/bmksEFU
         UXFPKuRbCk4EWFb285VRL+IyRPDZtXmNk0daiJmSLUHl44LBofZ9omqfhp/RXooA+XEh
         yAyldXlcjnQQsyAbf/wJ4W7wa44EHJLnBs3fdVLYuXkecTBzRXPoLgICQisZWFwAkxxD
         WVnvJv9lVx658c3BO8o+ODS4pJiVRHFxuXLcbdhmjpr4JeP9ImAPadikFkhYboYcQYis
         T+XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUpNY7bX/pAxmuh7eW7xuo045LZvb6UyqhkevHFDbTv8JLwURyRiQrexa/RSVPL8a0cW6CziBwnCSx/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxngUA24z9b2VfXz12XJ6LbiF6NbpZ+m89NZa/5lHnQ94tv0MFX
	eRNucHXxjadRrJNXYMxRkaW48PJH0yCJZALVoyxC80I2XE9kkWSTs4Txdr+suRU=
X-Gm-Gg: ASbGnctyvLkV6K5T8qmpU4Z0zFGEMOd5qTc76Z6FKY1JTB1IhYkOWOrduNUTunfd4qf
	XpixT5bE/LoWPmXWSP7YoAZVAFvFdI7faEpi1K8RWaTalgDELG4/WO8mEdFvKm6JLkv1Tt2zYOz
	5rGvyhPdJaG3Gj/FP+AOkEPruXdN0iSXoN2oXFiqHwDqtxAXHgxd6vHWvuULbeTN7i/zpsgUIWx
	zccVv/igJ7jPq2AnxqcASfDe54D3RigqHn5f04ea8SrGmVE/jnHzDpX0/jwBFafYjE=
X-Google-Smtp-Source: AGHT+IHXM6yBIyUN5IOl2XwzQf3IuEJpf0cNwCaDErthAQJRzZCXMS7KQIlXRIe7/2ggUbe+PD0Nmg==
X-Received: by 2002:a05:6a00:1acc:b0:725:ead7:fcae with SMTP id d2e1a72fcca58-7273cb7fb3emr3815468b3a.18.1733789093256;
        Mon, 09 Dec 2024 16:04:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e3ca46f0sm3477249b3a.15.2024.12.09.16.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:04:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 09 Dec 2024 16:04:46 -0800
Subject: [PATCH 2/2] drivers/perf: riscv: Do not allow invalid raw event
 config
MIME-Version: 1.0
Message-Id: <20241209-pmu_event_fixes-v1-2-d9525e90072c@rivosinc.com>
References: <20241209-pmu_event_fixes-v1-0-d9525e90072c@rivosinc.com>
In-Reply-To: <20241209-pmu_event_fixes-v1-0-d9525e90072c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_160454_498023_166D970D 
X-CRM114-Status: GOOD (  15.89  )
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

The SBI specification allows only lower 48bits of hpmeventX to be
configured via SBI PMU. Currently, the driver masks of the higher
bits but doesn't return an error. This will lead to an additional
SBI call for config matching which should return for an invalid
event error in most of the cases.

However, if a platform(i.e Rocket and sifive cores) implements a
bitmap of all bits in the event encoding this will lead to an
incorrect event being programmed leading to user confusion.

Report the error to the user if higher bits are set during the
event mapping itself to avoid the confusion and save an additional
SBI call.

Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 3473ba02abf3..fb6eda90f771 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -507,7 +507,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int ret;
+	int ret = -ENOENT;
 
 	/*
 	 * Ensure we are finished checking standard hardware events for
@@ -536,8 +536,11 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 
 		switch (config >> 62) {
 		case 0:
-			ret = RISCV_PMU_RAW_EVENT_IDX;
-			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
+			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+				ret = RISCV_PMU_RAW_EVENT_IDX;
+			}
 			break;
 		case 2:
 			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
@@ -554,7 +557,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		}
 		break;
 	default:
-		ret = -ENOENT;
 		break;
 	}
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
