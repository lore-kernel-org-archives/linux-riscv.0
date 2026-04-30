Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CAFCD13D3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbCr/Mzog2dnoAwkV5rqYtmfYqergMBQfjffF3ijNVw=; b=sH01UEsKzA1tfN
	eAYRsTRj6hiCN6xqay9tCIuC5YKoF/LkHiHS0ClXE3E05ThAow2mo0ZQlZ/8ZAA9/RKF+NrBzmEoX
	2P1O7wuyuwGpZ1xVGmqnS1+NIDUcEeVOTjX4Yoxcm0Epewjo0BcYyGViXGEApDx8n6bSvEULOUQZa
	xRAaFxJke9O+S9oUlafzBJO8SNhjanDVg8XD8ObZDXdfJQXJ8lQb6/Od0PA5opLmy0XMIOMB47/SV
	35lNa+FoJ6mH2Fod5SvCYc5hEU23PLVeMZ4KcZ5qcCAeC1qur8LHQfbLDJhmOJpCNqjTx8lXBai6H
	pRiCyQDgAmgNPv7NahQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4f-00000004YpQ-1zrh;
	Thu, 30 Apr 2026 03:28:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII36-00000004XBh-3k6j
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85BB744593;
	Thu, 30 Apr 2026 03:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE8C2BCC4;
	Thu, 30 Apr 2026 03:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519608;
	bh=FEe6qHhEqD00NVl5OFtLZeIeX/qR9AM73Fff22EwmbM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UfCaDdmBPeK5S8ntCX7V/WAJzL6PyW2JWMazeBtJpkMluxHI6LPKyHczr+cQ8EmGZ
	 rZhbZwiXkzo4rKHE7nXKZbAly7aVJl9deRbKhucyZnIqztBUJbpahKyYO2Z97QObAM
	 VrUMrRhaTRBDed5H2giu2cPJYUkl8ue9/WIodbqWiNG4cd40oQSKGXOj0gS7QKvtCo
	 iwPsRCDoPDk/wNrUimKJ+Z0rgNtD825RrV9n8k4XqjKSJ9EElbs19T6/Y/Xks6mnPZ
	 jIHk5jXjZV84wNJ3EE3p3cklsGFTJalRuTp7+NZE342r+K0YOCwLXWHQ2sWG+NzXJh
	 mCwmVu/psxHDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA07A3809A07;
	Thu, 30 Apr 2026 03:26:04 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/msi-lib: Refuse initialization when
 irq_write_msi_msg() is missing
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751956329.2274119.1202554287518338365.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:03 +0000
References: <87a4xp35cn.ffs@tglx>
In-Reply-To: <87a4xp35cn.ffs@tglx>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 yingjun.ni@riscv-computing.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 maz@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202648_967112_BEC1C83A 
X-CRM114-Status: UNSURE (   8.44  )
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
by Thomas Gleixner <tglx@kernel.org>:

On Tue, 03 Feb 2026 22:05:44 +0100 you wrote:
> MSI parent domains rely on the fact that the top level device domain
> provides a irq_write_msi_msg() callback.
> 
> Check for that and if missing warn and refuse to initialize the device domain.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> 
> [...]

Here is the summary with links:
  - irqchip/msi-lib: Refuse initialization when irq_write_msi_msg() is missing
    https://git.kernel.org/riscv/c/aa80869b77e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
