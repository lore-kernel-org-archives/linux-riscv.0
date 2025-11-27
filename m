Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF56D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yp/gOcNVAkNsdIJUcxaC3MHQIsQbuV6GlhXBp8ib2k=; b=nbrAcXhKTlxKMI
	Uz26LPNyiUBPPu2ZcMIgXnp/mzAkaT/2ONR/HOCOl4T54E30AwzTglhMgmp9UJeEX64VGELGtJVvA
	a6raVinUjgLVG3CZHzSd2H1DOXoa/YW+N43vBn7iDJBpBsDXjFyA2SIvOG3P9Z3L2nG9wyOjYgl9t
	0bzOT+5l2NWiuvR/1pZb0TAZbX6l8VgVXbrymbKaMgVawKmr38y8tXbNSCZHvHBNBoNNA+xjUrESe
	kxdvveeTX9odmwSOF1nlbqvvjz2TSE/a2R14Kz5so7u19Vd75nBEWbdWfy52p8voHtFBe0tYYla9A
	NTH6Zqnl6F0ECJJCfySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVb-0000000Gbg3-3mLg;
	Thu, 27 Nov 2025 12:54:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVY-0000000Gbd2-3PGf
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 12:54:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-298144fb9bcso8619825ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248040; x=1764852840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ks2N7WiKrF1vmFIuqsgCKEVR33GasRQqyUpzFrSGTVc=;
        b=QUXcaFlY9Fhe6lhpHZ+ZEntg1TWujMSdKIUQ8K5xjLjlGdQHbPDhokPXB2oX2cgcal
         w9OcxlQE8cw+xv4vLd0OzkSpdQEJNxLjt8OzLen8MIf6nU+4zhPsbji9kTKzB2aBN7S2
         0LRluSfxx6Lx9s3q8AQvk4LCyOciZXyK8FJ6wPIa6myOrSM8Jo172oIkE19e2AfCOoa4
         eVnvGMjp9z+fs8b0kvz78d3tQ3sjfmNZQBDOMn1ThF7ACEvEdwewZ/Yen+ktkLOVHDfF
         Mr2HviGyuU+OmSkkeLUSMu/eehmkRy/xfM5RLuVvCGdztN58FLiUp8Y2HQWhBYb7TRO+
         t89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248040; x=1764852840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ks2N7WiKrF1vmFIuqsgCKEVR33GasRQqyUpzFrSGTVc=;
        b=PxifIJXFeg419xfWbkXluEXSbkXVvSAPYrcNpVpyPkq7Mmq4qaVjcvnd/YedMppbsC
         WzuYMWHLu0Yt7tAYZ/U3WWR1bUwJDlC3LlpSnCqd3GjJ2mA+nDeP8wAtET9AUgn63MKU
         Lyq17AsOyb0D1rzUkkaMglMpG5ukJyP0rIQeFbkyCW7XNMdsek+WG3H36pR9wf/As8X8
         0izkMRCjKpTLxvH1b8Cf5dhZN/qIaIRwq1i+e8nkrE3dDf0HTvm4tFgLCDnknM1vZ8EP
         PbZO3FITYppmWe2tJztKvtfuKmKgodIxagISebo/SsYBleU59yCMiQjz7WRf/YiQZeBl
         /TgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS+5XUnXfr9AhpKbj0goRjNB3xQxvz1URFqqt8SKAtRVg0WFRadBFQUjgexWmM2U5ti/WXGmWh8yyFWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6VAuxuMxlEgJPlEibE7p3IjIuaghip/x6yi75A87Y+S9c4Fu2
	nKrvEas/L1wr6HFv/wYLYVff5ffq4UTDDioWleEoEn9U6Ui90QQdvP1u6jt1iJnaXXo=
X-Gm-Gg: ASbGnctx2JUBz6KIG77bXjqm5ArRqgZhxPOUMZf0mBtSKu3GD3TJ6SNrMClaCnkro+G
	fcCquXenI2ogCkH2cUr4/sMio7tECUcatXKqFyDi4jjO7EMNT/SAffqtuV/PkR/0V7GNOAGuqfb
	gZxIYjwSoy2ytdEz6vJAJtMCMCROlYNRpIhPcHxLffgFKZsy1HXSZ1HZIr4R60PYGHaEW5RrxFV
	bK6lsriOX2RgQQaBzI5b64Qsbk3MaaMgE2rTMTzi73dvOgKZkfAjbMnwPA1JNAVvC6R8qJMTsNw
	1WSUKt9Mrxy2LvgRlLeNHSl9t1wdX1kKSPDsZyF4UeN3s0/3u5/mJQsq2HlgatzbKNnDzufsGH1
	MlvATVuVAr5HRP6UoX+BdA8q8KMX3DqftXIMGl9RxYT80m5qMDMm2FNV94Z8ewYioL1P8qxxmHQ
	NoDHnOj7KbscIxoTFSP2WLPuaXoHMteIL043XlbkobDeEl
X-Google-Smtp-Source: AGHT+IGDuGibd7LowW1oyCK8TgeUaL+QE7qRAlkmjqYkFnpqp1CfVc1mAg7S481yXF2w5bN4beqelg==
X-Received: by 2002:a17:903:1acf:b0:295:3e80:9aa4 with SMTP id d9443c01a7336-29baafa939fmr114147395ad.22.1764248040026;
        Thu, 27 Nov 2025 04:54:00 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.53.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:53:59 -0800 (PST)
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
Subject: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
Date: Thu, 27 Nov 2025 20:53:02 +0800
Message-Id: <20251127125305.89961-6-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045400_925648_FF158E8D 
X-CRM114-Status: GOOD (  10.40  )
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

Use NMI instead of IPI for CPU stop if RISC-V SSE NMI is supported.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/smp.h           |  2 ++
 arch/riscv/kernel/smp.c                | 10 +++++++---
 drivers/firmware/riscv/riscv_sse_nmi.c |  1 +
 3 files changed, 10 insertions(+), 3 deletions(-)

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
index 1b8cf986abbd0..bca95ec0b0f74 100644
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
@@ -259,7 +259,11 @@ void smp_send_stop(void)
 
 		if (system_state <= SYSTEM_RUNNING)
 			pr_crit("SMP: stopping secondary CPUs\n");
-		send_ipi_mask(&mask, IPI_CPU_STOP);
+
+		if (!nmi_support())
+			send_ipi_mask(&mask, IPI_CPU_STOP);
+		else
+			send_nmi_mask(&mask, LOCAL_NMI_CRASH);
 	}
 
 	/* Wait up to one second for other CPUs to stop */
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index add028efd25a0..02e2de2bb70f7 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -58,6 +58,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	type = atomic_read(this_cpu_ptr(&local_nmi));
 
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
+	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
 
 	atomic_andnot(type, this_cpu_ptr(&local_nmi));
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
