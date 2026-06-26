Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578D5CDE00E
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sgWL0jArpxCgFC2nHSWeLtsBukSMVpdBQ1trjXWbiI=; b=HnKYgybnbnPqCE
	c7r1n/bT8YxB29DhZMStH0qfWSyk4cPClw0QKGd6Au5OUoA4PDjcIJkiPk0hV3QQilqGNnwv7g+uI
	hTqOUNibLxYQDPjjEaesqZwQeDhRegK6m/csUXWdTRfHbCIBxTZeyYY3EpHy3lE0hj6bKbsD+glUq
	qB2HsRgV4er82OP1ZnAgIEkNO75JvwcILG7mWo5mp+l2/BhVVPsoZ1S39m8cirKJItqNypscQEAn8
	Vi3yOTCE3H9PwV9km4a6USen5hg7QrpN9xiclbBNtndRYZDZZwAQ/Hac91+mfAoihm8bivXEiIMth
	pf6hJBATpo4v7FwXGwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1p9-0000000Aosz-3zbz;
	Fri, 26 Jun 2026 08:22:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1os-0000000Ao9G-20Vl
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75D6641A33;
	Fri, 26 Jun 2026 08:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CAF1F00A3F;
	Fri, 26 Jun 2026 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462109;
	bh=AYNZzZeOmFE2pPGD5v82j7fSWAbJiNgUt8ZRmPqYi4E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VuM+Cc/fPuXXma72yaPxPdO+vp38h0bXCjVwItksCXJ7lJrPe8tdY+C12WvktPaFm
	 V6ShIUNFPfNe9VdBbDw7ysUpWL3bvcn7LNxQEQByhtq/67+wP5tNe7aMk/07Si87hf
	 SjX8wjRjaYYkWAjA/x12jwp7RYimxMYeEBMi7G2tL7W+REwJSRN3ToULO3bQ1lqVbA
	 WqtVZVfkIw8JC8atVLbRiAum395W/ISVrbVQbS+hK9/WEjho5JtH/M5U4jMiWJ5fAK
	 YdXvHfSqTePxsheMu49tuwrzP1naD3E/wXxbFtonUUy7xjITz0V/gxslu7x3yOsDOy
	 zTtBOJqok2gKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93CC839389E8;
	Fri, 26 Jun 2026 08:21:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Disable -Wattribute-alias for clang-23 and newer
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246209611.3816447.421614366595878220.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:36 +0000
References: <20260515-syscall-disable-attribute-alias-for-clang-v1-1-9a9d95d41df6@kernel.org>
In-Reply-To: <20260515-syscall-disable-attribute-alias-for-clang-v1-1-9a9d95d41df6@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, morbo@google.com, justinstitt@google.com,
 nick.desaulniers+lkml@gmail.com, arnd@arndb.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Nathan Chancellor <nathan@kernel.org>:

On Fri, 15 May 2026 19:35:18 +0900 you wrote:
> Clang recently added support for -Wattribute-alias [1], which results in
> the same warnings that necessitated commit bee20031772a ("disable
> -Wattribute-alias warning for SYSCALL_DEFINEx()") for GCC.
> 
>   kernel/time/itimer.c:325:1: error: alias and aliasee have different types 'long (unsigned int)' and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long)') [-Werror,-Wattribute-alias]
>     325 | SYSCALL_DEFINE1(alarm, unsigned int, seconds)
>         | ^
>   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFINE1'
>     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
>         |                                    ^
>   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
>     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>         |         ^
>   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DEFINEx'
>     251 |                 __attribute__((alias(__stringify(__se_sys##name))));    \
>         |                                ^
>   kernel/time/itimer.c:325:1: note: aliasee is declared here
>   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFINE1'
>     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
>         |                                    ^
>   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
>     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>         |         ^
>   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DEFINEx'
>     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
>         |                         ^
>   <scratch space>:16:1: note: expanded from here
>      16 | __se_sys_alarm
>         | ^
> 
> [...]

Here is the summary with links:
  - Disable -Wattribute-alias for clang-23 and newer
    https://git.kernel.org/riscv/c/175db11786bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
