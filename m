Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0544CC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nw0ntgA3IeffOwK777D4xbNw9Os57av5Z+jLWC71Iyc=; b=tL/0Wpws22wtVG
	XJftgYtgDikLtMaGRMEiU/zH/7KhfzY9VKS/PEpgDiDmDMVAwhqOZIssyx/5WRVuOZgXz69sA9/sz
	AjFW/TmyA7WsxYbtHC/s1+3YQr2jE6tUmJD+n9VWY+ncuWr/xaZV1A3e+FtJSM1NelybcfRm0Sn2L
	RERVXOWhKvhxJYzKq9oj7/tdtHv8IdLWAjd/1/huRl3BhC8LMdnB7lT+6w6E7liWZW0nmWiMTqHdn
	Lo7fYm43Qf8ByjK7pLbfaEjqd5r6NoO3/lNjBMnQrjcE3JSu6qSuCD6qTsNCWzkJPDh+a2BUQWQoN
	Hw6HwGpVVSUGMR/eyrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZb-00000000nlJ-2kFy;
	Sun, 28 Apr 2024 22:00:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZY-00000000niu-3EA7
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD3B560BAD;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED6E9C4AF1C;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341635;
	bh=G75BxI2Ke585cbRErrGMj5F7qdvtnyl04UrjmqS8Nts=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RKACEZM19RbQbpO/Z7PdjBdvoZePPUTDthdMmu1niB0ZKljcxQGfiXDP13BhPqRqx
	 9EYEwdZM6CFTMX05tFuV5jZVJgoDCKrQiFYqYfg5lARUxSgVhmWnScukiB80GPDKMu
	 qQJby5ChjLvbSwreZZD5Md9A8jiLm6wXRVq5O7WLA2bRcOZ2/NNk8sMIcMGdDp3tAP
	 faXsVbSd1llPWZhDpS92sfMu0w9FCDkCj36CxwjuO9yXX2PM3HqsFJmwpKul/b1Fjv
	 KI3OUHEXN8txRDoGc8JF6lZfP2sMypiukY4uPbBONsOXykR0TomVlzEyIa6sP5pSrn
	 i2Sj/bzC+eJxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E04DCC43618;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v13 0/4] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163491.22130.7402887915365003575.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:34 +0000
References: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
In-Reply-To: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, corbet@lwn.net,
 conor.dooley@microchip.com, cleger@rivosinc.com, atishp@atishpatra.org,
 rdunlap@infradead.org, alex@ghiti.fr, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, atishp@rivosinc.com,
 alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150036_876749_A23F4CAD 
X-CRM114-Status: UNSURE (   8.17  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 12 Mar 2024 16:53:39 -0700 you wrote:
> Improve the performance of icache flushing by creating a new prctl flag
> PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
> for future expansions such as with the proposed J extension [1].
> 
> Documentation is also provided to explain the use case.
> 
> Patch sent to add PR_RISCV_SET_ICACHE_FLUSH_CTX to man-pages [2].
> 
> [...]

Here is the summary with links:
  - [v13,1/4] riscv: Remove unnecessary irqflags processor.h include
    https://git.kernel.org/riscv/c/bebc345413f5
  - [v13,2/4] riscv: Include riscv_set_icache_flush_ctx prctl
    https://git.kernel.org/riscv/c/6b9391b581fd
  - [v13,3/4] documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
    https://git.kernel.org/riscv/c/6a08e4709c58
  - [v13,4/4] cpumask: Add assign cpu
    https://git.kernel.org/riscv/c/decde1fa2093

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
