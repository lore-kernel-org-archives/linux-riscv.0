Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D17C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 08:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yI4Y/ZzrEWiIj9rVzccVyEyuGnTyL59cu72ZF5EifWk=; b=rYfOZ2SpO0/Kxx
	LSI8JjWG4rinJbIIHy3lvm5Oy7DbgfPUNLVQ4rWVq8xOQ354x22haYlhaC1GF0NOXE95OPmMmeUeL
	ykJdcIoC46TX/SFTSttiWyXnws9ibfpkQsQ7F0jodvDsxRi8NCdsQrc2AHxKgLCYOr2yuae1V3d8O
	IFFzn2WB7aQKb4ubGQnNMNrbWNmFz8xchJBR+6V991O7RXUK0oHbhKt6MSGAj9motzL3pYBMSEuMg
	k2XdwCx3i/UohmZ8RH2LFkw6J09XFF2TXAmARQtRNmdBQqcMoi+JC8yqtrAy0vbU3U9QoEtHjefxB
	kCG+nq0x0DNg/UKECZ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTe5z-000000079hj-2Zxl;
	Sat, 27 Jan 2024 08:31:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTe5v-000000079gb-2DFI
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 08:31:22 +0000
Date: Sat, 27 Jan 2024 09:31:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1706344276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3I7OJx5NKf289xrERaDLT1wF8RTcX1Wk/OCiBAc6Gtk=;
	b=18TQg4VnhdAfpujoCis6XXFumAyQY/XA4yICkWbb8vFFLH1DAB1sUTpd8YxIZiAbHbedvo
	e21QAAwnfmPI6/9+CAm/Xn9JCufaTiu0L0Ob10PBY4smQ6xRQMUIY9YQhbbpZsXsHLG2mD
	ca1lTz46zkXyMOKoTEhpyR1YGxqPy9Czcp3e9eFiXHvevjuuA11qI62KsROng/er8ga+VP
	y5H/7VcGB4LMPq4oEEl8Ji0lE0ysdaJecx0NXX4yiOXXMpxm+kUJv51CJ7q8fEAafZpM1Z
	VMsSktzNAQA4BD4tEtoscvEnEDiIqUadyL/Y1z6d0xQ7C0pGKWKX8yD+0/y2Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1706344276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3I7OJx5NKf289xrERaDLT1wF8RTcX1Wk/OCiBAc6Gtk=;
	b=K28Qz48WNcKWSyoQpS/7SybGS3TJtuhaR0/z7bCQ1I/ZdbIBYQJeoXyRKLl4neQzlsKB+H
	GmpthLsy0/QJZ5Dw==
From: Nam Cao <namcao@linutronix.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren
 <guoren@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] irqchip/sifive-plic: enable interrupt if needed before
 EOI
Message-ID: <20240127093114.15fdfa5c@namcao>
In-Reply-To: <071142d9-3644-4c62-a99d-40b55bf64406@sifive.com>
References: <20240126223836.202321-1-namcao@linutronix.de>
	<071142d9-3644-4c62-a99d-40b55bf64406@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_003119_746419_82159ECA 
X-CRM114-Status: GOOD (  21.28  )
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

On Fri, 26 Jan 2024 18:31:19 -0600 Samuel Holland <samuel.holland@sifive.com> wrote:
> On 2024-01-26 4:38 PM, Nam Cao wrote:
> > RISC-V PLIC cannot EOI disabled interrupts, as explained in the
> > description of Interrupt Completion in the PLIC spec:
> > 
> > "The PLIC signals it has completed executing an interrupt handler by
> > writing the interrupt ID it received from the claim to the claim/complete
> > register. The PLIC does not check whether the completion ID is the same
> > as the last claim ID for that target. If the completion ID does not match
> > an interrupt source that *is currently enabled* for the target, the
> > completion is silently ignored."
> > 
> > Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
> > ensured that by enabling the interrupt if needed before EOI.
> > 
> > Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
> > operations") removed the interrupt enabling code from the previous
> > commit, because it assumes that interrupt should be enabled at the point
> > of EOI. However, this is incorrect: there is a small window after a hart
> > claiming an interrupt and before irq_desc->lock getting acquired,
> > interrupt can be disabled during this window. Thus, EOI can be invoked
> > while the interrupt is disabled, effectively nullify this EOI.
> > 
> > Make sure that interrupt is really enabled before EOI.  
> 
> Could you please try the patch I previously sent for this issue[1]?

Unfortunately my system still gets frozen with the patch applied :(

I think because the patch doesn't prevent plic_irq_shutdown() from getting
called after the hart claiming the interrupt and before irq_desc is locked
up.

> It should fix the bug without complicating the IRQ hot path.

I can add an unlikely() to help that a bit, because from my experience, it
is quite rare that EOI happens with interrupt disabled.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
