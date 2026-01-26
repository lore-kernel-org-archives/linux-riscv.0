Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54826C88E42
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvXmz54b8oVKfqLVweB1a3YM5SHkJ9bTdB/qzKvWG5w=; b=AMgABQCv1ba1L1
	NeZ5NcTGshmXX2J3sTRXtrVQ+L/GL7c7DbMt8gFxBRYv5qprjI4jaktp+4FSl/VDidVAiAI8ZKnxM
	wqc4RKIDh7j+DD0ycPkTgd8h07F1i7hsCLbzzvu9x4C4u4DT+EfQnlrQQIonjJmYbe/rWew4VpnM1
	7LEnBBjsi/XT3ax7DJBMyEk6AQI8AGCQEmwJnaMdUihHljPtpYtiLj91bOfFb/xq1z/YDxUs5g6+B
	fl9RPpeKh+53vgeGCr0XKilqyS8Kqj+s9OqlItY+Oxv5rWAMy7remfFLCrr+QeIfZ4l47Ww2ceRTW
	edHEKdvaFEsRPW1cD/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6r-0000000BsXU-2lQo;
	Mon, 26 Jan 2026 04:21:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6q-0000000BsXN-0RRt
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32F2A600C3;
	Mon, 26 Jan 2026 04:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FF1C19422;
	Mon, 26 Jan 2026 04:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769401310;
	bh=/vXTBfeE725mECzMswPlT8VIsWW85GRiOqx6wcOhv/0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NjoDNyQPCOhKTyr7GfI6wYkhJo3a5jfDCB9kKoG4YIQ4c7VUjLLf65hh6C4oRd4s0
	 SDwNhZ77jGdDiSOiNahHqsGHTdPlwzqcWdNjRtauNPz39RNgNEyBdDSBf0c4LNAZmQ
	 cEzB5OlJ4FBLGK+qkxrZXgCDIUlVC9ZoFlFFZd82nvEhiC9l0gn7g+KkpRY3ju3jyx
	 z4u65YJeqAMvkGN037DCwCiqRHfIjlVXXsJEH8dwH283gzABIKRywyu0aQCQmNJO2u
	 4fihUj0CFvOh4IhAPoo0rwTOQWPmykEy8XR6Ss1rfCFnubj/DK6AP4xsemQjYWhwte
	 B8zgWtpOZSRJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8EDB3809A22;
	Mon, 26 Jan 2026 04:21:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] i2c: spacemit: drop IRQF_ONESHOT flag from IRQ request
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176940130560.4057692.15383272493073261611.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 04:21:45 +0000
References: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
In-Reply-To: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org, andi.shyti@kernel.org,
 troy.mitchell@linux.spacemit.com, elder@riscstar.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
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
by Andi Shyti <andi.shyti@kernel.org>:

On Thu, 22 Jan 2026 07:52:00 +0800 you wrote:
> In commit aef30c8d569c ("genirq: Warn about using IRQF_ONESHOT without a
> threaded handler")[1], it will check IRQF_ONESHOT flag in IRQ request,
> and gives a warning if there is no threaded handler. Drop this flag to
> fix this warning.
> 
> Link: https://lore.kernel.org/r/20260112134013.eQWyReHR@linutronix.de/ [1]
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> 
> [...]

Here is the summary with links:
  - i2c: spacemit: drop IRQF_ONESHOT flag from IRQ request
    https://git.kernel.org/riscv/c/e351836a54e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
