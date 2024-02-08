Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69199C4829B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 01:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb9SyvMVWHh0hTGJE232ihA5yetfCm8ZVfAadqjArgw=; b=MDzMmM6rd4SzgP
	8Vyz6ZotEdyXzpJCDG8cNwDHN+EkCimS9ByLf/C/op7MexzCRWzS32B6Qkml5kVOJh+yS3LCiPrDF
	bj5kc9OJoI2WNjujUmXHvEy695zdcVHpyNgNdzaMLiO74QILNcXOH7iWwqYhSWwwjR05A0Nr0plEt
	dZvO92oMOezA9tyjVwEwnSdiPagyCep0P4omOVLvIeDFHKc7PHUxQDgonGJj8YpXe7Ueelzgn8sSC
	amqOSab0BdUXCUdgTSpydOcSbPzYc1pei4saiIG8qWmK079iNpouJPuNhnRjMuuaO3AUDLkaGlmgM
	Su4hzYgPXLllrLtx0ByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFb-0000000COZ8-0C3A;
	Thu, 08 Feb 2024 01:30:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFW-0000000COOj-0lsi
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 01:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6364ECE1B25;
	Thu,  8 Feb 2024 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55592C43399;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707355829;
	bh=n+Zpbje2Yn/E1Fwodo+iDATPIiXjKClf6LBuUQdStTQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WJU8GpVHN4RYHnLNu2VXsP3IGQWHmpiEf3ZWrE2/F5GHZ905HuoPGnQdH7mYbG0gF
	 9ndxU8JmEvSmGAYZ0A61e2yH3hHQtBqh5bNYlZ12RE3FyOFwrniPMFD807/q3yxSQ0
	 vPQmRYXsL76ks7zKiFmf5Jc/D3vhIK0/4GtBmaNcCWrhsnexd6ZGZqbMl/3C4yLhH9
	 Lh7wU8J3p96XhCsxOZtRSj7GBpJBZ6A6eehDBpmynv6C+TqdfFwGu2za4Dw9RHnZuP
	 AuB8/3Fxv69O94oXwaYWbiJsjPrEfiZOUUHH5oXf4McT0QPT43NpOKIzI4nQl5vAVb
	 9EEUy0qkav1yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D762D8C985;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [v6 PATCH] riscv: mm: execute local TLB flush after populating
 vmemmap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170735582924.12826.13269485419610623682.git-patchwork-notify@kernel.org>
Date: Thu, 08 Feb 2024 01:30:29 +0000
References: <20240117140333.2479667-1-vincent.chen@sifive.com>
In-Reply-To: <20240117140333.2479667-1-vincent.chen@sifive.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_173046_452591_792B1C49 
X-CRM114-Status: GOOD (  10.32  )
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

On Wed, 17 Jan 2024 22:03:33 +0800 you wrote:
> The spare_init() calls memmap_populate() many times to create VA to PA
> mapping for the VMEMMAP area, where all "struct page" are located once
> CONFIG_SPARSEMEM_VMEMMAP is defined. These "struct page" are later
> initialized in the zone_sizes_init() function. However, during this
> process, no sfence.vma instruction is executed for this VMEMMAP area.
> This omission may cause the hart to fail to perform page table walk
> because some data related to the address translation is invisible to the
> hart. To solve this issue, the local_flush_tlb_kernel_range() is called
> right after the sparse_init() to execute a sfence.vma instruction for this
> VMEMMAP area, ensuring that all data related to the address translation
> is visible to the hart.
> 
> [...]

Here is the summary with links:
  - [v6] riscv: mm: execute local TLB flush after populating vmemmap
    https://git.kernel.org/riscv/c/d9807d60c145

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
