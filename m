Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1F6C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7kNZ6yCsK5PB+DJRDD+o1VzwZVbR8F94HLyEK/wWUs=; b=sF3oTZqoOJMDX9
	sNj3gX+BR4ZYS9n7UtU+YWNjixQ4G6eE1kVEKjrVduMR5yc5ITJakFyyvgsDdnzkFx0mmYB5ImhpE
	MANkfsVj+dzu0ah2juduraj1vja9WdF4kwAhkQ9CTCNbT5lpAhXMc1gnEKPKICxnDMcREnZ9vkRJR
	frN4rNGKtQguTtBuh16mGCDfRv4Msn4OKc3FU/lYEPKb36B6zVggJ2QesFW3dwXCAxLSqgagDDE6N
	5RkN5q5sHZBeejyRW6aa1jVKAc6LuBQNHVw1l7+1MsdaG0UG/oG/LTVbsDvbiTsbraqTWht/8ovXo
	fXGCS6uV/teHsWwqZSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTbA-0000000DHjx-496N;
	Mon, 29 Jan 2024 15:31:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTb7-0000000DHjX-2k0F
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4F0362259;
	Mon, 29 Jan 2024 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85D23C433C7;
	Mon, 29 Jan 2024 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706542226;
	bh=ixi8kL7I86gBrHfmeQ/hZc+GdJatpUL8KGDJK72LYAs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a5gwh+QIq4ZeTsxtmZ8+aIsNKWJ/brKgOggIog+p3Jk5uZqM1l8Qyrt6CL3F+aX72
	 bLF1Gyuk0+aeINi5T5tVR9gcNJgfoJ4hzC9HEIKaFpDfoXYQcn9B2toux7xLXLV0IP
	 Z0s1PUogO6Xa3EMQH1sVdWvVvMDb9hj85f5NaJt+hvKSdqdDTL1cThAIHywL1/IAPj
	 jgAHEJTfO1n5XwXaJHTGWRHnzEsuJ4tTyuzpmC5ya1qLJwUcud67O1hVNyZjdB85Ww
	 QR5ba/9MXfzlGJ8bfjYY8tM7FsCjn2a+GtsEUvoClIUMAA3kurhKvsxCy73h89Ta5U
	 jFsUYDN+CU14A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 64CF4C3274C;
	Mon, 29 Jan 2024 15:30:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND bpf-next v3 0/6] Zbb support and code simplification
 for RV64 JIT
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170654222640.3521.12964970085967863074.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jan 2024 15:30:26 +0000
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
In-Reply-To: <20240115131235.2914289-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, palmer@dabbelt.com,
 conor@kernel.org, luke.r.nels@gmail.com, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_073057_740490_D97C69D5 
X-CRM114-Status: UNSURE (   7.16  )
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

This series was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Mon, 15 Jan 2024 13:12:29 +0000 you wrote:
> Add Zbb support [0] to optimize code size and performance of RV64 JIT.
> Meanwhile, adjust the code for unification and simplification. Tests
> test_bpf.ko and test_verifier have passed, as well as the relative
> testcases of test_progs*.
> 
> Link: https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-38-g865e7a7.pdf [0]
> 
> [...]

Here is the summary with links:
  - [RESEND,bpf-next,v3,1/6] riscv, bpf: Unify 32-bit sign-extension to emit_sextw
    https://git.kernel.org/bpf/bpf-next/c/e33758f7493c
  - [RESEND,bpf-next,v3,2/6] riscv, bpf: Unify 32-bit zero-extension to emit_zextw
    https://git.kernel.org/bpf/bpf-next/c/914c7a5ff18a
  - [RESEND,bpf-next,v3,3/6] riscv, bpf: Simplify sext and zext logics in branch instructions
    https://git.kernel.org/bpf/bpf-next/c/361db44c3c59
  - [RESEND,bpf-next,v3,4/6] riscv, bpf: Add necessary Zbb instructions
    https://git.kernel.org/bpf/bpf-next/c/647b93f65daa
  - [RESEND,bpf-next,v3,5/6] riscv, bpf: Optimize sign-extention mov insns with Zbb support
    https://git.kernel.org/bpf/bpf-next/c/519fb722bea0
  - [RESEND,bpf-next,v3,6/6] riscv, bpf: Optimize bswap insns with Zbb support
    https://git.kernel.org/bpf/bpf-next/c/06a33d024838

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
