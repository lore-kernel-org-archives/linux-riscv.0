Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EC6C3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0Wl/gMAZv8WFh78wlrVWs+ilbBxq/SOHBNeobkfwGw=; b=Ji44yQzc7CZH1B
	Lg54wFJh3JGCUfeAa1uBQ5Abh5Mvw2HTaLRn08SDMZEv39fJRc7d/ANOFq5ZdzVa+fcMDOHaiiX3g
	OKtTdzy7Z2eFxbxgXsp+8yaaqEGUVSZeTVo9eV4FKgYtodNRXJYIPMLOVVdawOK0OIz4hIkM9lj8m
	+aXEe8LY0ECwrYqTmQmTWesWRfEiy/13Qm6OZN2IDgpHXIugVZQYR7KOWwNvNgNuz+dBDGjjuP2CR
	WVClJ01PPtVWsXgZMXTxY0lzdTVFbCHlIbLpNX4b96bzS6iv9FUykgtJY1oQNVM/VzjhqbsaYCbFM
	Wrf5LID8eBwu9mjMLsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf16-0000000A9wA-2kDf;
	Thu, 27 Mar 2025 04:38:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdr2-0000000A4Z5-2ria
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11047A40D1E;
	Thu, 27 Mar 2025 03:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F226C4CEEA;
	Thu, 27 Mar 2025 03:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045867;
	bh=uxV0gpTWcSn/NPTb8m4uz1rrxBfq6DQTERk40jtB/p4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Nf9acJWmZP5ty2PjHMZ67Gu2M2ST8OBykmYZX1gv5snUXmarrn40dG8tnK16WN0c+
	 q8IydbPK8p/3XR5fZDmPgq7Yvw+5Adsbjaz/33kTbOpzRYCdFWU6BGNaxcb5yf1S95
	 AqSnBnu5GpOv5399S1mH09X0M8t292Cdz78fdt/9++y1N8C3iW0HAecklbnKfZYsOl
	 yZtlPO90ajTZ+xrMzwMAZm+qMkP/LxvqE1CHUFWsqg3IHn+pEQIOC8ev/K0rocJ7++
	 t54badeh8w+5bFJl43qIhWQv2jq6B72FCPBwGm1A54eRHgC9AuFg8c8X8vhlRfndnO
	 o4QsbIkrKptdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C3A380AAFD;
	Thu, 27 Mar 2025 03:25:05 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove unused TASK_TI_FLAGS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304590376.1549280.1858924823997003300.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:03 +0000
References: <20241109014605.2801492-1-ruanjinjie@huawei.com>
In-Reply-To: <20241109014605.2801492-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 puranjay@kernel.org, zhangchunyan@iscas.ac.cn, cuiyunhui@bytedance.com,
 guoren@kernel.org, bjorn@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202428_790619_9B863459 
X-CRM114-Status: UNSURE (   8.84  )
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

On Sat, 9 Nov 2024 09:46:05 +0800 you wrote:
> Since commit f0bddf50586d ("riscv: entry: Convert to generic
> entry"), TASK_TI_FLAGS is not used any more, so remove it.
> 
> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/kernel/asm-offsets.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - riscv: Remove unused TASK_TI_FLAGS
    https://git.kernel.org/riscv/c/a4a58f510bd8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
