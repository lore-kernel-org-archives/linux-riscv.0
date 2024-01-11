Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB13C47DB1
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rT4y7amtfXNWuDM8WR1Dm3LffAWO+XR5wKV6nBmIAys=; b=auz4GX1B68CxI3
	MoFa1NxVBZ3gKa0LVWZDLtX9HKvpKi9KhJLGIscNXQaJ3uVaRg/PHVByNo8H4OZ2FkDBmNtox12uP
	YLf+cTauZY7ZIvI8wb1CcK3SA5MSHIzixqO/Y/WWcX4yQsCH6wcwqCyfcMLSxCd6znvD+OiXnQVHj
	2StDneEK0xts4324Q0HLfsfo26m5mMRm4OUVci7GIvm3MUNiBMp6D72v2q+Dhsgdi1mnzscteM1Lh
	ojyQw7oDAq4a3sE4r8aYOo59eXuEiMpnUNH4+x9i+XV+5gRu/PBfJ45zhesEEANAvMyPndOoUTTU7
	Gg9fXi4uFWU+XUomcRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOR-000KOM-1V;
	Thu, 11 Jan 2024 14:50:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOH-000KIn-0e
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3783361AFE;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16038C32778;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984638;
	bh=sxh40JJQMoRZqXunjJmrdXyyxH+F75rmhC8LiUGqhE0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kRPkfA0lip75TvmCFQUcSzqgumSiQtZ+YPmRhQRBD/E10A8e4L30WM/Mm70ctz+uM
	 nJ5Aq2dEBNBVVPwuxppzz6EXd1lLlPGhwV4s32x/P+SeOfpwOY/SSK23ArBxSOh5Mr
	 TL5sWbLVYLboYp1J1fnVCLjyDKOl2noLagjJuAX3Xvhkmn7yWvuZUWtLoaTpVVXYHm
	 74iIsYZIVhlJ/w6rO6xe1IKghnmsbgk+fmmZZpGFZXHGe9O+REHc8/M/5s5/mih030
	 MEP1KsEo8LHPYIZvaoMJzLSPewDrsnBlfmkqCp2bY4G+E6kl0mXNjGQIg33UqoP5/a
	 sMI0u3IaBOkNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0222AD8C96C;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: fix __user annotation in traps_misaligned.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463800.20080.16588164711212512128.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:38 +0000
References: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065041_296433_4231323E 
X-CRM114-Status: UNSURE (   9.67  )
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

On Thu, 23 Nov 2023 14:16:17 +0000 you wrote:
> The instruction reading code can read from either user or kernel addresses
> and thus the use of __user on pointers to instructions depends on which
> context. Fix a few sparse warnings by using __user for user-accesses and
> remove it when not.
> 
> Fixes:
> 
> [...]

Here is the summary with links:
  - riscv: fix __user annotation in traps_misaligned.c
    https://git.kernel.org/riscv/c/ca0e433b41a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
