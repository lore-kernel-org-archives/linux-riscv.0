Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3536FE77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7sdvRjRc7Mmt7ERRsdNogzqjopFdloCjQR0gCaxQt2c=; b=U9Q24Gp26GX7xX
	sG+o1eNIABeB/I9SMff+NASfDE3VlzD6vdi9VNS5r4IaT/cn9ca/cV5F4InpQokctBTQw8X93k7zq
	3tbmCkwWZPPrFkyfHPXnR1jZj67ABfwN/OHBq2WjOAy3GJ2eBUOLLUofjM/2bdGMvXRd+l3RI4UeC
	ofAe5MsCfEoqVWNbLSgEExwh6ZkBVs6/7DJ4bLeL+UBzmcpjA8ojpTeTbShj7eJ9Y/4zD4X7xg0kd
	ZjK2kPsMJbiWuZvCyGQIPq+IVFJaY9BNkHyOEytdb/dtW4CfsRxBnGryqr5kMxdPXLKdYnemzWoTo
	TNo1HybzXRLAMzGrkY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVM3-0000000GMsu-0Iaz;
	Wed, 11 Dec 2024 22:38:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVG8-0000000GKg6-06jE
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A1325C67EF;
	Wed, 11 Dec 2024 22:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1B8C4CED3;
	Wed, 11 Dec 2024 22:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956363;
	bh=GMbLNjHYQHlthnl6X6B/C2qmZ1gVTWtoeCUN4jAlGyY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NUls12FN3SQfGL8gNK0d3XSvq5CEiEoBT0Ehc8gHs8vKLhadFUTVdxehhaZMTOSfB
	 f2e9DjeYYF1SkZnSTzd4uZufNPwFwjWtYC1x/Ov0fvC67pZf2wQfU5IEkbeJODoOic
	 KzRqnHqM8BWrBkSH2CjHQTWKQdGWoK3U9I/+ektGFuY1bRJfnU0XycCGiYafnhoOXR
	 lcfKvFhCrKGvU5q1V3Rilz2MblwKNvE/EAstR6gJK/qLApWx6qdtkPEj61hhT+hlF4
	 bpKqTLmNAnakfjPdfpD2hdUpckTdASV6NPZoPChM3qk95/u/XxfX96NEp3V43X26Lw
	 ndySRzbs7YFxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70A87380A965;
	Wed, 11 Dec 2024 22:33:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix IPIs usage in kfence_protect_page()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395637899.1729195.4700524807900643783.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:58 +0000
References: <20241209074125.52322-1-alexghiti@rivosinc.com>
In-Reply-To: <20241209074125.52322-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, glider@google.com, elver@google.com,
 dvyukov@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, liushixin2@huawei.com, wangkefeng.wang@huawei.com,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143244_145688_95F0E74E 
X-CRM114-Status: UNSURE (   7.36  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  9 Dec 2024 08:41:25 +0100 you wrote:
> flush_tlb_kernel_range() may use IPIs to flush the TLBs of all the
> cores, which triggers the following warning when the irqs are disabled:
> 
> [    3.455330] WARNING: CPU: 1 PID: 0 at kernel/smp.c:815 smp_call_function_many_cond+0x452/0x520
> [    3.456647] Modules linked in:
> [    3.457218] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.12.0-rc7-00010-g91d3de7240b8 #1
> [    3.457416] Hardware name: QEMU QEMU Virtual Machine, BIOS
> [    3.457633] epc : smp_call_function_many_cond+0x452/0x520
> [    3.457736]  ra : on_each_cpu_cond_mask+0x1e/0x30
> [    3.457786] epc : ffffffff800b669a ra : ffffffff800b67c2 sp : ff2000000000bb50
> [    3.457824]  gp : ffffffff815212b8 tp : ff6000008014f080 t0 : 000000000000003f
> [    3.457859]  t1 : ffffffff815221e0 t2 : 000000000000000f s0 : ff2000000000bc10
> [    3.457920]  s1 : 0000000000000040 a0 : ffffffff815221e0 a1 : 0000000000000001
> [    3.457953]  a2 : 0000000000010000 a3 : 0000000000000003 a4 : 0000000000000000
> [    3.458006]  a5 : 0000000000000000 a6 : ffffffffffffffff a7 : 0000000000000000
> [    3.458042]  s2 : ffffffff815223be s3 : 00fffffffffff000 s4 : ff600001ffe38fc0
> [    3.458076]  s5 : ff600001ff950d00 s6 : 0000000200000120 s7 : 0000000000000001
> [    3.458109]  s8 : 0000000000000001 s9 : ff60000080841ef0 s10: 0000000000000001
> [    3.458141]  s11: ffffffff81524812 t3 : 0000000000000001 t4 : ff60000080092bc0
> [    3.458172]  t5 : 0000000000000000 t6 : ff200000000236d0
> [    3.458203] status: 0000000200000100 badaddr: ffffffff800b669a cause: 0000000000000003
> [    3.458373] [<ffffffff800b669a>] smp_call_function_many_cond+0x452/0x520
> [    3.458593] [<ffffffff800b67c2>] on_each_cpu_cond_mask+0x1e/0x30
> [    3.458625] [<ffffffff8000e4ca>] __flush_tlb_range+0x118/0x1ca
> [    3.458656] [<ffffffff8000e6b2>] flush_tlb_kernel_range+0x1e/0x26
> [    3.458683] [<ffffffff801ea56a>] kfence_protect+0xc0/0xce
> [    3.458717] [<ffffffff801e9456>] kfence_guarded_free+0xc6/0x1c0
> [    3.458742] [<ffffffff801e9d6c>] __kfence_free+0x62/0xc6
> [    3.458764] [<ffffffff801c57d8>] kfree+0x106/0x32c
> [    3.458786] [<ffffffff80588cf2>] detach_buf_split+0x188/0x1a8
> [    3.458816] [<ffffffff8058708c>] virtqueue_get_buf_ctx+0xb6/0x1f6
> [    3.458839] [<ffffffff805871da>] virtqueue_get_buf+0xe/0x16
> [    3.458880] [<ffffffff80613d6a>] virtblk_done+0x5c/0xe2
> [    3.458908] [<ffffffff8058766e>] vring_interrupt+0x6a/0x74
> [    3.458930] [<ffffffff800747d8>] __handle_irq_event_percpu+0x7c/0xe2
> [    3.458956] [<ffffffff800748f0>] handle_irq_event+0x3c/0x86
> [    3.458978] [<ffffffff800786cc>] handle_simple_irq+0x9e/0xbe
> [    3.459004] [<ffffffff80073934>] generic_handle_domain_irq+0x1c/0x2a
> [    3.459027] [<ffffffff804bf87c>] imsic_handle_irq+0xba/0x120
> [    3.459056] [<ffffffff80073934>] generic_handle_domain_irq+0x1c/0x2a
> [    3.459080] [<ffffffff804bdb76>] riscv_intc_aia_irq+0x24/0x34
> [    3.459103] [<ffffffff809d0452>] handle_riscv_irq+0x2e/0x4c
> [    3.459133] [<ffffffff809d923e>] call_on_irq_stack+0x32/0x40
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Fix IPIs usage in kfence_protect_page()
    https://git.kernel.org/riscv/c/b3431a8bb336

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
