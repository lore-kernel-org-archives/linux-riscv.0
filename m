Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C28BC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwGVBkbt4hJzgWJLlxgEadhWHsISWev9VJGlNJjJtr4=; b=EalTFXI/OghurP
	1F2mSAK04BTvxL5ojxqkfJCU2GYR5BLjOVz/1elJv2byZiIj+oeeKj2VskpctVnoP2OyGC0dZ7ecK
	69AVj7MNQHPcVfHvdvJJDPhMVc9HVubcFPcPiCfyLRuCjU6/xkwmfCXIW4FzVsNW1nSbBkgnzam8h
	3oBbT3YKd3Ftz2z9iH01IlcNGrlvhsqMx/xfB9wb8SimQOxpvaxU1ZmFdXYDZEoQ0C9oxjFBm524X
	iWyo/5gRBTw3fmvSvycIbTLaW+s1D8aaBhtIcGswTwuWdlHqzJP0SqZzzjCAFoHe0ktEo6gd16nxW
	H4ZmsLsV7pPqhBcMCssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOIpZ-00000003v2h-22lW;
	Mon, 01 Jul 2024 15:20:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOIpW-00000003v0Y-2BLa
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 15:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73305CE17D1;
	Mon,  1 Jul 2024 15:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 918D4C2BD10;
	Mon,  1 Jul 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719847230;
	bh=wxYu3zIRsXfA4tN7GBGojXy29esfx9y9v7Vqne4vjRI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S7Hbbd1vhwHZKa9YqOoZSUlJFWJpgZPDu1al4RUr/qVgCCC05hGixcBxq1qU+Xvr3
	 f0FNf1IXL8LLVTNy9HOky1GbeQ99L0NzD6ZtVO+vPyvk/+n4lmNhBhgkM6Ed2xn+Y9
	 QzpgIgDVGClgh5LEHyHA6fvw0fNZQsGfW8heJ2uwD0v7zBdfIh7dPB3Tj2CBf91Bkj
	 xgtKYtD7paXl7kh+QqkTLiR5hF/eRDqXsc6jtPZwvRrFuZ0OSc89/P2jcC1z3vHXSl
	 VhRIFsT3UGHDNnns5g7Xj8fSuYzS8KrG9l+qGAxBW3CPlzAfmlyc73fGTA2ErTjzLj
	 Q6spRSFMLybjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7E2E6C43468;
	Mon,  1 Jul 2024 15:20:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND bpf-next v2 0/3] Use bpf_prog_pack for RV64 bpf
 trampoline
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171984723051.1282.8352301752535739343.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jul 2024 15:20:30 +0000
References: <20240622030437.3973492-1-pulehui@huaweicloud.com>
In-Reply-To: <20240622030437.3973492-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 puranjay@kernel.org, palmer@dabbelt.com, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_082034_758803_F45D7CC3 
X-CRM114-Status: GOOD (  11.41  )
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

On Sat, 22 Jun 2024 03:04:34 +0000 you wrote:
> We used bpf_prog_pack to aggregate bpf programs into huge page to
> relieve the iTLB pressure on the system. We can apply it to bpf
> trampoline, as Song had been implemented it in core and x86 [0]. This
> patch is going to use bpf_prog_pack to RV64 bpf trampoline. Since Song
> and Puranjay have done a lot of work for bpf_prog_pack on RV64,
> implementing this function will be easy. But one thing to mention is
> that emit_call in RV64 will generate the maximum number of instructions
> during dry run, but during real patching it may be optimized to 1
> instruction due to distance. This is no problem as it does not overflow
> the allocated RO image.
> 
> [...]

Here is the summary with links:
  - [RESEND,bpf-next,v2,1/3] bpf: Use precise image size for struct_ops trampoline
    https://git.kernel.org/bpf/bpf-next/c/d1a426171d76
  - [RESEND,bpf-next,v2,2/3] riscv, bpf: Fix out-of-bounds issue when preparing trampoline image
    https://git.kernel.org/bpf/bpf-next/c/9f1e16fb1fc9
  - [RESEND,bpf-next,v2,3/3] riscv, bpf: Use bpf_prog_pack for RV64 bpf trampoline
    https://git.kernel.org/bpf/bpf-next/c/2382a405c581

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
