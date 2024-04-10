Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF0CCD1299
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uObgzPTEF6uoYwf0be0cwY+ITBMA0j8kD4HKxqkiZow=; b=ESZAtnLb0asZvX
	qJXipv2lHqAg5LoNfb7mVgRuAKw9Mv8BhNPn+s7y3ovgCw+ZHG2iG5q63kan9dhFXGVrTpFcao6RS
	IJO2VO6YMuUhkk51ddIxo0Ejh8d4r8gh1SVGiLRzXABOj2Fwrj3Z3RHBO+XSaEtZC1H1xecQYwHw/
	mhHTlMOxJS1GrQmKjdr+rwzEevFuPi7tXYDcRLjJ/0Ir6mf7YwgIi0rmaSuljHEtse1e/KNK+R6zR
	AxQyarmqUTaLKB4+BrPiqKDPvGBIoxorZD7XddrpE1nC5NVVyJ6i9yhzW4kD1Xn7tIDsyXUZ2FKjz
	CAhTMMXLrOKVb/R93m9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoZ-00000007R7m-0RxJ;
	Wed, 10 Apr 2024 14:20:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoU-00000007R3h-19BK
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA89C61DA2;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55CC0C433F1;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758833;
	bh=xDkGlfHuxeUMLKmnnKvrUXj70ln4rm8rNPiszU3Vn/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y6OL6W7vapmqulllVpsNnjRDcPT9oEzn/Rg4xVgasMrP1z0CpfNDJsR5X2iVWRm4Z
	 ry7M9L4OkEHQpe3Q65uHSiAxVYEygosyL89IiF8RBAZJpo5FR9roEQmdQN+GYIOa7T
	 yAMzC10eFvGglUDLckZCGDUDLxOwR+T9N8f2S4kHs3hijhgSRqhA/LUnkMvgc1xq0x
	 BS+tN89A6x41e7iFDAdCYvdtveafvQSX8UcBt23YPwFG2VRQbQiSiGfL+OboCtkrrp
	 68si6Tzhvw1Lt2zJr4i7PtmTbyf+95t1EUT/KvFvpFQn6H5NEx+ERWB4EXieonyq2e
	 2nNai4sEogyQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4AD22D60310;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/5] Rework & improve riscv cmpxchg.h and atomic.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275883330.18495.10110341843571163280.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:20:33 +0000
References: <20240103163203.72768-2-leobras@redhat.com>
In-Reply-To: <20240103163203.72768-2-leobras@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: linux-riscv@lists.infradead.org, will@kernel.org, peterz@infradead.org,
 boqun.feng@gmail.com, mark.rutland@arm.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 parri.andrea@gmail.com, geert@linux-m68k.org, mingo@kernel.org,
 andrzej.hajda@intel.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_072034_428634_778BB0C7 
X-CRM114-Status: UNSURE (   9.34  )
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

On Wed,  3 Jan 2024 13:31:58 -0300 you wrote:
> While studying riscv's cmpxchg.h file, I got really interested in
> understanding how RISCV asm implemented the different versions of
> {cmp,}xchg.
> 
> When I understood the pattern, it made sense for me to remove the
> duplications and create macros to make it easier to understand what exactly
> changes between the versions: Instruction sufixes & barriers.
> 
> [...]

Here is the summary with links:
  - [v1,1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
    https://git.kernel.org/riscv/c/4bfa185fe3f0
  - [v1,2/5] riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
    https://git.kernel.org/riscv/c/07a0a41cb77d
  - [v1,3/5] riscv/atomic.h : Deduplicate arch_atomic.*
    https://git.kernel.org/riscv/c/906123739272
  - [v1,4/5] riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
    https://git.kernel.org/riscv/c/54280ca64626
  - [v1,5/5] riscv/cmpxchg: Implement xchg for variables of size 1 and 2
    https://git.kernel.org/riscv/c/a8ed2b7a2c13

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
