Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D4C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dD+xTsa514j2nJKT1nBExe9renTbIieFb54Xgb18vO0=; b=MWIl4717z6GW93
	MbTtrEIpKN0rxEwNndW4rMtQTsBNCQRjddPceGX7OOYCGC2M/lltdD08R4vNesj0SqdBZOLC/48EL
	dvUhhGuB5JjSCrBWBXMQWBPPEO5iLHebdfrTcATr64+LMFf2IERjRmxmOAHhexrBcZQSFtzt3rBIy
	8aZKEfYeAV830o3w7yMBOPINX401H8VrEXGVOUsXC2+Qe667eiXZ8LdPcczzx+aCecN0rnlIBm/Vz
	NjjUMvP7hBQMtc3njFEkghzvItdrInVebthe7SgRNkE+qLRxkiyeTPdmt0JwEiKkjajRLrRynsSbJ
	BrQLP1FJ4NNWQ/2QEKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbn-00CmE3-IT; Wed, 22 Feb 2023 15:00:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqba-00Cm76-S6
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FCEB614AF;
	Wed, 22 Feb 2023 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55601C43442;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=sAD41qlfpUmeVTbNrsaNBRxCTKKHTpb6EbOTUc1nL0c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V0GT9cQpOdFsMVan0RIVmmJO+AJk4l/zpz/IuknM0eLQAWsPzL5hKHWyYPotVvWC/
	 iExM48uAxvBH+w+0Jq78YGe4QyD1XXSYMfoCpk5izibz/MCysGVp+193+kKHKA2rtr
	 /YJeUHHnmY79nLNHzWfK3un7fSEDdaiYta01V6q1RYfD1FxgWUzyDqhSvSWHaPkzvC
	 QHLNMeHCPDgpFGYkFFt5Aq/Met4mYxXT9hVHw5VquKkiontLPESjEZgJayccvGT9fW
	 9uw/s10f3er9LoaawnufdN6uDtuTiVSZB4sz2uGojc6kMt1Q8mQ12fU6V8/x6mBJ/6
	 OOoq+Z+g37U7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2DCB4C691DE;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Add header include guards to insn.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802217.24438.17901281821213780885.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230129094242.282620-1-liaochang1@huawei.com>
In-Reply-To: <20230129094242.282620-1-liaochang1@huawei.com>
To: liaochang (A) <liaochang1@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu,
 ajones@ventanamicro.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 conor.dooley@microchip.com, jszhang@kernel.org, vincent.chen@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_070026_995030_EA3AAAB8 
X-CRM114-Status: GOOD (  10.32  )
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

On Sun, 29 Jan 2023 17:42:42 +0800 you wrote:
> Add header include guards to insn.h to prevent repeating declaration of
> any identifiers in insn.h.
> 
> Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/riscv/include/asm/insn.h | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - riscv: Add header include guards to insn.h
    https://git.kernel.org/riscv/c/8ac6e619d9d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
