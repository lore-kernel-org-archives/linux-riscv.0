Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA6BC77B7E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mtX7c+grr83jlx20Gzkyn7tHXPWUkA+GtyvRqW1vAdY=; b=MaVKGWcO05jb8N
	MjzirlYimELPakoJcEdLR+iEfb6E2KEZeZ4eqRLWPULGd1rsB/di3eVVCY/9+aKDvc7y+lCDFc0Pb
	5cmtG8VcuRiqqbUac7bOAw/CZhWO04o/cydP7ldRnU7zzKvXeQ/9L6vL+t7HFzO9ERO5ybeY2yTLZ
	+pnRNNjObPvO++4NfePY4ZYBoa5LreK71p7aZyqbYsornItoGhJSMckiTy2AsQv1kExgJEntlJtgz
	3q4IHKFJ1tmLHvy6uR2sM7nYL+9UFTx+VahXp66BuHnMSKigruptMVXek6WJylKYlpNVs7b2xFt1m
	6WFtJZAyIDRZn3IlZeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pK-005fxh-0A;
	Wed, 19 Apr 2023 14:30:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pF-005fuc-1W
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:30:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E270638E6;
	Wed, 19 Apr 2023 14:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C657C433A4;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914622;
	bh=CLPBCvnLBPNDhkb3p5LS+h+PE2cDwvg/S4UXs4J1CbE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i11vCd7wd6FsvgKK3GuPKKQHxXINchgPooH7ZUEOJyIkihbGVuiAL0bMUJRnRTHAV
	 1/nLznGDAGFzPg4E5I/YHcUL4+2QO6/3Mp4DFRwlIxyi5ZvnFAZ+EMgfKp1jXNLXCm
	 xH4YiIFpUkvL8JzyfhA60sFX0GG0yAC/iwFLKV8zd1c3XrykMfGkp39YSXLFDg8HVW
	 QKLqyFf5a2YmmQQcaB8EnBSKcra9Gr8WA/6LWlXbGVO1PchDf4O6z5zE0/T4cpBpN3
	 yaIBB+JU0YN5nUsmVtQZpg3J2qPpXRIVURkqjvTFU29HGHVwZoi6JFIb98b86hlrHz
	 f9oaGrWupUA+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 667E2E330AB;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "riscv: Set more data to cacheinfo"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168191462241.22791.9394039484769649395.git-patchwork-notify@kernel.org>
Date: Wed, 19 Apr 2023 14:30:22 +0000
References: <20230308064734.512457-1-suagrfillet@gmail.com>
In-Reply-To: <20230308064734.512457-1-suagrfillet@gmail.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
 pierre.gondois@arm.com, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_073025_549281_F902301C 
X-CRM114-Status: GOOD (  10.97  )
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

On Wed,  8 Mar 2023 14:47:34 +0800 you wrote:
> This reverts commit baf7cbd94b5688f167443a2cc3dcea3300132099.
> 
> There are some duplicate cache attributes populations executed
> in both ci_leaf_init() and later cache_setup_properties().
> 
> Revert the commit baf7cbd94b56 ("riscv: Set more data to cacheinfo")
> to setup only the level and type attributes at this early place.
> 
> [...]

Here is the summary with links:
  - Revert "riscv: Set more data to cacheinfo"
    https://git.kernel.org/riscv/c/6a24915145c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
