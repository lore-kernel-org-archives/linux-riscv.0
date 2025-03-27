Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A0CC36002
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BYSErNfTEWcEwJPmBN3XBCx7/Lbz9c6Q6YCGn+2x+E=; b=slmy2Qeh/LmOpE
	MOkUyqpYl20/Iukw8B452M4lqHJGcZkX7r/jmxrDjqtTMlr5FeM9x2Ax2ZvpBw1kW7vaDbm9EnAcJ
	YWHzrURQDLQ5eDqbJXU9Al80TOpc0vNPIao7aK+d3tBuBaMUH9ImyLlbyoy1JnlV+YdM/LIIH9BBv
	wGakN0cdDJovSwf1TIXTubka4TqUUeI1VHbifEbmuIAMaQx/uSeit5iVY+LlRVMl0a67WN/mN6mG4
	w9416vnMXCpgq+BufVmJac81gDgbPTrN/PVnSo81ABsb64e68LYac3aMWhWk4dJc+V5hMB1N7Djz5
	+b8hr5WCvaSz1DFeu4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqc-0000000A41W-13Ur;
	Thu, 27 Mar 2025 03:24:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqY-0000000A3yA-0qdh
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8CA43A41AA6;
	Thu, 27 Mar 2025 03:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F24EC4CEDD;
	Thu, 27 Mar 2025 03:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045837;
	bh=RwEjkDL2fS+r4oZqYYE//W3MjrsqbkHSq0YLkJXBptE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PfBiy6+1GmzF/BqmKCCWlR13h6NguFPkm3sM+7+FlleTXyuJxyoj3AFeUyOR7v/fj
	 v6OKmtuDErcHnw1224ySWVr3UdRU7yeDXqdRsKpSIB+tnN3JmOKrLBQz0yzWoFQMHG
	 tMEqWtHQb4uyuKtKcZQtgk5uk+ppjhv0y+qCtMrjw/vSIXU2igbHNKcJm7/JVYaJ8V
	 J9qoqHfP+/sYWiCOoHg4SLkxb10fSx6oTouP4NiLuOD+0lZ6xZ/FKE2aoOsXO6ZTfH
	 xmQJ6g+s6KdyK6uV6SJwx2JLw+WbvbDhqHm5jelp+XJ1Ws2OXlwWKNPw/dgsjO3uhO
	 A76zyL6AVPRlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2BA380AAFD;
	Thu, 27 Mar 2025 03:24:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: remove redundant CMDLINE_FORCE check
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304587325.1549280.12018226648442560841.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:33 +0000
References: <20250114-rebund-v1-1-5632b2d54d6c@gmail.com>
In-Reply-To: <20250114-rebund-v1-1-5632b2d54d6c@gmail.com>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202358_326011_D392FA26 
X-CRM114-Status: UNSURE (   8.22  )
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

On Tue, 14 Jan 2025 00:30:20 +0800 you wrote:
> Drop redundant CMDLINE_FORCE check as it's already done in
> function early_init_dt_scan_chosen().
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
> ---
>  arch/riscv/kernel/setup.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> [...]

Here is the summary with links:
  - riscv: remove redundant CMDLINE_FORCE check
    https://git.kernel.org/riscv/c/eac5b138814a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
