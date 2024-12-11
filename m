Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B57E77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWNncx7NUcwvtVU/KLQt5+PYNTwN8DNXPatO6kAMzbM=; b=yFwmWAPg5lthJ3
	msv6whjsf4AVDogDUtPxgnXS4QERtkCHRfPe3XJQ0vYHnybDXGSj+SxHCnd8DtWh38k7XQnbpusZt
	90WXZei2FnrTlBVXazpcq5CqCySYibph/nTgOGCY1h/TMLvJUhiKMOq86mxG3HcLkmLVWex8ZmPSC
	WuOwsDVlNFwUUy3ORH8WhzHyhYjGwWGRCfR10ROftBEH+gY0Bu3Ecds9RaRH3uQ6UvDPtxIqZEL9i
	JD+dKya+7OE+mcm5spBnlxW13wJ8xrgS5WDwUtO8K1VxaByA6lQa/Ze4KL3MktDKF8V+8xUOjcIN4
	R9ZTMGkWR7wTEBg8ct4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVRS-0000000GOEP-1SFz;
	Wed, 11 Dec 2024 22:44:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGY-0000000GL11-3o5w
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E324FA41797;
	Wed, 11 Dec 2024 22:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0511C4CED2;
	Wed, 11 Dec 2024 22:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956389;
	bh=rziuN3RXTNb4asfxHKmfuF1OD4uzOzCzxCR0NbNYJbs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HjCRwsVY/9VT2iX5FTXa5PhLKybNvSrKCwt5s7RhSzyhnUxmw6iB+sLJeMZ75QLFL
	 TiI44RsJG0ThJvtEwTJJyDRxf7rMu7qdSJYfNhLKnQGaDzaI/f0CVShF/0UFeO9Z8R
	 K8iAVjjnrLu9k8nNR0boZZKuT/BBhxJupk+NSqJ8vcH2B4/kAzz8c0ztLrOhOE5JFV
	 GxlOtFug4+VsW3KEmgl0yGR19Haaw9RWvfChhL0QVGwm12s1a3ku6xBE6ZkzHbPeqO
	 9IJhqAY/pvtJzZQp8M9u5kSctPMt3rzzIiPyIwS/gf/gETsNkipHN4eV8pITk007Az
	 ptHGEaZoLXKcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3435A380A965;
	Wed, 11 Dec 2024 22:33:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/riscv-aplic: Fix crash when MSI domain is missing
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395640574.1729195.6519858091833497915.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:25 +0000
References: <20241114200133.3069460-1-samuel.holland@sifive.com>
In-Reply-To: <20241114200133.3069460-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@linutronix.de,
 aou@eecs.berkeley.edu, bjorn@rivosinc.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143311_004987_826041AC 
X-CRM114-Status: UNSURE (   9.32  )
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
by Thomas Gleixner <tglx@linutronix.de>:

On Thu, 14 Nov 2024 12:01:30 -0800 you wrote:
> If the APLIC driver is probed before the IMSIC driver, the parent MSI
> domain will be missing, which causes a NULL pointer dereference in
> msi_create_device_irq_domain(). Avoid this by deferring probe until the
> parent MSI domain is available. Use dev_err_probe() to avoid printing an
> error message when returning -EPROBE_DEFER.
> 
> Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-aplic: Fix crash when MSI domain is missing
    https://git.kernel.org/riscv/c/1f181d1cda56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
