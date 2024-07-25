Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F6C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=702gytFQUMLp/TakJQyfpdhjzDmI3Ekqj0a6Sp19K3o=; b=06yzvR14hG1oOm
	U+cB74zDwbTup9Oc3O3omAqL9P2pGRL7qjAdCOMu/JA6MFfBnBAgoISGkhFjlBujyyzqZpIAI67rS
	TCOEoqs6JHrAuH7rNB1Hwxjo0+q9bBo39Xx/Cyl1F9tY3Esu8Nlux/5SbPA81KDERi6MlLW1A/Znr
	CQAh2VczBWNQhNvajjCFoc1ClcH8k5t9FDLf0wV5NapyVMnngsSuBYwkpBwhYwCHcTaX+dNoZ+S/v
	4obiM+GXnE0xRc2AlxeF8rwqlG0OBntygfmFMxr7m6kH0GPqMXLgSxh/GnUJvMGUbj3Q8YyTIPt/T
	mALA+jMFuRPEjKjDzjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOi-000000012lS-0mrJ;
	Thu, 25 Jul 2024 13:20:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOe-000000012iL-3ueJ
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87F7A612FB;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39002C4AF0E;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=pFdXkjdGSDh8zJd7wdWGLRV6jOx/WG05Mm/gHD8rTs8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PCTiKvkMrxorbBHJyOMPP3nbCO8C0QvST4F8LSkAlfPRPxyRlWCGcucGMHi3QcF5K
	 nwqnFej+PfHTsencpYTdZ0EUBU4swYfTxwWrB4QjyaZto5EUu9iA+6317ICEr/1AWd
	 ceE/NN2GzcQqEcSSpzXP1xHTFNcQeA9yWXr1IOsgwHhVnBbr3iVYIWwZ/9oXkVrnDH
	 nf18rr08iHrfqZNfSeyYrfmWP+lbMIIFlyqZFoVoDjJFSQc7wYFvNN9MXlWg2iHe88
	 vdN3a1oJQflhcV44wwySOjj+4aDbUF7L39sIKZELlmGbMak9INugucwaWNmZOJzPwo
	 EFc0FBU2CJVGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2633CC4332C;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: signal: Remove unlikely() from WARN_ON() condition
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363915.6240.3728973029853294759.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240620033434.3778156-1-quic_zhonhan@quicinc.com>
In-Reply-To: <20240620033434.3778156-1-quic_zhonhan@quicinc.com>
To: Zhongqiu Han <quic_zhonhan@quicinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 conor.dooley@microchip.com, ancientmodern4@gmail.com,
 ben.dooks@codethink.co.uk, bjorn@rivosinc.com, quic_bjorande@quicinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062041_104407_2DEADCF0 
X-CRM114-Status: UNSURE (   8.65  )
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

On Thu, 20 Jun 2024 11:34:34 +0800 you wrote:
> "WARN_ON(unlikely(x))" is excessive. WARN_ON() already uses unlikely()
> internally.
> 
> Signed-off-by: Zhongqiu Han <quic_zhonhan@quicinc.com>
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/riscv/kernel/signal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: signal: Remove unlikely() from WARN_ON() condition
    https://git.kernel.org/riscv/c/e1d96a07ba4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
