Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2139EC25B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJgyvLxUPGwxEa0gPqEkmnh9OClCjJubM8ky18vucY8=; b=ON4T/LPmYHnNoi
	i3LMqjbLoMXE+FkbPbwIfxrWQ8iO72yHXPQJIRMStySd6OBLxgbCZ6ypYbkSyVUJ/2Kx4d364g2HM
	oAEKrCHAm2I88nMUDurnL2e+HJWhC8bQqWWkDf0hEMMRMkaCTz7WCPp1VIOQDMTJVGHu0E9N+6ibn
	xEczjhxUHkEdnFMsSdr3KkWHkikAQ8HvYwvAXz/hpzjq338FR6h9vNzmqpRBAHOK8q+AK0gFsT2Ns
	RkChTy2mXddQKbabMniCml+KiMJuetfj9aV8DUBtsoBfmsZ/4HSPiEhFle3t+/PtJgVs4dVpg3LST
	/wr8BMS4mMWjOeHWQICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6si5-0000000G6kt-16Xc;
	Tue, 14 May 2024 14:00:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6si1-0000000G6i7-2F3n
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1853CE1289;
	Tue, 14 May 2024 14:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EE52C32781;
	Tue, 14 May 2024 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715695242;
	bh=N8ye8kP7p0QXl90QBB1Ui1ORw3dVgGH0prC6aY8G1zI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=flySvlIFxx028oqiyNIAiWkTN29fVn1UrZVagDmGmXIh+kDwmFGPN1xYTtFfgNq0U
	 OnEiMqPKgiT7ing3LfQm0jBi2+vMyqtntWomEOs0oneNypxvK2jnDtk6Tedol8EJFC
	 jqXE5I5lfKZNOr+rBHh1BV4o5JmTiJOZ2gjMwmS3oDF20QY042UzmzJj+CK9xXl0Ix
	 vOh0tAXUIT6B06N2sl8pasATv+SozeVDHNYRBtW108K2oD0KSzY0bhOCg0uI0ktwWM
	 bA0pAZR6noCawMI41/ip2rPoEy8UNpwL8wlq1Jn5GOfk/bISfzlIL/KkQ4gcNqi7pd
	 WCfQ96XmYVeMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F5A4C43339;
	Tue, 14 May 2024 14:00:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 00/13] riscv: ASID-related and UP-related TLB flush
 enhancements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171569524205.4793.10651789416740480698.git-patchwork-notify@kernel.org>
Date: Tue, 14 May 2024 14:00:42 +0000
References: <20240327045035.368512-1-samuel.holland@sifive.com>
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, alexghiti@rivosinc.com,
 jszhang@kernel.org, cuiyunhui@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_070049_958692_8A8B5D73 
X-CRM114-Status: UNSURE (   9.78  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 26 Mar 2024 21:49:41 -0700 you wrote:
> This series converts uniprocessor kernel builds to use the same TLB
> flushing code as SMP builds, to take advantage of batching and existing
> range- and ASID-based TLB flush optimizations. It optimizes out IPIs and
> SBI calls based on the online CPU count, which also covers the scenario
> where SMP was enabled at build time but only one CPU is present/online.
> A final optimization is to use single-ASID flushes wherever possible, to
> avoid unnecessary TLB misses for kernel mappings.
> 
> [...]

Here is the summary with links:
  - [v6,01/13] riscv: Flush the instruction cache during SMP bringup
    https://git.kernel.org/riscv/c/58661a30f1bc
  - [v6,02/13] riscv: Factor out page table TLB synchronization
    https://git.kernel.org/riscv/c/aaa56c8f378d
  - [v6,03/13] riscv: Use IPIs for remote cache/TLB flushes by default
    https://git.kernel.org/riscv/c/dc892fb44322
  - [v6,04/13] riscv: mm: Broadcast kernel TLB flushes only when needed
    https://git.kernel.org/riscv/c/038ac18aae93
  - [v6,05/13] riscv: Only send remote fences when some other CPU is online
    https://git.kernel.org/riscv/c/9546f00410ed
  - [v6,06/13] riscv: mm: Combine the SMP and UP TLB flush code
    https://git.kernel.org/riscv/c/c6026d35b6ab
  - [v6,07/13] riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
    https://git.kernel.org/riscv/c/20e03d702e00
  - [v6,08/13] riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
    https://git.kernel.org/riscv/c/d6dcdabafcd7
  - [v6,09/13] riscv: mm: Introduce cntx2asid/cntx2version helper macros
    https://git.kernel.org/riscv/c/74cd17792d28
  - [v6,10/13] riscv: mm: Use a fixed layout for the MM context ID
    https://git.kernel.org/riscv/c/f58e5dc45fa9
  - [v6,11/13] riscv: mm: Make asid_bits a local variable
    https://git.kernel.org/riscv/c/8d3e7613f97e
  - [v6,12/13] riscv: mm: Preserve global TLB entries when switching contexts
    https://git.kernel.org/riscv/c/8fc21cc672e8
  - [v6,13/13] riscv: mm: Always use an ASID to flush mm contexts
    https://git.kernel.org/riscv/c/daef19263fc1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
