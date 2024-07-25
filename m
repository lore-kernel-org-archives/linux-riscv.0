Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9C1C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0ZkUdPqVM20tlEFT6spfodZ9BV8ATqEpAlXK4Jjtx0=; b=y9EWbGsUbBJZ5N
	3+bTwmquhY+K8uyYmQftqCiT0yVEhTGTTcS4dQffZGHydsgz/YMk1cifDA69ChFVvc+ddIWpCIlZX
	5Loax0EanHsISgPNJCVKFKoY/uuw4aXcbfmtZgGxGCITbxRnl8T371lAFUXIczA8cJOZvL3i+tyE/
	PPdpev1bBx82mCoW2dRTnYIrueMMaeFr6WzPupImxMLgV/gj7pflH9fn+YDpFadu+dDYeUHD0fsd0
	RDHZyY7G8RzyHstm9Ej/K1joNHQHXDNzy+TNVD19unBsC63+lWfI7CXyZKeUNnqcYp0aus8qEZ5+B
	Cqg0n+R3Mp75mIymqGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOk-000000012ng-2vRh;
	Thu, 25 Jul 2024 13:20:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOe-000000012iN-3unT
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9169B61305;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B5A4C116B1;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=hoQiJY9BOtutRnP8ZDMMRSTBIBRxgWMbA8kX5W35XC8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OS8Ydb5DlSPEE9Y9icrNPqRCwLigh1hRBDg0V8XYTqZFmjqt/vZyZUTLpJny5GMxD
	 p1pg3Vf6woqO3DMZPCiE2flqQTN3R0h7ly7z8kPAb8u16TigUW0+IXlF4B/IgiQYwu
	 5LQ/l1VP6ilYKgLp6Ydbck0jmuOCKUUpgOQHlb3KyGfKqh03huwmkfD+D89J+DOZP4
	 FNKLFnrwt9NoARtb2K0fnBQRB6vCJdAGP4DtBKOCLzjWH59LjiByDDFrhJx04FPWwD
	 dTMIOLV9FUmC3nI6aPFyLNHtSdUeHCX5EK2y2KucYnOKk6ldmt42OgXREVvOfBvfaX
	 0bsYGV6wsIgEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2F023C54BB5;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/riscv-intc: Remove asmlinkage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363918.6240.8119408289460257884.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240614151955.1949-1-jszhang@kernel.org>
In-Reply-To: <20240614151955.1949-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@linutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062041_103291_90AACC78 
X-CRM114-Status: UNSURE (   7.67  )
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

On Fri, 14 Jun 2024 23:19:55 +0800 you wrote:
> The two functions riscv_intc_aia_irq() and riscv_intc_irq()
> are only called by C functions.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
> Hi riscv maintainers and all,
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-intc: Remove asmlinkage
    https://git.kernel.org/riscv/c/96333a020615

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
