Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78931EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 01:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzFAvUAois8XsrqKrgI68ugugPeqK3hf42D+2vrbyMY=; b=pDqCWgU+ec3s73
	kSMXNHSZzW8SfjlQCmTkVtyeD7UA/3mr6+5ta/U7kigypdDumKsgwzFObjhf4M0f5wtqNcsHkVrp9
	lrADLWwOFZftXzO2blJxfQAyBmsNnvqFHD/x4qIOqgiQN0NcfbrH05OP6sfXajMJVigokxira0jnU
	zAZFzwbxMVErcZEt2Cc1u1nisBbgWsgQnn1IMFLrX2XDJQS3VvvS5eHO1ND6ubNsnbxOnPDw8JcK3
	BEmKcjuc2plX3ZEclKp8k0EXXpdyIA4TDNwYnt/zRI5/jE/Y7ntxSuEIaX2X0RqV3OWdBET3D+Heq
	BvvQn/J6hBiani0HenkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjT-009pY1-1X;
	Tue, 20 Jun 2023 01:00:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjO-009pUT-05
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 01:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98D0160F4F;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEAC6C433C9;
	Tue, 20 Jun 2023 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687222824;
	bh=m/bds2qI0I7nlVEDozWBkVc/6egEMeDsV/8HStsN4z4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rdW3s00rS+h79iJWRc2WnutP++TKWYBPoSbAqw+xSYnu5frnlgP7HrbKr++TSPbmr
	 /ncvhGoxZJWV/yQhoUBui8QXQgJIeMonsBEiQZZ2d/XUkTjJK3KYGrxqHzEaVk4kmH
	 PYj+vcofq9ZNWMBP58eyhL6cW7Wzs/bbnimAcoYtQpbHQFQSA8I6T/xTr2eWa8q2hI
	 MgDBnVhFP1E/Cxh+1j1GqUUy8d6SQXDxbQ8gHNRYjayjefZsuYYeMbUjBUMVoffWfM
	 fGsDobSxfJazK5Zd/STF0xdANPykqHGc5l/PiGZd9A17uUwXeYuOlU555VgDaJdTnH
	 2D/HILve1t+Qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CBFE3C43168;
	Tue, 20 Jun 2023 01:00:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: hibernation: Replace jalr with jr before
 suspend_restore_regs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168722282382.22807.3982031186213234976.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 01:00:23 +0000
References: <20230519060854.214138-1-suagrfillet@gmail.com>
In-Reply-To: <20230519060854.214138-1-suagrfillet@gmail.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jeeheng.sia@starfivetech.com,
 mason.huo@starfivetech.com, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_180026_148322_338078E0 
X-CRM114-Status: GOOD (  10.08  )
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

On Fri, 19 May 2023 14:08:54 +0800 you wrote:
> No need to link the x1/ra reg via jalr before suspend_restore_regs
> So it's better to replace jalr with jr.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  arch/riscv/kernel/hibernate-asm.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - riscv: hibernation: Replace jalr with jr before suspend_restore_regs
    https://git.kernel.org/riscv/c/650ea2a1dd96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
