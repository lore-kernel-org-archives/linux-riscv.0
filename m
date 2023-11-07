Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAF8C4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCNfw5NoLh6JOwmvYNiHu5JGJMe9omQekEJIp93vutg=; b=blIb+lMwNyBzC+
	WQ/2g2hT9D3xb776WJsvsxFspWDAvlHr4Oy4Y4TlfK9KlcEbT/ZSDvmmgg0854+/pgCmg+mVyvaR5
	EGNmakailRwsoNC0kKbWD560e4QU9Ynb8Ay5WCtvwfl7OnC9buk6wvlwlxmVtv6Z2x9Okab3VAfB6
	ejwitZ2OsB6EcVnI5joOj9/CgPHFnpXyTpDAjIBfOQX45stMAKGwvMTr8M5H4yCXOg2h8j5ruiNEO
	8WuAD7vpTPuXHniCnIDxhK8upA688NCwpcdZHDUS6Erz78KI6NeZAdkpZ9arICMm4BDD0LJhVS5Hm
	lu2JWFZABOK3OoX8T3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fv4-000fH8-1i;
	Tue, 07 Nov 2023 06:50:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fuy-000fCc-1d
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 06:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78375CE0B89;
	Tue,  7 Nov 2023 06:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E211FC433CC;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699339826;
	bh=+cTlWJxTAf872aDvdexyZnpvcYSn14wI9GuK2A/2+GQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=byAIYpNEkPlqwWpI6oNdRkOvONsD7yqV9Y5qKdaH5gDE3bmkwyqoMUkO5B+FWJOYG
	 o/Yk1nwq0gqWymAaXcIeqQFcg1/R9dr1OsCqXJWouRMSGm0ZZIC9PPD67RU8DJgS7S
	 ZQHmp5a4PVg2kkZjGlD5btd9Cd1C7PonHGPOKczkuagSOqKZ45erDm1VhZRtNGXRoI
	 2qK/SVM8g7TDIOXm9OxtP8bY1R6d+SRXoRnZRJQFCjHSqKiAGu4KMxcpUJQUOlpiqV
	 5lgFYIOezQ3s08/P7Sqs7bkUbYrke4CZnezo944UxXoRbHMIo5TZeYfBe/H+0y3NLu
	 ySaaLBRYFCcGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA204E00089;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/11] riscv: ASID-related and UP-related TLB flush
 enhancements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169933982682.6233.11600132793189977124.git-patchwork-notify@kernel.org>
Date: Tue, 07 Nov 2023 06:50:26 +0000
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 alexghiti@rivosinc.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_225032_724767_B58ECE35 
X-CRM114-Status: UNSURE (   9.45  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sat, 28 Oct 2023 16:11:58 -0700 you wrote:
> While reviewing Alexandre Ghiti's "riscv: tlb flush improvements"
> series[1], I noticed that most TLB flush functions end up as a call to
> local_flush_tlb_all() when SMP is disabled. This series resolves that.
> Along the way, I realized that we should be using single-ASID flushes
> wherever possible, so I implemented that as well.
> 
> [1]: https://lore.kernel.org/linux-riscv/20231019140151.21629-1-alexghiti@rivosinc.com/
> 
> [...]

Here is the summary with links:
  - [v2,01/11] riscv: Improve tlb_flush()
    https://git.kernel.org/riscv/c/c5e9b2c2ae82
  - [v2,02/11] riscv: Improve flush_tlb_range() for hugetlb pages
    https://git.kernel.org/riscv/c/c962a6e74639
  - [v2,03/11] riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
    https://git.kernel.org/riscv/c/9d4e8d5fa7db
  - [v2,04/11] riscv: Improve flush_tlb_kernel_range()
    https://git.kernel.org/riscv/c/5e22bfd520ea
  - [v2,05/11] riscv: mm: Combine the SMP and UP TLB flush code
    (no matching commit)
  - [v2,06/11] riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
    (no matching commit)
  - [v2,07/11] riscv: mm: Introduce cntx2asid/cntx2version helper macros
    (no matching commit)
  - [v2,08/11] riscv: mm: Use a fixed layout for the MM context ID
    (no matching commit)
  - [v2,09/11] riscv: mm: Make asid_bits a local variable
    (no matching commit)
  - [v2,10/11] riscv: mm: Preserve global TLB entries when switching contexts
    (no matching commit)
  - [v2,11/11] riscv: mm: Always use ASID to flush MM contexts
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
