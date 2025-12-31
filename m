Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91928EE57D1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 03:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPYnQsAZwOHPvB9VmW8iP5sQFo47D4wLlOvbZYyQh4I=; b=sqvk6llMnll0ui
	16Wgmn4PJazFaMUx+8i8rfiAegVJiEFUtQ56SHdtEDt8Vyi+AHuOQtUJZ22caGUnXoVY6U7IL0Ihv
	xg6ekG3hG2dbwGWE/Q9n/xkKXqWXr2pd8p423yke5ZqwrwgZvqU88SnhDLgI6jcgEh2ReJvdwtN6C
	NM/bnxORIwOMalgxls68uEj0gCUc1DIvomAaGIJKD7tpsCWmP9G9BnRcvKlExUKEVGM8jJZ6loB1S
	TslFHkFONj/d5tP03JI5MzmOXUazXq/liusCIkmLrxKQj6LSVyibVghZFzABE8zrbtdmjdd7Lt+l7
	03reOTG4Cmqiccygy/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamzD-00000005e5I-37UI;
	Wed, 31 Dec 2025 03:34:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamzB-00000005e4l-31nr
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 03:34:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EA9544117;
	Wed, 31 Dec 2025 03:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F82C116B1;
	Wed, 31 Dec 2025 03:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767152097;
	bh=8DSvRSus0xbGzOAr4jp/3UnDYQkmeJ4CLOvKen8nVeI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PG4+EZXESNN/ftMqOQkG0PDmeBExQAFFKYmt+0c0Wyw/6A7+EiNm42NqjrtMcWrPq
	 Qt/QeETxER8bjdf3F00f7YDoq3oO8gav1HcUjrVnwIYpRBmgaIaPdL1KS8flzEBHcI
	 WKCBrcVKd/MdX+SIb1G4X0Vy0q4vDV9ELOJ8dN1NVQYx/f1AWl+jnfOAhHodzM0qpF
	 MTWySVkAHbTffMpM3OcGVU4y86CAH8PNXVrd3jBJeXpS28V6ubn0gDrJMdqIT6tTqn
	 16ZKhJ3po131qRbAqBwMUBq3FG4VeJtp8cUO9xJ9YcT//bKWkO64Z4NDarEV4Wtrz8
	 LZ13dG9GWDmBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B79D3809A19;
	Wed, 31 Dec 2025 03:31:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] crypto: riscv: add poly1305-core.S to .gitignore
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176715189877.3416240.15703522189822790265.git-patchwork-notify@kernel.org>
Date: Wed, 31 Dec 2025 03:31:38 +0000
References: <20251212184717.133701-1-cmirabil@redhat.com>
In-Reply-To: <20251212184717.133701-1-cmirabil@redhat.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, ebiggers@kernel.org, Jason@zx2c4.com,
 ardb@kernel.org, zhihang.shao.iscas@gmail.com, zhangchunyan@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_193457_800602_7DE774FE 
X-CRM114-Status: UNSURE (   9.00  )
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
by Eric Biggers <ebiggers@kernel.org>:

On Fri, 12 Dec 2025 13:47:17 -0500 you wrote:
> poly1305-core.S is an auto-generated file, so it should be ignored.
> 
> Fixes: bef9c7559869 ("lib/crypto: riscv/poly1305: Import OpenSSL/CRYPTOGAMS implementation")
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> ---
>  lib/crypto/riscv/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 lib/crypto/riscv/.gitignore

Here is the summary with links:
  - crypto: riscv: add poly1305-core.S to .gitignore
    https://git.kernel.org/riscv/c/5a0b18825068

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
