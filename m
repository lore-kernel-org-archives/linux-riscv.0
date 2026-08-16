Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F97C5DF74
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUdWQxpxTMTN8ewvDtR6NiCgRHGrg6FWHlmGPgDSbMY=; b=gth9F+u6x7rlu2
	wjNj3UMoaiJk/1VobLzGJTUhO4KNXdssq7wgSuFY063cqEoJXwc7eIxjSadb30b/I9D7JdYTbs2vP
	mMS6UaYNcvmgKJ8mTFIQu2fuwlj8mH2SYQvdvLtsdBUOb0BDD3NDCXcYLIBAXXFpphDFVQWNjC4Kk
	nsNFodUr2H7zfGRE1vGcu5sfTZ4lxtOp/+DRDnKcKIbdbFyD+iqTz8sX9y5a0H2f3F/skeckrUUW+
	b1apYUOXv2eoFkTOCif6gORX2N1UIBHK4Fxe/SgOnTKPnMH6UdB/T9C0al+9v2qZ3oOq3nHrnxf44
	+J+vnJLC7iTts+uQ6N2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUry-00000004XeU-37nq;
	Sun, 16 Aug 2026 07:01:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUry-00000004XeL-0tUW
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 07:01:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A703960120;
	Sun, 16 Aug 2026 07:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D681F000E9;
	Sun, 16 Aug 2026 07:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786863681;
	bh=LlOcdIlR/UGWGcEjF0DyvDvYmc+/0am7NsuqSYJwMus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KKcb1R+Xwd4GvUUSNnuZzdkD3oUAdGwfW8N+3N3NxtTn1PnvshNzfZNLmACHZcQkJ
	 /H7iN29zcbP/2ZseOjXPbB4VANCJQ+dMjtpGAg7910jHP8Xew/fo0wyCS4jzi2E0aI
	 ezKKUmep86SPUxBUR5tDFwLkasA65HL3Op7496gyJZ6zOjT9uGl/MFr+F0CXzr8Z61
	 5zi4CuBS9O9LLtMLr5y4UByw6qioMeHATuqONMecsAARzBtSDmW8M5TCzlRF1WyATd
	 gZ3NdT8Vnc1vndK01nlASHAfbhkdYYyxXlGZCyavBFv7+J21mAPuKJmeeZ2TYoJY5f
	 NHLhU3cN2s4bw==
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
Subject: [PATCH 4/5] irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
Date: Sun, 16 Aug 2026 07:00:48 +0000
Message-ID: <20260816070049.2097442-5-guoren@kernel.org>
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

Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the constant
is exported from riscv asm/smp.h.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/irqchip/irq-aclint-sswi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ca06efd86fa1..5e010fc401f7 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -138,7 +138,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
 	}
 
 	/* Register SSWI irq and handler */
-	virq = ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
+	virq = ipi_mux_create(IPI_MAX, aclint_sswi_ipi_send);
 	if (virq <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sswi_ipi_virq);
@@ -152,7 +152,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
 			  aclint_sswi_starting_cpu,
 			  aclint_sswi_dying_cpu);
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
