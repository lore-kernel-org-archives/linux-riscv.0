Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1B2E7719A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yzuHHxQnOZ4VB4IkBmf2Kb41ZDGWmLLcpqDjkW6cyM=; b=P4kqADBgayu0/R
	5i2tCvxURDZIiGnyNG0ib2Q0iF22lbirG+J/GH0V5m0xVLB//4RLreEJU4Ms2Ux4pl5nJkbBBP155
	2zfZtWOcfVezBgLfA5YEMSgpDxtXl349v3WdqJUSI8bC3GDFyyptOtGCkV0lsM9E4RBGsPcu3VcWO
	QwVB0tAg9b3Pwq8bU+8oI9m0gAHCNmMMQTVZusChkD0QBJcQGmltaNNc2KSfvLv88uMPE95D3yfPH
	X7jE5QmE4vFmRzy3Z01do1DuW6LuTKyalizSZ/dmOe2kPO2q4ITxoX7C+RG8v/AUPwLSEah6962j2
	P0NxOlI4VKHytVRjBzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCz-0000000CdoI-3u1c;
	Thu, 09 Jan 2025 16:16:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCw-0000000Cdlk-3C29
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4963D5C5C7C;
	Thu,  9 Jan 2025 16:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13588C4CED2;
	Thu,  9 Jan 2025 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439390;
	bh=lLc428MwVBZLOUjSb7mBR/eR0fcuFIIBC38FuoCAZgc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ox8csaZVwuUcQbX4/ODrqTC2b/7NOy4qHH1/xjBCRfHbfTIi+Yvr3T+MgmLfq4W2G
	 LtXEJ7WRtaX4TIiDDZbhxKxd+eKyhYShsYERMmhMPBWEpy+YEwXwedJbl3o6tui3jM
	 bGuvsgeggpWHfeBMwJa/IDjRVQF9VmQN1EbZhIJGH3by4qiLVAFERzLL4HJQmkNAt0
	 QDVRrKLzuDSqxyU15p3B42r+C3KfpWhgrnK1gbqgemJroOHeacz/OuQAu4tv3x+ZiV
	 oqkN/Gd+1meHJfNwk7AJHm6sQInxs6iXBaYrhvgZFvGsaV6h1poyDOBhnNR3UMZrtM
	 v+666YguQKwWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADB3380A97D;
	Thu,  9 Jan 2025 16:16:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: qspinlock: Fixup _Q_PENDING_LOOPS definition
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643941148.1375203.4599909310672567109.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:51 +0000
References: <20241215135252.201983-1-guoren@kernel.org>
In-Reply-To: <20241215135252.201983-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com,
 peterz@infradead.org, parri.andrea@gmail.com, will@kernel.org,
 longman@redhat.com, boqun.feng@gmail.com, arnd@arndb.de,
 alexghiti@rivosinc.com, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081630_842867_CD3641B0 
X-CRM114-Status: UNSURE (   7.40  )
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

On Sun, 15 Dec 2024 08:52:52 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When CONFIG_RISCV_QUEUED_SPINLOCKS=y, the _Q_PENDING_LOOPS
> definition is missing. Add the _Q_PENDING_LOOPS definition for
> pure qspinlock usage.
> 
> Fixes: ab83647fadae ("riscv: Add qspinlock support")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> 
> [...]

Here is the summary with links:
  - riscv: qspinlock: Fixup _Q_PENDING_LOOPS definition
    https://git.kernel.org/riscv/c/40e6073e7648

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
