Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15771C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnWzB1TQig6aELBBaIo1BMOsuJ1gBCNWIBAOVfpZLnM=; b=zq/hl9owq6RCuT
	tyKEQvGbkb67AeFFOCK2KfKohGghcsOJQXgKa8Gfhk2q4iB/rmtWbzDmluGDM9NViTQ5YyaGTHjvh
	1PiRyFZ1XWN1+dFS+LsOKW9598WXh/UZDSs8Vlmvti1/fuVBS2HtldvmRTj+ai4PHFAqw6NFlpPHz
	YCHuYFe38/xt+fFQS4gpmwJKYeHnXN+UuWbTXo1nKUfG8viQI1Uhb4IkZ/z8MhqzjxMyg/8a0VBlu
	46fzSgVaZtzHKttrCtY6NISTGVZ+AFKp4lPB5IG9f7ZbcvFtbI8nL6WXR2xDsTB35+rkqXt0NXrQF
	yI6d1k8mHmYIfxnGxfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBKt-00000001ygv-0zqO;
	Thu, 22 May 2025 19:12:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCm-00000001wME-1j6j
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2320d06b728so46161695ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940628; x=1748545428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=;
        b=IQHipMqfaSleJ00HcPRRVhNNadpsxzL6AFW4sD9jdFb6U3mq1HJEcrG/5G90rKQT07
         JEoSpwLreUeT0XXtAAdB0YwmdVamm0nErWhn6y0YOWE5XMGII+5NG3UW14wRS+y3LfpW
         ak2aua+t53C7f69f11pP6EneUsWEEAxCY3hP5lcCAWhu4AgC3MqldUHkS7UBcAczSz2H
         xygq0cDnHNDOE45xkiob+ETOibP0Sis5a0WIZ+YEhaHlamSpjXUfS4zevU86N8Pu5ity
         CU+Q3ozS9r9Qvvf0e5NReiw2O8ugnaC/6eokNixHghj3r7eZdtheqVPAKN9dVthxmnQW
         XP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940628; x=1748545428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=;
        b=JzFgZcOKJ5bR41WQ5V9c1MZF5wSs5vijEWrUc5z3ZjZ7n+jFd2r2Q7/rVW5S3w8twZ
         xWhofguXrR0YvOsrrjZ1cirvi33ubjcPnEl7VCqJMP6e/grfPrJyOdv/25vOJvcSYvHE
         xUmcqMRQ7qzFpn1WGCFoasQb1LfyGvsESbPtsjVCQ1LxWyUbG6zRB6F5iE4wv5KadYnA
         xGUw/BgLsPlY5tm8tKXjrDLur/Gw8n6e+kC3FKojoHyFq65qGDHvrvcEMTEADXIhXrwv
         oipI51hVWia7hr1sFiy3L4pTwDz1ymCI6AsDndqGtATyXGnJMKEwbn0O59y+/l5p23m2
         k6jw==
X-Gm-Message-State: AOJu0YyQs7P63EmRmtgSCK6DtZEUAuq006Om8FrVqc7cIMySYQfSn1r4
	A1ixTXgBd/sD3gv5rZfbJC8KdNvPWUIyqKGvnvJ8iTqRuRJF5XLlOA1kACWZkOG3F+g=
X-Gm-Gg: ASbGncuaiGOn1e67JAQQCoJ9stUI/xGEB2U87TuKV1Yl4L/EalPsRXHNxlbRrf5aBra
	5krsrdKi2OoBotaf6/0YspF9213GEw+nuKFsLCONpL6p7XlujmavnJb7iBxEAYkS0bQ3Hdn+wWU
	upxPU7fTtg7iIu9dfRqH2yHRkt6U/HyekiRAEnsKYQkUVKfFSsLXE+nXifgskLhzoRYVV6Sv97F
	L3tcST8pssmnWAFvE2s7QCUB3d+tfjfHxz0AGDhA7DjUErn1vHcJvq7cWULV2RQRWb9uK0R/nNX
	RBItSgEbv6tQ/Dh3hikaN8FDasmKBK4wKecousEpZZrWG3OnLYY3f6UD4ClH0ipS
X-Google-Smtp-Source: AGHT+IGs856eL1BrViuwG7Snet4kjwTZqseUJx/cN/TovXlD6rlR9pixORAh5bRSKluNwVXzmFHaxw==
X-Received: by 2002:a17:903:2301:b0:22e:364b:4f3e with SMTP id d9443c01a7336-231d4562cc5mr379326455ad.49.1747940627664;
        Thu, 22 May 2025 12:03:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:47 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:37 -0700
Subject: [PATCH v3 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-3-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120348_444328_F542CD32 
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

SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 78ac3216a54d..15d71a7b75ba 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
