Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56362C38145
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5ZXERW4e1ZjR9cKYqRJabUHSnR2I1ZIqBIuWykrTnc=; b=zl0OztjzvypWqe
	mHouA1m/SGcgadxWdQuXqb481lCLK9AzbIP078g8CzYddr6x4vl4/P8oou2YJVdRUxX7a6ZEeeSiW
	F1Nvn4HLayr8T/gPu5WDuoDUFJybZBWM4ITAci4V3ty1hdLjg0w0AH9wU7hos85QeQz6JG3hY5Mno
	sIf6yEiF/XqNVYdKxe7SHGnZxjS3Xw6KNbcj3YgppMIiA8zFt0sb6OwAp1OWeMv1moJKWQGJJh5C+
	sIVwaoe6zmspxMAQwT1dThTJYr2HpOmDku90cLfLpLX1S7mbtC9UCk+QoeyGQiJWaAhiWTCuQpVLj
	IV6MpQSvoIgLqu6wQANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVm2-00DP0z-9F; Sat, 03 Sep 2022 16:13:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVm0-00DOyD-A3
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 16:13:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id y2so1138222plb.2
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 09:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tQCr/IgKCdRHY8LSP1T2xhus9TIrH4sruSlDTlO3guE=;
        b=dp+XfjjPEpFz8l3g+2HRPu6/Oxxe7BWROkQFfLregsYeoPEgBgNA9LY5Wx17C2B7r/
         uVnHBAul6Kfkuuh/+ckgiUFUDg/eIIXDw9ShHVNqOTGgtMLjQ7S8xtSI19lYjbrAot4N
         9/ffzt+I37vNqdvdkeX6QLwCniN+Evxbt5C8aFv3BYfSXpcnyX/nMwgL/JIGwTEeTgIL
         49cUUOkn9dZbcWnm/wfJY/1MLpYY0BS8Jl6VVvVCw7N8uCwXm9/osbwHWr89vVpRAz51
         kUXbdtLbyAZwilcEPudiQfgAq+ZjYvtHbjVCs/aDRe3XIgdXZbKgPa2VXDN3qdFCgPFt
         W2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tQCr/IgKCdRHY8LSP1T2xhus9TIrH4sruSlDTlO3guE=;
        b=jy+7ikSoEdQgSqG73ArnyG6PU0k+I/09uZNltA40JbyshN8bRsyYdTebmU6qucVteT
         tIzMKAyTw4x/+v4NPNuuV3Miu4K6koLgjFiwaeHM1vDo63/Vlo4U4iYIoTset2P7fnsb
         6NGLoBUJ5Orl2K1ROq+1hB+91Vid8+VjzVG+vScPJRKj2X3z5xTjmFGDR1UH/Cc0UtRt
         W7yVTj1UOwBOy7Unbumc7eRJsvgLRmVtoVTs7FYqGEnfHXByqtnUeGmiGKRsOkDHJ6Dz
         2GyQyyLTh4hDq8528cSnTaW9QMCvqQ3nrVkL7GpmNcKCNpsHurvhRrUd9r2Oyq1uTYsQ
         0NLw==
X-Gm-Message-State: ACgBeo3WTO2QkcH8bN+SN0Eocqotkv7t69TvDagCDBPYV8pCct8FAiMf
	41fiZwSyUFnJN36/lKe4fU1J+w==
X-Google-Smtp-Source: AA6agR7gAEvd9lsPIHkr5H0TaXFmE4KOtqHNX4fnAfzULbOARkqHXBkFV681PeajUyNHenoxCI8JEQ==
X-Received: by 2002:a17:902:8347:b0:176:6597:85f0 with SMTP id z7-20020a170902834700b00176659785f0mr8999030pln.169.1662221609329;
        Sat, 03 Sep 2022 09:13:29 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.86.115])
        by smtp.gmail.com with ESMTPSA id 4-20020a620504000000b00537b1aa9191sm4166738pff.178.2022.09.03.09.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 09:13:28 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v9 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Sat,  3 Sep 2022 21:43:03 +0530
Message-Id: <20220903161309.32848-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220903161309.32848-1-apatel@ventanamicro.com>
References: <20220903161309.32848-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_091332_366009_E0CC923B 
X-CRM114-Status: GOOD (  10.54  )
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

The software interrupt pending (i.e. [M|S]SIP) bit is writeable for
S-mode but read-only for M-mode so we clear this bit only when using
SBI IPI operations.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 arch/riscv/kernel/sbi.c | 8 +++++++-
 arch/riscv/kernel/smp.c | 2 --
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 775d3322b422..fc614650a2e3 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -643,8 +643,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
 	sbi_send_ipi(target);
 }
 
+static void sbi_ipi_clear(void)
+{
+	csr_clear(CSR_IP, IE_SIE);
+}
+
 static const struct riscv_ipi_ops sbi_ipi_ops = {
-	.ipi_inject = sbi_send_cpumask_ipi
+	.ipi_inject = sbi_send_cpumask_ipi,
+	.ipi_clear = sbi_ipi_clear
 };
 
 void __init sbi_init(void)
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 760a64518c58..c56d67f53ea9 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -83,8 +83,6 @@ void riscv_clear_ipi(void)
 {
 	if (ipi_ops && ipi_ops->ipi_clear)
 		ipi_ops->ipi_clear();
-
-	csr_clear(CSR_IP, IE_SIE);
 }
 EXPORT_SYMBOL_GPL(riscv_clear_ipi);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
