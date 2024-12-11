Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CACE77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfRSGz2oHqNkEwjR49doN9Ii8tax+40aRbB84Y+x0OI=; b=EeJK2emExXw1aY
	EoHwOKchpGzkVt8GU+OCiwZgDW9a0VPkeIR6JSOCeGebuj//A0HuskmtsOQibtZu8/2OklIFLBvke
	S+lvAStCrZ1Kdf7Ny1VpyxXuhblOFmCH+KpFxhckCeseynOCA+nE9PecwzE40JKxFlchvqfuMruq7
	amn6a/LiGu3NZdVQjSVjfbxmHtbDIUFafHe+BwaSFBL7mR1236UI5SRjgqoDLG0WZfRO9MCBW/dPc
	9w6ucy7Pphtqd8Cp/KspZw74UwIZRG3movgIQc6gPl/HJ9wDFgo5f+CYiOmFK3hnvMoMBqaJxxcuQ
	bup8d87Ohasj3rlUUu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOX-0000000GWbt-0Om1;
	Wed, 11 Dec 2024 23:45:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFz-0000000GKW6-0bFo
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89F8A5C6474;
	Wed, 11 Dec 2024 22:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A286AC4CED2;
	Wed, 11 Dec 2024 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956354;
	bh=D8PIEfAkk3ZURZLdoJfZkuoLoCE4AVt+//7WJV4stTI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rbl6916+Zv/ZGhbfFNrBYPN6Ig1vrxarxb4LSjDhlwExb8L+Lq+2UD0ffQnWh8h4s
	 DpGOCoiuYKnJZKMTuVzYVhGZ3YuLTXuy1iyp0HuZ01hLDTy4JIu7cluWfhK6Nm/r4h
	 rGFsQTAiWVDX9RC3/nPrTtyfyIbi85DluHt/9Q0deDuv3wm+UjAHEdeeNZFxymeUGG
	 7I/sBszMtqijm61PqNLaE2a4jJqyuHE5OFBdZsgvv7ZCa5jyJetZoeRwV5xhNIFnoL
	 XWY2ngLDLWEvW4Q3p17ceBYsNra+U88Y+eFZlgRB2brmwJDufsCHPMl/NuKf3I2K7H
	 8DAYif77nC/nA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD92380A965;
	Wed, 11 Dec 2024 22:32:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] selftest/mm: Fix typo in virtual_address_range
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395637050.1729195.966660069889668701.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:50 +0000
References: <20240913022635.751505-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20240913022635.751505-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 shuah@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 alex@ghiti.fr, charlie@rivosinc.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143235_217849_F1B08A99 
X-CRM114-Status: UNSURE (   9.19  )
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

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 13 Sep 2024 10:26:34 +0800 you wrote:
> The function name should be *hint* address, so correct it.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  tools/testing/selftests/mm/virtual_address_range.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [1/2] selftest/mm: Fix typo in virtual_address_range
    https://git.kernel.org/riscv/c/e847f8cd96ae
  - [2/2] selftests/mm: skip virtual_address_range tests on riscv
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
