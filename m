Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3D7EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWW3/GQodXQ+76IGp/qsJXNbdRu8ag7FvZiUDz77CJk=; b=hpWxWrSJnsjfyz
	vTIgDKqO0Q3vzOq0NhGiXn9kN9cxQrOjYb1O8uguqzkAvzoFLwhizjwdxnht6I5FjZTQyz8RdxtQc
	psNwGrkcSsvUdwYTMgmemkwF75/tZqCsS2IDkpTiUvyjLcOXQ1xOT/ZPhq7byXBGguf/B7MNgXP3k
	taZ2l1J/6zYJPspD3BJZOZQwgBSY1xk/m56wv4t7ANyqYjp7DmbcygzIdtqnhHYFqN/wqAmVdiq6H
	HGVTBwPjZpeTfED0B91sBAHhtDgvinCx5VyyhIVZLgpgupj7BD59N4bMuzGnv6rxNnG6Y5rNbADrr
	P4/qHss1BMRXMD8rv+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ1x-008uJS-0W;
	Sun, 25 Jun 2023 23:20:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ1t-008uH1-1i
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:20:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FC5860C50;
	Sun, 25 Jun 2023 23:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3437C433C0;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687735223;
	bh=9T9wbf7SB0laUWaTFhRmYXAuMcUBhfaXs+Wo6X0IGHk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rgGRKrggNqFKiwwh39BQt9eFyMXiDMmWBnl8PRdiLjd10/XIEhNGqK+xQfs+QRDB0
	 DWl4HXyg/jrhe/qHpnmIiSxMd6/gQBoD/do6ahDRsKx2nu2EDNbZhVUOGczllL5VS3
	 9IprX8JT2thDPbhrwsDO7g0/IP1pZFNvKn6uFZgfLyrjbRTrRQ6u/k7rEauEkBhCaY
	 vMJ2bOqAJdVqNzf0chE6ia+LG68sI+mv+QIArhZLp9+LysV95kwDDB0G/g8RdmsZWn
	 PitAgCmYme1QUcZhhdonFBsHDJB5ue9Cg2ttyBlO9U+7z3lD0IWW78xooMjPVaHfwM
	 00Mg/D/GkXOwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5C9EE26D3F;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next V13 0/3] riscv: Add independent irq/softirq stacks
 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168773522366.24181.11030375429651091401.git-patchwork-notify@kernel.org>
Date: Sun, 25 Jun 2023 23:20:23 +0000
References: <20230614013018.2168426-1-guoren@kernel.org>
In-Reply-To: <20230614013018.2168426-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, palmer@rivosinc.com,
 conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
 bjorn@kernel.org, cleger@rivosinc.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_162025_629426_A3C5F3DE 
X-CRM114-Status: GOOD (  10.16  )
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

On Tue, 13 Jun 2023 21:30:15 -0400 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This patch series adds independent irq/softirq stacks to decrease the
> press of the thread stack. Also, add a thread STACK_SIZE config for
> users to adjust the proper size during compile time.
> 
> This patch series belonged to the generic entry, which has been merged
> to for-next now.
> 
> [...]

Here is the summary with links:
  - [-next,V13,1/3] riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
    https://git.kernel.org/riscv/c/163e76cc6ef4
  - [-next,V13,2/3] riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK
    https://git.kernel.org/riscv/c/dd69d07a5a6c
  - [-next,V13,3/3] riscv: stack: Add config of thread stack size
    https://git.kernel.org/riscv/c/a7555f6b62e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
