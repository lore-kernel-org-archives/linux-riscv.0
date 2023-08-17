Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F208DC30654
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahuqu2AjakWds5Wa3bWEXQOw5AegDpHvcmPWypYEKVw=; b=APCvj+IKAZ8jRl
	wONyDg5mUPUac8kdO7iSp7KeN0pN6IuO7r7nrYfkudW8HD0g3WHywWD/ERytiPMzb5nGd9eK/1X6T
	rGYCLWwo5mJNK0xFmHQpZkfBl7Z1blqtWewsG8GWOUid4ix6Wt4PJ8eDilGiF4ZwWm+dI8zO4oEmr
	Jv6i/hcsF1aaWuh3W7dyae/cTkXdfo5u8J8gpJ9O959yUdnDJ9v44BLryhKmrABTgpLasZQekjIdp
	Dpv6A1efkq7tGW3DJghduQjo0xjOecbvZi90RypRZg2vbBWgu/pzST8BWfOxWxlihU4lgs6p4UXOq
	w8og1rI0Ey0HbXD1jSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenW-006fTi-1K;
	Thu, 17 Aug 2023 15:20:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenS-006fRq-1W
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 15:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7FB162EEE;
	Thu, 17 Aug 2023 15:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E27D7C433CB;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692285624;
	bh=DB0OhACvo8fkRgRhb62F5ThJJF48oRue24Z1cHKFom8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e7mr0TARpLL1dqFKwLjPCjuA6zvFD4sIuqk6uQguLrIfP33B+9Ljwq+BbPRlfv4/v
	 rFFDpGQUUDBFKQllHAFuMGjmdKFZkWDzvVAQK10RDEmmfZoQFQUq1jU+/nQedBP4FS
	 g34UXmgEw7ux6SiGJTpvcnlivwV9tLwZ8BnWcuzLv3gtlJveEbDl+Oqpx3/DOMoCha
	 FlzgDFwDa++8U7xLHyQRdMx2o7jRlvRVSsrlVsDUOopy2+pT/ISgAo31KAcdH1Zj37
	 lEPM+HiDWGAvO+aS4krHf7eK4R0PdPwj5l1Y7sw3DBcvZQuD8E4N5botAnOlUes/If
	 yVR0mwrlsfzJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C714DE26D37;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: correct riscv_insn_is_c_jr() and
 riscv_insn_is_c_jalr()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169228562481.20811.1913626229577446367.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 15:20:24 +0000
References: <20230731183925.152145-1-namcaov@gmail.com>
In-Reply-To: <20230731183925.152145-1-namcaov@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_082026_553715_FBC837BE 
X-CRM114-Status: UNSURE (   9.55  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 31 Jul 2023 20:39:25 +0200 you wrote:
> The instructions c.jr and c.jalr must have rs1 != 0, but
> riscv_insn_is_c_jr() and riscv_insn_is_c_jalr() do not check for this. So,
> riscv_insn_is_c_jr() can match a reserved encoding, while
> riscv_insn_is_c_jalr() can match the c.ebreak instruction.
> 
> Rewrite them with check for rs1 != 0.
> 
> [...]

Here is the summary with links:
  - riscv: correct riscv_insn_is_c_jr() and riscv_insn_is_c_jalr()
    https://git.kernel.org/riscv/c/79bc3f85c51f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
