Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34625C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3Ru3IgErXyyAIdxPGP1vOiy3XUmGIbVRhHyVIFu4Lo=; b=HMaqUT7fAuVfGd
	wsRt4INVKs80T1OTWj4HBdiXORPnH/2xjD+2LogWD8v2dBAuKf3JirYIPpb3JYALtsZZiKJsUColE
	nZ24oVbpxRVtYgnv7BYP3YZ53Wg2NwnC8PDbsGnp5vcFzNF6TTt9PW2B0nIrlT7VGGGf2AzoYs/UU
	cvsmk6X+Lz772yUsulnZyRuRmyU5Yp6MXgPRDOCSZDWyAVFZkOmkWBMrvO7PQUM3fLW4ipnqduZSH
	qcLvdVGcccQpZQOQD60crB1FpOVuwNpDeypGdrAPoJSM3y0l416GDrg/p1j9lFTzxBHRbtHai/krT
	fVP0fU2uoAWO24umdsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Xx-009DpY-Mz; Tue, 29 Nov 2022 14:25:17 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Xl-009DiQ-BP
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:25:09 +0000
Received: by mail-pj1-x102c.google.com with SMTP id t17so12810160pjo.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXLvXXdTgugvaqwC5VnS0gtZiRjZW9Lq1RMlH39mGsc=;
        b=jdsucmnVILuZ3Qemss8/fjATR1/LMZxJMMNLJzvghhxXWtVwdiyQ679xMAD4/YdU+r
         fFBe1Ho2LUOt7gZAlFMAh75XXttpn2CJEfh5fDXZvj11/242xCM4SoMZHdkCtY0rRq0u
         liunwBbiTXwg2pFUfG4OJkTii6i0QZYZ83PJ1+/AGUabkpBaBowzctSJRsSyH1vmsPX2
         fwokAj7ss5ZGxsiZ5rAD+KeKxKI5YS1Tq4F3XUI8tasvBTyiWaYJN1Og1FPm6Z8jHcc1
         FopsC+YN9vai+YUeZafeP7R4MB2B5gIQtS5IKA4bx6TCh+Vv7gctHuQCmX/DLuR1eD2B
         peFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXLvXXdTgugvaqwC5VnS0gtZiRjZW9Lq1RMlH39mGsc=;
        b=OA0gOjR8kdlBnqMr8cWnp/ikxAjicn9SAckLhb0FnrQIF4OEdt1nafcVbQJFR+m56C
         9up9xGLcOk3oyNIIdBgXQ0lM1lqnRsFuQqQ2BWmn/vhc7+K0oUNb04OxfWoIZ5UoDtWu
         Xs/s8O7OYbvaUfgKGlOxe8P8fJFDhymvZu6bwXwWcgocMOfhA5vimBDPIA/KTSyA8Z/P
         eOM4zJI20+aGdjOwKtojsd9DQdYR5lhQqHP1S7ib/QF53C9NRgjnWMz4kIhmVXXBvxbG
         wyom/SBnxH5Mmk9GVe1+reRr3jRW/wZQ78l1r+h8ky5mKW6YZgjL1uJItbG4FL12IP0I
         HvoQ==
X-Gm-Message-State: ANoB5pkdJqlEy1kQLSyWPmFrnbfNjHIVjRUe4IfYnOCtFuYJJK5SlyuU
	mhLJstv2pL3JHV/5mONXiLYKmQ==
X-Google-Smtp-Source: AA0mqf6zpsQVlYbUz71/pV/CIhxdNR/fGGYGsGYYapd85XiiSvvt55Pl6nwPzz5JBk2M0uJFy0cHYA==
X-Received: by 2002:a17:903:31d5:b0:185:4e4c:3483 with SMTP id v21-20020a17090331d500b001854e4c3483mr39081193ple.163.1669731902202;
        Tue, 29 Nov 2022 06:25:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b00176a2d23d1asm11039076plh.56.2022.11.29.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:25:01 -0800 (PST)
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
	Bin Meng <bmeng.cn@gmail.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v13 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Tue, 29 Nov 2022 19:54:43 +0530
Message-Id: <20221129142449.886518-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129142449.886518-1-apatel@ventanamicro.com>
References: <20221129142449.886518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_062505_461755_F7998B2E 
X-CRM114-Status: GOOD (  10.55  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 8 +++++++-
 arch/riscv/kernel/smp.c | 2 --
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5c87db8fdff2..ac99a70ead6a 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -646,8 +646,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
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
