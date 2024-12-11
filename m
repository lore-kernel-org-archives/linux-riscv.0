Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA28BE7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VsFgf5ubVAXqAFMIkTv6mMBxeq9DF9xguzv4IpSJIjU=; b=he3SrS8Qv+6hw2
	mmoBoL2Qnsenu4dD6hyug0cBpXtxtZf8TBAnh2ZtHyDg1RvAUZ5FvDRW9T53re0ciXxQ0Edygzxrn
	Atlx4nXQZwjD1ZZHs6dudDgKNWzS1f8NTY2e2+F/bJD8vpG5pbvvSPE6KqQ4HPLpW7oTzRXRWLg9O
	e1QxBiE8BTUfC9P57vCpR1j2tCRyMDyLU/kNjaEFiO17v8bs3rmr28bA5PhM9CcAP2hFNcoO8ZbXd
	xq/q3GmQ9XOW9OlzzFp5tWX6UywNvqklXOKa/OIdOuPeXYCh3gsxsdzgebkU1qgXa1ySKjE0X4NR8
	iGVMxnjhN6tCmjRP6wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOX-0000000GWcn-3hhG;
	Wed, 11 Dec 2024 23:45:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVG1-0000000GKZS-0FNm
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0967E5C67E2;
	Wed, 11 Dec 2024 22:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3F6C4CED2;
	Wed, 11 Dec 2024 22:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956356;
	bh=R/piOYxV7yarX3+ioC7AI5Ae+G1cK9j4iXrTWmCNeAU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mj+xOSeioeKDbSdqGf7D5cWxQNiIVtl7IETIJJK+Mr5SkhgY3mm+EOPmB+a0z7dBz
	 qNrMjXgWwxB3u9abW369Ms9zhe+peGKYSJLjDF1Z5JyYXRXxOmnwmOlLUBLi360JCe
	 qgamfxLSrGa98pH6H28pPOBTk5HEOqo+umYvqz0XWFqlWiENDVQY9qCs05xN6cqAaK
	 oFEnHQ3vYSyZLODCiMjpOKzHE8cGbmYEl8wweOS5jfXTijJD6/+5efD23tkjMH0kIp
	 zurVJTSSW7qbW9D0LkpoIlMa+c/AAW9zBLnivUed2vUPouh+xI/CBLKJOdBxS8sIeg
	 MI2Ybwv0kGmNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B08380A965;
	Wed, 11 Dec 2024 22:32:53 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/4] A few fixes for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395637198.1729195.13590127218540707757.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:51 +0000
References: <20241008094141.549248-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20241008094141.549248-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 akpm@linux-foundation.org, shuah@kernel.org, paul.walmsley@sifive.com,
 alex@ghiti.fr, charlie@rivosinc.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143237_137029_071A738B 
X-CRM114-Status: UNSURE (   8.24  )
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

On Tue,  8 Oct 2024 17:41:37 +0800 you wrote:
> These patches are all simple fixes with no strong dependency though,
> I hope that making them a patchset will be more convenient for merge.
> 
> The patchset are based on v6.12-rc2.
> 
> Chunyan Zhang (4):
>   riscv: Remove unused GENERATING_ASM_OFFSETS
>   riscv: Remove duplicated GET_RM
>   selftest/mm: Fix typo in virtual_address_range
>   selftests/mm: skip virtual_address_range tests on riscv
> 
> [...]

Here is the summary with links:
  - [V2,1/4] riscv: Remove unused GENERATING_ASM_OFFSETS
    (no matching commit)
  - [V2,2/4] riscv: Remove duplicated GET_RM
    (no matching commit)
  - [V2,3/4] selftest/mm: Fix typo in virtual_address_range
    https://git.kernel.org/riscv/c/e847f8cd96ae
  - [V2,4/4] selftests/mm: skip virtual_address_range tests on riscv
    https://git.kernel.org/riscv/c/4175eff0e007

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
