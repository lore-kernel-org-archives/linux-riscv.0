Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE59C5B572
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMHQzknfcqvfZQ/7H0ekdG58CI6jApygQOdF1cSZaus=; b=HrTm+0wsplKr8e
	edIjFdq2cUYb6zqLhM48Gi4ojjLu7uK2D8nmO5++R/b9l/sJKQZdQZflZXI3wLkamsUdU91sS86wA
	4VSLBggJ5Ao/LOWPIpfKgrMAB5O/LAbSalZYt9pgtC6OGjuVuDqB7rS9IVbzyq3PwMRGOvy0vsgIx
	2BhDc23rKNS15uRmvdLoHClgj2qiQIU4JVUsf+4B8mBVnda7woNByY8z4AJ5F0fTs3Nevr+Zni3CO
	ScOrK5/uqmpCgseGbL6t0VX7e9VvWhGRhtLyIFwbZlyeFzX4deIiUw9CjAeSUlHq+85hvyLhnCyUW
	Ur8vWTKsPU3RvAznGd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUrq-00000004Xcu-27Yj;
	Sun, 16 Aug 2026 07:01:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUro-00000004XcW-3hBg
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 07:01:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8626601E0;
	Sun, 16 Aug 2026 07:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6151F000E9;
	Sun, 16 Aug 2026 07:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786863671;
	bh=6qhxawFRrWwuiVPOyNVYAZ9b5mpiegOTbZA7RhAR7g0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TISlbhDvgTJqS8fWldW2PqgROrYhkeCY1wAyzBIh5B9PwxDD/fkz4Fov+XMJ1C62L
	 lTTNQW9SYgcQTKw3VIJgpJ87hv+/wKj1eDTMF/9tgSDI9jsXfi4MRCAe4Pai61iIZ9
	 s7df9sIPLJinp3OD2qV0230hkmkxPUQEbSOjX2bGRFuY8flwuSiexqp7SFdkBLPP5+
	 IdCVM0mfMRbBVsYrnLaOLg2QDjCeGQ8OzA8cb/OioW6ZXtu1Z+UYqN0DBHhRnb4nsI
	 GPtKh2wguVk2b5t+LwWFKJ741v+oRw6Fb0YtNchC5kWIdhLzF7J4rhgmb4rnAcAcX6
	 1NyJ4rL1bpPUA==
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
Subject: [PATCH 2/5] riscv: sbi: Use IPI_MAX for SBI IPI muxing
Date: Sun, 16 Aug 2026 07:00:46 +0000
Message-ID: <20260816070049.2097442-3-guoren@kernel.org>
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

Now that IPI_MAX is visible from <asm/smp.h>, replace the hard-coded
BITS_PER_BYTE with the proper symbolic constant in the SBI IPI
extension driver.

No functional change; IPI_MAX is still 8.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 arch/riscv/kernel/sbi-ipi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 0cc5559c08d8..eeec178a9b95 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -57,7 +57,7 @@ void __init sbi_ipi_init(void)
 		return;
 	}
 
-	virq = ipi_mux_create(BITS_PER_BYTE, sbi_send_ipi);
+	virq = ipi_mux_create(IPI_MAX, sbi_send_ipi);
 	if (virq <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sbi_ipi_virq);
@@ -75,7 +75,7 @@ void __init sbi_ipi_init(void)
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, NULL);
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 	pr_info("providing IPIs using SBI IPI extension\n");
 
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
