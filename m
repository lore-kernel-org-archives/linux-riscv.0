Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B7C44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amVtxMlYS1jOqxgzHF3EZm48DgIAWynJMC7B/+NdvEY=; b=HzfJY6KsDDtgWo
	2CCBwoQqSXlDwmPrLBhV96gV9pfob5AeuHX/LskjOQ8IjxVbxdODrZWXieSgBhofCqH+naJTUKejK
	jTeczHnyzDzCEIZuRzo68dSE7PM85Ku1aoZ9gSdxl0B/utA7ndQf/TH2S/zNJr/sJQY70VgaivBPc
	xRAsUUNu7KuVtGp6JXEC5RlxQrg86QJm0ZppW9pyCbMzwyjO9KNG3n1Zf3UUsUdrl/jvBl4LvOSao
	duyBs9fW4VGuj1ZUvSD7xmF/znyeVR/cg9YnePY9rCJVg6hwYIqjVoFQG9bZHED7xD0fHAjA1yeEH
	iWOGr6gCQ6vReS8wlaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkg5d-000000021gF-070S;
	Fri, 17 Jul 2026 10:46:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkg5a-000000021fR-2sOf
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 10:46:43 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784285198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YevZp+WcXO8LGuz5eOqbM+91Ij2ZiExSH2hvsBOZsvo=;
	b=CbDeLus9tQ5f58r9WNDzhDdf+9Lvn/3BblELdhk0v7g/2KZkvcIHBb8unaK8BA43aCm9ja
	Ux46yaKXOP+YZxcq7hSfg1hINtZOFiFVtoz6FTc2LuxiUm26e45gAeu1VTln53bTygV8Mi
	Ab67kZy5albKUk1C7k7l8c4hcjF18Bi9yE6eV7voIX+S4RmqYWVfd/5cw29DyOCLq8gNnx
	QJHZIN0vWZ8ZnIbeNICvXk44vVMSL92yQe3RjPgctKGYqt1v+CcbRuA3dlM+iU7uYINGHz
	1mx19BoCmdKITGG4Emf0LopMy87OetRPH8mw/GcUFishAwG2Q3SyOT9RLFzNcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784285198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YevZp+WcXO8LGuz5eOqbM+91Ij2ZiExSH2hvsBOZsvo=;
	b=LGR0wwBE4hTM1zArP3dS7gIrSbjSeJwS9jX8IZYpLdZGp6KxpJHNBsePtHP0cHV0H53Kx3
	zlZ3YHVFoBXY/cDQ==
To: Xiaofeng Yuan <xiaofengmian@163.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaofengmian@163.com
Subject: Re: [PATCH 1/2] riscv: mm: make EXECMEM_KPROBES writable without
 ARCH_HAS_EXECMEM_ROX
In-Reply-To: <20260701102822.95459-2-xiaofengmian@163.com>
References: <20260701102822.95459-1-xiaofengmian@163.com>
 <20260701102822.95459-2-xiaofengmian@163.com>
Date: Fri, 17 Jul 2026 12:46:37 +0200
Message-ID: <87v7adx59u.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_034642_864105_ACCA7F44 
X-CRM114-Status: UNSURE (   7.00  )
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

Xiaofeng Yuan <xiaofengmian@163.com> writes:
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 5b1b3c88b..21794e7bb 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1457,7 +1457,9 @@ struct execmem_info __init *execmem_arch_setup(void)
>  			[EXECMEM_KPROBES] = {
>  				.start	= VMALLOC_START,
>  				.end	= VMALLOC_END,
> -				.pgprot	= PAGE_KERNEL_READ_EXEC,
> +				.pgprot	= IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) ?
> +					  PAGE_KERNEL_READ_EXEC :
> +					  PAGE_KERNEL_EXEC,
>  				.alignment = 1,
>  			},
>  			[EXECMEM_BPF] = {

CONFIG_ARCH_HAS_EXECMEM_ROX=n for RISC-V, so this is just

	.pgprot	= PAGE_KERNEL_EXEC,

Since this is only needed when CONFIG_STRICT_MODULE_RWX=n, shouldn't the
condition be based on that instead?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
