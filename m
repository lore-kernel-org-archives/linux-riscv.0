Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0D3C3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8le2uI93K3fuRWVCyPVwqTAsyz0CaDTpz0ux7StY1zQ=; b=gmiJ/Lc0gSpHOv
	CTOIdjz4EX4qvJeGcOur6AJ04cgbVT2ForA2Sa4V83KqAYikvs4TdnS+BgwEhf2VTCAJkDY8Oj5KO
	OGECvSf8/Ozjsnq3/hjqZiQIw14ewTs2bHof9ykeR1yaU379jwp/xomwcOtFXrBtD8BZAm5YsYH8G
	hix9m1pAjx87UTTeCyTuin8t2gwAcfqH1tM41ZVjLMXpmx1N6ApoFdH1TUW9RKvu4lU7FPsUP4X5c
	qyp+mLtBxHWU1AAnELuvSN52RV7Liu2fQ9m2XxV6LVkzsJb052P0asxcz3RZy5rE8utaygnQ7le5N
	9d8KsH3ZnUG1eokPN24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqY-0000000A3zF-3xNv;
	Thu, 27 Mar 2025 03:23:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqV-0000000A3xe-1lSK
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7EF261163;
	Thu, 27 Mar 2025 03:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1CFC4CEDD;
	Thu, 27 Mar 2025 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045834;
	bh=AZfAmtXWPjB78IvE3dih6OE3AEgEQndtmIduyANQAes=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KLK+l8GGDlEaSm0rDjZoEcC1gOtqfGhEMjL2TT4AlqMouwOSIWNVisxw5wrohN1iJ
	 cvxJ4WVl5HhOph5Ug1+C89OosjsedJ45Or1jGW6bnwIMXU1jc7nB7SbUFb8vfuBxan
	 X+ZYb4NLpA8/KcwvpEMdi2huP+jzV/wFFzAfduBYl12c7fqzpwLdn/9ZxkCDLWlHq5
	 A5U+o77BWENzNC7SAriIGzTXdLhyYSW7VGbT/UFuomNICi90M8QqdpT1mVCDJ0O0sN
	 zKgqU7DlvHUExUAINrRPUsYI0gftDCuledS0R0G6Tls3Fp3YpdXV6fDnLvG9kttCYD
	 KjMpnzaQF1tkQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE13380AAFD;
	Thu, 27 Mar 2025 03:24:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] Support SSTC while PM operations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304587049.1549280.16882804409549926349.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:30 +0000
References: <20250219114135.27764-1-nick.hu@sifive.com>
In-Reply-To: <20250219114135.27764-1-nick.hu@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
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

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 19 Feb 2025 19:41:33 +0800 you wrote:
> When the cpu is going to be hotplug, stop the stimecmp to prevent pending
> interrupt.
> When the cpu is going to be suspended, save the stimecmp before entering
> the suspend state and restore it in the resume path.
> 
> changes in v4:
> 1. Apply the suggestion from Daniel to stop the clock before disabling
> the irq.
> Link: https://lore.kernel.org/lkml/5f7179ec-e4ce-4644-8a60-ce407a4d2f11@linaro.org/
> 
> [...]

Here is the summary with links:
  - [v4,1/2] riscv: Add stimecmp save and restore
    https://git.kernel.org/riscv/c/ffef54ad4110
  - [v4,2/2] clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
    https://git.kernel.org/riscv/c/70c93b026ed0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
