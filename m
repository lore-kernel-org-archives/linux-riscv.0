Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2CAC47DA9
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mw2AaYg63yTpIBDei4ADKi1XDoO0RNWz5xBUiLXabcc=; b=zyRUwSsB/MgJE0
	r40l2PORNYmAP4TdL/4vZVl1StSEKyFyp8EZGTLU8CJEvjZdo6P6N4Hr6DubpcnzQ5Ig5vOHDYcZv
	HsfwwPfC+0IqZm3HA8YzTXBKZgvyFxd/i8H/9yFLlZFYdF2SFLEHXEIRNbMc7j9R1UKscqFtj8LWr
	49TFxVgpezKQjhxtigW8PChS20jy5RhwvPJzihVVIjzqFjVx75ZsJdN+MEKolKn3X01d3ULqtD534
	OYFkqyq41T+pFK/HUGqT9V+dgH4+o4O9SPHZi//keACNfAcHQjQh26L+ghsBRma+vGJIOOU3rrhLZ
	Vx3rIlajFv7UNey1NV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOT-000KQ7-2n;
	Thu, 11 Jan 2024 14:50:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOH-000KIv-1f
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DDC961B07;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 202A5C41613;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984638;
	bh=8CFIvlUjGt8QuBBa8Tb8VwbjhIkC8KrpqfYFhCv5K2M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CpGQWbIj1uskVJ7lEG9iK0nGpDTR9n0fGvpAQ2p/nlqtR4Uxcb2SFeiqkbYLu/cGj
	 NOxhZWAHvUqIvcR/oo2NCvFeI7/vn0c5kBkMm2TipC8WZTinDydm6bcy7NWm6EAD5N
	 ICzCoQhUfL6Jc+SXuOeztQfIF3vW6CyvCDr0dvjFT8D/CpesXqLUO0s5AFjjyBOTsA
	 gdHdvj3RJ4U0qZtrkQNf9Z86COGWSL0iky984fGmMofk4SifP/wye8NDI2sgdLDKnx
	 FRRhrygIEkjcdrHFHGc89Kinl+YNcWU1/LEMDfvQw3ovx+iaojrYiomzKS7W7TOYcy
	 opK2acU/E8BYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0A954D8C976;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/1] riscv: Introduce system suspend support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463804.20080.18088597793409481961.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:38 +0000
References: <20231206110807.35882-3-ajones@ventanamicro.com>
In-Reply-To: <20231206110807.35882-3-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com,
 jeeheng.sia@starfivetech.com, conor.dooley@microchip.com,
 apatel@ventanamicro.com, samuel.holland@sifive.com,
 songshuaishuai@tinylab.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065041_595345_9AB45434 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed,  6 Dec 2023 12:08:08 +0100 you wrote:
> OpenSBI v1.3 and later supports the SUSP SBI extension which has recently
> been frozen with the freezing of SBI 2.0. This one patch series adds
> system suspend support to Linux, which implements "suspend-to-RAM". To
> use it, build the kernel with CONFIG_SUSPEND, boot on a platform which
> supports system suspend, and then issue 'echo mem > /sys/power/state'.
> It's also possible to test this Linux support on a platform without
> system suspend by using OpenSBI's system suspend test support. To enable
> test support add
> 
> [...]

Here is the summary with links:
  - [v3,1/1] riscv: sbi: Introduce system suspend support
    https://git.kernel.org/riscv/c/99cc514d444c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
