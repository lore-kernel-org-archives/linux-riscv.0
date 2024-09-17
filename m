Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B3FCAC593
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvePEVbA5LJqjf8zSIvWDYti98VBGR8OahjJ59hYUNE=; b=Vt3MJz3brnFP5z
	apNc+jNV9LVA5tL2DLCP9tqwn+jUEOz2sAnPRKASZGHAWWBbFIv0xnnjIc6f2URseJjl5WD4xXSa8
	vWt3D6s4XafeKnpr/3Hs/sg52ZwMztDLS5pr2qp2UItlCo8b+MXjuD25NhERZl3S/ickvSI7GGfmt
	BYAgQEZ0qVU8XZVeiVqi8IKFX5jfY+EI/TYRizu+/sMIv5yH/J34UmJlNNBTL3UJJ9mY7LqNuu4F5
	DICfjb0sCp28M91O4t3xF1XYGS5mdJqW6BXKqEdG9tporQVEpLwmuCqoGADsOk7NhCZ0fhz9W+i5o
	tU3bXA6fK42WCKNIK3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqcGX-00000006dkQ-3yCj;
	Tue, 17 Sep 2024 17:45:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb5z-00000006VVI-2N9P
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 16:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95138A426EA;
	Tue, 17 Sep 2024 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161B3C4CEC5;
	Tue, 17 Sep 2024 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726590630;
	bh=Qp1EeX8xGUd5kQiQXNESKgJ0EV0UH4Y/iy7zxMn1Lvo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TgyNJbBcw2xzv5RloeoYcrEkX6Whx/GkckMJuCATs3ROis2LX0WZ81THmXk13YR7T
	 whRNNBfxHCq6MLvpgl/5cUBsWCf/NPcPbQQcE90hj521BJLZNqXpmmyzz8xb7sGo4I
	 zBRkhZpdB/ZTIpivUhNz4aR/ErqdSUpo+xH0xnDea8KeZzz+U5Tqjc8XN60AOxfrfB
	 KwOBoV6b6pKrGVP1bx+J4OEIEALrVfLUSHVzCe97LUeiZ0lVQ4ROn6Z3tG6tIPhzyW
	 1fPEoIU+a3gamopndP1zJEM/eZ1VPsq5RM1QhBq3554uXUwwLUJwHurOjl54XqPjwH
	 E8yoj1Klm5K+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBBAE3809A80;
	Tue, 17 Sep 2024 16:30:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Make riscv_isa_vendor_ext_andes array static
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172659063180.214459.6745282493523135362.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 16:30:31 +0000
References: <20240807-make_andes_static-v1-1-b64bf4c3d941@rivosinc.com>
In-Reply-To: <20240807-make_andes_static-v1-1-b64bf4c3d941@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_093031_697863_20896AB1 
X-CRM114-Status: GOOD (  11.15  )
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

On Wed, 07 Aug 2024 17:27:42 -0700 you wrote:
> Since this array is only used in this file, it should be static.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407241530.ej5SVgX1-lkp@intel.com/
> ---
>  arch/riscv/kernel/vendor_extensions/andes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> [...]

Here is the summary with links:
  - riscv: Make riscv_isa_vendor_ext_andes array static
    https://git.kernel.org/riscv/c/594ffcf4efe5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
