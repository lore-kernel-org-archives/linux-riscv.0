Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4DFC87FC9
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Aug 2025 22:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6H+agS3nMzuWTZl9yKwIeWVL18nkbYygDA/0S0+lGT4=; b=uRB4wnEp60/YEG
	ZVxqg0AcMx4i2Chyllqksw4+4sj3zCU7fghoPIDTu2+2fi3Fq3xe8wp8RwHHlRxUBNQhLe1PJ1b4F
	RcVHPZS31BEMR3A5Zy5b1Jhutipepob5mj49binGCoSCV1at8vI6n3aJlN3uJzm4m6oQ3rah7slMm
	Vk4ENTL2ucvUbLKc4wcMNk/3HkBw5FCWtDwhT1y08SA0HclURGpp2mZ7nYadAm1MGqenFYsX3BfMe
	BKsQWVnI5Efl0EVGxsFbNLOKk1cHzr9cQg6NjeVvKVvJ5auHy1znMtBTtEGMJFupZ9S1CY3fZXvo7
	nXfezEwPQNKOHGskxE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiKZf-00000007vmx-15NJ;
	Sat, 02 Aug 2025 22:19:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiKZb-00000007vme-3vw8
	for linux-riscv@lists.infradead.org;
	Sat, 02 Aug 2025 22:19:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754173165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wYn4+AjuXVa10cV2piAdZD+Z/476ZDmv3ExwRX5MbZ0=;
	b=oZyELAxeu2s8rN1OMEHcckNbKDTT3nx5fo9vgEJGiRpDCFD4QzRCFX4cqpDK1vxP+nvLIf
	pABU5mzFGBvxBozMiPJJdSWvTeTZni07md/enETwncVAE4kBzBnive2/SvbJYhZHtlZnYm
	udWj5FYHnPxUfW2wgf5E3f7PgXUDLlaESTSlINWu9GOOpwwSq7S3YB1Ih4Idtl5naLkPQT
	isUiErFKChf3U0MA3vD8lFKc6CYlRRAKseZ7vnkGyTQ14XQjznWz0Db1Ieug2+pkQkWVy3
	8TrkixNAKYktW9F9A5VkydRx+qYlqFiVqYuZefRi1HBexQvaIMT5EH9JhVFkjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754173165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wYn4+AjuXVa10cV2piAdZD+Z/476ZDmv3ExwRX5MbZ0=;
	b=F7l4SGYrgWUt4RvEHbyLwattwfCgtV95skBBsvOQ2spHGUH75LT7qP62f6anPzcPE7N6zn
	jne92jcSEaEuWlCg==
To: Kuan-Wei Chiu <visitorckw@gmail.com>, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, maz@kernel.org
Cc: jserv@ccns.ncku.edu.tw, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kuan-Wei Chiu <visitorckw@gmail.com>, kernel
 test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix 'imsic' dereferenced before
 NULL check
In-Reply-To: <20250801172459.94708-1-visitorckw@gmail.com>
References: <20250801172459.94708-1-visitorckw@gmail.com>
Date: Sun, 03 Aug 2025 00:19:24 +0200
Message-ID: <87ms8hgydv.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_151928_129272_8C91C3AD 
X-CRM114-Status: UNSURE (   6.57  )
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

On Sat, Aug 02 2025 at 01:24, Kuan-Wei Chiu wrote:
> Smatch reported a warning in imsic_irqdomain_init():
>
> drivers/irqchip/irq-riscv-imsic-platform.c:317 imsic_irqdomain_init() warn: variable dereferenced before check 'imsic' (see line 311)
>
> The variable imsic was dereferenced before being checked for NULL.
> To fix this, move the initialization of struct irq_domain_info after
> the NULL check to avoid accessing imsic prematurely.

It's fixed already w/o moving the struct into the middle of the code:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/urgent

But thanks a lot for caring!

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
