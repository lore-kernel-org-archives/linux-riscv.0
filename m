Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130D4C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDZGwGtpRHBcnl+z5fDV4x+mQhqyBkB9QBrGYM1oJo0=; b=LMqCXyTryQrS9o
	R5tYfX2OOCZpewf3bhbD8ZcFMGePFAg73+2J76mIt4rbkU9YDBWGnPfiLlsC7yMCNmQ3GqQu6W8wQ
	M1AyvrUY11KwOkN6Dj/VSf6ZKR3xXp+ZL7N4Zx90BSeAQ2RIlt5XxsEqeooeY/hWdpfie1N/U55dF
	3goWmFocKIlWaiEU643+qaWt4/x/hNwpS27gyYH29/GfOmDVLFnRz/xBULgV86EpcBoGRiJRnTX+6
	9ONJpm4cXfv7zMdLFUyPCzfYVsBRIdEURy0dFHKOJE9+6H3qJUt2aOewyHeO/KPuz89HOoICKVcCZ
	yrUwREKeq4wKD3lDCyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRgp-0000000CQps-2aP9;
	Sat, 27 Jun 2026 11:59:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRgn-0000000CQp3-2ByW
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 11:59:14 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782561551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zz7muMR2y2m8wMPeJd2fbbBgpyba86ouaGupG4x7Onk=;
	b=OJ2v7SaqZ6p2uQKb1KB3sYtEkpDTUm1oJafzGknXxUnJmAU2jmE4dqxftkD5jQG9A1NYE0
	LBexswRK7hivG/cQiCp8c3hLpKbcsDQYAPEghSu54+Pb2+gHmDA+J1yWUWWDgmZ+fn/o9o
	tS3m38Sh+2sLlF+PR9RpnSvsyfBR4/M+BIyZ0GqGELWJTOb7QrOx80V/ao20wrzflvClDv
	562ptRRpSBRNkq+ZvwBNhTbN1q6RDFEZjypO9ii/LFNtvDdqmfpcRSmQM1IocBgg2pyXUi
	q5vqCDxK8Q4p9+Bkm+zGfMDIVEg0cEuGJyNbFiVro3+StiF3HNi1ITdqA4VkpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782561551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zz7muMR2y2m8wMPeJd2fbbBgpyba86ouaGupG4x7Onk=;
	b=Din2LXd2lP45ltmSDRBkHblVW/HV823P+Pjn02dHUm/biMea0ZXle2IbTV3ECorgBK7zGc
	k0ZQMWGDG4hgJdBg==
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Jiakai Xu
 <xujiakai2025@iscas.ac.cn>, Matthew Bystrin <dev.mbstr@gmail.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rui Qi
 <qirui.001@bytedance.com>, Samuel Holland <samuel.holland@sifive.com>,
 Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v3] riscv: stacktrace: fix stack-out-of-bounds in
 walk_stackframe()
In-Reply-To: <20260625123906.211981-1-xujiakai2025@iscas.ac.cn>
References: <20260625123906.211981-1-xujiakai2025@iscas.ac.cn>
Date: Sat, 27 Jun 2026 13:59:10 +0200
Message-ID: <87zf0g42k1.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_045913_705089_C20B06D2 
X-CRM114-Status: UNSURE (   7.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Jiakai Xu <xujiakai2025@iscas.ac.cn> writes:
> +#ifdef CONFIG_IRQ_STACKS
> +DECLARE_PER_CPU(ulong *, irq_stack_ptr);
> +#endif

Instead of this, shouldn't we
  #include <asm/irq_stack.h>
?

> +	if (sp >= (unsigned long)task_stack_page(task) &&
> +	    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {
> +		high = (unsigned long)task_pt_regs(task);
> +	} else if (IS_ENABLED(CONFIG_IRQ_STACKS)) {
> +		high = (unsigned long)this_cpu_read(irq_stack_ptr) +
> +		       IRQ_STACK_SIZE;

I suspect this fails to build if CONFIG_IRQ_STACKS=n, which would be
resolved if we do the suggested #include above.

> +	} else {
> +		high = (unsigned long)task_pt_regs(task);

We only get to this branch if the stack pointer is broken, right? If so,
I think printing a warning and returning is more appropriate.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
