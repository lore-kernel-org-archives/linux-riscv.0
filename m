Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB29CD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 22:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knugQqj5dJE3s/htbkF0lLWiD8dkaXfbbcG0hSoUyAk=; b=TWLW0VqeR3CKJW
	Lq08ZISlEBGoidyQdVBYqXO0hiMUntONGC5+A/MkwkKQVj8JGnSj8VDbHKnC0P7TE84vYuXbDHYdB
	+ZGUXTw7E4tTWetPYJ2O2SQxfGIld04WnvNIzwAyxMrclHfFN3gjqsob6GDzSV85Cl5oiqSc74Cjj
	5U5KN4TRxKL/ZoKL6sqr+yv88c7jvnJHJILzsPcJR3xgv84AS/SDYak42WXxErX9nxNNVE4U0JzSz
	dVXuweLZOMS1HNFRXTdJRXjfLDZDMgUJMARodO53hKD6iSD61ExUfDH5zsPJG2/gDyuTD41HBY1h8
	GCxtoiuU5yufHo44lYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVd3Y-00000001Gyw-2jHY;
	Fri, 05 Jun 2026 22:30:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVd3W-00000001Gyn-3U7C
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 22:30:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B143F600AE;
	Fri,  5 Jun 2026 22:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640C01F00898;
	Fri,  5 Jun 2026 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698621;
	bh=d1FS9jRxbt15zPdczeD3jqROF2JzOH7zVfMIxmBfRbY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oRpNEoqHwJR0aIbFlw0Z6jVbqjRW+3aA3rriM/Y5FhdDDqMOxW8qkm1BpVzJuuJFJ
	 n2zVzaz0HmJU++aI0eyjd5gZ0b3zCOCLuj2JPV0zwsPO8EUiwKCWn711qPkmm2Tqs0
	 8t7oWa9ZdI412ucaLNxF4Wf+WvcvE83LEWZNgzvDFRZvkNIjIssoqo3up6IZieWzf5
	 cAbhFizwyU6d0ATp5VqC9e1NgUXwZEneUm0S9AFYDFr9v+IRirqZDMs+o2+pnljwZ0
	 8h8t2U+DmG9v2sJLEgFRlWXo6xBEvP2c6VgRnts8j5A+wbokIQP6wxUazesE2MWqaJ
	 dU4ag2XV1tVOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AB73930C04;
	Fri,  5 Jun 2026 22:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 0/2] RISC-V JIT support for
 bpf_get_current_task/_btf
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178069862138.3943503.16397384527889534334.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jun 2026 22:30:21 +0000
References: <20260602205847.102825-1-varunrmallya@gmail.com>
In-Reply-To: <20260602205847.102825-1-varunrmallya@gmail.com>
To: Varun R Mallya <varunrmallya@gmail.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 bjorn@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 puranjay@kernel.org, menglong8.dong@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 pulehui@huawei.com, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
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
by Alexei Starovoitov <ast@kernel.org>:

On Wed,  3 Jun 2026 02:28:45 +0530 you wrote:
> These two patches add support for the bpf_get_current_task and
> bpf_get_current_task_btf kfuncs in RISC-V JIT and add a selftest.
> 
> The first patch adds support for cpu and feature detection on
> the JIT disassembly helper function as RISC-V JITed code was not
> being disassembled using `LLVMCreateDisasm` as it was missing the
> "+c" CPU feature and JITed code contained RISC-V Compressed (C)
> Extension. This patch generalizes that to detect CPU features and
> enables testing on more RISC-V JIT work ahead.
> 
> [...]

Here is the summary with links:
  - [bpf-next,1/2] selftests/bpf: use host CPU features in JIT disassembler
    https://git.kernel.org/bpf/bpf-next/c/557d0cc3f252
  - [bpf-next,2/2] bpf, riscv: inline bpf_get_current_task() and bpf_get_current_task_btf()
    https://git.kernel.org/bpf/bpf-next/c/6d13ddb1d465

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
