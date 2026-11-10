Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3499606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cvSUXgO7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KvWG8aAK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ySUL2v0X5A9aHYcuSEijImwmmAVzIoLKVdzz+QT008=; b=cvSUXgO7OOpaRcWKlbEcDTeosi
	5hfsnT9Eebqpk3Q3KlAcpq19v/W2lAiNJ3dYulsnLqOZqezaGNVWqNtGBuw7uGSCZ39u1vs+2wntp
	RRfnUF/KcaurWaLIFJopTbvINcLAAsyxndLEuVwaJ/dfwhWAE7kB5hS2pThZC2fN3u0T8L1/pwkWL
	O3F6mvFa2BQVQ4v2jcCxPnqy9p7I677nODffSWs+W8u026y158a5fTBypX+G0QPtRpD4q/6mLg2aW
	fWk1lbtVgnajE4wQvInsfrfPToyNd5rXDnhLs37bQw5cp/RuhnhKJiTCtwzgvwe8mpO+6dXpwg7vY
	1FHfT1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkci-00000003k3I-1EdX;
	Tue, 10 Nov 2026 12:06:48 +0000
Received: from out-83.mta0.migadu.com ([2001:41d0:1004:224b::53] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkcg-00000003k1w-1KoG
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:06:47 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ml9Y2L0WRshHOEyX3Fcfgu4Ny7zTrj4mhFqLWDOSppY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794312404; v=1; x=1794917204;
 b=KvWG8aAKFIcvuNrMws3WpxjIZReiE0YN8vFQN0lb2LJcqj04Be+4cwbXABqn/NDO8/wldul+
 CvSBHRc1BOw4UmabKStFqvqmPE+EZqaPanEFeCvEFWCNTNQEg8pc7R9ko/TEi2EuFl6yVkNuCxE
 jbW1da3Z6t2zVHk2HKtLZiN4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 4ba640714a9ce6fe;
	Tue, 10 Nov 2026 12:06:44 +0000
X-Mizu-Trace-ID: 4ba640714a9ce6fe
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 10 Nov 2026 12:06:29 +0000
Subject: [PATCH v2 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
 edge-triggered MSI sources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-aplic-affinity-fix-v2-1-6c143b8b4e8c@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=Ml9Y2L0WRshHOEyX3Fcfgu4Ny7zTrj4mhFqLWDOSppY=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmfOY6bGMff2F5vf883UFlIKXtLdOTmFENB9n8Oxw+6P
 /Oe2fmzo5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCLZ/xgZ5v9qDrX0OP81Pq79
 qLHAvv2dQkox0XaJi/9kMP/899C5mZHhm6ix1y/1Y3vOdvp5Xftcr6Ayq//SGX7Zqqhri60u1K/
 jAAA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040646_540687_26C9C8DD 
X-CRM114-Status: GOOD (  15.01  )
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
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609f..44f0df83f93e 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -69,6 +69,20 @@ static int aplic_msi_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (rc)
 		return rc;
+
+	/*
+	 * Edge-triggered sources are fire and forget, so they must be
+	 * acknowledged before the handler runs. The edge flow handler also
+	 * replays an interrupt which arrives while the previous one is
+	 * still being handled on another CPU after an affinity change.
+	 */
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_edge_irq, "edge");
+	else
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_fasteoi_irq, "fasteoi");
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
