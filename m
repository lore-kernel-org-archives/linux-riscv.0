Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACBDCD11DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmAZR3q8qEMVKBu8d3QKSyb96Su7+/s8w0Fyl/o/ioI=; b=ckDdGKoZsXe0sQ
	8eWRMs+GhmCDm6BZ1x8GoYiEJa11FkNLUfb26f0sEzNl996HZixr68UOjOB3IOgOYbCyRphW577II
	6KCtKsBEKfNQq+Vk1IUIOLA/YyQo0m0L0ovUn8/TOlLs9trkly8AAUgygTsBa8m2v2iYou348ERa6
	wdkhS3EIZyzZqEvSmAcD4fnGo0Wwe4zHVMDzX04f6sAa46y9qvvnBsWthvE8bC5VvryUF0jF8joUT
	BJiSQxGJLrsly9Ag1hXRmOV4nSqDtxYZmjomDhQd0R2L7u7D14WS2Cm8/zTVKgTudz6ETgZNYw7Ju
	F9xwb7tarPWokN2SJwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tn-00000000w1X-0fK3;
	Wed, 20 Mar 2024 20:50:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tW-00000000vpp-27mn
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A526CCE125A;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57AADC43142;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=btAeiZEcxlPc+5rjYdZBbRGASbJnixxCwyL87/+mmOo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JN/d0FocPRzqdLlU5VONUvcBZvnw9D4YRv8Y3S5UurFmfqHDO7Sqn0paBjrkfe+Qj
	 e/UDyZU3WH3eIoBQRu2Z4rHSTGvWyGxZOYGSeGXRYN2r9a0mx/YfyL8tyLYED5iQxU
	 BSUtRnwhMtjbjXw5qX9tBgugPTbOUEZhLJ+g60ruK3nVWm7kB6JG8kqdEo7Nwuo0P2
	 yQXBRtKyme+0ak27W6kGkJ02ncA95rZvSQpkLXoohaVPRZ5ET0drm0UCoKA2Vx85nH
	 fWxULX7R8Lg8zokts8jPRZq4aOoNRY6cHsZT/X3fr2mCowtqrWEAuju+2l5s1bOWCh
	 bVl1azAGYztTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4A960D84BB0;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Use kcalloc() instead of kzalloc()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783930.6804.853209401745501176.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240120135400.4710-1-erick.archer@gmx.com>
In-Reply-To: <20240120135400.4710-1-erick.archer@gmx.com>
To: Erick Archer <erick.archer@gmx.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 ajones@ventanamicro.com, evan@rivosinc.com, cleger@rivosinc.com,
 jszhang@kernel.org, charlie@rivosinc.com, gustavoars@kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135042_775673_1B546A51 
X-CRM114-Status: UNSURE (   7.34  )
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

On Sat, 20 Jan 2024 14:54:00 +0100 you wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> [...]

Here is the summary with links:
  - riscv: Use kcalloc() instead of kzalloc()
    https://git.kernel.org/riscv/c/28e4748e5e3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
