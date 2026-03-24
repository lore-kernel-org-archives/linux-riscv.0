Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1AFF532DE
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtVgVvAZ0StEQrV6tVw8LAQ6i+HpzgvEMF2xHsZaEPA=; b=gqHn19A9Lt0G/e
	fIddZqodhZB74RsCSYTq7XBpsfdXO1UX9HUxD1HWKN0VKn4h9/HjCLAX3iBrviLhGN2uhRSFOWCHK
	fG5lOj2FoDntAXiBazxQ3/qm6tLtLOaBSIWrQiSqfLke7rxB/22gYOTgVSdOus2CeXWAtMxrDFghR
	s5ihSFUbJQ7tBQNAfppMAlaXm+wXmNJGevrr5c1VEDhru4vaWbj0tqNCQOpqtZm+WkQh6bX3Lwlzq
	1DEYNWGAsgcyeDMzdLPMJ8hLmVn6wiwWIL2Tv4GHZvkhA6WdltKbbRucyrK7YRSElESJsmHoUF9az
	tmb1Q/GNXGq9qIPJzEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uw0-00000000dxe-3PDM;
	Tue, 24 Mar 2026 06:08:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvw-00000000drU-06Yc
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A21460120;
	Tue, 24 Mar 2026 06:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24EDC19424;
	Tue, 24 Mar 2026 06:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332456;
	bh=ERBLBGFxNq+tw8J+RPOIjrdA3OFXnDLhara3Lrzl8F0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aGKD5InQRxlFbijIW3EzZgevF/FdmjqIoApOebGLbAL5K6RCk7ESgNQYd6xSw5UQh
	 j+Xdff94aUvzMBSSODWn7CYJs//8ITYjbgBBNAuYLFQPHv8mNpGSuNLmqXEYDzUSD/
	 7YVcJMX/e24F9c2KT/+CtuTqm12ybAyKpR/4s3AUmgkQ+n2WfVHtYe8ggCJCg/uZMN
	 3ozTCDOM5u3zQAw6cZInT7VwsrzqzWy3+hVmrEYekXjNHuJUFAyXFOarrEMRI98hhj
	 nBR7FQD3ET8wCUGi56DgCIN5YGpiy07X9t1ErUfguxelwnNjKvxTqAHe1mOURT6E85
	 YTaCwYsFlanHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE583808200;
	Tue, 24 Mar 2026 06:07:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/sifive-plic: Fix frozen interrupt due to affinity
 setting
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433244498.469836.5203107878440214495.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:24 +0000
References: <20260212114125.3148067-1-namcao@linutronix.de>
In-Reply-To: <20260212114125.3148067-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, tglx@kernel.org, pjw@kernel.org,
 samuel.holland@sifive.com, maz@kernel.org, anup@brainfault.org,
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

This patch was applied to riscv/linux.git (for-next)
by Thomas Gleixner <tglx@kernel.org>:

On Thu, 12 Feb 2026 12:41:25 +0100 you wrote:
> PLIC ignores interrupt completion message for disabled interrupt, explained
> by the specification:
> 
>     The PLIC signals it has completed executing an interrupt handler by
>     writing the interrupt ID it received from the claim to the
>     claim/complete register. The PLIC does not check whether the completion
>     ID is the same as the last claim ID for that target. If the completion
>     ID does not match an interrupt source that is currently enabled for
>     the target, the completion is silently ignored.
> 
> [...]

Here is the summary with links:
  - irqchip/sifive-plic: Fix frozen interrupt due to affinity setting
    https://git.kernel.org/riscv/c/1072020685f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
