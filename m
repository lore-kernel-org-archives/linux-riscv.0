Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46E9C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 16:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKoDpx5K8dV4h1zi291/ny/6JiOJQqvXXC/KjIfyVs4=; b=s70VY+irae4850
	dT813oBXIHM8X7CVW7dFfDXAeTscW6UQSb4ZDCT8w9CZnOAPaKVC/8hVOn2BIC377PxCwt/VXe8Jt
	Wcsec2AXk/AVxH3lTJPGgA1Te+M6pX5KWeLFXklQNqN3TJ1rwqQCNgDgTTjJM7apkTJiyPCGF2W1A
	VZoKdfvXl7V+RdBZsfpIX98g9xsnX48pnuo0LmCLisZhVweEu5YZR4QgideELSfocpQ4Y8Kw+dygr
	uUMDp7Urmrl622+s3aYQiPTCIJE3mJNAipQlgVF4PbP/MdiFGCIVuKTWFlztLP+T4WyYLxDpiOkyj
	7Z052VDGH6iUSUfgKPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4gQ-0000000Akmc-255A;
	Fri, 31 May 2024 16:00:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4gN-0000000AklK-2QpZ
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 16:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B13DECE1D0F;
	Fri, 31 May 2024 16:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D985CC32786;
	Fri, 31 May 2024 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171236;
	bh=ue49JlCpjRBuJwkDVBPStXgNI/crZ5RD6wSv46b3h3k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=usSwkHvUVsf7/ZNRXUCMNsqvZHcyzc4kvc1SZOpeCW1uFaQUIFbpOGhzBT2P8HIT6
	 Ylx8eTuBrpw8Lyr4nYYEJK6e1Q25nq4Ka9CY2eppnCYnLPWvO4cbvP1AQW7YnnR1KX
	 0sNg4uAHyi12kch59Mq8IgHaGiSVF18tLoxoVSqs9Y1fNHtgQrrcbvw3ukuLaiF49w
	 DLYw5PNShkR1l4Cukkj8SBUNxSAsj3hnAeA/zHR3lgAIsFR/JCmlR/PP+93UjHHcju
	 ijgGiem5Q4cxWXUjBwiSR4DHNakUzcCGXiY/9hCfzIlQE7/L+tWn7Yl1Vo8Y4VqJ/c
	 cCP+ptG9j7/Kw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4528DEA710;
	Fri, 31 May 2024 16:00:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "riscv: mm: accelerate pagefault when badaccess"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171717123679.27814.3225238698035039427.git-patchwork-notify@kernel.org>
Date: Fri, 31 May 2024 16:00:36 +0000
References: <20240530164451.21336-1-palmer@rivosinc.com>
In-Reply-To: <20240530164451.21336-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, surenb@google.com,
 akpm@linux-foundation.org, alexghiti@rivosinc.com,
 wangkefeng.wang@huawei.com, jszhang@kernel.org, ben@decadent.org.uk,
 bjorn@rivosinc.com, willy@infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_090043_859564_4ACC9803 
X-CRM114-Status: UNSURE (   8.17  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 30 May 2024 09:44:51 -0700 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I accidentally picked up an earlier version of this patch, which had
> already landed via mm.  The patch  I picked up contains a bug, which I
> kept as I thought it was a fix.  So let's just revert it.
> 
> This reverts commit 4c6c0020427a4547845a83f7e4d6085e16c3e24f.
> 
> [...]

Here is the summary with links:
  - Revert "riscv: mm: accelerate pagefault when badaccess"
    https://git.kernel.org/riscv/c/7932b172ac7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
