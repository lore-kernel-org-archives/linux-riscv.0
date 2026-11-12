Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6CF606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EdgV8m4q;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AnvzJ1ZF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kawARf6kUS3kx97I21TRnsGsZhfYOnxVqrCAEsO8lCc=; b=EdgV8m4qZr1ZRHQnBpzZKr7Tz2
	DKBkugueav/85YQGxbc1RBb1Px+Oi47J5/mVXaC8slukAOZWWrGbIZ4xzbHJmkt0i4Ic2FdOVi3/y
	CvaLTvIWtByZWKsz4AFIWxzfXs7UxqqEGRoAE9RNSomtFnRH0tvao57Htcrv/cvmLR6rWywtygGvZ
	YUxrpZVhCUtvdszJZ0UXsoTQE8y4YAGId62/SMbEPqC38q5cbRJV4oc/ZQaNNfXIK1GtB1kxTGN4Y
	UZpA3KHL7KdeTnS/8JwXCdeDT/OiEjvWsxh8TzyrE4GHsgAll0rStFRnyGaP1LVNaJH81oYfCpNdw
	W4ai9/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPxw-000000093Y9-0yS5;
	Thu, 12 Nov 2026 08:15:28 +0000
Received: from out-231.mta1.migadu.com ([2001:41d0:203:375::e7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPxn-000000093W8-15Ik
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 08:15:23 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=sOgtWAxcrlGbQSoX1V5yIO89uZD0ppP6b0dzshzQZsc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471317; v=1; x=1795076117;
 b=AnvzJ1ZFCaCiZnIDtP1SZ+ImD/TpS6sCyMtYC5n3CFRJqvwBimRi6F2+fE96Mzx5aW0m1H50
 08XHc86yjCchFn/DHCDkZNab4AbGyYrvvsVXT1XEvJlgPFbcMeOmNXIQfiSSa0thk/fewpLBcb4
 bb0eWUzCE+GMAiM6erXd4R40=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id d04481d91be052fc;
	Thu, 12 Nov 2026 08:15:15 +0000
X-Mizu-Trace-ID: d04481d91be052fc
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Thu, 12 Nov 2026 08:14:43 +0000
Subject: [PATCH v3 2/2] irqchip/riscv-aplic: Apply pending affinity changes
 for level MSI sources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-aplic-affinity-fix-v3-2-943d25cfbfad@linux.dev>
References: <20261112-aplic-affinity-fix-v3-0-943d25cfbfad@linux.dev>
In-Reply-To: <20261112-aplic-affinity-fix-v3-0-943d25cfbfad@linux.dev>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=sOgtWAxcrlGbQSoX1V5yIO89uZD0ppP6b0dzshzQZsc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfS5vsPBxTf2U+i7f0VfvNnhT69+J0683+CR+F1ywyf
 HfYdN3ljlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgImcfMLI8Kz1jhDD/xhGWes0
 X9/l6tcMhCc2NLu8zWOyupC6JNFTkOGfscHKrKWLbfu4Yrd2rKs+m32xPiqqteWcpEj0O+Xg0uP
 MAA==
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_001519_455307_9A789D76 
X-CRM114-Status: GOOD (  14.22  )
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
index 5aa9607fbd83..7a8e569002c1 100644
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
 	if (type & IRQ_TYPE_EDGE_BOTH) {
 		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
 						 handle_edge_irq, "edge");
 	} else {
 		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
-						 handle_fasteoi_irq, "fasteoi");
+						 handle_fasteoi_ack_irq, "fasteoi");
 	}
 
 	/*
@@ -182,7 +185,7 @@ static const struct msi_domain_template aplic_msi_template = {
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
