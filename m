Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2004C5B572
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 07:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JidCgyR7N2AHwIeO1qPh5+ip6Ao0Z2QOQgWjvU0WhE=; b=OeaX5/NdV/96Mg
	nhNw8Vbih8rr34utehk5FYZsTRe5gYy49kvgoC38rAbbBKEw5YBzVzQSaRlr19G4CI/loi5q4gwFz
	xkcjaWmvMimvWutsC95egfWASPfgarkckpiaWn+jlpqrqTS0dQlovanrtZBj7tab4wsMuAipO2eav
	/U+LOOy2RCUmaVufSBrCGQDiXyLcZh/hC/E4QCM3sF8S21DH7UyvAa4S8NdVs73rLA9NHP6QNpCN8
	phJGfP2oy6yktD+vnPUfgwJG7dQkqa9f7/rw5qjnWD8YJ9sZfKAi3TaMiy+Q3UxTPS5q2dd8AFDXk
	agm6y/JVpCiH1B8AwQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUs3-00000004Xgo-3UJy;
	Sun, 16 Aug 2026 07:01:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUs2-00000004Xg7-2K5h
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 07:01:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0562860A58;
	Sun, 16 Aug 2026 07:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01FF1F00A3A;
	Sun, 16 Aug 2026 07:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786863685;
	bh=dB/jeR1Y8CYCi+kLcLnNsF3XST9sa8hY/+IQpCFYcjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jxHMRhEpDraNs5qWgyF8Y0u6HTAgxoXCL4aYX6a+rBNvZ31DGd9MOxFD48eNOMs5u
	 RPVv4DCD1qgI4dM4tEpsJzKNOuuD2BTqyS2kLyDbx27cg2JtMcI4roWo3cboYI2W6y
	 OMxq4/0SNEsk93/nbixuaP4FOJZvLrXnsb8NwlKfQM94EtI3P46YYB01BaUVBWrOdq
	 z1/elxmirB5edLLFD4S+AjnmMsVtq+TsI1cH3OW6kUVD0y5ytorJz4+X3B7VQTKvym
	 IH3TCekLNnbS8yUE05SVqLq+7MvpQZMeLcE24CxUyFgVcswiOVR3RytcDxrazPLS+O
	 uIAHZf3r+PkOw==
From: Guo Ren <guoren@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	anup@brainfault.org,
	hui.wang@canonical.com,
	samuel.holland@sifive.com,
	"GUO Ren (XuanTie)" <guoren@kernel.org>
Subject: [PATCH 5/5] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
Date: Sun, 16 Aug 2026 07:00:49 +0000
Message-ID: <20260816070049.2097442-6-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816070049.2097442-1-guoren@kernel.org>
References: <20260816070049.2097442-1-guoren@kernel.org>
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

IMSIC was defining its own IMSIC_NR_IPI (= 8) which happened to match
the architecture's IPI_MAX. Now that IPI_MAX is exported from riscv
asm/smp.h, use the architecture constant and drop the private define.

This keeps the number of multiplexed IPIs in sync with the rest of the
RISC-V IPI infrastructure.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 4 ++--
 drivers/irqchip/irq-riscv-imsic-state.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 12efd241ce88..823f5f2ecb3d 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -67,12 +67,12 @@ static int __init imsic_ipi_domain_init(void)
 		return 0;
 
 	/* Create IMSIC IPI multiplexing */
-	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
+	virq = ipi_mux_create(IPI_MAX, imsic_ipi_send);
 	if (virq <= 0)
 		return virq < 0 ? virq : -ENOMEM;
 
 	/* Set vIRQ range */
-	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 
 	/* Announce that IMSIC is providing IPIs */
 	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..878cc192ccec 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -13,7 +13,6 @@
 #include <linux/timer.h>
 
 #define IMSIC_IPI_ID				1
-#define IMSIC_NR_IPI				8
 
 struct imsic_vector {
 	/* Fixed details of the vector */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
