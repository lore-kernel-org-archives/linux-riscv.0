Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740ECC41535
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q38HQ8JzaDKYk+mZbbssIqD7/EIdHLGa0Numl7KWqCs=; b=mx6vrAHAs8jmBt
	lncv0u+ZlmetXbFHKZZpVJvUwpEYrIn7biqgTcUD7s/lN4f4vYyoQT1u918ScXPxpZyORyVBPiLWx
	crpZZ4FNcwxNz8EQluTTOJz+GujfKOOwBzNWQaVXY6yk3wslPLitgsBtfcklTsqcJpCV+2U2HvNSU
	YS4/BzWzSAh+4T6ZGNf+ET5Z/+GFP+RgCYCpdhWDpE9+3T/p9SSNn9SqpvNS0SFDfygB53LchQ9XA
	fUmvTsKejhKCddW6cdq8QmPyHGIvSoTF9E4I6Gp+ecq20HNbsunyuO27AGBzy62SRZzs5Jwnz0hDA
	zhqcdaAFlGQbXG4XN7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCO-0049b4-2g;
	Wed, 08 Nov 2023 15:10:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCL-0049Vu-1w
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 15:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BC006162F;
	Wed,  8 Nov 2023 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16A09C433CD;
	Wed,  8 Nov 2023 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456224;
	bh=+q4CMZEtGo5T8fEL2Av92WTVOokwQQBXyhymHf9umrE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b41UNZmy2S7levto+O8FCd4Vh4U9Si2Z+0j8DASbN+bcz8POhFLkSfzokKmapNm9T
	 F6WR2Ul5h9V/Z6gWuSjycEMgV4yTGBwMJPcUVkhPBdKveZ6qUcgcAIqS/K8oE74gJT
	 vj0xIU/AypRqUyL8A7C02fJoJ0Lq/sWgwYrlCW42qb5s1zTRamqmkrPeXAxOXOU0jI
	 paSVhtpEvmhLA5Wlp0nhizR5i5X7ZdCa8GtVsrncz7D/nTcyLgvUjjc0eI4RrXYmk5
	 9XsjxRt+RR9K+5SCzt5T1sRj6numRQKNmdOJAa4vFLNX893xBIUx4PgV9ZocL86usm
	 Fow7lHkx2Qvew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8903E00088;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] RISC-V: Probe misaligned access speed in parallel
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169945622394.21527.3124390235718223224.git-patchwork-notify@kernel.org>
Date: Wed, 08 Nov 2023 15:10:23 +0000
References: <20231106225855.3121724-1-evan@rivosinc.com>
In-Reply-To: <20231106225855.3121724-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 apatel@ventanamicro.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 leyfoon.tan@starfivetech.com, maz@kernel.org, bigeasy@linutronix.de,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, David.Laight@aculab.com, palmer@dabbelt.com,
 jszhang@kernel.org, greentime.hu@sifive.com, cleger@rivosinc.com,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_071029_727532_F20E0832 
X-CRM114-Status: UNSURE (   9.55  )
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

On Mon,  6 Nov 2023 14:58:55 -0800 you wrote:
> Probing for misaligned access speed takes about 0.06 seconds. On a
> system with 64 cores, doing this in smp_callin() means it's done
> serially, extending boot time by 3.8 seconds. That's a lot of boot time.
> 
> Instead of measuring each CPU serially, let's do the measurements on
> all CPUs in parallel. If we disable preemption on all CPUs, the
> jiffies stop ticking, so we can do this in stages of 1) everybody
> except core 0, then 2) core 0. The allocations are all done outside of
> on_each_cpu() to avoid calling alloc_pages() with interrupts disabled.
> 
> [...]

Here is the summary with links:
  - [v3] RISC-V: Probe misaligned access speed in parallel
    https://git.kernel.org/riscv/c/55e0bf49a0d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
