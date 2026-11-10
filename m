Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A75606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fP5tt1Sc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XShnS3CP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZivcSYTozftrjnz68lzANXwKNlUdE33po0VSL2GMcPI=; b=fP5tt1ScjQySxTQmgi7Iv5ZSSR
	dGvdF02vESr+jcVHXjgjwrAU9kcorSbDG2sYrhphf+dVSpWVX8Ll2fweBqb/zf9/lHxVJ1sk5j2rS
	7uTapBJWkSRK80KVFqKwmgeWFH7Hf4xKWU5quwhiZ1mQbzwUh/IZv4W4d38fMROjSIAQvLKj8u+g4
	iA5QW19KSPkB03LqVG+BVBlph0x6r+TribKLAWji/A+bWmUDuyCsrDvV/n5TBnKhbmuT9Ktr63Zwt
	aFHnL5LMMThFzxIO9VLjf+jFJ93icEe4RbWlx1pwT675FbBR22van1xGdzqRezNqvI4XWb2NB82bQ
	tZipgHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkcl-00000003k4O-1c3W;
	Tue, 10 Nov 2026 12:06:51 +0000
Received: from out-89.mta0.migadu.com ([2001:41d0:1004:224b::59] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkci-00000003k3A-3nZf
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:06:50 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=B8vP+nfvf+L5pSvxIzqaD3WoBVS7IeYmJsXVBIxFPvg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794312407; v=1; x=1794917207;
 b=XShnS3CPjuawOXPiL7E9K0OUeg3/G7kd1rBhMcwzz6vDnxNtMZeG4Eme0IyZIsj+z7oOLEt/
 7bQVM1d4+98jvPtZszTfrxVitvkacKIeAHMubTbVZSL14iDIdogqAjzAZtPUNT1VN8qr85nQkwq
 Wb18Ext9kNX+a6YOXkeTjGI4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 4bd8311dc589fd4f;
	Tue, 10 Nov 2026 12:06:46 +0000
X-Mizu-Trace-ID: 4bd8311dc589fd4f
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 10 Nov 2026 12:06:30 +0000
Subject: [PATCH v2 2/2] irqchip/riscv-aplic: Apply pending affinity changes
 for level MSI sources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-aplic-affinity-fix-v2-2-6c143b8b4e8c@linux.dev>
References: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
In-Reply-To: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2720;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=B8vP+nfvf+L5pSvxIzqaD3WoBVS7IeYmJsXVBIxFPvg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmfOY5fKZm5aKVk/v65+zxmrcu9/9f4w2G9s2wFc50kZ
 proKLfO6ShlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZhIy2mGP9xLj8gExJWKpsx3
 0dtS3d14bqVsgBTH+ikzaoJaI5aey2D477dnY+Z3S7voTXLbxE8azChZUaQft8TwsME91hNSEQw
 fmQE=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040649_110424_A421DBCC 
X-CRM114-Status: GOOD (  14.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

IMSIC rejects an affinity change with -EBUSY while a previous vector
move is still in flight, and the IRQ core then records the new mask as
pending. The change is applied by irq_move_irq() in the IMSIC irq_ack
callback, but level-triggered APLIC MSI interrupts are handled by
handle_fasteoi_irq(), which never calls irq_ack.

The pending change is therefore never applied. While it is pending,
later affinity changes only update the pending mask, so the interrupt
stays on its old CPU.

Use handle_fasteoi_ack_irq() for level-triggered sources. It acks the
interrupt before invoking the handler, so a pending affinity change is
applied on the next interrupt, and the EOI retrigger then targets the
new CPU.

Fixes: 58d868b67a9a ("RISC-V: Select CONFIG_GENERIC_PENDING_IRQ")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/Kconfig               | 1 +
 drivers/irqchip/irq-riscv-aplic-msi.c | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..a639a0c2f3d2 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -645,6 +645,7 @@ config RISCV_APLIC_MSI
 	bool
 	depends on RISCV_APLIC
 	select GENERIC_MSI_IRQ
+	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 	default RISCV_APLIC
 
 config RISCV_IMSIC
diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index 44f0df83f93e..0e71b427da34 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -75,13 +75,16 @@ static int aplic_msi_irq_set_type(struct irq_data *d, unsigned int type)
 	 * acknowledged before the handler runs. The edge flow handler also
 	 * replays an interrupt which arrives while the previous one is
 	 * still being handled on another CPU after an affinity change.
+	 *
+	 * Level-triggered sources use the fasteoi flow, but still need the
+	 * ack so that the IMSIC parent applies deferred affinity changes.
 	 */
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
 						 handle_edge_irq, "edge");
 	else
 		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
-						 handle_fasteoi_irq, "fasteoi");
+						 handle_fasteoi_ack_irq, "fasteoi");
 
 	/*
 	 * Updating sourcecfg register for level-triggered interrupts
@@ -181,7 +184,7 @@ static const struct msi_domain_template aplic_msi_template = {
 	.info = {
 		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
 		.flags			= MSI_FLAG_USE_DEV_FWNODE,
-		.handler		= handle_fasteoi_irq,
+		.handler		= handle_fasteoi_ack_irq,
 		.handler_name		= "fasteoi",
 	},
 };

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
