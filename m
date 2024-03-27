Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA75CC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lC31/tTIW6W/eTHZAzlok+qRiVu4EiXSdidbVS6LxS8=; b=dL+KwImQAFitZ5
	+ZHobrn+hQ6X9mBH+7Vk0yu9ihYIKmYoxkxg/56l8qjzpQikGuTsGTK0kS966a6ubMGNH+jFM/T0y
	ln6Sp7AG2ebMcNz87wmoFJq5o2A2RT+d4you00cb9rB/XU/+3eoPaZg3nEABUKwFtGJQG8HOYcrkn
	I7wFCrOrzk7eiiqxODplaqbj2+1pvEeiSBxPo2jH69RjOy761lFdu5isL9YQTBh1MGbowe0+IgbfU
	66ZqknoO7eCDr78nU/aUMpQScdN7w1MxzZlXl9XwJq6ma8ZAtGgCv219t3704r48ur2uEX+nsTls/
	Y39nk25SkRmL0fD4r0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpTpS-00000009LGd-2uJ3;
	Wed, 27 Mar 2024 14:00:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpTpO-00000009LES-3uIm
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC53A6130B;
	Wed, 27 Mar 2024 14:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EFA8C433C7;
	Wed, 27 Mar 2024 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711548029;
	bh=ZWRwW5a/atUY75Ot5EmWWJL5+SmwS0RdF9EFAzrkh/8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ReEFqrogeCi+nRbx42nxkjrSkR3GIqBQ6PZ6p2tUuKR9PTorPRZZutM0AROiDLTkF
	 2s/dHtCXduY6xTzRPGnE2eGGEHU3iqsf5mbWq+5lm/ECl78jWGez4+euoaXONpegN2
	 Y5q+GvKsZOTtSokf/mgdk4IZSAEK4V9ebdx05kez1Fh7ikPLmN7fQrqbLzNW7D1MGp
	 43gypArhfrHuQKX164JMDZZ3ON8XJNfXJiyGavzXlhXw7Db4ROgDhG2ARBAN5exPL1
	 weYVQBMzbFDpSFMDOn9Cr+6mgdsorM1wqMOJck8EkDxQ7XMd7TDNE6VINSJWZ3a+3G
	 Rs+TcgrS6WfrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 821ABD95061;
	Wed, 27 Mar 2024 14:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_* while
 not supported
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171154802952.9827.25009069225289323.git-patchwork-notify@kernel.org>
Date: Wed, 27 Mar 2024 14:00:29 +0000
References: <20240312012053.1178140-1-pulehui@huaweicloud.com>
In-Reply-To: <20240312012053.1178140-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 atishp@atishpatra.org, conor@kernel.org, anup@brainfault.org,
 palmer@dabbelt.com, bjorn@kernel.org, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_070031_279787_5A602020 
X-CRM114-Status: UNSURE (   7.79  )
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

On Tue, 12 Mar 2024 01:20:53 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> RISC-V perf driver does not yet support branch sampling. Although the
> specification is in the works [0], it is best to disable such events
> until support is available, otherwise we will get unexpected results.
> Due to this reason, two riscv bpf testcases get_branch_snapshot and
> perf_branches/perf_branches_hw fail.
> 
> [...]

Here is the summary with links:
  - [v2] drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_* while not supported
    https://git.kernel.org/riscv/c/ea6873118493

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
