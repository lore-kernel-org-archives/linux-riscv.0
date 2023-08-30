Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF98CC83F18
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CcHErRfashdvkCs5GKqWBl5sHkTtikE43nn974hBqk=; b=FqZdT3xITSESWX
	GvqBOJ5F+uuu9mXYaelMX5xuw34ZkJHGwKOoWNnFr6lwYP0BnyqDaY1ihUFR8HBnyFb4aVcM6FyaB
	FHh4rC/mJxLp3WXFa4IFy/uIuG5qAfy/6d1cr8wM6WRtf3lP+zlBB8rp9Clj1ziE7dBDhnFVRHAjm
	LBST3Q7cT9T3izQ25FR9s1P0SAUHr3HVbWBop3M0ymrjfCWn+nhwt2dEAwL7pw7sP97vgzbu4bRhL
	Ge18WwiJ10psFlUNX5/xhNr5jWoLcxOgzoDBgZ/62YtoFHYamNAKoJLqhShLKhPe2gTMt2D6ANi8I
	KqjOYmxunQ8DsLZRpoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL86-00DXsG-2I;
	Wed, 30 Aug 2023 13:21:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7f-00DXXj-2t
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B9606106D;
	Wed, 30 Aug 2023 13:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C76DFC433B8;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=0qA1YOV07JE1ChOWA2MvdbLJtXmV6RJUAOUCWFuJG8Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZId3b6yTC33m6QHD2Dn9azQNzMwdOrgfAR5UV0X8qktkVkVKu1K2yfl0psHATsrgm
	 WuTwwb43O2W8w7Ctn7c5r1MlIsN2R9YzDy5Or2cgjqmOzknYJwCu4jqgGRrb5vrhzr
	 U8rIRPczHSYHLrl5HSRkckmMcsza2dMvIZc0sKMN2ZUzCdb9m3aadurhx69sAuii3E
	 Q/50dEhj4QwYjCV9lOG5mRWWvSTRevL/XAYfZddLAX8ML4qMo/TDMbI2JoI0aYPilQ
	 /9OhxxL8bEV8AMkyZ0qeb8vKIVEMp6eTMwEpNB8yOU7HJAYOK3o9nziQKmBOwjZVQX
	 r/yX3HzuScSqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B244CC64457;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: enable DEBUG_FORCE_FUNCTION_ALIGN_64B
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163472.19859.6098325003909705724.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230727160356.3874-1-jszhang@kernel.org>
In-Reply-To: <20230727160356.3874-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062040_012097_2CC31C4E 
X-CRM114-Status: GOOD (  11.85  )
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

On Fri, 28 Jul 2023 00:03:56 +0800 you wrote:
> Allow to force all function address 64B aligned as it is possible for
> other architectures. This may be useful when verify if performance
> bump is caused by function alignment changes.
> 
> Before commit 1bf18da62106 ("lib/Kconfig.debug: add ARCH dependency
> for FUNCTION_ALIGN option"), riscv supports enabling the
> DEBUG_FORCE_FUNCTION_ALIGN_64B option, but after that commit, each
> arch needs to claim the support explicitly. I tried the config file in
> [1] for both RV64 and RV32, I can't reproduce the build error as [1],
> there is no reason for not allowing to enforce this function alignment.
> 
> [...]

Here is the summary with links:
  - riscv: enable DEBUG_FORCE_FUNCTION_ALIGN_64B
    https://git.kernel.org/riscv/c/74f438e75483

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
