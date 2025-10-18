Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116EECCD195
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vumR79U+iAwzKMXxD3O9k4aFr0LH+rc9lSDw2Hjm3E4=; b=jjCtk4oi9iYwMW
	jTHBNNml5RsI4IoGIXGHZnzGYPLg+IDcXU7nDLJMMy6KONsg/GffZmyjV4WI9xrKFLloNTcC8U2Wy
	mvNCR+GmE8mgwE5+9SiBfIXPjTiA6YwfUVUrmgguD0uCMGOLnyLPwL74tAg2PiBFdEuGdjbzbBfmt
	5VaXieVOwhs4cAeFxajFHl7/vaPmv6UyBTiz2YIFP6qi9VTZk0+oa+x2J4AtjX/VivCb3aZ1eXs84
	/PFzbeSUEfGV8tAiCVSOxC4+7xZv1230VuUbOjHiVZ6C6xE6IKaOFe3exeMBc3GMW/ioo/KibWIob
	PPUwIXKM2Aw0IwbL70nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NQ-0000000A76K-2A2D;
	Sat, 18 Oct 2025 16:01:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NN-0000000A75G-0idE
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 16:01:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C6C461154;
	Sat, 18 Oct 2025 16:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B270C4CEF8;
	Sat, 18 Oct 2025 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760803308;
	bh=u/syW8Wz8ABWTw3mp7UlY9VWdvRASbfj7TUbwfSB4jQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RwXqchKvN++6LJ8SxvtqfDUt+hFjpitkBtY5GiIbpO6ItDvb6LSoI28GhUd1Krkwo
	 OI1qYUwLSa0oT49UHwy+v74fz1VofqxaaBJ9wRSlo3It8XccsfDep5/Mf+3df3ejUJ
	 CWNYPCVstUzz82gtoO9wOSmI1Jx7iVH6X1P0bR/pTShaA1JjQQFhx2VtMHEjVeDxjO
	 wBIj6G+9xxINb2+aKs1v+Q4Nel7y5aHSPeKTbCQMT65TAI7AFznPTLzgTJ8eKeGksD
	 DENxYFIHRv4M5k9hZhuiLaYFj2Mbc9nkjheB6BEwDkQf00WEH8csEqswmoRU4UzJbL
	 Y3BG/0xpGYYvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD8839EFBB7;
	Sat, 18 Oct 2025 16:01:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: mm: Define MAX_POSSIBLE_PHYSMEM_BITS for zsmalloc
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176080329124.3028979.1869728422063945538.git-patchwork-notify@kernel.org>
Date: Sat, 18 Oct 2025 16:01:31 +0000
References: <20251015233327.3885003-1-samuel.holland@sifive.com>
In-Reply-To: <20251015233327.3885003-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, apopple@nvidia.com,
 akpm@linux-foundation.org, willy@infradead.org, will@kernel.org,
 linux-kernel@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Wed, 15 Oct 2025 16:33:24 -0700 you wrote:
> This definition is used by zsmalloc to optimize memory allocation. On
> riscv64, it is the same as MAX_PHYSMEM_BITS from asm/sparsemem.h, but
> that definition depends on CONFIG_SPARSEMEM. The correct definition is
> already provided for riscv32.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - riscv: mm: Define MAX_POSSIBLE_PHYSMEM_BITS for zsmalloc
    https://git.kernel.org/riscv/c/5898fc01ff34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
