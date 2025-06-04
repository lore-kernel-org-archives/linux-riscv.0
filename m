Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390A5C61CE8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkA7v5f4lVxlZDb7xq/2XZC1ys6T6IckgRFFaWKK2x8=; b=cmMYTifDah3/jv
	SuQYdzxVbmMAbY1IZP69EenQbkr7J6eJmuGLFWxMohBV56NtbdvcFdG33SOw5mWpKWKOQk+X9gzLf
	uWlaVPEnnCPkysIX098tCVfrABAuneHwgdbfsh59R0/dhiE9saiMhfjP1qIrYOtN8jMiO8+hxHPvQ
	HVXgmxMgXwBgGd7RCfaC1jyUXGvaN0sYCjDQ2fi7YavuXO4fdINeLKWYsVxKcsi6vyFcDGOpirGLx
	Q6UxnWj7mug93TOuwVKNgzaBUngB1pPI4mkoC6NETimeRiB1FBZMDla6lK7Rwnc/DLMu55w3ARwL5
	QWbge5Y8HHbh1Orsmd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAW-0000000DZmS-2zbi;
	Wed, 04 Jun 2025 14:32:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAU-0000000DZk6-2IwY
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 14:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D72E7A50148;
	Wed,  4 Jun 2025 14:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FBFC4CEE7;
	Wed,  4 Jun 2025 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047557;
	bh=O87SbhJu8MiAOI5eh0Puuguvo3LgbY3USgQjEazZQpo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jEgMPt0Bgzg6ctCIJSWZMCZxt/hbyRD4wWVB6bkpUzlBPFnGniMjAvRLrjTtcgso5
	 M82G3WqjhsGU5gRwiW5dGGwMelMyEKKYQSNfgB9uWO0WzdokraZrqLRYG3y1q6DHfm
	 H1BFiE138JGS4ur6BRfCrSw5eU7fTHniz6A35Waf7gIKDOHMh3K6w6y+fCe1Tml9zx
	 ewnP5ePr652n+i6PhJ+wl/ra3pMLXtrzkOBLpdb4FQeI+OfHcVbtU+keVtm70lq5dy
	 nApBuyYdbsUm61Wqg1hO/XIuv/z1+G3yLwTeqrdeVzt2rXca3xP83euqZOygiXT9ff
	 6nPtW7/GM1w2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC1E38111E5;
	Wed,  4 Jun 2025 14:33:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174904758974.2309006.8809303189389627595.git-patchwork-notify@kernel.org>
Date: Wed, 04 Jun 2025 14:33:09 +0000
References: <20250513151631.3520793-1-namcao@linutronix.de>
In-Reply-To: <20250513151631.3520793-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_073238_657673_F8E93B5C 
X-CRM114-Status: UNSURE (   8.00  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 13 May 2025 17:16:31 +0200 you wrote:
> Add KUnit test for riscv kprobes, mostly for simulated instructions. The
> test install kprobes into multiple sample functions, and check that these
> functions still return the expected magic value.
> 
> This test can detect some kprobe bugs reported in the past (in Link:).
> 
> Link: https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/
> Link: https://lore.kernel.org/stable/c7e463c0-8cad-4f4e-addd-195c06b7b6de@iscas.ac.cn/
> Link: https://lore.kernel.org/linux-riscv/20230829182500.61875-1-namcaov@gmail.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Add kprobes KUnit test
    https://git.kernel.org/riscv/c/91d95bd795b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
