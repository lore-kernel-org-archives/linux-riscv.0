Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EC6C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 01:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkaSYtl9a+jw+lqC+3NXtNOg4gx7KdDdzM5o6RdGqu0=; b=hv7VPfTQwsmDAC
	BxuwFWl0sZ/y1mRZoHkh07B/BIto9r2Ej9m6jcWslLMAcaXdjfTnBjZMO6cccHvezu0y61/toWf8w
	hpSRure/816XsNoZhY3TmHpcInwypoNZbUXgdDnA/3m9/nwO6WjSn3wwFAcYUkImhYbQBbgyVl16X
	8yj0W4lYm0R+9vhl28gegsjofw1BYpVDoT1uRhKXLF1Mwsbo4H5Y6QwlriCd1lC1ZntY+Drk0WEPo
	g/ELdGwL0Ev6LRWZyp+jazRCD1OaJ6VB3tboAP59dl9yh3hxSGJZUvB93swL2mBtyeQb5HYN0hDRA
	MTDy6G2StN5sALHONCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjV-009pZK-0n;
	Tue, 20 Jun 2023 01:00:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjO-009pUU-0D;
	Tue, 20 Jun 2023 01:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D09E60C4A;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE71FC433C0;
	Tue, 20 Jun 2023 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687222823;
	bh=d1EVAIuUCkQo8k/ULkkFYkAV6A3t5sHL69vz5H1Z1a8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dVywihqGfCS3dskFd6RjHIXYmAsUMhLaLN30lwloXCa9Up8R1yHKpBGaPZxyWzbL5
	 3NzveDV4CJK7bcJhceRXCRjUagX6eD1HXk8PV5PFrBZkGdI2PCDpp2dHbuYAeA9gby
	 ys+YG9PqEZS/pdNU4cIA+9mYTXM6hspfw/0uKcIwpRo8h94xSvQePdwI30u6xCzUjQ
	 mXqZZJ0QyxGKA15M56Y0I4mM5TPLOd/L54N8hgeuMh+uZh9orUr9mcJX4rFfpg5iUh
	 S4Y+zza0Bhh3oB0g5PnolNorNEN0DF/ojAuMfC+aORERzLG4BtiHelSr7BK7llrJy+
	 h3r2QjqUUOvfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE7EDE301F8;
	Tue, 20 Jun 2023 01:00:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 -next 0/2] RISC-V ACPI: Assorted fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168722282377.22807.11943189274896706189.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 01:00:23 +0000
References: <20230607112417.782085-1-sunilvl@ventanamicro.com>
In-Reply-To: <20230607112417.782085-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, atishp@atishpatra.org, will@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_180026_151068_78C96594 
X-CRM114-Status: GOOD (  11.25  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  7 Jun 2023 16:54:15 +0530 you wrote:
> This series fixes couple of issues required to complete the previously
> merged basic ACPI support series.
> 
> 1) Kernel test bot has found a new warning using the sparse tool. Though
> I believe this warning exists for other architectures also,
> I don't see an issue fixing this for RISC-V.
> 
> [...]

Here is the summary with links:
  - [v2,-next,1/2] RISC-V: ACPI : Fix for usage of pointers in different address space
    https://git.kernel.org/riscv/c/3b426d4b5b14
  - [v2,-next,2/2] RISC-V/perf: Use standard interface to get INTC domain
    https://git.kernel.org/riscv/c/ca7473cb8312

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
