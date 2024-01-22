Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43317C46CD2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 23:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8T0Ap5zpxKO/W+tf5TPTT+GzrECF4CbKOu/NSGJyFQ=; b=MYiUtKzEcuqT+Z
	tJuh0z+PZX9JD1/Y770u7XU+wgeLX9BpfDWUnOHa7zDejkCzbQto8gGGnrmsVPe8E3qJAXOpmvw+C
	Updzmdj7+Cz3gJwVyHG40GVMT6pB/f/ltT+6QIf7S8AxlBqlKY3fA3xkwMXNbPzTf8/UIskMB9ohM
	zx1hoiGTja7S0GfKT/RePC+i562R4mGnTugDJ6RGMoJfjJc90U/2vDuNJEp+6018u2Gti+v2OGUkI
	jwUGIFljXfD9BKlTkLU9tNnxSwkNUu11SI//oMar8r49UoDZHnUBCdW+BeATwnJlxLFy1W99ixp5f
	bma7uAEvUtcKHWEShyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS46B-00ESYk-20;
	Mon, 22 Jan 2024 23:53:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS469-00ESYP-06
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 23:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 89CD0CE2CCD;
	Mon, 22 Jan 2024 23:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B46CDC43390;
	Mon, 22 Jan 2024 23:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705967577;
	bh=3eVeComrwr86ZuOxJi0T6/Ud2Y6QycTfq4pL9KBAx0U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XxdWbR5N+ZU/LxQUpVqdkFLcNnXBayx72WcjrplGotWkBWNq+HpdDfEGXvx7VOZXK
	 6jrY8+hhnGfXsvPQOHlPKxDnIrFU/9Deryp8f35KH7ffnQpgZWZDoJh3w+HQFka1G8
	 MbM1DMpFEMWimhcYVhPtfq3CULcfZqytaNCKFyUvyoGZ6hturz2tNwX9d2qFL/xOgw
	 +rJeFhJb+HM9ZgVL4fyXjPSoSz9Gpfl++k5KksLuLFy4zetJQREY2jklhV9zzGoZMN
	 PHj4fWAKo6JNRlMdKsqSQFfCMJnEFc/RM2pni80agscQnsWrHAw5mNXchOixe93lAV
	 mcx3eV3wnIXvw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C287E0B63B;
	Mon, 22 Jan 2024 23:52:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: remove unneeded #include <asm-generic/export.h>
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170596757763.31397.10703280405391487918.git-patchwork-notify@kernel.org>
Date: Mon, 22 Jan 2024 23:52:57 +0000
References: <20240120213312.3033528-1-masahiroy@kernel.org>
In-Reply-To: <20240120213312.3033528-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_155301_271946_F2733FE3 
X-CRM114-Status: UNSURE (   6.34  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 21 Jan 2024 06:33:11 +0900 you wrote:
> Commit 62694797f56b ("use linux/export.h rather than
> asm-generic/export.h") replaced deprecated <asm-generic/export.h>
> inclusions.
> 
> Commit c2a658d41924 ("riscv: lib: vectorize copy_to_user/copy_from_user")
> introduced a new instance of #include <asm-generic/export.h>.
> 
> [...]

Here is the summary with links:
  - riscv: remove unneeded #include <asm-generic/export.h>
    https://git.kernel.org/riscv/c/3a6dd5f614a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
