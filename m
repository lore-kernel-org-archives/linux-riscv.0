Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D07C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 15:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpTBfSXBLg8g5Dh0WbLe9KVBUE5WAfrawrXmxzws6vA=; b=wrYQ29elWgBMzf
	lCdE8eoHX4Goie6yVk6cooC0LHMv1y89l/gXAayVzYjVnIvsw2QXBFidDtrLtim7NEkqxWzSszhKK
	ME/8C9ydUI4USikwg2RgTlQc7ED4BrKnCxF15piRSMun1IGw7Xa4J3OwWl+xtyXcUZQW+JvFTV3Ld
	6U+fjgaY3KKtk6BLJ98gxn6y8dAZ5SmHJear0FMY8XZipETBPMOWUIR4wDsOTCRC4Pr1O7IlTyc1X
	+GOUaN9UPWcfQzQmXgWzPf/LUCpYi5r6zYVQXrauI3CS5H5aHhFFAi2NmrqFvuFJmDh1tihVoxggc
	e9RnPVeIww/KTFr034Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxAW-000TRC-1n;
	Thu, 11 Jan 2024 15:40:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxAT-000TQ5-19
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 15:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EFFE3B8206A;
	Thu, 11 Jan 2024 15:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46CC4C433F1;
	Thu, 11 Jan 2024 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704987627;
	bh=zUUw91RjsXsTZYU7IzR/N1+v3essx1rs3BbSwsHr3oU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j7I8+XcKYl48Q3tHezghtFOktVKpj6TFmWK7ccynETAiyfnOqsGnP/Q9Iu0BXadsd
	 iL/5U18CnjNqeOTFLMRcO7dyDu8wDpOhmcvxgYzfB7GgyW+urtq4aOjcup4eUXgMVe
	 4nQ55V5dJZApSrQVYGxecLnsmkBEpG+UJLBmiP+/TJ0Ah+yuKtoTLPowkW7Ivaj16c
	 0FdgLy2bMlt/p3KkpeIDTcWtOL4dDlgPkH4JDZPp/6n/kRDkIg9m28pqLnvAqC9k3S
	 swIKfT6e/KikHBROddxFbJagZW5VNq98IJfqTiTBVWAMVV/D0G+VPjt/KbuLL27zZs
	 c+jxI8XVr7bPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E270DFC698;
	Thu, 11 Jan 2024 15:40:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: riscv: Document cbop-block-size
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498762718.16494.12898852163164457210.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 15:40:27 +0000
References: <20231029123500.739409-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231029123500.739409-1-dbarboza@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
 palmer@dabbelt.com, devicetree@vger.kernel.org, ajones@ventanamicro.com,
 robh@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_074029_537660_29E0729A 
X-CRM114-Status: UNSURE (   8.08  )
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

On Sun, 29 Oct 2023 09:35:00 -0300 you wrote:
> Following the examples of cbom-block-size and cboz-block-size,
> cbop-block-size is the cache size of Zicbop (cbo.prefetch) operations.
> The most common case is to have all cache block sizes to be the same
> size (e.g. profiles such as rva22u64 mandates a 64 bytes size for all
> cache operations), but there's no specification requirement for that,
> and an implementation can have different cache sizes for each operation.
> 
> [...]

Here is the summary with links:
  - dt-bindings: riscv: Document cbop-block-size
    https://git.kernel.org/riscv/c/d3e591a38c98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
