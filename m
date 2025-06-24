Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E713C7EE2A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 03:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wR0iE2gPUb4ooaHqZCpw5vqMKCDVTtU9myJP0FdsoM=; b=XcMW2B9CJkysZ+
	VIuGLQmj0stCAQFx8Ws5Gm57Fzf7fQg6+CAjY3UHw4YDrZNBgalBvChLoGPrdXpOTIz2Jm+BMMSoO
	6EjN/Qrkg/ijvRW8tfOfEYVutcEKF/wkfCQ2Uh17BQrQWAIIBMFdPtz8cEevCHu4+cBoDr5u7v6nJ
	RrQIqi1PmZwDcWaXQ1v3JzL7FKlC5GdPAGoeMFhcBN+un6zWTVcsfCK+Wb3tBlB8WeSXbwyaBYbgQ
	EpKIHSatls8Q3pEMw6WCk3Y7PvU8Jir2NBJblosAfHBJWFoPGxq3HmkNglngjfuZTSD6V2Mh88En2
	KVlJl1eJMekkZT+FjFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTu1J-00000004WMW-3cRk;
	Tue, 24 Jun 2025 03:08:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrr2-00000004KVP-3gMq
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 00:49:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD3675C4A5F;
	Tue, 24 Jun 2025 00:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00414C4CEEA;
	Tue, 24 Jun 2025 00:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750726179;
	bh=auJG+ebWPdigAZon0xUkAP9Sh4i7/1apI4ycMMIuwnI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tYo+416UzkF5unLO+5cq/IgT7Fws78hZETuwzulH0wPGHZK9jye0wFAUDVS89xI1D
	 zZ4v8aCjXZGEAPo9GMvVOxF9jlWeLmSiNklzmwyuKjAPty2zHZwbrPueF25qMv/EYr
	 inQ4HZKZB0SUdDaIZOpuwp5NwhMy6ton90LNxLQslz8cjYlE+GlV/+RIixbc9hjdpF
	 OQMEb60IPneshvBC9mbd0uKnhuNJH3qvUOLB7KQ9Au2+e8bbu7h/pM6MPf5C6vjat5
	 dhl9NLupsVecmwzPx4nbWScAvg2UBv+Mb+t6dTbHuOdx8KUDkmCJz7wsWXgu49UG6k
	 njFyy5C3Iuypg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E6739FEB7D;
	Tue, 24 Jun 2025 00:50:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: export boot_cpu_hartid
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175072620601.3349808.417584899603480594.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:50:06 +0000
References: <20250617125847.23829-1-klarasmodin@gmail.com>
In-Reply-To: <20250617125847.23829-1-klarasmodin@gmail.com>
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_174940_966336_1915DECD 
X-CRM114-Status: UNSURE (   9.03  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Tue, 17 Jun 2025 14:58:47 +0200 you wrote:
> The mailbox controller driver for the Microchip Inter-processor
> Communication can be built as a module. It uses cpuid_to_hartid_map and
> commit 4783ce32b080 ("riscv: export __cpuid_to_hartid_map") enables that
> to work for SMP. However, cpuid_to_hartid_map uses boot_cpu_hartid on
> non-SMP kernels and this driver can be useful in such configurations[1].
> 
> Export boot_cpu_hartid so the driver can be built as a module on non-SMP
> kernels as well.
> 
> [...]

Here is the summary with links:
  - riscv: export boot_cpu_hartid
    https://git.kernel.org/riscv/c/c5136add3f9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
