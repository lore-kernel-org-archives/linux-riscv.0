Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41CDC4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 18:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOOueQK+lXVjfLzXzrQlNBj6H7NBphnnt3gmn/nri7w=; b=KhzkovfX/xt1wc
	RH+mkdNjI22clV55bf26JJJigWu3umLuoIgoUzlCIJnqTyLx2C3ue159s3yozYPRNHVBFKm/D+8rb
	PaimlLdc3bYVeWxPTKcosXyYIVtKU/GarJRo4/lQX437Ka/X2qoRLf6hTgSGrbnv6s+0fEvRWEo3f
	gttOezjNFFgu26MXUwP48VAHMeNR9QZwbesNJBc1SPHtROUmlQPNtzZRmOhAdMv875N0dsUzJRx0J
	BInUiL1nlhGeSSu6PpMnw+IzLV8Bi0zW3aypHY69w/rNEZAVbB3VMxMRsGyvh3BNAl/iMDbIyQbsf
	EHfQ/4cteDZHCe+cPrlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFEw-0000000ADDL-1Uok;
	Tue, 21 Jul 2026 18:30:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFEu-0000000ADCX-442C
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 18:30:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B59924174A;
	Tue, 21 Jul 2026 18:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925F61F00A3A;
	Tue, 21 Jul 2026 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658648;
	bh=xImigRmDnIx1zusSwHpXh3TKLKehrpgm2XReoQ8B3p4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aRAP1m8nSJHiWjBmQgmhAPrtgBI6FDHCA1EWKJaAtrnW3PPTEiluupniJbTDpo6Xm
	 tpkIjaYc0uD4DRsdhr8a3GoUmHNpxoJHkeL2N4RkUb/yAaVGYU0dfX6SpOX2kgB6/K
	 loc35dANYletc4bdaq6mDfajSfkxdDTWFaLo4EE5OjF8FeOjn3wuWLCFGUWZ9JqGjD
	 AhLd+JGE3rZkAHlKY9ilU+iAF+UPEUrLWFJxUHTTZbOLVXrmOStVDQRJVTVuUAHkv3
	 mrYMGZdPUdB/ceqcNtvNL0f0wJBiU0/yiVvLE63bas1DgcAJsAR2VdVqbJSj/wK96L
	 M/LhQzZvVMO3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B0F39253EE;
	Tue, 21 Jul 2026 18:30:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v6 0/7] Mixing bpf2bpf and tailcalls for RV64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178465861815.931197.16356281577887013283.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 18:30:18 +0000
References: <20260708064436.2971933-1-pulehui@huaweicloud.com>
In-Reply-To: <20260708064436.2971933-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com
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
by Kumar Kartikeya Dwivedi <memxor@gmail.com>:

On Wed,  8 Jul 2026 06:44:29 +0000 you wrote:
> In the current RV64 JIT, if we just don't initialize the TCC in subprog,
> the TCC can be propagated from the parent process to the subprocess, but
> the updated TCC of the parent process cannot be restored when the
> subprocess exits. Since the RV64 TCC is initialized before saving the
> callee saved registers into the stack, we cannot use the callee saved
> register to pass the TCC, otherwise the original value of the callee
> saved register will be destroyed. So we implemented mixing bpf2bpf and
> tailcalls similar to x86_64, i.e. using a non-callee saved register to
> transfer the TCC between functions, and saving that register to the
> stack to protect the TCC value. As for the tailcall hierarchy issue,
> inspired by the s390's low-overhead approach, we store TCC from
> RV_REG_TCC back to stack after calling bpf2bpf call or calling orig bpf
> func in bpf trampoline.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v6,1/7] bpf: Extract the is_struct_ops_tramp helper
    https://git.kernel.org/bpf/bpf-next/c/6bcecae4b65d
  - [bpf-next,v6,2/7] riscv, bpf: Fix memory leak in bpf_jit_free
    https://git.kernel.org/bpf/bpf-next/c/369e4635d048
  - [bpf-next,v6,3/7] riscv, bpf: Using kvzalloc_objs to allocate cache buffer
    https://git.kernel.org/bpf/bpf-next/c/f3ab878594b5
  - [bpf-next,v6,4/7] riscv, bpf: Fix kernel stack corruption in tailcall with CFI
    https://git.kernel.org/bpf/bpf-next/c/52fb1756ea1d
  - [bpf-next,v6,5/7] riscv, bpf: Add RV_TAILCALL_OFFSET macro to format tailcall offset
    https://git.kernel.org/bpf/bpf-next/c/a21731f54cfe
  - [bpf-next,v6,6/7] riscv, bpf: Mixing bpf2bpf and tailcalls
    https://git.kernel.org/bpf/bpf-next/c/ec72848ca0ad
  - [bpf-next,v6,7/7] selftests/bpf: Remove tailcalls tests from DENYLIST.riscv64
    https://git.kernel.org/bpf/bpf-next/c/683ed8b78c1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
