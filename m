Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B015C3601A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PoOUsFCCFFLmrtVJggEhkfdvNdqGQElpb73kcUS2f8=; b=tc8Vf26ikWQiQx
	j+HMB0HdO1jmRWjdRziHROFnh2RV7HOoF4nI8BvZ8saY7GsIXxMITuq13SkF4jUM7hthd4CbUMMAy
	ogq3ZEqIGFgOJv67H7ZwooleAHbtbqNmvJQs13Lnxn1C1z5p6BwjRSxonlV+O+m2Ncz7INYp3yvTT
	C+Al9ocrtDGNhBo8qovW1rkWG7MIBzRZnPtp22+aZEoPmQODEqZc32Tn7ixs1GMZ0sasph3gboZUs
	GGGB201I0l1PPko/MU4JHGtz1vIgS5ozxZCk6ECT/QFRq9bVpOL1VaFBGs3goNrnO2KS3sBKCD2bU
	ByI52/PXuUSUJM3BIG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iVl-0000000C4xX-2x6W;
	Fri, 04 Apr 2025 14:59:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iOC-0000000C33T-2p75;
	Fri, 04 Apr 2025 14:51:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743778280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ki7u9cfXUyQNld/a1MIArILl2CpoC7PHwvBk36BVlsk=;
	b=oCFQjRbdDC64UiVAB8XTsODZJtPQRW8QwstyLQ24xtMSqdK3xQzaVS9MmjUhAHeOGgnSIf
	MENe7aGCyGdj+uU95oB/OEC9nazAb0a7u04t2GpgBek84RUEOhTphFwH8+PaIpr38HM2SA
	5K6o26RNsVz5fK20Dk5xHAb+3AOhrLmbgK85qWloI2Ly36oaFbNiblAxtWZSdIKkrvMjRa
	O0WY6XY0k8RmoQCTDCTr3zrGgg2joq5p0Qhq/D+yRxKr1thkv6tpZFq0E1eadcKrnRoJNE
	CW5Ne7NTG7VePTkaTGB+6qf/W738lGRE8Dmit4cQ4dNkuy3JYNN5tjpt6RwcVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743778280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ki7u9cfXUyQNld/a1MIArILl2CpoC7PHwvBk36BVlsk=;
	b=rIh6e55KM2pp2K0N0UFeNgcRmAHMNzgV6U/rG+M1JXj/scAulduj5+Qof6daIkGohPC2SP
	n+pWkJBuf5yu19Bg==
To: Frank Scheiner <frank.scheiner@web.de>, apatel@ventanamicro.com
Subject: [PATCH] genirq/migration: Use irqd_get_parent_data() in
 irq_force_complete_move()
In-Reply-To: <703d6f83-f054-48ec-a6da-6d0bbb9e65d4@web.de>
References: <20250217085657.789309-5-apatel@ventanamicro.com>
 <667d272f-2b51-49d6-84ea-1156027e00a7@web.de> <87plhtuw18.ffs@tglx>
 <703d6f83-f054-48ec-a6da-6d0bbb9e65d4@web.de>
Date: Fri, 04 Apr 2025 16:51:19 +0200
Message-ID: <87h634ugig.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_075124_852353_66DEF42B 
X-CRM114-Status: UNSURE (   5.37  )
X-CRM114-Notice: Please train this message.
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
Cc: andrew@lunn.ch, linux-ia64@vger.kernel.org, imx@lists.linux.dev, dave.hansen@linux.intel.com, hpa@zytor.com, linux-riscv@lists.infradead.org, anup@brainfault.org, gregory.clement@bootlin.com, x86@kernel.org, sebastian.hesselbarth@gmail.com, s.hauer@pengutronix.de, bp@alien8.de, paul.walmsley@sifive.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, atishp@atishpatra.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, kernel@pengutronix.de, maz@kernel.org, ajones@ventanamicro.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Frank reported, that the common irq_force_complete_move() breaks the out of
tree build of ia64. The reason is that ia64 uses the migration code, but
does not have hierarchical interrupt domains enabled.

This went unnoticed in mainline as both x86 and RISC-V have hierarchical
domains enabled. Not that it matters for mainline, but it's still
inconsistent.

Use irqd_get_parent_data() instead of accessing the parent_data field
directly. The helper returns NULL when hierarchical domains are disabled
otherwise it accesses the parent_data field of the domain.

No functional change.

Fixes: 751dc837dabd ("genirq: Introduce common irq_force_complete_move() implementation")
Reported-by: Frank Scheiner <frank.scheiner@web.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Frank Scheiner <frank.scheiner@web.de>

--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -37,7 +37,7 @@ bool irq_fixup_move_pending(struct irq_d
 
 void irq_force_complete_move(struct irq_desc *desc)
 {
-	for (struct irq_data *d = irq_desc_get_irq_data(desc); d; d = d->parent_data) {
+	for (struct irq_data *d = irq_desc_get_irq_data(desc); d; d = irqd_get_parent_data(d)) {
 		if (d->chip && d->chip->irq_force_complete_move) {
 			d->chip->irq_force_complete_move(d);
 			return;





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
