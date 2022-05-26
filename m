Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91D2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3AZSvbj6wPw8ak7ipbXgMzIEH1RwT/3+bU1//QugGw=; b=QHxMEA/AU6W2wV
	t4XpALrQx62xGvPqgVJl/5OGAR8WNVwbkyxGmm+5TLPMKm4OgX1xFeXl5f6MKhduar+IJzAYFeSAG
	NBBjpQxuyoAwAzC86b9dOJnRizTNg4TOA7FPhZ23JeLwlWuA+mjVVOpfTzMHmz9fhWy71RPb2TTeX
	jFkkquI8cdTiGWn5mGgss9h7SR+7cl4p8xnzx2BJX7E+EMWO8B+FlbgRQ9kpPCJpCqGV7WyfVOCnh
	IEHwuqfclOz4XdxCIKEEVm2pRYm4mSNsBz0B+siMn6zozyX7lesPk0iSrwuOO8FGEYP5icPqr61Sc
	ztPQtkXVy2P1EIzr/ctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuATE-00ELWf-Ht; Thu, 26 May 2022 10:11:56 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuATA-00ELUW-R6
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 10:11:54 +0000
Received: by mail-pj1-x1029.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso1369709pjg.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 03:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3wURJ7f8wK/rYX1AWremJ6WWxVIvdF4W4fcHK+urU4Y=;
        b=lGJPvC3W+KdDytFN09EumhPJrVSmrwGdIlDlX0GeN/DoMzCv8kpUJVZJ3ZwxjFOOW3
         bc3zhkW3fIOhwGJRYktfEaa6VNws2H+5LeTtokOCeN7bGS0nVMAdKnCv/A1bWKN7GVQg
         7l9zc2sLOaEwGo/OCT8s09I3+rVZEiuGWAX6JEr/moa/ahGPNGvoq2coD9OCgH0p2ybK
         8um1khDECGbpWGLs20DbAfVxDv4gd4sfJt1KiyrK9oeHpJtqHsj7m3s4qUAA3EYTiml1
         RcZeE0Hm7CulTjv7sdEW5sdjPx+nXybfeWjLOZxocdhADUQdz6Ry1qcD3twvtA/wV+mt
         n8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3wURJ7f8wK/rYX1AWremJ6WWxVIvdF4W4fcHK+urU4Y=;
        b=lUH2GirSjbDs0CFF/je9o0TAtT3y5Tzqw40BFdbav7FsKiAuiD3kHuz3Xud8UnivE+
         8I1rMOBSP6RS7KKACglrssdTQ5e9OJyf/8EjcxypJwF+rMTBP1eIcc+B1lDGMGN1DKLN
         TVXSCTi5VtUTGr8XOg0/EgcnY5I5by0q97jJIy84iUxl8wxernokO3bIpiW98v++KBOl
         EQH15CcPTjEa/X4nyMDPP2StA1xUa8nmZ5chIJ3q6UcqHeJi6MtV6DKSzOoDjZpiw07p
         3fVEwh7ltLmuCwCHJ88p0hF8ezu5/PuNAsJEGlo9mSNO2hYmNZblRKKO2j8PZzY+96O3
         uHhQ==
X-Gm-Message-State: AOAM5319DDMarNw3WVYeL8Sfk4fBd+F8s5eq8yErJ0+AqO3fCBRfc3mZ
	T9xVd7vnh8NIeAaZUW3BYxugKQ==
X-Google-Smtp-Source: ABdhPJyHqPUWM6TLaBadwtJgoFX8sqXAz9turIY6bW9WSl9x0ZGa0cM73mxFnfgICJ1iaqcFQ+3yLw==
X-Received: by 2002:a17:902:e14c:b0:163:86e0:2137 with SMTP id d12-20020a170902e14c00b0016386e02137mr122325pla.89.1653559911140;
        Thu, 26 May 2022 03:11:51 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id z17-20020a170902d55100b0015f309f14d0sm1114861plf.56.2022.05.26.03.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:11:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2 3/5] riscv: smp: Support for 64bit hartid
Date: Thu, 26 May 2022 15:41:29 +0530
Message-Id: <20220526101131.2340729-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
References: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_031152_926792_251F376F 
X-CRM114-Status: GOOD (  12.91  )
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

The hartid can be a 64bit value on RV64 platforms. This patch
modifies the hartid parameter in riscv_hartid_to_cpuid() as
unsigned long so that it can hold 64bit value on RV64 platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/include/asm/smp.h | 4 ++--
 arch/riscv/kernel/smp.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 23170c933d73..d3443be7eedc 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -42,7 +42,7 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 /* Hook for the generic smp_call_function_single() routine. */
 void arch_send_call_function_single_ipi(int cpu);
 
-int riscv_hartid_to_cpuid(int hartid);
+int riscv_hartid_to_cpuid(unsigned long hartid);
 
 /* Set custom IPI operations */
 void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
@@ -70,7 +70,7 @@ static inline void show_ipi_stats(struct seq_file *p, int prec)
 {
 }
 
-static inline int riscv_hartid_to_cpuid(int hartid)
+static inline int riscv_hartid_to_cpuid(unsigned long hartid)
 {
 	if (hartid == boot_cpu_hartid)
 		return 0;
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index b5d30ea92292..018e7dc45df6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -47,7 +47,7 @@ static struct {
 	unsigned long bits ____cacheline_aligned;
 } ipi_data[NR_CPUS] __cacheline_aligned;
 
-int riscv_hartid_to_cpuid(int hartid)
+int riscv_hartid_to_cpuid(unsigned long hartid)
 {
 	int i;
 
@@ -55,7 +55,7 @@ int riscv_hartid_to_cpuid(int hartid)
 		if (cpuid_to_hartid_map(i) == hartid)
 			return i;
 
-	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
+	pr_err("Couldn't find cpu id for hartid [%lu]\n", hartid);
 	return -ENOENT;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
