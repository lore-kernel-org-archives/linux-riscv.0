Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B52C10F1A
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCKSx4tTezW3V5xo38xqkSlQJoFpDXDFYXRQL+PDDJ8=; b=oJJKceA5h4WkMO
	f1JLBjyHyCXxNn2UetEEdWk1SI+wOdvyDk3e5RgJ1LwD4xx/ZHHCb8TplXrhwwzaipUbxGGpIY4AU
	ndX2lTYfGU9VBEHys3NaGPytvS7WCEvwt20DhZv1rSIcQMIhrLu4ENWFZbBaLhK/i8kzJjN5iqV6o
	qgnUCOKimw8t+qr4QKUymxOek0tfygf9e5awTNjeDOdONhGVifkAJoJP5L09bavTgfGVmcuKHWScN
	1xawvKFCyzgKTf+zKFDygHltrLFxQtwuXZxGDHXe8ZPzFOWtHzCwp4P6u2rTvY583JknYGFr7G5F7
	Y2MDEKStPiGebfsMjHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZi-00000000nne-0jJ1;
	Sun, 28 Apr 2024 22:00:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZY-00000000nip-3Hat
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CB8A60B93;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C06B4C113CC;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341634;
	bh=9Zs3qLqdKozykHa9V75JS3GRduTLPrPINfUtjXZ9lBM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H26tfuojMbEhe+aZECwDU+ED3T57TnYoE/Oa+tN65hwAONVJCWsXAhrS4a8xlV8WS
	 AzlrzY0ue4clDNz2ht2J0Xn/NSF5vU5h/kBH+VRGYF/qLdDVHGtQk5OYEh4xG8QZMa
	 AI0QNnmzv47L4oTpMhoBEPUq6TALpXn3RPLcxM+hgZXJHtlLNHybiwtvmNz6/fpFGM
	 PgZTX9izxRSAxdv0zZh4RnPFP11kbNFWsHxEWrwUI1y9HnB2fv3jAK2F+WXp5mV3sJ
	 h/S/o+uBvJayQOLvhwjr2zsNP2ltb3c5aAuAv6dP6tY1oLexG8DqQVGX9kJTrLyzms
	 IM1weeXXc6FcQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AFF72C43614;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163471.22130.9333013244228014885.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:34 +0000
References: <20240226065113.1690534-1-nick.hu@sifive.com>
In-Reply-To: <20240226065113.1690534-1-nick.hu@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150036_895361_9F8C16A1 
X-CRM114-Status: UNSURE (   7.73  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 26 Feb 2024 14:51:13 +0800 you wrote:
> When the cpus in the same cluster are all in the idle state, the kernel
> might put the cluster into a deeper low power state. Call the
> cluster_pm_enter() before entering the low power state and call the
> cluster_pm_exit() after the cluster woken up.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> 
> [...]

Here is the summary with links:
  - cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
    https://git.kernel.org/riscv/c/3fd665f2854d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
