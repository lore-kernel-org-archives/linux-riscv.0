Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE005CEBF9A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yxpt3Di8eCX3p1qMnZcs4FUOyTF0k0fBywWxgB+EWi8=; b=ocjPymZoqqq25H
	hu5UQ3sV3H3iOf83iMY4nQpjYfyEJBvpwRCPo7JeCuWEH+2aA6pkbrBmhmkPfVeSSfoA9GI32qgM4
	MyQT//os6+1leg8NhXQllrrww1ZCvf/JrZ2oSpngqXAvFOtK57WUTY9gkmQzbg4bhHHVjvEpCs2zO
	YG1jO0HwgvfCAEcC10NTE4W/+dC4qpsziIecj6+IiA47fNJCG1HAl25uGHjmWtYSYlpTbV1yqUXcM
	zuUgEHUWa1uoKKpP4heibm8c3PiqU91SKE5V87WFaqQbU3fDXE2LGgWD2ag3z4zWypllblnCk7s/i
	43ZlFtyCs5dOO75jtwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoa-0000000HFtz-3PMx;
	Tue, 18 Nov 2025 02:51:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoQ-0000000HFlz-2ubK
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:51:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29558061c68so58754345ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434282; x=1764039082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ktfjcf1VaoQQvTZkflNkd5LOSRp4Bliy+Ze+vhLB+8=;
        b=Fegay5JcSLgWLq9fYsw/sVv4cZ9fEk4V4pJxJ+4dxqUBU1VR2T25X+4zZGLn/132mA
         EWFS/OmrOCNy6VH+4MXfTkFIpOv/3YyCmqlYtpNMTwJ6hx01k8g3/hSoc39s7ybyVudr
         gsMZYNx6FQrbEum3hcZ7f+tzhuKdbRUdBdXbjPUe6sNCLC6x3FqJXKGOAYtey48bSv2g
         IsUKZIsNaJ1xdKhodUaDN0td+IlP0CgjrT5yIbGzLxPOoTbNuBxa2Hm018RTOMuRrN/l
         SuHtRR2RX0kz1KPixSonRurxr5WWbc/AMge2V2TWKy7KSoYgMZ2lQdye+sXwEiMZfE2X
         VCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434282; x=1764039082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Ktfjcf1VaoQQvTZkflNkd5LOSRp4Bliy+Ze+vhLB+8=;
        b=aToD2N1hPcaZGFvyMN+X4gEUX9l5Yb7XbsAkNvSc1mPtcGXONHEbpA0AOHoBSga0fK
         EHxRkLJ3sFNNxEl7EfmFKd9Jk9wRddLO1yB32Oji8IQmPEtvdI0b/7Ijx1Td7XeF9+xH
         jZPIrdWtlOKoM23xQl3yciJxziEqZsOuqGTwXEaQ+N21T8QEcAhDBKrbZZsnHAZ0oF3C
         CPVCvafSV5dlV7n4ubgsfhdRhSIxTDNBNlVaa0m5Zd8lw4g9xvzPeDiu4bKX1JBE3Eka
         vTxKRnh2bePp0vO9+DfyywffsXcFqr/FzsoyEonVO1kHTlrtd5dwyrazQYLMD3UZe0zE
         AUqA==
X-Forwarded-Encrypted: i=1; AJvYcCXwRYpIhlUOUDIX5vQpjJTQsamIktqye7tWFBXrAW+Voqmd9F0mOrGauKsjOfWBUGbolPRW0WmUgfuY4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGB6ARaIjzFNFwmUKU0S8BJvrTduhCEDEQUFTFN18Ez0ZnEIB8
	VUKyIxjuSGwb8CIQ0MlM8E6Obv1J79LLSrPIRG3MSMAu0Zk0IOyi4Q32FfitAQ3mdA4=
X-Gm-Gg: ASbGncvaECB97y0ITCda2aOo02eUk48z2v+wqpbmGmDt/n7OlvV4bUUDKi3ZkvQCR6n
	1bhy+vCDdmqCgk2QaorM7lQOXf5lEKRvLKqDwheJwZVAAELg40gfzv7P3fjCQ4wVQH1sHzowPIz
	iR/6PpL5K8RRnCrOMqnfWHxE+HV7YuhhooyYylvM3dKFIxqgfiFbCHNNpuwrmtzOltJp4Vl9fZj
	8BR+nJpEQY/KGSU8ePAab1nBfKHN1NUBZyyRGw5BZGP1wZ/mdEpEamz5E+c+f2etPfyFk3DJZlR
	UH1p02UQ7cY+f2R61wWt0tgSTrIzpL8K8o1+TT4OkpkxQqeMqi1EBCCisYqbaNkhWCy0aJImy8h
	D7bLLG+mYsputBKIc0HTjyFnTAJBd0F1ZZyKqOhJ88EcDPRQWjKEZNa6FgVnTL95DB2JT5vJngd
	dvcInDeOKIRTW2t+sAWgXnfnhhAAj/9N2mGTG7Cui1N7tr
X-Google-Smtp-Source: AGHT+IGdT725im4HB0Isy/71zroaDxOZnDLP188E5pE1tBPP1s1RRQVrXvWNbLyW04IPhqkov5keHw==
X-Received: by 2002:a17:903:3503:b0:295:195:23b6 with SMTP id d9443c01a7336-2986a758e70mr161110795ad.55.1763434281922;
        Mon, 17 Nov 2025 18:51:21 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.51.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:21 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 6/8] riscv: smp: use NMI for backtrace
Date: Tue, 18 Nov 2025 10:50:13 +0800
Message-Id: <20251118025015.42491-7-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185123_717202_58E0D2CD 
X-CRM114-Status: GOOD (  10.01  )
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

Use NMI instead of IPI for backtrace if RISC-V SSE NMI is supported.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 12 +++++++++++-
 drivers/firmware/riscv/riscv_sse_nmi.c |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index aa1cfc344a2c6..26083fe0a5df6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -356,9 +356,19 @@ static void riscv_backtrace_ipi(cpumask_t *mask)
 	send_ipi_mask(mask, IPI_CPU_BACKTRACE);
 }
 
+static void riscv_backtrace_nmi(cpumask_t *mask)
+{
+	send_nmi_mask(mask, LOCAL_NMI_BACKTRACE);
+}
+
 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 {
-	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, riscv_backtrace_ipi);
+	if (!nmi_support())
+		nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
+					      riscv_backtrace_ipi);
+	else
+		nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
+					      riscv_backtrace_nmi);
 }
 
 #ifdef CONFIG_KGDB
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 0ff0bda53608a..cac940b7e8773 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -3,6 +3,7 @@
 #define pr_fmt(fmt) "SSE NMI: " fmt
 
 #include <linux/atomic.h>
+#include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
 
@@ -56,6 +57,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
 	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
+	NMI_HANDLE(LOCAL_NMI_BACKTRACE, nmi_cpu_backtrace, regs);
 
 	atomic_set(&local_nmi_arg, LOCAL_NMI_NONE);
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
