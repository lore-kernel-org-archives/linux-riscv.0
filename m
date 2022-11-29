Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1B4C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 00:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CC3Sa6wxTRgm+gAvvP6E6TP4BqP3KvkK4KXgEtqEjuE=; b=ruvTp968kFkcL9
	W3gsqh9uUz/fw+5IUtGURV36l4S7GR8oijrx+HvqbNwnh1UM9i1yDpi3jGGbxwk7tYL3ian6SSXXp
	SHMwAz1SaaMN0ev8LFeB7IV4LZhT2jJ3cS6tSaliyxYqZOC/d4knRpzb/aRTOpfDVxrOKxBEvoFth
	v8+hYCAQ+YU2QHeayh7KOIRL5asOMboxGRJiUWKMgKx9Rbvb5Vzn3bH84oZ1wX0DIytgYVKS+706f
	RJkOoFH4fZfY/xcApnW2SLl0aNxBqBtR0jnST9NeXoTasD3bRazAEkXlq2uVePnT3uK2TKCLDGMo/
	o9oN1nY3lmPYh7x8pAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozopJ-004vh9-3O; Tue, 29 Nov 2022 00:50:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozopG-004vg6-99
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 00:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7A612B810D5;
	Tue, 29 Nov 2022 00:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23D32C433D6;
	Tue, 29 Nov 2022 00:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669683015;
	bh=gVh2g0Vi1FSHpyi0QX/3SGHx2knvHC+vTGRbDJ9Tg/0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=A2y0HV0WBuZHEV0GYJ/MZJ3NGO8o6Yo+3jHKTQJduA2LKrukDPICEN/IK/nEtp+E3
	 rQ0LRQ9BRTGh07oqSgpxIyhPOez6/vFgqBWtMz1oZWLbqnqHdOiR0wnNlb8fEZV8YN
	 2sHZrOKhxgO3/tfzRcAcJZz94WssYuB56mO9EL1E0IG0a/OEdGpeHY0ywmi9EG5XwT
	 HYsohvw0FVHddZgPMEu0hcrKIi+uQBvHOJqiTdfjnz/wDvLzsV+lEKkalWZId7PcGx
	 roLKVhT9cvYXs5klK94Quac1gzo1azLgffLlCFtAoT98CyZH0NP3euvHwK1DEqsYsb
	 uHREn/H7qO4zg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0128AE21EF6;
	Tue, 29 Nov 2022 00:50:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Sync efi page table's kernel mappings before switching
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166968301500.7047.6174959001069239033.git-patchwork-notify@kernel.org>
Date: Tue, 29 Nov 2022 00:50:15 +0000
References: <20221121133303.1782246-1-alexghiti@rivosinc.com>
In-Reply-To: <20221121133303.1782246-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, ardb@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 heinrich.schuchardt@canonical.com, emil.renner.berthing@canonical.com,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_165018_498627_298AAE4F 
X-CRM114-Status: GOOD (  11.57  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 21 Nov 2022 14:33:03 +0100 you wrote:
> The EFI page table is initially created as a copy of the kernel page table.
> With VMAP_STACK enabled, kernel stacks are allocated in the vmalloc area:
> if the stack is allocated in a new PGD (one that was not present at the
> moment of the efi page table creation or not synced in a previous vmalloc
> fault), the kernel will take a trap when switching to the efi page table
> when the vmalloc kernel stack is accessed, resulting in a kernel panic.
> 
> [...]

Here is the summary with links:
  - riscv: Sync efi page table's kernel mappings before switching
    https://git.kernel.org/riscv/c/3f105a742725

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
