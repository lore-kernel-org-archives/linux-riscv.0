Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C5DC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qe9v6/hGpk3KKyRYBak4t590hJCQgTV5fA7Domcp4Rg=; b=etc/R3JHiqOmaZ
	q2vg5MSY2S6cl6hyMT7V5jeeRxm0py2yGn3BnNn0zODbF0uczfEutYjATVwSjHNEE8Exk68wCa5Vq
	1s0AuBbKdvUaij/IYO8AV674UIM7GtsOWu+DUGVxHC8GyxSya8YtiU75Ga9qTR0o23oYEdc4VUMUr
	6pLes7P0gU8cR1bp89m1Vmrl+UgwJHVeaC2p9DfiuozkUmYN8HSvsuAkcPt46B4xflFYbiIsY+htF
	FB21QWq3d+BmmCXnJNpeP14M6wXQg8vb1mE+v31vsKgwCaUiCCdJDqh/f65bDVGK44Zctp3b5NID7
	SLX4yVDsUimQqAhoZ8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDOH-0000000HGHI-0y81;
	Fri, 12 Jul 2024 10:20:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDOE-0000000HGG0-0DAB
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 10:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0173061E8B;
	Fri, 12 Jul 2024 10:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA387C4AF0C;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720779632;
	bh=z7JPQE37pSyjNSZtNlu6IO/vJDtKDa4C76kcC+2CYrY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YxBirr1AcJPqVOzgNyhbrxe24kATHJg7cbH0n9efMvsjs0paONyjWv5pJRr7xNUMz
	 k4UBUKOjDFc+uzvFUglhrYkgxOYpPO56lNn9DS1Mp8JQphIrMg2OBpuDnYwLLEipAw
	 27WA0QdOfeE8hXXfl0RVr8HZx4JY4lhEJbupgmePTIGGev0i/rEAXkZX0LjwCJANkc
	 96NzZnO/RXH7MDUtMhzH1tb3a0oQdfxi7QSInwKpuM8s94N0fomduHQT4bEiy/+OgG
	 c6d/RWd6L6I2V7TOXOF0ur1dY0G9dKbXdddowSgd1ST49WKnjkm5MddDpBOeb9iyL/
	 VExc6Yi03xa9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9F0A5C433E9;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Add tracepoints for SBI calls and returns
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172077963264.4770.1010194114117186773.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jul 2024 10:20:32 +0000
References: <20240321230131.1838105-1-samuel.holland@sifive.com>
In-Reply-To: <20240321230131.1838105-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 ajones@ventanamicro.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 apatel@ventanamicro.com, maz@kernel.org, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_032034_177805_FC06EBD5 
X-CRM114-Status: UNSURE (   8.28  )
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

On Thu, 21 Mar 2024 16:01:25 -0700 you wrote:
> These are useful for measuring the latency of SBI calls. The SBI HSM
> extension is excluded because those functions are called from contexts
> such as cpuidle where instrumentation is not allowed.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Add tracepoints for SBI calls and returns
    https://git.kernel.org/riscv/c/56c1c1a09ab9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
