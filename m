Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C243C02199
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfRQCbANzJvPRr0dE5cyAV9+Z54R5zRQP+0Q30etQ3Y=; b=FJAbHLapmx7uqo
	GXxfOTQXUSbl//2EeHq8cD19EplOfrHCziZrhlljWaqO+bLcNt9e0lM5l5dI5BoxqaeDyIcEvM7hA
	SAtlAcVIGgjejOkNXA0vMWbKGv8W4Oem1z9TtVncimSKIc3/0vsb2DCNvu/0pormmvc4bl820yTd1
	ch3xu8lIq5gF3pXW89wv/3+q+kbbjiCo4kiuarBINNoptY9Aolph3jKTzOnXnsG+ZSqcCzRbIAv8w
	i719pLI62C6Dh7KypWkULuFMW7VUuRBTvTTBd3T/yQMopCWTFK4frgsoRtK8RKkd8f1g7urPVEz6O
	7Tu1jJ5t1TihN+5I4BRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1zx-0000000GS57-09OI;
	Mon, 03 Feb 2025 19:20:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uy-0000000GQJt-1qWP
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7AC8EA41C1E;
	Mon,  3 Feb 2025 19:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650CEC4CED2;
	Mon,  3 Feb 2025 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610135;
	bh=yIVYx2Injx0V5rbEcq4duBBRKtzAISqSSzu7G/z33hY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HH0ZsWIHJBGpXlVL3gXhPosWAg7/NDxPYAztafp1qE8nDjdyBmkgON17aHRZfsUyJ
	 VraQT5d7wYuNZWchQ6W0xe+QsJzpjoMS2f/b1uDStP1aAcykJ/EG6p2ClS6pSxdcaB
	 oCb/AaCssu2PPGAjUcvAhGjoRtcNlK+Ty8Wy9eq4HiALarnKhvORCLt5hX1IaaHXWs
	 sizCtCuuLS0e1a1+vAWQ+UeKFAhhLUNPZIIsYZA2Z4QDPYnvtzFRuiwAbMze3aYCEh
	 HmeHhfcuDdOXniZaFIKUhzM0MsJmkds9KIsWO6WEabchJE/5sbkpYMLvvJyO3QcMvs
	 UpJc9heOMbf9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEAC380AA67;
	Mon,  3 Feb 2025 19:16:03 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861016251.3409359.9684011048470573342.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:02 +0000
References: <20241228034802.1573554-1-dfustini@tenstorrent.com>
In-Reply-To: <20241228034802.1573554-1-dfustini@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, mturquette@baylibre.com, sboyd@kernel.org,
 frank.li@vivo.com, jszhang@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111536_547821_EAF8F0AA 
X-CRM114-Status: UNSURE (   9.51  )
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

This patch was applied to riscv/linux.git (fixes)
by Stephen Boyd <sboyd@kernel.org>:

On Fri, 27 Dec 2024 19:48:04 -0800 you wrote:
> cpu2vp_clk is a gate but was mistakenly in th1520_div_clks[] instead
> of th1520_gate_clks[].
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
    https://git.kernel.org/riscv/c/3a43cd19f1b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
