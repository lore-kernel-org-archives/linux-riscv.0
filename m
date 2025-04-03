Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E59C3601A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 15:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7W10qjChf7TapEu6RTcCANsbKQ7lvPmUmmMhL99RX4=; b=RL27VRQcuj82uu
	/xs+7YGeEx5pBnED/ZUFdjESfE4q6++iTg+6O7oFtDPQxlorVd6RJrhc7b87MUKYbybfG7AybmdXE
	L95DsrotT0XyRJHQmc1NAauAATV+OXwYy6f9dvbKnhIpSAJ0xBHpz1wADC6ykkSjIeK7OHG956t8P
	GTT2IJv4IU5GHRPwwyAiOdFiQ8I7umLUSr57WRtkm03+s46VE7jOh084QDeOBa0Z3mKAS+mEpIOWE
	R3xr4bueTdqbujQUqGgqn9o1n+5vqSu6BGgXVbASTwAGq833bewekmxqrPn7ovHR7HZBhln6OKIVz
	ThQQ0cNoSErdNnhy2FIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0M8U-00000009Arl-34iF;
	Thu, 03 Apr 2025 15:05:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0M6h-00000009Aia-0SKv;
	Thu, 03 Apr 2025 15:03:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743692627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EHbCePX24dh6KDJ8X+RFQ5xBFtUQ6++YcFww5RU2/aM=;
	b=cAWc2c6X5BJpIpgjOXnZKqynoDf4CCrEuzivOkx71QQg/6/melJAeT2Y0DX7p/hlhj9uPf
	7bUp6mjwtjQlKwFOlixaVLeAx9I7JRykqitt+QPbBUWL9I3StpxaotwDB9q30gHnf7i9NA
	LDhy/Pk3MgTqW6UUar4Eky5xJDAbbYJmE2ijdsz4KBB/jkHPNjncBzn7JE16phj7GPD6+l
	WrLvwzbPTBqlF2vplEep3bug91J5/tFuP9szoX1LDmvvJpEK9epMer5BBawdO8X1yOPr54
	WKujMmMS2NAHXP52D2ZQgKt+ppsKgPL9R9PHxynKL2RTQaFBujamNzGVP/Bifw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743692627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EHbCePX24dh6KDJ8X+RFQ5xBFtUQ6++YcFww5RU2/aM=;
	b=aMNLw6BiyQBB/EaqECgC7EhDDvNwWSgmoZfQeRO5JsW6QuiIu5LwonVANOgI6USyH5VMS8
	d0alF73jquU26hDA==
To: Frank Scheiner <frank.scheiner@web.de>, apatel@ventanamicro.com
Subject: Re: [PATCH v6 04/10] genirq: Introduce common
 irq_force_complete_move() implementation
In-Reply-To: <667d272f-2b51-49d6-84ea-1156027e00a7@web.de>
References: <20250217085657.789309-5-apatel@ventanamicro.com>
 <667d272f-2b51-49d6-84ea-1156027e00a7@web.de>
Date: Thu, 03 Apr 2025 17:03:47 +0200
Message-ID: <87plhtuw18.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_080351_285860_C132B956 
X-CRM114-Status: UNSURE (   7.40  )
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

On Thu, Apr 03 2025 at 15:13, Frank Scheiner wrote:
> this change, specfically the introduction of irq_force_complete_move()
> to `kernel/irq/migration.c`, strangely breaks our builds for the hp-sim
> platform (i.e. Linux/ia64 for Ski):

arch/itanic has hit the iceberg and sank with the release of v6.7...

> So I guess, either the requirement in `linux/include/linux/irq.h` needs
> to go, or the use of "d->parent_data" or the whole of
> irq_force_complete_move() and its use needs to be guarded as well.

Guessing is not a really good approach to solve a technical problem :)

Thanks,

        tglx
---
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
