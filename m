Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6D7C04A94
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmfJmhYUIPbONb3kESfQTWZ0GPXtF6Gc15r9WM2zirI=; b=u+bkSqm/UdzQef
	RpVPhYRAKZvUB6gLItAou+4N3OfISpZKcaEcvUf2tQgWmFTfP3pXPcVQkpGa3kTyk2JBQMEtLTKNC
	df7PT0lj4tdIVriSMDuVmD477Y7veEOjYmADY7fGOVDMqHdwMm2bJ0ereRzpJWueCfvkmSiCs6hNg
	Ve1i51ljwYjl3vR5Zx4/1JcBQqA8YoA1CwIDVingakqMc9V3l0+8OldZZRvy855J2wNcw/ZjuDLLL
	hrg6IVKU8YaK0LXQW/W7GsJvZSoRkpWKAzt0/ZipkQUyMEs2mVvERyJjbcUqFtZrfyrZ5rhZCjbnn
	IG8o/7URv+KVjHvU7GLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkMP-005CJN-25;
	Wed, 09 Aug 2023 14:40:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkMI-005CEj-1E
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:40:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3BAC63C60;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41280C433CC;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691592021;
	bh=rS1VmWngCPrpnlr93e2OHzvT/pKtGX1S57FyWy3qM2M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dBZYMRaMdKwDDcfKgHAVBp4WysQCa1YCVUBQwYN2ahYEnn1HcKCYXhJMi4hGlDTmX
	 OZvjLyrUQqj73yo7fenV96uNsHyUKdZaRc1QEP6/cnnR78XOr2+ESS4IYAvGf0sg0G
	 puTi5bM7Qb15nmV13MrNo4XXBsFA2jkHJEtbfXiOv7/5N/TwWLbExGPSwDMnff/UXI
	 3M1CaUDGkM1yFcK5xQVlHe1QnXKHVhu8m17pUAnGSWhH1OsfM7YVywSO0Se2J40534
	 jqs6Elf111OeGVNFbB8Tbqa9cGXo6UlbKj302wIp5HFGrA5Gokh5ows60BN90g6HGJ
	 F4ay19kBN6J2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25A66E330A1;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: fix 2 instances of
 -Wmissing-variable-declarations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169159202114.17533.15862327157630311285.git-patchwork-notify@kernel.org>
Date: Wed, 09 Aug 2023 14:40:21 +0000
References: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
In-Reply-To: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
 trix@redhat.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_074022_847642_74DF4181 
X-CRM114-Status: GOOD (  10.51  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 08 Aug 2023 09:35:00 -0700 you wrote:
> I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
> bot spotted the following instance in ARCH=riscv builds:
> 
>   arch/riscv/mm/init.c:276:7: warning: no previous extern declaration
>   for non-static variable 'trampoline_pg_dir'
>   [-Wmissing-variable-declarations]
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       |       ^
>   arch/riscv/mm/init.c:276:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       | ^
>   arch/riscv/mm/init.c:279:7: warning: no previous extern declaration
>   for non-static variable 'early_pg_dir'
>   [-Wmissing-variable-declarations]
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       |       ^
>   arch/riscv/mm/init.c:279:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       | ^
> 
> [...]

Here is the summary with links:
  - [v2] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
    https://git.kernel.org/riscv/c/d2402048bc8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
