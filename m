Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72866C4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZaVeKzPfS2T4+17EeyLC5pWkl/cDQYue+CxSTxT7s8=; b=ursc9lI1N8KVFK
	SQF9kktRlxZpe0uBIiHoQKEGoVBAP/GJV/Gw8OnkSFyCVd60B3hfTgoBSX6SJMAh7B3KH+2P59mLb
	tZLFqWuYqk/Gvu96+04Q4ozoK3aOKVqLr3M06Jl01ntF1JyQVYysSUjuRDjzQhLXN1v0TnEtMVhfy
	cXqIJIkZuWrxdQ1uJmLOtJkmKY6Q0bNDliLxw5d5swHCfn7fnsk0bEcjbgep5og6+1RC1SGN2cSDX
	32G9C4s+xn4u4Yx1BjxbrxyeENMckuMlE0giYK7YnvSLBWc2Is3HDEoeCGT0yflWhH2aLC8psIaBY
	rXSe51qMJTLriInL6q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3v-0020vF-2p;
	Fri, 12 Jan 2024 06:30:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3s-0020sT-0x
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 06:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7315CB8225D;
	Fri, 12 Jan 2024 06:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F3B4C433B2;
	Fri, 12 Jan 2024 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705041031;
	bh=jekUb0FSVZPvWCqMLLEnDhCHnUsUC5IyzrcXtmJkoMQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZoKOZ9IuihzHcwrt/9jW7znjgqOmpCDPTWVGhMBu0568Xac3cCsUNuuX8bVv2JwUd
	 xzb1otYyIhe3EtzEe4kPVfjeqXy51k6sJSGXTnuIJogGmya4bW2JUn3MLIc7OO9TvF
	 BrS8tcj1RJfZrvpcriWUGrdxKBWH9b/oWYJVyPIHNyWrtz+42/nfCW9VBtz9UVIf8a
	 oxLTDHk4EVyakeEZ/C025+5Q1HGsOUJYQkl+OMjJgJd1UpNBtRA3qBezowVSQjoy9Y
	 shZv2Kw1qPkckk9gyNznM+MzacDcN16R+IPb6SpkQAAhzl7aLsMR8fPwGoBGG9HqzN
	 clSGzXxLo2zBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8B73DFC697;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V3 0/4] riscv: mm: Fixup & Optimize COMPAT code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170504103094.17535.18254228443220727646.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jan 2024 06:30:30 +0000
References: <20231222115703.2404036-1-guoren@kernel.org>
In-Reply-To: <20231222115703.2404036-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alexghiti@rivosinc.com,
 charlie@rivosinc.com, xiao.w.wang@intel.com, david@redhat.com,
 panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com, willy@infradead.org,
 bjorn@rivosinc.com, conor.dooley@microchip.com, cleger@rivosinc.com,
 leobras@redhat.com, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_223036_510804_14566F97 
X-CRM114-Status: UNSURE (   8.23  )
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

On Fri, 22 Dec 2023 06:56:59 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When the task is in COMPAT mode, the TASK_SIZE should be 2GB, so
> STACK_TOP_MAX and arch_get_mmap_end must be limited to 2 GB. This series
> fixes the problem made by commit: add2cc6b6515 ("RISC-V: mm: Restrict
> address space for sv39,sv48,sv57") and optimizes the related coding
> convention of TASK_SIZE.
> 
> [...]

Here is the summary with links:
  - [V3,1/4] riscv: mm: Fixup compat mode boot failure
    https://git.kernel.org/riscv/c/5f449e245e5b
  - [V3,2/4] riscv: mm: Fixup compat arch_get_mmap_end
    https://git.kernel.org/riscv/c/97b7ac69be2e
  - [V3,3/4] riscv: mm: Remove unused TASK_SIZE_MIN
    (no matching commit)
  - [V3,4/4] riscv: mm: Optimize TASK_SIZE definition
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
