Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD20DC0218F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGzlpKQ9qsSF62K7VeDCE75mknO9qXZs/yMtSiYBvFE=; b=bDLkzEdBWBhvFE
	GA4xlmUhZVRRO0drxxH6LmPnEry3fl+wy3eETEm5iQctCKRBMXz99tqiUpqQPi2D4ZS5lmSRHL5rN
	SollKsurpYZOVEgUC2VWBcVS+Fuw0ubR3oHHYgX4JWFGmjJH5QwRurT7Qkv1dJP6EBZUR0OX7OA4U
	jpqfmZn7LcZW3uyunZi6wLcSS3UaVIJxriAl2j2VESF9XSFQeeMWgqO8MXAwjLRlXcy1USg6ZqvT7
	HyRLxm6e14L8v/VQY7dAAjzTHNmh4dTvegx+8CZ+lK+x0r8YZgvKP+KS+O+lx3/glxs6YTEXSj4+8
	OpCIXepoS+az2j+LRW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFM-00000008wN9-0z3b;
	Thu, 30 Jan 2025 14:10:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFJ-00000008wKW-2EjS
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 14:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25676A41A99;
	Thu, 30 Jan 2025 14:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83485C4CED2;
	Thu, 30 Jan 2025 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738246216;
	bh=CbMMJF1uQMgPSz1soY9p3lNPl/Y6u9Wb56FJLQKyfSo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QwVDph6HjKDRoF7VVkblK2s4GXMm7YUaZyR2O+5ZDZSY8UFdaws5nM6s4tKUlljOd
	 u0AVW43U64Rh+kxwkMZyjbpYbg6bPxkXHafV/3Bykl/i0Q/BGwJLPKiPhzVy3IbEtg
	 Y8MGnjeqmoUsFF9SRVM2lfRmUzcuqdLOpO6cuK+mihuVO/ihUc5XpeNFAzcIgn9/OR
	 fdgUt/LiNxN2dKLao4zEQj204vp0i4x4Oq2o3Z7zRZRLXgwmHksVkniCWX1biku70h
	 LWgNGPpggnY2vUrcJZNVPlF6uDJO5wkrX1QcjIT+K2jggCBNUYlmayzaDvQ8oEQv6G
	 8PES+PGMogm0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBB7A380AA66;
	Thu, 30 Jan 2025 14:10:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv/futex: Optimize atomic cmpxchg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173824624249.971083.10928021960691626990.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 14:10:42 +0000
References: <20241113183321.491113-1-dave@stgolabs.net>
In-Reply-To: <20241113183321.491113-1-dave@stgolabs.net>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, jimw@sifive.com,
 guoren@kernel.org, dlustig@nvidia.com, parri.andrea@gmail.com,
 boqun.feng@gmail.com, peterz@infradead.org, will@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_061017_632413_CC6565E9 
X-CRM114-Status: UNSURE (   8.06  )
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

On Wed, 13 Nov 2024 10:33:21 -0800 you wrote:
> Remove redundant release/acquire barriers, optimizing the lr/sc sequence
> to provide conditional RCsc synchronization, per the RVWMO.
> 
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> ---
>  arch/riscv/include/asm/futex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv/futex: Optimize atomic cmpxchg
    https://git.kernel.org/riscv/c/9d0593da9459

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
