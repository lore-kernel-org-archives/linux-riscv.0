Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E6DCEBF91
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcGw/JuzFAhHQMsuKzPviO+NdI9mMBL2DGbfwFK/i3o=; b=c7cWMbfp11W3Uk
	1a0BqMDNSTF9K8C1UUKDcTwD5BUfLYSH4nIb5KLA8L335pwdvykmtnSq+Io+hLVs2l3IqN+4XTge5
	qBANJXsqxvKnRokbAjCh3NhQdzFWF5Ilop//H2XqqRK45DZ2Lpd4SDacoHovlJlXhGQMqqCxDkRWy
	3Pn0HVi2QWk1qNb2w5aYc+/HOKd5Cc0QSnrng/y/+q1EDWg138Bw5G0o7jdNAF9MwITe8fBfPp4EC
	HB0/7M3vwl38nwltQy3ZADW8i8i0HUBL4CMYzBgvjrhgvbhr0PfcFqCfqgXWUOIqYlQ5QEfBkdo8J
	dtQD5udzZidCqtqwsaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoS-0000000HFoH-2Anw;
	Tue, 18 Nov 2025 02:51:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoH-0000000HFgS-3MLF
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:51:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-297e239baecso54664405ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434273; x=1764039073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZF6D1TfH8JuPuDc3tnEaueOaSNKrGkLTfLM+n6CeqE=;
        b=EG6o3QwB512njv8Aq9DJ4x2CMSB2gfvKjjBTenMg3DpfqKClXFD8oWOfV7ZpI3rbU0
         MDDPwbq8R5mePcb01bgKxfsJFpW2Vo8pDkVBIzCD2arnOVPxZKJr8Uj6LPrUAcCJ9ERN
         zZM1Nb2lQ5TAFIktlkzUI19J72EQc4I2mk8E/1wa5N/qdwNIm+tu6tGhwBUh7ZkyAkSs
         egDpkflspf0ExN0/8N3Wahgh4hpFkqWY3nTPeeUmQbjq39O8Oi1FS3eNfbh8bmsG36lJ
         C3e+b6JbBpV2p0ULImqzYmA1WvhvPRIZ7IdlGDgxGfBwy7HYxA+g2kJ9WSvCN0NYEXoP
         oKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434273; x=1764039073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZF6D1TfH8JuPuDc3tnEaueOaSNKrGkLTfLM+n6CeqE=;
        b=DCHemavcd5Ywyqg0MhLcIEhW8JZ9FRNyHbk/bAkKsUbigDCYqwCZ+rhEB5DyYhCZgk
         hb/WAzQFMUlpun7DZ3trF1pQ4/6fpOXiIDczQKAVI+x1LhfuG70TrcH/B/njzTzfUyhL
         djJVp8nWKdG3oHRNedF4/3UFsHGfNIm4lrX8xgvyzEgX4VYdecieYzCiu/ThcoQr+aYt
         w8xzr/K0ZIM/uESaqG3zU5W2/1EZeMsAw1A/UwQNFCNovsLLw/9rBVb+cfVN0egfxv6y
         3QpttOUBKNJFF3S6/R0wu5P0xP1Rj1ta/Zg+RIoL0PdAtmyifGz8fOTleoFKKZA2yT9n
         /P/g==
X-Forwarded-Encrypted: i=1; AJvYcCWpuqG5T2QNtq7tEmTXqn2GnGkcqEFtZ5Kf5022b0DDL2lXGcq/OQ5wvNGgGLJKE3SO4cxOOOTNRLze7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUN20GiuucSh8k091UEGRLkp1Hbobq1c5ey+cI+IRLY4ibYV9y
	THkn8+YQQT+urXfViws6BD6qmkoh1LjjP/FO31HQPGTkKdXyr6zktIUfNPQEwRSMR/aXdBBZvT/
	ilnDB
