Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8E7C5B549
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcWorMmkeFenOaiVdwwXZW5azxNbd6R13iBkep1J/IA=; b=Jfot62Wj9bSls4
	RciT1Z6+ghbO76vM2FgYT1m8PuPl0mPzx5jODg5rfPVmWtCHWKUuQlEfjBT1qMtckybcEKZWCsFEi
	/FqF+Tt1ZY/4nhcAu93+y180FR9pOG6MP9HsaQWXdeqdgCNJcj16rYUQ5oZvsQKxYA9lp48up9C6H
	M2RiMBS+bd2/nd28GLKcz2r66p3QvnlY4BcrztbnmTbYn9ywkxZDVvUnljlEo7fs39sXY0cXoYBPr
	kLMHWyfhnQOvq1YXY1Ej0kYNweiOcXCjRiWxuZnh7U+2iDk00fzJKKH4L6LpDU7ARZSz8poTMUPP7
	X4NNaAAjOntDPkj0gqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAY-0000000DZnM-1SnL;
	Wed, 04 Jun 2025 14:32:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAV-0000000DZkg-2cc8
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 14:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F191DA505FA;
	Wed,  4 Jun 2025 14:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DF3C4CEE7;
	Wed,  4 Jun 2025 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047558;
	bh=lB/yQAcwDwQWnC6crOBmKgKMu/ci2zhhqHFsOuC5dj4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fC2O+C650glKE+8dex9UU4aqKvHKVv3iwhgIb1n6+3eUgcZxapZVt6J9hFqGJHcqg
	 7ebQo2HYhvNRFSiFtWvL3xoS8xY9Bn/kq9A6rTpweSVGmEpyYOHivaCbWLtiKHEN1C
	 9Eax769vPHZ0pUsTZFBl1NszAXP8zZFm4fNbikj2c9Dkm26GjmdK5XeEWJx6n0hej0
	 3iO72hGOMjVFmm6FobI7XNWIHdZlf2IKk/xTI5MFEgvwcBaX4XSUnqhUXeCncGVJyD
	 QPE4I9HJoFa0tvLIdpvEaKBFrcGJsPJcx+9lLL6rzYAdGCTrCpiBkBzn4JXGyS+gBo
	 mUDzVPnA4wMEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B5738111E5;
	Wed,  4 Jun 2025 14:33:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Documentation: Add enough title underlines to
 CMODX
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174904759098.2309006.15834155817358253141.git-patchwork-notify@kernel.org>
Date: Wed, 04 Jun 2025 14:33:10 +0000
References: <20250603172856.49925-1-palmer@dabbelt.com>
In-Reply-To: <20250603172856.49925-1-palmer@dabbelt.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_073239_748307_9FA92567 
X-CRM114-Status: UNSURE (   8.32  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Tue,  3 Jun 2025 10:28:57 -0700 you wrote:
> This reports as a warning in linux-next along the lines of
> 
>     Documentation/arch/riscv/cmodx.rst:14: WARNING: Title underline too short.
> 
>     CMODX in the Kernel Space
>     --------------------- [docutils]
>     Documentation/arch/riscv/cmodx.rst:43: WARNING: Title underline too short.
> 
> [...]

Here is the summary with links:
  - RISC-V: Documentation: Add enough title underlines to CMODX
    https://git.kernel.org/riscv/c/a146ae2a60be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
