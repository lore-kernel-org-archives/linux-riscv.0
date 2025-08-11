Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BA9C87FDB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Om98+CmR4uM2Y/Ewa3+VY+/7xiDLSnTW6/Tfk4DrLM=; b=tUUKAF7dl8WKqg
	j1Wyv8CfjU88EPXThZjjHXLo7P5/1vyvmKlVLqcJDt5FiuTLWt1YllzZ1NbnvWlC/iCt2PFgLUREt
	13XCq8r8lbJwqMDLtHpQf4vccwTvbPxjMz8hjJJSTX305NuBqfzDoMvvZE/ILr0KmXbaoGDRsg1nL
	p3x2/5DIAURzjDnf4shzGmWUA+v/0a2bYaDqeVmc2Z4dhGApEkrSynlJjOjCSe1a3xqI0YnEksKrg
	gdd50LIe7rQKAsbKzSzmZYwAQvMeRlQ11PVUqXmtMSJrp5eh6cTk/+pmP6UF+94cI6ejgBlh0EhDr
	VNHXNziSgvMvxcDZYq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulS4r-00000007jpW-1uT5;
	Mon, 11 Aug 2025 12:56:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulS1C-00000007jGu-1r3E;
	Mon, 11 Aug 2025 12:52:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754916768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z8wb/yQcraBD38A6ZGHYoXhCAbkH7/ii4JJPfnbEvOY=;
	b=P+SwpmTJB1x2jNcuFUAHaluKSlCKiJuebZIYRBo5LFBQ9lEXLBfIq7/iAPPylOYpfx54Jd
	wdmfSHUjTeri6geIuPz+/5zBEwMWHIBqwaYqAxJdD1dljQKnRY7wCjT+ZLQ88H8ZC+SK7o
	D9h2upzLrRk6wF+Zbj6pZepPdjDNFoaSqwkkz7P8mT4np5hbRRWwkIxatkjqllQKcf5o3f
	J0Rk17d5wH1xz3rrO//pKwVaBLEeoa/IX4AJZIbcksQ+DzGcvVNGQf6JcN0mDvxWFcFKXU
	0Z5ff0DEoHeEFCRluJLduKnPdEDkjVpzGI2QkHaK/9fDXEaHIdo/efSzGi5z0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754916768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z8wb/yQcraBD38A6ZGHYoXhCAbkH7/ii4JJPfnbEvOY=;
	b=6OkO09b5uefLLQygsaYrxy4/iIH6iDnvW2eOBtCYNvtDrER4xoq4YKH0PZuEFSXTXXMwMr
	pPGuAV5UXewH+pDg==
To: patchwork-bot+linux-riscv@kernel.org, Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, atenart@kernel.org,
 andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 chenhuacai@kernel.org, jiaxun.yang@flygoat.com, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH 00/12] irqchip: MSI cleanup and conversion to MSI parent
 domain
In-Reply-To: <175486033550.1221929.7725164280675452092.git-patchwork-notify@kernel.org>
References: <cover.1750860131.git.namcao@linutronix.de>
 <175486033550.1221929.7725164280675452092.git-patchwork-notify@kernel.org>
Date: Mon, 11 Aug 2025 14:52:47 +0200
Message-ID: <87ecti81gg.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_055250_618414_D2D97AC9 
X-CRM114-Status: UNSURE (   8.74  )
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

On Sun, Aug 10 2025 at 21:12, patchwork-bot wrote:

> Hello:
>
> This series was applied to riscv/linux.git (fixes)
> by Thomas Gleixner <tglx@linutronix.de>:
...
> Here is the summary with links:
>   - [01/12] irqdomain: Add device pointer to irq_domain_info and msi_domain_info
>     https://git.kernel.org/riscv/c/858e65af9135
...
> You are awesome, thank you!

I know that I'm awesome, but this broken patchwork bot is _not_

Why the hell does it waste electrons and inbox space on stuff which is

    A) applied on a different tree

    B) already upstream


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
