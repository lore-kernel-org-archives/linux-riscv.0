Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD72C48260
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 21:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XorrnazN5uyYkXLDoOTkFYqaxJojpsOd+Jy1q9KH28=; b=VvFTv7VV6qd1GP
	oQckGgUAoJFk+Bcy/YfG3qlvYhj4fG6nB/llIrrg1uZ1Y0LuwzQlzbkGVeC4uCFeIx01MvA5hKUFL
	ef/1AiRuQFFnFmHRCooudyeIf1J9iu+GjoeGDcJESi/G5VkwcwyJkqpLziMWwOBeI9DZ7eitJUCkO
	MczxQdIYXOBywh7TiiwwOy5kEoDdWTS7MwZPQrTjZ87VEM0Q6nzsNYBe3NUEenucQIYc5G9GovOtO
	BMHHTags62oMEscw645w9mznrdijKtvEKxMmY46BoQYiuUyQUltkJXxLOSt5okDpehfK/AiC7o/wq
	9bmEqqrhJK6gV7FI/TOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7JA-000000020ab-0iP2;
	Thu, 25 Jan 2024 21:30:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7J3-000000020OA-491y
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 21:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B24FCE3521;
	Thu, 25 Jan 2024 21:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D5FDC433B2;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706218229;
	bh=0c77Px4FgFzSMDDopX9HQK54i0DhuO6fgk/RYUZ7kto=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YJN1C2EGISR9CofRVEJLO5WTqYVsqTyEafbuz9HXFhB3nO2Gc6cxsX/dqnSrHR+BB
	 YcKwRlaicZji+pTptYuomsuowAbnnqda0H4m9w8VNUel1kJhla6qY7Iuk+vmzxlZ6x
	 65phPPiHu0hEvEBYKvD0Bb4Y8xpD14K/FUuvKsZNWACe+2jsnyGFeRn2IFnkntr+qi
	 Usw2/ivEMl0B8dV/us4zHDcur/RKpa/4zJux37NvwrFtbH0oEOS0moVLPwGauzaeuZ
	 UDKbDiWGbdpD3WFPdILH28kl25+H0hsyOpxAIOukVQMM0ChCxbQUmJUg4h2pmhQLoh
	 9sQ95lHHpmHFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 52E22DC99E0;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next] RISC-V: Remove duplicated include in smpboot.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170621822933.6239.12409482420137215453.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 21:30:29 +0000
References: <20231031004018.45074-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20231031004018.45074-1-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 abaci@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_133042_267235_7FD50C7B 
X-CRM114-Status: UNSURE (   8.52  )
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

On Tue, 31 Oct 2023 08:40:18 +0800 you wrote:
> ./arch/riscv/kernel/smpboot.c: asm/cpufeature.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7086
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/riscv/kernel/smpboot.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [-next] RISC-V: Remove duplicated include in smpboot.c
    https://git.kernel.org/riscv/c/dded618c07fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