X-Gm-Gg: ASbGncspS07I3w4rX0IXMgxpdnJIjKP4q/KW5pp6rXzjNEt9486ervpaJBrTs9wa4Wg
	rrQHwSP/rVmJHXfELwkGJvSMnTA8ESr9NDYRewyrDKalf2KntwAYkuueA+t2rn1lSF8hhv/h25J
	ce2PDXMHPUGR/w00vW+Nqpn2Lm9+d8aRQ/xH1lpKuTJoZitA7+Y2DaTYegfuGIWyYy4f8iHR6gv
	WRTo3NUdgmcIZJ/t0Bp1DnNr5GwmSUWgrRyvy3li4bCeEaQYCQkoSbrUNoHZGReXEHPusjeRDoZ
	FjmBavv8h+MBM/MujA1Z4mhf+TeihCvo/BYPqDRkCVzFttbzJpNxq0coqXRHQnqr8pZNzOzz/sV
	x84mNknfxwpdJ89yJjq8StHHYSQA5cJgKwx/ZJEP/bNJCkPdZOLo+1kQT36+bBbgrsTuxZjSxwy
	uqo5xR1cQ34L+XbusWkmqwTZ6k9EzM5gVOj6aBPjkKpVsz
X-Google-Smtp-Source: AGHT+IFnh6sQLklp1JcCHBWGK8mewKb6UL9Nrbhv3tBeBHg/njYdxNQEi6GUf8dQSrAUDBQig6m8+g==
X-Received: by 2002:a17:903:2447:b0:24b:1585:6350 with SMTP id d9443c01a7336-299f5513a84mr18079715ad.11.1763434272809;
        Mon, 17 Nov 2025 18:51:12 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.51.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:12 -0800 (PST)
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
Subject: [PATCH v2 5/8] riscv: smp: retry CPU stop with NMI if IPI fails
Date: Tue, 18 Nov 2025 10:50:12 +0800
Message-Id: <20251118025015.42491-6-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185113_983933_F8E259AC 
X-CRM114-Status: GOOD (  13.61  )
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

Retry CPU stop with NMI when IPI fails and RISC-V SSE NMI is supported,
borrowed the code implementation from arm64.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/smp.h           |  2 ++
 arch/riscv/kernel/smp.c                | 23 +++++++++++++++++++----
 drivers/firmware/riscv/riscv_sse_nmi.c |  1 +
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index f53f1f0e7aa9e..e01ea962adfc4 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -63,6 +63,8 @@ static inline void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 }
 #endif
 
+void cpu_stop(void);
+
 /* Secondary hart entry */
 asmlinkage void smp_callin(void);
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 07ccc28f52172..aa1cfc344a2c6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -69,7 +69,7 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 	return -ENOENT;
 }
 
-static void ipi_stop(void)
+void cpu_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
 	while (1)
@@ -127,7 +127,7 @@ static irqreturn_t handle_IPI(int irq, void *data)
 		generic_smp_call_function_interrupt();
 		break;
 	case IPI_CPU_STOP:
-		ipi_stop();
+		cpu_stop();
 		break;
 	case IPI_CPU_CRASH_STOP:
 		cpu_crash_stop(cpu, get_irq_regs());
@@ -250,10 +250,9 @@ void tick_broadcast(const struct cpumask *mask)
 void smp_send_stop(void)
 {
 	unsigned long timeout;
+	cpumask_t mask;
 
 	if (num_online_cpus() > 1) {
-		cpumask_t mask;
-
 		cpumask_copy(&mask, cpu_online_mask);
 		cpumask_clear_cpu(smp_processor_id(), &mask);
 
@@ -267,6 +266,22 @@ void smp_send_stop(void)
 	while (num_online_cpus() > 1 && timeout--)
 		udelay(1);
 
+	/*
+	 * If CPUs are still online, try an NMI. There's no excuse for this to
+	 * be slow, so we only give them an extra 10 ms to respond.
+	 */
+	if (num_other_online_cpus()) {
+		smp_rmb();
+		cpumask_copy(&mask, cpu_online_mask);
+		cpumask_clear_cpu(smp_processor_id(), &mask);
+		pr_info("SMP: retry stop with NMI for CPUs %*pbl\n",
+			cpumask_pr_args(&mask));
+		send_nmi_mask(&mask, LOCAL_NMI_STOP);
+		timeout = USEC_PER_MSEC * 10;
+		while (num_other_online_cpus() && timeout--)
+			udelay(1);
+	}
+
 	if (num_online_cpus() > 1)
 		pr_warn("SMP: failed to stop secondary CPUs %*pbl\n",
 			   cpumask_pr_args(cpu_online_mask));
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index e4c20dce40f9a..0ff0bda53608a 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -55,6 +55,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	unsigned int cpu = smp_processor_id();
 
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
+	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
 
 	atomic_set(&local_nmi_arg, LOCAL_NMI_NONE);
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
