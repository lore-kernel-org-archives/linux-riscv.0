Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B21AC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvBFu6urL8vik6oZmQzDemPdGFDPlH8L9dCyUbRv5JI=; b=u+1+K16PU99z0t
	mWHP6si3Untkbb29ryqw5z790hdw/IR1qsnxlOFLb+zjwutm68D6UBFVH6XNaatzjf4/uXZE9/HBp
	5g1r5h9wAO4aO4sF5UwpLJRomGP3zQhjnKCsRQDi+hPNkcd8QCCvnKdnTLTiLdDjXmfofZccYJJMq
	ANlyWBpSmzHI8/y6yuWYvkvLUKx0OMgZ/ErOwM8jBzhb1Snu4f3XdqB1i56CNH1+nJ/VjOQnWdFeG
	5iaWUn5DDwx5MQzh9h+OabJS2+xVSJpspElOwLDuXWlU9BzJjl7y7tvXP6OW/inVP/ajKdzcafkbB
	x9ioMzaVzZ87Wlfhhbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tx-00000000w9D-3GKi;
	Wed, 20 Mar 2024 20:51:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tb-00000000vty-0jFu
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C9ECFCE125C;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B498C116B1;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=l/9iJWoH/f/YfhX2gaiUfb3YoSSB39W0tME/SJHepYs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g5qlDElupvSOTbFHPMC+aQf+KLiBRimzmBFUIkAq6cUde8e5omhOmI6aH7bqZt9vU
	 Ow8bR2/36Zs1w7SFjAIFPahmAuuRJhDGSGVvRjas1HTlGPsaKuvwHH+3+re2BDZ4hO
	 VtJ8BE0j11uBxh8KAk4tHoDcp3nVv9MnRlnFeYtkYEPX8VGzJWPF9xsdbrQjCYnhRd
	 R7CwrmURhpK+oTx0VAH/L2pkx1YnEl75qm4XEKn4ueQ890hyMpM1ZrrfQkXrEdJAEx
	 Q0XT1eI5POlDLAWRbsSJLRxfju81CjEXVUM8wVzvjx+SOf2nobLHSplpretWSIFgNG
	 pjP5da33R2W2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7388AD84BB0;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Only flush the mm icache when setting an exec pte
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783946.6804.8158757772819473697.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240202124711.256146-1-alexghiti@rivosinc.com>
In-Reply-To: <20240202124711.256146-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135047_548390_614EDA5E 
X-CRM114-Status: UNSURE (   8.93  )
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

On Fri,  2 Feb 2024 13:47:11 +0100 you wrote:
> We used to emit a flush_icache_all() whenever a dirty executable
> mapping is set in the page table but we can instead call
> flush_icache_mm() which will only send IPIs to cores that currently run
> this mm and add a deferred icache flush to the others.
> 
> The number of calls to sbi_remote_fence_i() (tested without IPI
> support):
> 
> [...]

Here is the summary with links:
  - riscv: Only flush the mm icache when setting an exec pte
    https://git.kernel.org/riscv/c/01261e24cfab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
