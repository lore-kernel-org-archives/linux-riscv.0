Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E460C3ABA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7q9BXEzQe3pZjVGUhj2nHhp8CNcYInPkiHhxnBXEeA=; b=x8zX8eqL5jdgEZ
	hvyK9GdhPKqkdpVIaxOGjy4d4kmI50l5mfJZlCOZ+SIUXXVkuBJ3WJpDtBHbSOt9kr/sddQpdzLR9
	snn8pqqWdI1C6kGf9PNhdxX2b6kbZ9G/MaMWjvf0Up6N+7fYAI02IPNEj4BsmSfR4owxTDieQBdqD
	4qtnfWR173FwlOGxOMxP3GDKd75258wMGJ5J/MkqA0MDYLIpEMsMGkydbbfUJ9N4dNgJZRlwlQFs1
	Dj88MyVi1ec0G8n5yV8pSoqzBEm8G5DIuMvDmiKNeE3yeBEl1m7ci0HrOJBsvGOoVq5Pjk4JRftbo
	Rx+srJbZV5BicdlXPO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oAM-0000000AJnR-2f7A;
	Tue, 29 Apr 2025 16:50:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o8C-0000000AJWC-21HE
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 16:48:29 +0000
Date: Tue, 29 Apr 2025 18:48:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745945306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eesAZMgstduPVaEESNAi0LnDjxGoJvSDuC/mj3w1pYU=;
	b=odBTB5QykgKLaJoG3eJifs7bkg4z54MWQmZDMSDQ+hP4Qw1WCEALVv4DRJ+6me3mIW8kmY
	Q7jqyd/6qjzwZThiTcj+skcpCQ/xcPFjVdN25wvVWmva+1fl69J3EX1GTXN/sEX3/o4Eks
	b9LHQvRHyR0IjYDrIAwvYdNCpC1gdF4gVEMOJNl0EO6tNCG07f+Sg6KAD9ZBsRxFwWwxPg
	q9yw/Unxsd9EzXs7ikI2TFiFe1efpRnzESQATSzzkOZhnZHWXdzBvenBo5y+Q6a2J/J7xr
	Bv/jE8k7YuugsjkdKcGLzdBgQDLtkEbpQm6rtznaSKNSMOxOU02isPnZJbTJ2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745945306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eesAZMgstduPVaEESNAi0LnDjxGoJvSDuC/mj3w1pYU=;
	b=3QIFNafg6nxw8am8DCLkuq71zFvv4hecAyBBCes9WCZvY7dNUVVJf1qLzVZ/FRfGCp0UHO
	adH1ylpazfq0GIBA==
From: Nam Cao <namcao@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Kai Zhang <zhangkai@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH stable v6.6] riscv: kprobes: Fix wrong lengths passed to
 patch_text_nosync()
Message-ID: <20250429164614.g3w8JJAk@linutronix.de>
References: <20250429161418.838564-1-namcao@linutronix.de>
 <2025042945-financial-rumbling-bcd0@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025042945-financial-rumbling-bcd0@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_094828_660856_854E23EA 
X-CRM114-Status: GOOD (  12.51  )
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

On Tue, Apr 29, 2025 at 06:31:09PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 29, 2025 at 06:14:18PM +0200, Nam Cao wrote:
> > Unlike patch_text(), patch_text_nosync() takes the length in bytes, not
> > number of instructions. It is therefore wrong for arch_prepare_ss_slot() to
> > pass length=1 while patching one instruction.
> > 
> > This bug was introduced by commit b1756750a397 ("riscv: kprobes: Use
> > patch_text_nosync() for insn slots"). It has been fixed upstream by commit
> > 51781ce8f448 ("riscv: Pass patch_text() the length in bytes"). However,
> > beside fixing this bug, this commit does many other things, making it
> > unsuitable for backporting.
> 
> We would almost always want the original commit, why not just send that
> instead?  What is wrong with it being in here as-is?

The original commit is probably fine. But I'm paranoid, because it is not
completely obvious whether the original commit would break something else
in v6.6. Because, as mentioned, it does more than just fixing the bug.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
