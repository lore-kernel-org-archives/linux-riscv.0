Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6D8C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dq3Xh2Ogg6BOo6oc5b21gY4z9aaJ8rR+YFmEPBl8qNE=; b=YNpFeziN28LOPk
	bMaazyXoeaoY876lhmnQZ3uSawzum5kvWPKKA+XxjzyIPZivWJBLEM2BkdGw+AfyAVvRgH3586W6W
	r2pjP6OrYG2iVggAInqDDXjYobrbZ+DV6E5+xeXbBQNrzuJA2ZCtGO8lc5UHC5VXnbzv4bMmJgx8i
	4dN9zoG+/qgDwH84ir+hafWke8ZVmCZrg6hrc1VzmGwP6QdIhj0Svz2F0rx2EoOfmbfaeIbi/Y1+Y
	c06nCtWP4bS8U4dKN0S6Bm13/mYHN/T/L1EkgXrBkytDKyWjLaTPyFzR4lqKqsTJCmU4c/jjjDYg4
	Iq28ev0OS5+NwHP7zgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLZs-00000009poP-0OFh;
	Wed, 28 Feb 2024 15:10:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLZp-00000009pm5-1dmO
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 15:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 350B5618C1;
	Wed, 28 Feb 2024 15:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD5D9C433F1;
	Wed, 28 Feb 2024 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709133029;
	bh=Hl4aguKOTd8JlLqCsXIN7K+U/MvNiYnC1LzWdx7ZBq0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oq9+Wk21fB3vdeq1PxsrpEc6OYKE8ugwMPUiHXnzSzt0I1QhRZBqNX1jBK2QB0zfy
	 yPlEtVWMmXrxLN34z+5fBmQ46+f3zD66tkOhozaVrDUVpS9sr+VghyVXor3YpDzq2U
	 cj1p6vYpSvWJK2rJ+T/HGJjUAl4KOjA3AY3VXxyUnDN0YuE6W0U20Ux+UCHWpdjd9M
	 lTlh8f+Dh0klWreWUZ3+yoq+wNqrDeCuqGM42PvXPan/xBnaf38uGHO8zhzVIAkSVK
	 680qGQ5knv1t4Y9escBw9XxPK7B2qi1C590U9MFEgyj2xu2gnIlIXzKRKdGpSVemRY
	 oVUIHSu8k7TWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B2121C595D2;
	Wed, 28 Feb 2024 15:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drivers: perf: ctr_get_width function for legacy is not
 defined
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170913302972.9913.1220229545519276494.git-patchwork-notify@kernel.org>
Date: Wed, 28 Feb 2024 15:10:29 +0000
References: <20231205092555.35617-1-vadim.shakirov@syntacore.com>
In-Reply-To: <20231205092555.35617-1-vadim.shakirov@syntacore.com>
To: Vadim Shakirov <vadim.shakirov@syntacore.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, ajones@ventanamicro.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_071033_554713_A304CD8F 
X-CRM114-Status: UNSURE (   8.14  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 5 Dec 2023 12:25:54 +0300 you wrote:
> With parameters CONFIG_RISCV_PMU_LEGACY=y and CONFIG_RISCV_PMU_SBI=n
> linux kernel crashes when you try perf record:
> 
> $ perf record ls
> [   46.749286] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [   46.750199] Oops [#1]
> [   46.750342] Modules linked in:
> [   46.750608] CPU: 0 PID: 107 Comm: perf-exec Not tainted 6.6.0 #2
> [   46.750906] Hardware name: riscv-virtio,qemu (DT)
> [   46.751184] epc : 0x0
> [   46.751430]  ra : arch_perf_update_userpage+0x54/0x13e
> [   46.751680] epc : 0000000000000000 ra : ffffffff8072ee52 sp : ff2000000022b8f0
> [   46.751958]  gp : ffffffff81505988 tp : ff6000000290d400 t0 : ff2000000022b9c0
> [   46.752229]  t1 : 0000000000000001 t2 : 0000000000000003 s0 : ff2000000022b930
> [   46.752451]  s1 : ff600000028fb000 a0 : 0000000000000000 a1 : ff600000028fb000
> [   46.752673]  a2 : 0000000ae2751268 a3 : 00000000004fb708 a4 : 0000000000000004
> [   46.752895]  a5 : 0000000000000000 a6 : 000000000017ffe3 a7 : 00000000000000d2
> [   46.753117]  s2 : ff600000028fb000 s3 : 0000000ae2751268 s4 : 0000000000000000
> [   46.753338]  s5 : ffffffff8153e290 s6 : ff600000863b9000 s7 : ff60000002961078
> [   46.753562]  s8 : ff60000002961048 s9 : ff60000002961058 s10: 0000000000000001
> [   46.753783]  s11: 0000000000000018 t3 : ffffffffffffffff t4 : ffffffffffffffff
> [   46.754005]  t5 : ff6000000292270c t6 : ff2000000022bb30
> [   46.754179] status: 0000000200000100 badaddr: 0000000000000000 cause: 000000000000000c
> [   46.754653] Code: Unable to access instruction at 0xffffffffffffffec.
> [   46.754939] ---[ end trace 0000000000000000 ]---
> [   46.755131] note: perf-exec[107] exited with irqs disabled
> [   46.755546] note: perf-exec[107] exited with preempt_count 4
> 
> [...]

Here is the summary with links:
  - [1/2] drivers: perf: ctr_get_width function for legacy is not defined
    https://git.kernel.org/riscv/c/682dc133f83e
  - [2/2] drivers: perf: added capabilities for legacy PMU
    https://git.kernel.org/riscv/c/65730fe8f4fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
