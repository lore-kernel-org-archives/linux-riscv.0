Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B013C4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7j7XR16VSuD+mNGBZvo1NQ+VWbfifH11EflQKJLYU+4=; b=i/VF8Zkq7m0guZ
	tkttZWR6ZCtKsaFNKoY0BY+AdIjlv9zSuk3W21hzgcexKRBo5/SJh8bRU2OIXwOm6blt5JQTkhhv9
	SuoCBaKLDb9xQGFW3j1E90+dmpaFElBnArSNCXCxyAJD3U9AQViHWHcQBpHE3NsPqcDb0H4VfnBHb
	GOltpNAPFouFEtBmfLzrjHHEqoN2DXAs3L2QQSyIVOj2roHxvs3fu7DrENfXylQgF6ohAjzlb9k/G
	4SU7wyxjNI/ZOtjBHU288IhmaeeUuKeu6pfIPSm9yLNMR/skIC/G5yQ+tWWQxaj0aOYxsTeAASY6w
	3ZAfkGs4kZbhqJnlZWag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFF0-0000000ADEm-1wTx;
	Tue, 21 Jul 2026 18:30:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFEw-0000000ADDN-1z0o
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 18:30:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CF40408CF;
	Tue, 21 Jul 2026 18:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0201F000E9;
	Tue, 21 Jul 2026 18:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658650;
	bh=o34XGnWKkv3zk66cAVYP967kqgxsfnLjUYH66OHztlo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IkmjGzCLewpl2zglNrnxt8mPCrcamwsT/BBD2nUwsm58LiQiRsuMHlKdDYkmZHAil
	 vRZKfqpRFbfem0YeAbgUxShrK9sBYtvmiBk855YJT8+xUA4tGn+Eueal84J5Lr1n3N
	 2MhygonkGt8gSZZU3We15H4/qIj3ePKL878LzON+uX7+IlJ5SJyPxhqET9fynYrI7m
	 2Y/o3ugX8VU8xikJmIQ0H2KnncPwPKg4b00v+g22kB3MuSZcgrKDA1krN+/D6sp9L9
	 GFFiZhCn2Qo0sCNO1ouKGAPcdjaOeDge1zBrKPUM1ww6TkTHSOUKBVQv2VyL7k73os
	 k0whWoJAUdKeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C3E39253EE;
	Tue, 21 Jul 2026 18:30:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] bpf,
 riscv: fix extable handling for arena load_acquire
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178465861940.931197.3483820108983370634.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 18:30:19 +0000
References: <20260720-bpf-riscv-fix-extable-v4-1-165c0b3b07d5@kylinos.cn>
In-Reply-To: <20260720-bpf-riscv-fix-extable-v4-1-165c0b3b07d5@kylinos.cn>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, bjorn@rivosinc.com,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

This patch was applied to bpf/bpf-next.git (master)
by Kumar Kartikeya Dwivedi <memxor@gmail.com>:

On Mon, 20 Jul 2026 06:42:57 +0000 you wrote:
> emit_atomic_ld_st() returns 1 to have build_body() skip the zext after
> a sub-word load_acquire. The caller does "ret = ret ?:
> add_exception_handler(...)", which skips add_exception_handler() on any
> non-zero ret, so the extable entry is missing and a faulting
> PROBE_ATOMIC load_acquire oopses.
> 
> REG_DONT_CLEAR_MARKER leaves rd stale on fault, and the verifier still
> thinks the load overwrote it, so a program can leak it through a map.
> 
> [...]

Here is the summary with links:
  - [v4] bpf, riscv: fix extable handling for arena load_acquire
    https://git.kernel.org/bpf/bpf-next/c/5eb8921371c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
