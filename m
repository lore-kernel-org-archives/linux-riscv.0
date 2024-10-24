Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0964CE8E6A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmW8SW/wHOnKByi8bOfXLM4xG68JLDRj6rSJVl8dioI=; b=Wl4AifR3iZNibe
	zi97nkZJF/MGHseQpizUZLwtlEh+vEe5RQVO81gBtyze5S9eYiI9vg/udABQFSIzqCcYNdRBuIHly
	2bQAdcnJdFHCua9qALA3qeqMTqBLBNnaqFF2QNlowOmUxkujoVWNuZGwZQ5Yw27Zo5dV5iGXv6kgu
	f53izIXLjfV2RXhKWTa+a5qbLT27SqT7FRKfm/Ug7W7FjgRbI+AbpL6IjC/1t/w5oZWu0M4U3qABD
	ACwadnObcGzVkbdsfR1ktjWnolUL5yVF/K/XU6iIwDROSnaOHx4FFvrBhveyUb1F0UE5CQF3hgr5E
	wLGAMGqwgXJcqDJM/CJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42JI-00000001QaK-3fW9;
	Thu, 24 Oct 2024 18:11:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42I2-00000001QFc-3NKE
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 18:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D6155C5AA3;
	Thu, 24 Oct 2024 18:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2BBC4CEE4;
	Thu, 24 Oct 2024 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729793429;
	bh=OqL6FsvcsJdLGD36/xtR504tOLGaOA7KNoONdtMbKik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m/t23/5aQJk/UpUvlVmli0FE+oiCdC08hINCtLKz9be53DDMo9vz4mJBy+7Uu09xw
	 NZa8ElUC6A/JUn73uVbpGHBj0zd5G1rFQgwu5DUfTSODLwtQkTvjFojg6xXbczrpG0
	 XF0O3rO/R31eiqp3xsG2X7eMYbaExpvU0IsnBKZYcQRZEVFMozT7FGyiTfxkDDp/Tx
	 US0+IDURCfOh8XRVNygjqYaMDMOCMQD3M5ULjQqh+pk6SCf6D0Hiu/RAXmA99CD+F+
	 xZXp4V0hz0YbQS+we7+rLuiCtiRLrTqns4V8gmJXGuGyJUTNdItwMSpi3kjr3G7uw8
	 K/kGHgWxAw7Dw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE304380DBDC;
	Thu, 24 Oct 2024 18:10:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/4] A few fixes for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172979343650.2335128.10301613190246629595.git-patchwork-notify@kernel.org>
Date: Thu, 24 Oct 2024 18:10:36 +0000
References: <20241008094141.549248-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20241008094141.549248-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 akpm@linux-foundation.org, shuah@kernel.org, paul.walmsley@sifive.com,
 alex@ghiti.fr, charlie@rivosinc.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_111030_910242_61C8A1D5 
X-CRM114-Status: UNSURE (   8.18  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

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
    https://git.kernel.org/riscv/c/cb873b28bc2a
  - [V2,2/4] riscv: Remove duplicated GET_RM
    https://git.kernel.org/riscv/c/4c6b61b5d35e
  - [V2,3/4] selftest/mm: Fix typo in virtual_address_range
    (no matching commit)
  - [V2,4/4] selftests/mm: skip virtual_address_range tests on riscv
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
