Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B51C4452D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 23:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUvx6zQBk5HKZSFDCrUD3CChPpCfAJkOh6R7UuHHX9E=; b=I6i23kVBT7YLkG
	IPVHzXGzjdZ/s7ad2JaggCUqdthmvFT8cb0Yb/QoyyBlE37a4fS53GdtahQ5+yQdAi6K+RNoZy3Hx
	dHt/4EprLkEri+inYkdT0UYbmJgcc7A8w3JTYRC7dXUwYTgRBxW4qks4bAd3D6wIlCQUGHuwcgGQ2
	SiYGE2GU5QD9apEb4XM2ojO4l5XSgRJ3aT4QfHTv8V5vRGX2j8E8pT9LAC1wuW6B2fD6PgcisuZNv
	oa0126IrQb1aYStwd7ld5Q2YXiTCoApdJOYYE4vYLgM3mj9yX8pisVgONPGyEAyJVRrLu+OhMVL9i
	DgDC3qfTrEdbnzglY8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmKER-0000000AcGv-2KzY;
	Tue, 21 Jul 2026 23:50:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmKER-0000000AcGo-0aeT
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 23:50:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 653E041666;
	Tue, 21 Jul 2026 23:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C641F000E9;
	Tue, 21 Jul 2026 23:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784677838;
	bh=kLw2lxWCpAGiNj2+fQfGuNyaOZ8w1cVXAAEatOpdPL4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=j6aMpu1ECiVlxCKblxG+8u8lxP/2tgNr2b3LX3+XcTx8s857qLS5gyH6+yi1eozOu
	 fWzM8VReFiJ6ZQIlhEie6ipXGJ0J5siw7jPOQOE03Q+8H7knyhsd/KY3wVrmuz6s0E
	 Xx3/n5Z6ePRdMoGI+GGb/roGznNVqaKtskLLLNsaCXPcxMKAACgtl0h2ZcUWfrtQDw
	 NVabA94Og3RoaA2inGXl0zx72snguW+zQAUgbIa6376XdtQGmcEAdwbwRmG4BR3omz
	 MVSsJRPCn3nyjhyu8w7Ssy+ptSHGx2/NDnXZ1jVDOV5TUp6aAWr4brDUHxPaGW6nm2
	 b4dNIeUJoydVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0FDB380820D;
	Tue, 21 Jul 2026 23:50:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: mm: Move dma_contiguous_reserve() after NUMA
 initialization
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178467780765.1167722.17403934449709324097.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 23:50:07 +0000
References: <20260714185648.1082483-1-ezulian@redhat.com>
In-Reply-To: <20260714185648.1082483-1-ezulian@redhat.com>
To: Eder Zulian <ezulian@redhat.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Tue, 14 Jul 2026 20:56:48 +0200 you wrote:
> Move the dma_contiguous_reserve() call from setup_bootmem() to
> misc_mem_init(), placing it after arch_numa_init(). This ensures that
> NUMA topology is initialized when reserving contiguous memory for DMA.
> 
> Tested with CMA_SIZE_PERNUMA enabled and two NUMA nodes on QEMU:
> 
> qemu-system-riscv64 \
> 	-machine virt \
> 	-nographic \
> 	-smp 2 -m 512M \
> 	-numa node,nodeid=0,cpus=0,memdev=m0 \
> 	-numa node,nodeid=1,cpus=1,memdev=m1 \
> 	-object memory-backend-ram,id=m0,size=256M \
> 	-object memory-backend-ram,id=m1,size=256M \
> 	-kernel arch/riscv/boot/Image \
> 	-append "console=ttyS0 earlycon loglevel=7 cma=16M"
> 
> [...]

Here is the summary with links:
  - riscv: mm: Move dma_contiguous_reserve() after NUMA initialization
    https://git.kernel.org/riscv/c/76e885f2b89d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
