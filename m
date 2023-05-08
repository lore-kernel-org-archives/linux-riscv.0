Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7679C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0YmELMCKrio9rJLkTOrSTmHjIHuRZ2D3FPKVjP9iEM=; b=iAVjrUJpTjIBKU
	OkmksCYAI+F5rkyktI39oyTEqC+z2I6z8cGhFJCW50n3rFoiIa3r/d/R3PljBlr2qopJ/NWzFl5Mb
	rIAQYOZoPVLJKpHSx8NAIXjNwNGhOYmu0RXtkko48F2TdoQ0qbH9tZmZSZ2DHaTClzqhjhWwrZFmP
	AJfEp1xw58yGpIgLR4iJooeu0GFugIsVEGjvmrgBxNJ3lQ583ZJ241bny3mS/aOt2AVAt1wyyuPBv
	OO4PrTL6eLYuU8Zb6DI2oO0XQUxg0sHYqMJnzYRNv6CEU2QwWvSp0YOVCDM9i2NHuUeY4Ro2Bdn2w
	0QX+ThbAvRNVU2uG8gRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23w-000mYh-12;
	Mon, 08 May 2023 14:42:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23q-000mUv-2F
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:42:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90508640C6;
	Mon,  8 May 2023 14:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5599DC433AF;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683556916;
	bh=GN50963fdkw5cucYPuN4xRaiQmxHDA0hrlxtEWYsvtQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r64Dxi/fpFWqlTPgj0oa/IYTE2F52/0U4frXOQyj/T+tixhV8XgLG9eTZd0UTcV36
	 MThVa+dfb2c7qq/bN1MQ8+/nOc8Zmb/oMzz15aLEjcY3k7iXI8FgY1pc19ij96JWIV
	 p9dbdwXXuKSBbcyHFrtz6ZwA4PUDzbKgr0j7wVdl3YWaGX8HsjZh5pa2IYQUToSezH
	 E9CdNSf3PqfxLJyZIxE9T5n56CbdoDjfQLgg37E6Wjd320jmozml/4Ck793810C2gG
	 zwHDr3HymZCWssXv9EaO6SQ9YW4Hi3EpsX6/opGZlaru1Qz9BiS57573d/bVlpFpBc
	 4vD8grh8d6yuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2C09CE26D2B;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] libgcc: Add forward declarations for generic library routines
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168355691617.25692.18413165340491314933.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 14:41:56 +0000
References: <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
In-Reply-To: <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org, arnd@arndb.de,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_074158_774922_DBBA47A6 
X-CRM114-Status: UNSURE (   8.69  )
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

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 21 Apr 2023 16:54:24 +0200 you wrote:
> With W=1 on platforms that use the generic gcc library routines
> (csky/loongarch/mips/riscv/sh/xtensa):
> 
>     lib/ashldi3.c:9:19: warning: no previous prototype for '__ashldi3' [-Wmissing-prototypes]
> 	9 | long long notrace __ashldi3(long long u, word_type b)
> 	  |                   ^~~~~~~~~
>       CC      lib/ashrdi3.o
>     lib/ashrdi3.c:9:19: warning: no previous prototype for '__ashrdi3' [-Wmissing-prototypes]
> 	9 | long long notrace __ashrdi3(long long u, word_type b)
> 	  |                   ^~~~~~~~~
>       CC      lib/cmpdi2.o
>     lib/cmpdi2.c:9:19: warning: no previous prototype for '__cmpdi2' [-Wmissing-prototypes]
> 	9 | word_type notrace __cmpdi2(long long a, long long b)
> 	  |                   ^~~~~~~~
>       CC      lib/lshrdi3.o
>     lib/lshrdi3.c:9:19: warning: no previous prototype for '__lshrdi3' [-Wmissing-prototypes]
> 	9 | long long notrace __lshrdi3(long long u, word_type b)
> 	  |                   ^~~~~~~~~
>       CC      lib/muldi3.o
>     lib/muldi3.c:49:19: warning: no previous prototype for '__muldi3' [-Wmissing-prototypes]
>        49 | long long notrace __muldi3(long long u, long long v)
> 	  |                   ^~~~~~~~
>       CC      lib/ucmpdi2.o
>     lib/ucmpdi2.c:8:19: warning: no previous prototype for '__ucmpdi2' [-Wmissing-prototypes]
> 	8 | word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)
> 	  |                   ^~~~~~~~~
> 
> [...]

Here is the summary with links:
  - libgcc: Add forward declarations for generic library routines
    https://git.kernel.org/riscv/c/4f20b7471c57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
