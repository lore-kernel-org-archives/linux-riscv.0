Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44951606A33F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Z8BeFfw;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R8D9mx6z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OPaGG059uXAu1J4epxfMUjNd2h01KLpSFLcI0rAIwM0=; b=0Z8BeFfwUpI9TD7yRdyL2nDymX
	PMdd/CTPsAyxUZhEMhvNt1XVlwFoaB/S0vyyZe22O+cTsvCUdW1JlLALUnN/+cvos2ytRHHSzpadN
	gO25B1w/xccTKQVXpQMQpMBkZq4RKMUgEenhpELGqk7Rp51OWXAFMLKAhFA6duhU2oEuhfPqep28k
	x/1bC+G1mq2KsALurcaCkY/sKF5TlFcIPUDotSA2dyHsoOzggOMa4HsIOWTf/tXstR2ZR9iJKd/4+
	65yTnCIK5bEMnxS6/FTULJfSP0OvkzGeyWwqzR2KHbqaBu/y9PAiJmNZiYDVcFVhFG8CdHuAJW7hm
	6+97DYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPxl-000000093Vg-0Ulf;
	Thu, 12 Nov 2026 08:15:17 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPxi-000000093Ue-2xPd
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 08:15:16 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZSMnWkJIamVO8pDMKRsa4dzIAxKB5tL43vgFe5Xu4T8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471312; v=1; x=1795076112;
 b=R8D9mx6zQHUZbbGxKBHh4exu87hLkHXIBeiDham+HISBIpLYPwJ63riDJ5x0JE+yixBWqvA1
 EU7bgD4NYCVPEUJNjRsyM8ePnkBccYshrVHnm01B0mrW8gdnRJEi5YXk3WTGiyrE79bSK2995z3
 9GpXwsHSUewzC1buyaavobHM=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id a198511cfc691750;
	Thu, 12 Nov 2026 08:15:11 +0000
X-Mizu-Trace-ID: a198511cfc691750
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Thu, 12 Nov 2026 08:14:42 +0000
Subject: [PATCH v3 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
 edge-triggered MSI sources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-aplic-affinity-fix-v3-1-943d25cfbfad@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=ZSMnWkJIamVO8pDMKRsa4dzIAxKB5tL43vgFe5Xu4T8=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfSxu/JzzXca81PZ95Pr3nqqx429eG2vKfMX//Oe/ft
 KyUvTi6o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCLzEhgZNm0vqZZoDBeVjy29
 /fKm8ybDZwUH7cQenH2mX1d5l0niIsMfjheLa5T29b5Y+f9n3tTWH6ecbp8Kjf69KCWmRM/QQEq
 PEQA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_001514_931678_9ABD5F76 
X-CRM114-Status: GOOD (  14.95  )
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

In MSI mode, all APLIC interrupts are handled by handle_fasteoi_irq().
For an edge-triggered source the APLIC forwards each edge as an MSI and
keeps no state after that, so an edge which the CPU side drops is lost.
After an affinity change, the next MSI can arrive on the new CPU while
the previous one is still being handled on the old CPU, and
handle_fasteoi_irq() then drops it.

The fasteoi flow also never calls irq_ack(), which is where IMSIC applies
an affinity change that was deferred while a previous vector move was in
flight. Such a change stays pending, and later affinity changes of the
interrupt only update the pending mask.

Use handle_edge_irq() for edge-triggered sources. It acknowledges the
interrupt before invoking the handler. If the interrupt is still in
progress on the previous target CPU, it either waits for it to complete
or marks it pending so that the handler runs again.

Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609f..5aa9607fbd83 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -69,6 +69,21 @@ static int aplic_msi_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (rc)
 		return rc;
+
+	/*
+	 * Edge-triggered sources are fire and forget, so they must be
+	 * acknowledged before the handler runs. The edge flow handler also
+	 * replays an interrupt which arrives while the previous one is
+	 * still being handled on another CPU after an affinity change.
+	 */
+	if (type & IRQ_TYPE_EDGE_BOTH) {
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_edge_irq, "edge");
+	} else {
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_fasteoi_irq, "fasteoi");
+	}
+
 	/*
 	 * Updating sourcecfg register for level-triggered interrupts
 	 * requires interrupt retriggering when APLIC is in MSI mode.

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
