Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B14C982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 00:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBZeUepElMF7Qf+oXglxRlwiBNqG3IEbeCiefH2qCWM=; b=Kitzh7QHoVmQ+5
	xnyb1XNJiFkbPwwDX/P7+Tx4ET1WLYEY3tqSXmVGAuFBBVK3oEBDPYHIzBixojWXM1LLcy++kZNbn
	PCJSnMJ6yd4XvhlsABcFY7MrCR5E9pvT3v+h0XoUDMeqW1WPCsFtcG/klt0zeR2ZjHbGAPvE6WvFN
	H66zkppMMxW4REl831D+oZtbVa5e3KLV90jp+JWphehn/hAMSj0rduV4vy/PM8QGyYk/R3fRHLNzy
	wc//C1MwZprHkZd7bqRJAH5rMdVErtluRdxEJalo3bBzkwX3U6g6t2Z1A2GE7qPcS4nkMnybKL1R1
	wwfmtWHaWeY08BaImQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jEz-0000000Fn3k-1jtZ;
	Sat, 19 Sep 2026 00:47:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jEy-0000000Fn3a-0i4a
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 00:47:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A2FA40AFB;
	Sat, 19 Sep 2026 00:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D0D1F000FF;
	Sat, 19 Sep 2026 00:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778859;
	bh=l44u54NGQegQTy4FgW+UoNKtjtKv6PfsWA8pSzp6iso=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=o0XxZtnGZirUvphJUQk9VOn6TR93felVKy6Fvo5I34q4ooUc2lB/CYE7B3zR36L7b
	 uiXZ3sXTUQ2lIOxjSBFXJQUbM5pW8V7EOuEO0Mod5CRpyOM0V2LSsEm32397IBwong
	 s6VDoNpQEeSz/ULMA+nKJeuMFSuN/i5JCz28yVbm5dv49feE87rVlQNbm+ID0ExmpM
	 vk6vLZRcLhj+8/pg16EKHdTlBhWrG2hqgowlZ4rkzFnh5GP/VuWRit5nWDHjhvJ4+l
	 aTHDqiN4VN+uvZJfW99k/0oSKI5n2gTXn1KcYFpFksj3wAmo6IqZlkmLn9NBILSHPH
	 WUSF4lgDNVn0w==
Date: Fri, 18 Sep 2026 18:47:37 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Aleksandar Rikalo <arikalo@gmail.com>, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
    Conor Dooley <conor.dooley@microchip.com>, Nam Cao <namcao@linutronix.de>, 
    Jia Wang <wangjia@ultrarisc.com>, 
    Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
    Drew Fustini <dfustini@oss.tenstorrent.com>, 
    Junhui Liu <junhui.liu@pigmoral.tech>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: limit sifive errata to CONFIG_64BIT
In-Reply-To: <20260916083752.47310-1-arnd@kernel.org>
Message-ID: <3f809812-03d4-92c0-0f96-db76d8d909b0@kernel.org>
References: <20260916083752.47310-1-arnd@kernel.org>
MIME-Version: 1.0
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

On Wed, 16 Sep 2026, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are two errata for this vendor, and they both individually depend on
> CONFIG_64BIT already. However, an 32-bit allmodconfig produces this warning
> from clang for a condition that can never be true.
> 
> arch/riscv/errata/sifive/errata.c:29:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>    29 |         if (arch_id != 0x8000000000000007 ||
>       |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
> arch/riscv/errata/sifive/errata.c:42:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>    42 |         if (arch_id != 0x8000000000000007 && arch_id != 0x1)
>       |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Thanks, queued for v7.3-rc.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
