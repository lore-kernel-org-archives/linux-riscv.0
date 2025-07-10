Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCB0C83F10
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 01:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKJHBYvjWXVKVLf8Y4ijDoLfzdpH8w5YmQLbeZ3ENho=; b=utMJtB+5u3yw8q
	NcfjzHnoeDYzq7WjkqDHK82zgaRiCfXplITXuIvEjWpZBBOkvImKt6cd2uK6aSBqR+DGdk+in3d/4
	Zo0+x90P7WYjzW6+ewlNhJSsRPrfzfEW6flYFZ9DcMPUFMDxTnh+CLvxVPWPpQqMyUoMgQr7JGepX
	DLddkHZ0WZWlrssrox7Kgz0Ic2RBggp1NsWL4zWeGqhW39RW12MxqzghBNk4qttasnQd6A1zJSeVH
	swYSXDcyiO+AqYlVYNcrTETqHPMyjLyTCY1PFsoRT4Txvl0rxSTXpR/CDDeCTVSrEwrV6GdxyJ41Q
	V+RWXAP2LOLRI+5qI0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZgCE-0000000AQXK-1pBP;
	Thu, 10 Jul 2025 01:35:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZgCC-0000000AQX6-2OYE
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 01:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A005C6144E;
	Thu, 10 Jul 2025 01:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F1EC4CEEF;
	Thu, 10 Jul 2025 01:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752111331;
	bh=vuaZDssHpq/J3jA0y7OFz/bVN7cmfEs2MmNf4DnX/WM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nelftVPXCJB7ObKBwuBT3hh6ozJyMcEuIainJ1cEzbC3iWzXTEA77rqq1z5fs2+is
	 zs8v8bbfSTTEKZyGjVQneoFkszzLVhyQym7SZEVdSRHut8t1Hk4Y7LII/G3HvvSQJg
	 Dds0gjg62ARS3uJJEd1yNLkjPCspikXvFfFYpxRUKS9+xDEkkW7aBVCvwedELP81Hn
	 E7Eqig0LBWy1BdiIQP4JrqNMDWP4T6DZunrtOBuW0bqgto6EOvBdQGtW38B0ong4kI
	 9B/KNkFiCc8ofQxLOHq8OsYrpWvgbMug6jG5r0ZF+uEaBs9lqSrPQ6YRGlXS1CmKEf
	 lBLM0KAqMN6IQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF61383B261;
	Thu, 10 Jul 2025 01:35:53 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] dt-bindings: net: Add support for Sophgo CV1800
 dwmac
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175211135250.897408.2127630772719110412.git-patchwork-notify@kernel.org>
Date: Thu, 10 Jul 2025 01:35:52 +0000
References: <20250703021220.124195-1-inochiama@gmail.com>
In-Reply-To: <20250703021220.124195-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, richardcochran@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dlan@gentoo.org, looong.bin@gmail.com,
 conor.dooley@microchip.com
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  3 Jul 2025 10:12:19 +0800 you wrote:
> The GMAC IP on CV1800 series SoC is a standard Synopsys
> DesignWare MAC (version 3.70a).
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: Add support for Sophgo CV1800 dwmac
    https://git.kernel.org/netdev/net-next/c/6a971e48e2d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
