Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5DACCD1A5
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZB/Zj8ynkDjzERfFgSBC/TT20uV+ITtoY8TmX51pFI=; b=uT5KtecOKfaWsY
	o/k5dLmoQc3l7wvH66c47+P6tbYxPt16F/apWAfUAZKgjeAhau60KNhZpQyZxy5HjxzlkbA76ugmI
	S+1f8hFKo7uqWvjllxXtKVlW2nVN8ZLuiKx/cJbk6U4mwYxjDHsryjLaL/yCfBNYvkXf4kR6Y4hyH
	v2RI/p11ucJRKo7tkKVvsXM6NEhCFpDMy27FV9+T4CbCYogz26pP3jsHkZnLJsDjQe6qb0w9VQC88
	kpPwcKENGmmQON/kQ28N8nblb68z2J11yCqC0QVdhqkg2K5fKpov2UxKkzTiaXoLHfEhVxweGOQw1
	jKi1N1xIbbVn/iMQiiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NQ-0000000A76i-3YpY;
	Sat, 18 Oct 2025 16:01:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NO-0000000A75R-2Ln1
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 16:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0160F61160;
	Sat, 18 Oct 2025 16:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4182C4CEF8;
	Sat, 18 Oct 2025 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760803309;
	bh=W6ogpD1KM+CMWbUs+G23MEoyLhb/J95Jle+AQgCTx9o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jfn+9k8/hxqjb8D2Yl+EGbqrb4rxtTIb404ltItB5hepMdx6jxesJ8mOx3YrxXuVY
	 Eib02ct1YKFuH+o+VhSv/fMUheC3xIVppe38jl9n0xpQdqRkmC6+ZVtjcMPigLjSe7
	 6SLOLd2Lhf5Lafwphi+I4Iq7c7IfCC940rz+z3SP4KLdnPxpLg1p0925PyTPYl0maw
	 wMp9sxQtzHg6rmeJ3AXTGJPPfPZkGeT8PHWmWNBRXoaYUzFEW9oMYrvCoHbUX3I24/
	 nLkWw/AUzSRiLhv0mMkik+n/7GJbtm6cozcunJh986oe20jxjOGQKx5gnQdQZJDUZQ
	 YwrkstN0ejpXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D2B39EFBB7;
	Sat, 18 Oct 2025 16:01:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Define pgprot_dmacoherent() for non-coherent
 devices
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176080329274.3028979.8344603968685020251.git-patchwork-notify@kernel.org>
Date: Sat, 18 Oct 2025 16:01:32 +0000
References: <20250820152316.1012757-1-apatel@ventanamicro.com>
In-Reply-To: <20250820152316.1012757-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
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
Cc: alex@ghiti.fr, rafael@kernel.org, anup@brainfault.org, atish.patra@linux.dev, linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Wed, 20 Aug 2025 20:53:16 +0530 you wrote:
> The pgprot_dmacoherent() is used when allocating memory for
> non-coherent devices and by default pgprot_dmacoherent() is
> same as pgprot_noncached() unless architecture overrides it.
> 
> Currently, there is no pgprot_dmacoherent() definition for
> RISC-V hence non-coherent device memory is being mapped as
> IO thereby making CPU access to such memory slow.
> 
> [...]

Here is the summary with links:
  - RISC-V: Define pgprot_dmacoherent() for non-coherent devices
    https://git.kernel.org/riscv/c/ca525d53f994

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
