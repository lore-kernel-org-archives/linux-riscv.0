Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AB3FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scP3XKGLxbBzHf3KS0gHlRnka9vHmIL4aYLgsUp1dvI=; b=gaT+Pc3DotAh0Y
	v/0GC9ULKLwheYdwfkS4Okcn0uxOIIzj4Fe4XtuD31Ssa6/p28ArG6TjqUp43Tfz7YBsOMigObcLz
	QLyWT3yiWieB5RoNP6RwMLqDCAjESiOYMWcW5nsVZqcg31MrAzwR4637xvMHGyry1i9BiYffMD31p
	CgU67bDhPwQMfK8aMDHK/DFKfuXEQEbY5lCbixXVreRebRSdUL4GUOl1TRTHK+nb3MqY5iIbI+Pkr
	xnZmWITEuvmq4pfWvcM/am3qMVkwqrwT098b3UmR+Eb4strcrDgVIj+y7djAlXdk2ODWu73gO6Tx+
	PWmquFbgMroHBavVzjNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4U-00000004Yau-10lk;
	Thu, 30 Apr 2026 03:28:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII35-00000004XAA-3EAU
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 339D961336;
	Thu, 30 Apr 2026 03:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD76C2BCB8;
	Thu, 30 Apr 2026 03:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519606;
	bh=ygd4/5zQwKw6HFpt9wXfhit6omZnPB1zR61IVZpW//U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gQoB5rFOjfBdiU1remaLMpdCERG0XO/S8L9KIJJ46qsjLFch4mfI4GU6STXyHw41C
	 7ze0a9zZbhUANeSGx75zc5M7e0YOxOifvPyC629jtNQzIujew0tNzQp1JBUW4HU7iN
	 tF+FaIVkmMzj+lofiKmWT5Gr77I2xzI4vBfP0/ypEHDUFwTRXrb1AjlfoYeIPhni6f
	 wLeI1QiJ/Pf6Ed3MOBUrumeK/BRZQf/4xaum+nq5v49XPq3Nqofa5/UIK/mMzYpBfR
	 9kcF0QIafOZ9EtqKedkT4RUyw9D4FPpIOxjImeGpl3CLyNeYRuOXOdBjmdVsVYd5h+
	 VVc9qGak0oTiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDE53809A07;
	Thu, 30 Apr 2026 03:26:03 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] iommu/riscv: Skip IRQ count check when using MSI
 interrupts
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751956179.2274119.1428846442277871195.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:01 +0000
References: <20260130065420.16811-1-guoyaxing@bosc.ac.cn>
In-Reply-To: <20260130065420.16811-1-guoyaxing@bosc.ac.cn>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
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
by Joerg Roedel <joerg.roedel@amd.com>:

On Fri, 30 Jan 2026 14:54:20 +0800 you wrote:
> In RISC-V IOMMU platform devices that use MSI interrupts (indicated by the
> presence of 'msi-parent' in the device tree), there are no wired interrupt
> lines, so calling platform_get_irq_count() returns 0 or -ENXIO, causing the
> driver to fail during probe.
> 
> However, MSI interrupts are allocated dynamically via the MSI subsystem and
> do not appear in the device tree 'interrupts' property. Therefore, the
> driver should not require a non-zero IRQ count when 'msi-parent' is present.
> 
> [...]

Here is the summary with links:
  - [v1] iommu/riscv: Skip IRQ count check when using MSI interrupts
    https://git.kernel.org/riscv/c/7217cee35aad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
