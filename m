Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0223DC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBmODybNuXmAb7lFdF5KOOQu7deIuXUBiGfwIC+o73k=; b=A9pouEA8nsIWeF
	lkJOPixFLZICgmzBKejwptFVjwF8pmkjVCtEEKhSPnJpogNQptXkGF3aQ2PT1jRmHZykYXFHOHQIA
	lsuGf5jx1EhrmXdw13G/TWMe87hTgCAYH1eDc4paS8EaNJ973qctanGdKzWZFgl04LN/Lsejbhrqu
	ivkV91XN5nXmkZDH1u14l2NtjSDpdtR2TiT5b5qnKImBfcVX8Tk3P5UJCt4bUCpV3lJZnj6hfpytV
	9Tnng+ks0/rviq4gkfdsy8rs+S2GXsfBs6jeasX6Ic8ztazDY5p0ksvxWVLmgyi1g4YzhW5QT5wrq
	jwMPD6GnXcb57/HBeu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMhL-0000000HELo-43eA;
	Fri, 24 Jul 2026 20:40:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMhL-0000000HELi-1u6d
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 20:40:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC53760A60;
	Fri, 24 Jul 2026 20:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3B41F000E9;
	Fri, 24 Jul 2026 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784925646;
	bh=PgdTP64+EVmHRzWKXnz5UKUEwhJNxUbT1LrMWFDT2MA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OU0826zgWCqvHhhLxBuOQQpNsmpvdlx6ExQbCRUT2AgArn0lM6KvY+yOSagxCnL3/
	 K1uFtP2ot8+CsAvF0muymCuWDPcV1X1EUhvdxYLQy7HoYIvW/WXaQ3cr6dnmM1LlJA
	 Eonkx+qrDAI/jsx2HSkWtFJmFOgfDWBE/GoC7TQmvCkezyPCs1/46dCJX5mK6s3dEd
	 nI/Xnxr3yHeq16L2DpzrkAIRONyUlyWZLeVEfzLr7nSLhTRO2jGFq7n6rjKEgCpwbJ
	 RHrnt9rSORmyouEXvzIy0JmjQHsJ6TaP2VcpakwD0HMaxPOskVJqanCDlaRyL7gCkt
	 A2S1RcTWn6o/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CBE38111D2;
	Fri, 24 Jul 2026 20:40:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v5 0/3] bpf, riscv: add timed may_goto support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178492561340.3300548.13038272960987116593.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 20:40:13 +0000
References: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
In-Reply-To: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, shuah@kernel.org,
 ihor.solodrai@linux.dev, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
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
by Kumar Kartikeya Dwivedi <memxor@gmail.com>:

On Thu, 23 Jul 2026 05:41:31 +0000 you wrote:
> This series adds RISC-V JIT support for the timed may_goto loop bound.
> 
> Patch 1 implements arch_bpf_timed_may_goto() and enables
> bpf_jit_supports_timed_may_goto() so the verifier uses the timed
> expansion path.
> 
> Patch 2 adds a test that checks R0-R5 are preserved across
> arch_bpf_timed_may_goto() calls.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v5,1/3] bpf, riscv: add support for timed may_goto
    https://git.kernel.org/bpf/bpf-next/c/6ef8ff20c30b
  - [bpf-next,v5,2/3] selftests/bpf: test timed may_goto preserves R0-R5
    https://git.kernel.org/bpf/bpf-next/c/a0032241aa14
  - [bpf-next,v5,3/3] selftests/bpf: enable timed may_goto tests for riscv64
    https://git.kernel.org/bpf/bpf-next/c/3c2be3cbeb1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
